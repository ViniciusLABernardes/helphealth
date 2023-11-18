import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:helphealth/sections/list.dart';

class Hospital extends StatelessWidget {
  final String name;
  final String address;
  final String phoneNumber;
  final double valueCapacidade;
  final double valueSatisfacao;
  final double tempoEspera;

  const Hospital({
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.valueCapacidade,
    required this.valueSatisfacao,
    Key? key,
    required this.tempoEspera,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Substitua pelo valor correto.

    return Scaffold(
      body: HospitalPage(
          name: name,
          address: address,
          phoneNumber: phoneNumber,
          valueCapacidade: valueCapacidade,
          valueSatisfacao: valueSatisfacao,
          tempoEspera: tempoEspera),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: const Color.fromARGB(255, 34, 216, 192),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ListPage()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 34, 216, 192),
            minimumSize: const Size(60, 60),
          ),
          child: const Icon(
            Icons.home,
            size: 50,
          ),
        ),
      ),
    );
  }
}

class HospitalPage extends StatelessWidget {
  final String name;
  final String address;
  final String phoneNumber;
  final double valueCapacidade;
  final double valueSatisfacao;
  final double tempoEspera;
  const HospitalPage({
    Key? key,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.valueCapacidade,
    required this.valueSatisfacao,
    required this.tempoEspera,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalValue = 100.0; // Substitua pelo valor total desejado
    double hours = 24.0;
    double tempoEspera1 = tempoEspera;
    double tempoEspera2 = hours - tempoEspera1;
    double valueSatisfacao1 = valueSatisfacao;
    double valueSatisfacao2 = totalValue - valueSatisfacao1;
    double valueCapacidade1 = valueCapacidade;
    double valueCapacidade2 = totalValue - valueCapacidade1;

    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/hospital.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 36, left: 16, bottom: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const ListPage()),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 34, 216, 192),
                        minimumSize: const Size(60, 60),
                      ),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.maxFinite,
                      height: 633,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                          color: Color.fromRGBO(216, 216, 216, 1),
                        ),
                        child: Column(

                          
                                
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 16, top: 15),
                                  child:  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        name,
                                        style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.all(16)),
                                      Text(
                                        address,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.all(7)),
                                      Text(
                                        phoneNumber,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ),
                                 
                                  const Padding(padding: EdgeInsets.all(10)),
                                  Padding(
                                    padding: EdgeInsets.only(left: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Valor :',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                          width:
                                              20), // Espaço entre as bolinhas
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 34,
                                              216, 192), // Cor desejada
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                  ),
                                  
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Tempo de Espera:',
                                          style: TextStyle(fontSize: 22),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                            height: 90,
                                            width: 130,
                                            child: PieChart(
                                              PieChartData(
                                                sections: [
                                                  PieChartSectionData(
                                                    color: const Color.fromARGB(
                                                        255, 34, 216, 192),
                                                    value:
                                                        tempoEspera1, // Substitua pelo valor desejado
                                                    title:
                                                        '${tempoEspera1.toStringAsFixed(2)} horas', // Substitua pelo rótulo desejado
                                                  ),
                                                  PieChartSectionData(
                                                    color: Color.fromRGBO(
                                                        24, 78, 119, 1),
                                                    value:
                                                        tempoEspera2, // Substitua pelo valor desejado
                                                    // Substitua pelo rótulo desejado
                                                  ),

                                                  // Adicione mais seções conforme necessário
                                                ],
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),

                                  const Padding(padding: EdgeInsets.all(20)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                        Align(  
                                        child: Text(
                                          'Capacidade',
                                          style: TextStyle(fontSize: 22),
                                        ),
                                      ),
                                  const Padding(padding: EdgeInsets.all(8)),
                                  Align(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        height: 150,
                                        width: 180,
                                        child: PieChart(
                                          PieChartData(
                                            sections: [
                                              PieChartSectionData(
                                                color: const Color.fromARGB(
                                                    255, 34, 216, 192),
                                                value:
                                                    valueCapacidade1, // Substitua pelo valor desejado
                                                title:
                                                    '${valueCapacidade1.toStringAsFixed(2)}%', // Substitua pelo rótulo desejado
                                              ),
                                              PieChartSectionData(
                                                color: Color.fromRGBO(
                                                    24, 78, 119, 1),
                                                value:
                                                    valueCapacidade2, // Substitua pelo valor desejado
                                                // Substitua pelo rótulo desejado
                                              ),
                                              // Adicione mais seções conforme necessário
                                            ],
                                          ),
                                        ),
                                      )),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [ 
                                    Align(
                                    child: Text(
                                      'Satisfação',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.all(8)),
                                  Align(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        height: 150,
                                        width: 180,
                                        child: PieChart(
                                          PieChartData(
                                            sections: [
                                              PieChartSectionData(
                                                color: const Color.fromARGB(
                                                    255, 34, 216, 192),
                                                value:
                                                    valueSatisfacao1, // Substitua pelo valor desejado
                                                title:
                                                    '${valueSatisfacao1.toStringAsFixed(2)}%', // Substitua pelo rótulo desejado
                                              ),
                                              PieChartSectionData(
                                                color: Color.fromRGBO(
                                                    24, 78, 119, 1),
                                                value:
                                                    valueSatisfacao2, // Substitua pelo valor desejado
                                                // Substitua pelo rótulo desejado
                                              ),

                                              // Adicione mais seções conforme necessário
                                            ],
                                          ),
                                        ),
                                      )),
                                        ],
                                        )
                                    ],
                                  )
                                
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    ));
  }
}
