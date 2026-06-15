import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../app_config.dart';

/// Sends metrics to a Zabbix server via the Zabbix Sender protocol (port 10051).
///
/// Requires Trapper items on the Zabbix host matching the keys sent.
/// Configure destination via `--dart-define=ZABBIX_HOST` / `ZABBIX_PORT`.
class ZabbixSender {
  final String host;
  final int port;

  const ZabbixSender({
    this.host = AppConfig.zabbixHost,
    this.port = AppConfig.zabbixPort,
  });

  // ZBXD\x01 — Zabbix binary protocol header
  static const _header = [0x5A, 0x42, 0x58, 0x44, 0x01];

  Future<bool> send(List<ZabbixItem> items) async {
    if (items.isEmpty) return true;
    Socket? socket;
    try {
      socket = await Socket.connect(
        host,
        port,
        timeout: const Duration(seconds: 5),
      );

      final clock = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final payload = jsonEncode({
        'request': 'sender data',
        'clock': clock,
        'ns': 0,
        'data': items.map((i) => i._toJson(clock)).toList(),
      });

      final data = utf8.encode(payload);
      final frame = _buildFrame(data);
      socket.add(frame);
      await socket.flush();
      await socket.close();
      return true;
    } catch (e) {
      if (kDebugMode) debugPrint('[ZabbixSender] send failed: $e');
      return false;
    } finally {
      socket?.destroy();
    }
  }

  List<int> _buildFrame(List<int> data) {
    final len = data.length;
    final lengthBytes = List.generate(8, (i) => (len >> (i * 8)) & 0xFF);
    return [..._header, ...lengthBytes, ...data];
  }
}

class ZabbixItem {
  final String host;
  final String key;
  final String value;

  const ZabbixItem({
    required this.host,
    required this.key,
    required this.value,
  });

  Map<String, dynamic> _toJson(int clock) => {
        'host': host,
        'key': key,
        'value': value,
        'clock': clock,
        'ns': 0,
      };
}
