import 'package:flutter/material.dart';

/// Flutter code sample for [showModalBottomSheet].

void main() => runApp(const BottomSheetApp());

class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BottomSheetExample(),
      ),
    );
  }
}

class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
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
                height: 600,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          'O que é o\nHelp Health?',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
                        ),
                      ),
                      // Padding(padding: EdgeInsets.only(top: 30 ),),
                      // SingleChildScrollView(child:
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 20, right: 20),
                          child: Container(
                            height: 600,
                            decoration: BoxDecoration(
                              color: Colors
                                  .blue, // Replace with your desired background color
                              borderRadius: BorderRadius.circular(
                                  10), // Adjust the radius as needed
                            ),
                            child: const SizedBox(
                              child: Center(
                                child: Text(
                                  'Trata-se de um \n aplicativo de feedbacks, dada pelos \npacientes e cadastradas através dos \nfuncionários, sobre as unidades de \nsaúde publica da metropole de São Paulo,\ncom o objetivo de facilitar a vida do paciente\n ao procurar uma unidade pública.\nNele você encontra a lotação da \nunidade,  tempo de espera de \natendimento e avaliação de \natendimento.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,fontSize: 22
                                  ),
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
        },
      ),
    );
  }
}
