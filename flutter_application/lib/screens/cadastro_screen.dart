import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../theme/colors.dart';

import '../services/user_service.dart';

class CadastroScreen extends StatefulWidget {
const CadastroScreen({super.key});

@override
State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
final TextEditingController nomeController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController senhaController = TextEditingController();

bool carregando = false;

Future<void> cadastrar() async {
final nome = nomeController.text.trim();
final email = emailController.text.trim();
final senha = senhaController.text.trim();

if (nome.isEmpty || email.isEmpty || senha.isEmpty) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Preencha todos os campos."),
    ),
  );
  return;
}

if (senha.length < 8) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        "A senha deve possuir no mínimo 8 caracteres.",
      ),
    ),
  );
  return;
}

setState(() {
  carregando = true;
});

try {
  final credential =
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: senha,
    );

    await UserService().createUser(
      uid: credential.user!.uid,
      nome: nome,
      email: email,
    );

  if (!mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Cadastro realizado com sucesso!"),
    ),
  );

  Navigator.pushReplacementNamed(
    context,
    '/quiz',
  );
} 
on FirebaseAuthException catch (e) {

  debugPrint('ERRO FIREBASE: ${e.code}');
  debugPrint('MENSAGEM: ${e.message}');

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        '${e.code} - ${e.message}',
      ),
    ),
  );
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
                controller: nomeController,
                decoration: const InputDecoration(
                  hintText: "Nome completo",
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),

              const SizedBox(height: 12),

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
                  hintText: "Senha (mínimo 8 caracteres)",
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: carregando ? null : cadastrar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.purple,
                  ),
                  child: carregando
                      ? const CircularProgressIndicator()
                      : const Text(
                          "Cadastrar",
                          style: TextStyle(
                            color: Colors.white,
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
