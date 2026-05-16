import 'package:flutter/material.dart';
import '../theme/colors.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() =>
      _CadastroScreenState();
}

class _CadastroScreenState
    extends State<CadastroScreen> {

  final TextEditingController nomeController =
      TextEditingController();

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController senhaController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backgroundAeon,

      body: SingleChildScrollView(
        child: Column(
          children: [

            // cabeçalho
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

                  width:
                      MediaQuery.of(context)
                              .size
                              .width *
                          0.70,

                  fit: BoxFit.contain,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  const SizedBox(height: 30),

                  const Text(
                    "Cadastro",

                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // nome
                  TextField(
                    controller: nomeController,

                    decoration: const InputDecoration(
                      hintText:
                          "Digite seu nome e sobrenome",

                      prefixIcon:
                          Icon(Icons.person_outline),

                      border: UnderlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // email
                  TextField(
                    controller: emailController,

                    decoration: const InputDecoration(
                      hintText: "Digite o seu email",

                      prefixIcon:
                          Icon(Icons.email_outlined),

                      border: UnderlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // senha
                  TextField(
                    controller: senhaController,
                    obscureText: true,

                    decoration: const InputDecoration(
                      hintText: "Digite sua senha",

                      prefixIcon:
                          Icon(Icons.lock_outline),

                      border: UnderlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // botão cadastro
                  SizedBox(
                    width: double.infinity,
                    height: 44,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: purpleAeon,

                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                            20,
                          ),
                        ),
                      ),

                      onPressed: () {

                        if (nomeController.text.isNotEmpty) {

                          ScaffoldMessenger.of(context).showSnackBar(

                            const SnackBar(
                              content: Text(
                                "Cadastro realizado com sucesso!",
                              ),
                            ),
                          );

                          Navigator.pushReplacementNamed(
                            context,
                            '/quiz',
                          );
                        }
                      },

                      child: const Text(
                        "Cadastrar",

                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}