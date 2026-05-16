import 'package:flutter/material.dart';

import '../theme/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController senhaController =
      TextEditingController();

  String mensagemErro = "";

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
                    "Entrar",

                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // email
                  TextField(
                    controller: emailController,

                    decoration: const InputDecoration(
                      hintText:
                          "Digite o seu email",

                      prefixIcon:
                          Icon(Icons.email_outlined),

                      border:
                          UnderlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // senha
                  TextField(
                    controller: senhaController,
                    obscureText: true,

                    decoration: const InputDecoration(
                      hintText:
                          "Digite sua senha",

                      prefixIcon:
                          Icon(Icons.lock_outline),

                      border:
                          UnderlineInputBorder(),
                    ),
                  ),

                  // erro
                  if (mensagemErro.isNotEmpty)
                    Padding(
                      padding:
                          const EdgeInsets.only(
                        top: 8,
                      ),

                      child: Text(
                        mensagemErro,

                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    ),

                  // esqueci a senha
                  Align(
                    alignment:
                        Alignment.centerRight,

                    child: TextButton(
                      onPressed: () {},

                      child: const Text(
                        "Esqueci a senha",
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // botão login
                  SizedBox(
                    width: double.infinity,
                    height: 44,

                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            purpleAeon,

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius
                                  .circular(
                            20,
                          ),
                        ),
                      ),

                      onPressed: () {

                        if (emailController.text ==
                                "admin" &&
                            senhaController.text ==
                                "123") {

                          Navigator.pushReplacementNamed(
                            context,
                            '/menu',
                          );

                        } else {

                          setState(() {
                            mensagemErro =
                                "E-mail ou senha incorretos.";
                          });
                        }
                      },

                      child: const Text(
                        "Acessar",

                        style: TextStyle(
                          color: Colors.white,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // botão cadastro
                  SizedBox(
                    width: double.infinity,
                    height: 44,

                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            yellowAeon,

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius
                                  .circular(
                            20,
                          ),
                        ),
                      ),

                      onPressed: () {

                        Navigator.pushNamed(
                          context,
                          '/cadastro',
                        );
                      },

                      child: const Text(
                        "Cadastre-se",

                        style: TextStyle(
                          color: Colors.black,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // os divos
                  const Column(
                    children: [

                      Text(
                        "Desenvolvido por:",

                        style:
                            TextStyle(fontSize: 11),
                      ),

                      SizedBox(height: 4),

                      Text(
                        "Manoela Oliveira, Paula Carregal, Pedro Santiago, Vanessa Fittipaldi",

                        textAlign:
                            TextAlign.center,

                        style:
                            TextStyle(fontSize: 12),
                      ),

                      SizedBox(height: 4),

                      Text(
                        "2026",

                        style:
                            TextStyle(fontSize: 11),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}