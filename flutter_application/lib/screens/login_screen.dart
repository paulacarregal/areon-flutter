import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../theme/colors.dart';

class LoginScreen extends StatefulWidget {
const LoginScreen({super.key});

@override
State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
final TextEditingController emailController = TextEditingController();
final TextEditingController senhaController = TextEditingController();

bool carregando = false;
String mensagemErro = "";

Future<void> login() async {
final email = emailController.text.trim();
final senha = senhaController.text.trim();

if (email.isEmpty || senha.isEmpty) {
  setState(() {
    mensagemErro = "Preencha e-mail e senha.";
  });
  return;
}

try {
  setState(() {
    carregando = true;
    mensagemErro = "";
  });

  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: senha,
  );

  if (!mounted) return;

  Navigator.pushReplacementNamed(
    context,
    '/navigation',
  );
} on FirebaseAuthException catch (e) {
  String mensagem = "Falha no login.";

  switch (e.code) {
    case 'user-not-found':
      mensagem = "Usuário não encontrado.";
      break;

    case 'wrong-password':
      mensagem = "Senha incorreta.";
      break;

    case 'invalid-credential':
      mensagem = "E-mail ou senha inválidos.";
      break;

    case 'invalid-email':
      mensagem = "E-mail inválido.";
      break;
  }

  setState(() {
    mensagemErro = mensagem;
  });
} finally {
  if (mounted) {
    setState(() {
      carregando = false;
    });
  }
}

}

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: AppColors.background,
body: SingleChildScrollView(
child: Column(
children: [
Container(
width: double.infinity,
height: 320,
decoration: const BoxDecoration(
color: Colors.black,
borderRadius: BorderRadius.only(
bottomLeft: Radius.circular(80),
bottomRight: Radius.circular(80),
),
),
child: Center(
child: Image.asset(
"assets/images/cabecalho.png",
width: MediaQuery.of(context).size.width * 0.70,
),
),
),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const SizedBox(height: 30),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "E-mail",
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: senhaController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Senha",
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),

              if (mensagemErro.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    mensagemErro,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: carregando ? null : login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.purple,
                  ),
                  child: carregando
                      ? const CircularProgressIndicator()
                      : const Text(
                          "Entrar",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/cadastro',
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.yellow,
                  ),
                  child: const Text(
                    "Cadastre-se",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);

}
}
