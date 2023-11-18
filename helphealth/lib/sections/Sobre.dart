import 'package:flutter/material.dart';
// import 'package:helphealth/data/Funcionarios_data.dart';
// import 'package:helphealth/sections/LoginFuncionario.dart';
import 'package:helphealth/sections/perfil.dart';

class Sobre extends StatelessWidget {
  final String nomeUsuario;
  const Sobre(this.nomeUsuario, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          builder: ((context) => Perfil(
                                nomeUsuario: nomeUsuario,
                              ))));
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Assunto',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(16),
                      child: TextField(
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
                          labelText: '*erro na pagina tal',
                          labelStyle:
                              TextStyle(fontSize: 20, color:Color.fromARGB(255, 226, 226, 226),),
                              
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  <Widget>[
                    SizedBox(width: 8),
                    Text(
                      'Celular:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(16),
                      child: TextField(
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
                          labelText: '*(11) 99999-9999',
                          labelStyle:
                              TextStyle(fontSize: 20, color: Color.fromARGB(255, 226, 226, 226),),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  <Widget>[
                    SizedBox(width: 8),
                    Text(
                      'Relate ao Suporte',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                     Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(16),
                      
                      child: TextField(
                        maxLines: 5,
                        style: TextStyle(height: 2),
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
                          labelText: '*a pagina apresenta estes erros:',
                          
                          labelStyle:
                              TextStyle(fontSize: 20, color: Color.fromARGB(255, 226, 226, 226),),
                        ),
                      ),
                    ),
                    ElevatedButton(
                child: const Text(
                  'Enviar',
                  style: TextStyle(fontSize: 20),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(120,60)),
                  maximumSize: MaterialStatePropertyAll(Size(120,60))
                ),
                onPressed: () {
                  showModalBottomSheet<dynamic>(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    isScrollControlled: true,
                    context: context,
                    backgroundColor: const Color(0xff184e77),
                    builder: (BuildContext context) {
                      return SizedBox(
                        // decoration:
                        // const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),

                        // color:   const Color(0xff184e77),
                        // ),
                        height: 400,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(top: 30),
                                child: Text(
                                  'Reclamação enviada\ncom Sucesso!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30, left: 20, right: 20),
                                  child: Container(
                                    height: 300,
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .blue, // Replace with your desired background color
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const SizedBox(
                                      child: Center(
                                        child: Text(
                                          'Obrigada pela observação',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
