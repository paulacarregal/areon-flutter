import 'package:flutter/material.dart';

import '../domain/post.dart';
import '../data/post_repository.dart';

class PostProvider extends ChangeNotifier {
  List<Post> _posts = [];
  bool _loading = false;
  String? _error;

  List<Post> get posts => _posts;
  bool get loading => _loading;
  String? get error => _error;

  PostProvider() {
    _load();
  }

  void _load() {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      _posts = getAllPosts();
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Post? getById(int index) {
    if (index < 0 || index >= _posts.length) return null;
    return _posts[index];
  }
}
