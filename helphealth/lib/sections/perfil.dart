import 'package:flutter/material.dart';

import 'package:helphealth/sections/LoginFuncionario.dart';
import 'package:helphealth/sections/Sobre.dart';

import 'package:helphealth/sections/feedback.dart';

import '../data/Funcionarios_data.dart';
import '../model/Funcionarios.dart';




class Perfil extends StatelessWidget {
  final String nomeUsuario;
  const Perfil({Key? key, required this.nomeUsuario}) : super(key: key);
  
 String getImagemUrlDoUsuario(String nomeUsuario) {
    // Encontre o funcionário correspondente pelo nome do usuário
    Funcionario? funcionario = funcionarios.firstWhere(
      (funcionario) => funcionario.nome == nomeUsuario,
      
    );

    // Se o funcionário for encontrado, retorne a URL da imagem
    // ignore: unnecessary_null_comparison
    if (funcionario != null) {
      return funcionario.imageUrl;
    } else {
      // Se o funcionário não for encontrado, retorne uma URL de imagem padrão
      return 'assets/images/helphealthprofilepic.jpg'; // Substitua pela URL ou caminho real da imagem padrão
    }
  }

  @override
  Widget build(BuildContext context) {
     String imageUrl = getImagemUrlDoUsuario(nomeUsuario);
    return Scaffold(
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const LoginFuncionario())));
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 34, 216, 192)),
                        minimumSize: MaterialStatePropertyAll(Size(60, 60)),
                      ),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        imageUrl,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 194, 241, 236),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.only(left: 50, right: 50, top: 20),
                    width: 270,
                    height: 40,
                    child:  Center(
                      child: Text(
                       nomeUsuario,
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.only(left: 50, right: 50, top: 20),
                    width: 270,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FeedbackScreen(nomeUsuario)));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.maps_ugc,
                            size: 35,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Lançar Feedbacks',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.blue,
                  //     borderRadius: BorderRadius.circular(8),
                  //   ),
                  //   margin: const EdgeInsets.only(left: 50, right: 50, top: 20),
                  //   width: 270,
                  //   height: 40,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.of(context).push(MaterialPageRoute(builder: ((context) =>  FeedbackScreen(nomeUsuario))));
                  //     },
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: const <Widget>[
                  //         Icon(
                  //           Icons.insert_chart,
                  //           size: 35,
                  //           color: Colors.white,
                  //         ),
                  //         SizedBox(width: 8),
                  //         Text(
                  //           'Meus Feedbacks',
                  //           style: TextStyle(color: Colors.white, fontSize: 20),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.only(left: 50, right: 50, top: 20),
                    width: 270,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  Sobre(nomeUsuario)));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.help_center,
                            size: 35,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Suporte',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                 
                ],
              ),
            ],
          ),
        ),
      );
    
  }
}
