import 'package:flutter/material.dart';
import 'package:helphealth/data/Funcionarios_data.dart';
import 'package:helphealth/main.dart';
import 'package:helphealth/sections/perfil.dart';

class LoginFuncionario extends StatelessWidget {
  const LoginFuncionario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child:   FuncionarioLogin(),
      )
    
    );
  }
}

class FuncionarioLogin extends StatefulWidget {
  const FuncionarioLogin({Key? key}) : super(key: key);

  @override
  _FuncionarioLoginState createState() => _FuncionarioLoginState();
}

class _FuncionarioLoginState extends State<FuncionarioLogin> {
  TextEditingController cpfController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const Myapp()),
              ));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 34, 216, 192),
              minimumSize: const Size(60, 60),
            ),
            child: const Icon(Icons.arrow_back),
          ),
          const Padding(padding: EdgeInsets.only(top: 40)),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/helphealthprofilepic.png'),
                      radius: 130,
                      backgroundColor: Colors.transparent,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 50,
                      ),
                    ),
                    TextField(
                      controller: cpfController,
                      decoration: InputDecoration(
                        fillColor: Color.fromRGBO(26, 117, 159, 1),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(26, 117, 159, 1),
                          ),
                        ),
                        labelText: 'CPF',
                        labelStyle:
                            TextStyle(fontSize: 23, color: Colors.white),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 15)),
                    TextField(
                      controller: senhaController,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Color.fromRGBO(26, 117, 159, 1),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(26, 117, 159, 1),
                          ),
                        ),
                        labelText: 'Senha',
                        labelStyle:
                            TextStyle(fontSize: 23, color: Colors.white),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 40)),
                    ElevatedButton(
                      onPressed: () {
                        String cpfDigitado = cpfController.text;
                        String senhaDigitada = senhaController.text;

                        bool autenticado = false;

                        for (var funcionario in funcionarios) {
                          if (funcionario.cpf == cpfDigitado &&
                              funcionario.senha == senhaDigitada) {
                            autenticado = true;
                            break;
                          }
                        }

                        String nomeFuncionario =
                            ''; // Inicialize com um valor padrão vazio

                        if (autenticado) {
                          for (var funcionario in funcionarios) {
                            if (funcionario.cpf == cpfDigitado &&
                                funcionario.senha == senhaDigitada) {
                              nomeFuncionario = funcionario.nome;
                              break;
                            }
                          }

                          // Verificar se o nome do funcionário foi encontrado antes de passá-lo para a página de perfil
                          if (nomeFuncionario.isNotEmpty) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Perfil(nomeUsuario: nomeFuncionario),
                            ));
                          }
                        } else {
                          // Exibir mensagem de erro de autenticação
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Erro de Autenticação'),
                                content: Text('CPF ou senha incorretos.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(250, 70)),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(24, 78, 119, 1)),
                      ),
                      child:
                          const Text('Entrar', style: TextStyle(fontSize: 30)),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
