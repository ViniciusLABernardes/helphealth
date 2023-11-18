import 'package:flutter/material.dart';
import 'package:helphealth/sections/perfil.dart';

class FeedbackScreen extends StatefulWidget {
  final String nomeUsuario;
  const FeedbackScreen(this.nomeUsuario,{super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState(nomeUsuario);
}

enum HoraDeEspera { trintaMinutos, umaHora, duasHoras, tresHorasPlus }

enum CapacidadeUnidade { naoCheio, poucoCheio, muitoCheio, capacidadeMaxima }

enum AvaliacaoPaciente { pessima, ruim, boa, excelente }

class _FeedbackScreenState extends State<FeedbackScreen> {
  HoraDeEspera? _espera = HoraDeEspera.trintaMinutos;
  CapacidadeUnidade? _capacidade = CapacidadeUnidade.naoCheio;
  AvaliacaoPaciente? _avaliacao = AvaliacaoPaciente.pessima;
final String nomeUsuario;

  _FeedbackScreenState(this.nomeUsuario);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, bottom: 30),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
             builder: ((context) => Perfil(nomeUsuario: nomeUsuario,))));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 34, 216, 192),
              minimumSize: const Size(60, 60),
            ),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Feedbacks',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Capacidade da unidade',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff76C893),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 8),
                          ListTile(
                              title: const Text('Não está cheio'),
                              leading: Radio<CapacidadeUnidade>(
                                  value: CapacidadeUnidade.naoCheio,
                                  groupValue: _capacidade,
                                  onChanged: (CapacidadeUnidade? value) {
                                    setState(() {
                                      _capacidade = value;
                                    });
                                  })),
                          ListTile(
                              title: const Text('Pouco lotado'),
                              leading: Radio<CapacidadeUnidade>(
                                  value: CapacidadeUnidade.poucoCheio,
                                  groupValue: _capacidade,
                                  onChanged: (CapacidadeUnidade? value) {
                                    setState(() {
                                      _capacidade = value;
                                    });
                                  })),
                          ListTile(
                              title: const Text('Muito cheio'),
                              leading: Radio<CapacidadeUnidade>(
                                  value: CapacidadeUnidade.muitoCheio,
                                  groupValue: _capacidade,
                                  onChanged: (CapacidadeUnidade? value) {
                                    setState(() {
                                      _capacidade = value;
                                    });
                                  })),
                          ListTile(
                              title: const Text('Capacidade máxima atingida'),
                              leading: Radio<CapacidadeUnidade>(
                                  value: CapacidadeUnidade.capacidadeMaxima,
                                  groupValue: _capacidade,
                                  onChanged: (CapacidadeUnidade? value) {
                                    setState(() {
                                      _capacidade = value;
                                    });
                                  })),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Tempo de espera',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff76C893),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 8),
                          ListTile(
                              title: const Text('30 minutos'),
                              leading: Radio<HoraDeEspera>(
                                  value: HoraDeEspera.trintaMinutos,
                                  groupValue: _espera,
                                  onChanged: (HoraDeEspera? value) {
                                    setState(() {
                                      _espera = value;
                                    });
                                  })),
                          ListTile(
                              title: const Text('1 hora'),
                              leading: Radio<HoraDeEspera>(
                                  value: HoraDeEspera.umaHora,
                                  groupValue: _espera,
                                  onChanged: (HoraDeEspera? value) {
                                    setState(() {
                                      _espera = value;
                                    });
                                  })),
                          ListTile(
                              title: const Text('2 horas'),
                              leading: Radio<HoraDeEspera>(
                                  value: HoraDeEspera.duasHoras,
                                  groupValue: _espera,
                                  onChanged: (HoraDeEspera? value) {
                                    setState(() {
                                      _espera = value;
                                    });
                                  })),
                          ListTile(
                              title: const Text('3 horas ou mais'),
                              leading: Radio<HoraDeEspera>(
                                  value: HoraDeEspera.tresHorasPlus,
                                  groupValue: _espera,
                                  onChanged: (HoraDeEspera? value) {
                                    setState(() {
                                      _espera = value;
                                    });
                                  })),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Avaliação dos pacientes',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff76C893),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 8),
                          ListTile(
                              title: const Text('Péssima'),
                              leading: Radio<AvaliacaoPaciente>(
                                  value: AvaliacaoPaciente.pessima,
                                  groupValue: _avaliacao,
                                  onChanged: (AvaliacaoPaciente? value) {
                                    setState(() {
                                      _avaliacao = value;
                                    });
                                  })),
                          ListTile(
                              title: const Text('Ruim'),
                              leading: Radio<AvaliacaoPaciente>(
                                  value: AvaliacaoPaciente.ruim,
                                  groupValue: _avaliacao,
                                  onChanged: (AvaliacaoPaciente? value) {
                                    setState(() {
                                      _avaliacao = value;
                                    });
                                  })),
                          ListTile(
                              title: const Text('Boa'),
                              leading: Radio<AvaliacaoPaciente>(
                                  value: AvaliacaoPaciente.boa,
                                  groupValue: _avaliacao,
                                  onChanged: (AvaliacaoPaciente? value) {
                                    setState(() {
                                      _avaliacao = value;
                                    });
                                  })),
                          ListTile(
                              title: const Text('Excelente'),
                              leading: Radio<AvaliacaoPaciente>(
                                  value: AvaliacaoPaciente.excelente,
                                  groupValue: _avaliacao,
                                  onChanged: (AvaliacaoPaciente? value) {
                                    setState(() {
                                      _avaliacao = value;
                                    });
                                  })),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text(
                  'Enviar',
                  style: TextStyle(fontSize: 20),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(120,60)),
                  maximumSize: MaterialStatePropertyAll(Size(120,60))),
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
                                  'Feedback enviado\ncom Sucesso!',
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
                                          'Não se esqueça que o\nfeedback deve ser\natualizado a cada 1 hora!',
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
                },
              ),
            ],
          ),
        ),
      ])),
    );
  }
}
