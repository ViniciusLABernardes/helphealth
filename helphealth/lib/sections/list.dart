import 'package:flutter/material.dart';
import 'package:helphealth/main.dart';
import 'package:helphealth/sections/Hospital.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class HospitalInfo {
  final String name;
  final String address;
  final String phoneNumber;
   final double valueCapacidade;
   final double valueSatisfacao;
   final double tempoEspera;
   

  HospitalInfo({
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.valueCapacidade,
    required this.tempoEspera,
     required this.valueSatisfacao
  });

  toLowerCase() {}
}

class _ListPageState extends State<ListPage> {
  List<HospitalInfo> items = [
    HospitalInfo(
      name: "Hospital do Servidor Público Municipal - HSPM",
      address: "R. Castro Alves, 60 - Aclimação",
      phoneNumber: "3208-2211",
       valueCapacidade: 30,
       valueSatisfacao: 60,
       tempoEspera: 1,
    ),
    HospitalInfo(
      name: "HM Dr. Ignácio Proença de Gouvêa",
      address: "R. Juventus, 562 - Mooca",
      phoneNumber: "2069-9923 / 2068-6700",
       valueCapacidade: 38,
      valueSatisfacao: 40,
      tempoEspera: 2,
    ),
    HospitalInfo(
      name: "PSM Perus",
      address: "R. Júlio de Oliveira, 80 - V. Flamengo",
      phoneNumber: "3917-1242",
       valueCapacidade: 80,
       valueSatisfacao: 50,
       tempoEspera: 3,
    ),
    HospitalInfo(
      name: "PSM Lapa - Prof. João Catarin Mezomo",
      address: "Av. Queiroz Filho, 313 - Pq. da Lapa",
      phoneNumber: "3022-4122",
       valueCapacidade: 40,
       valueSatisfacao: 20,
       tempoEspera: 4,
    ),
    HospitalInfo(
      name: "HM Dr. Arthur Ribeiro Saboya - Jabaquara",
      address: "Av. Francisco de Paula Quintanilha Ribeiro, 860 - Jabaquara",
      phoneNumber: "5013-5302",
       valueCapacidade: 60,
       valueSatisfacao: 80,
       tempoEspera: 2,
    ),
    HospitalInfo(
      name: "HM Infantil Menino Jesus",
      address: "R. dos Ingleses, 258 - Bela Vista",
      phoneNumber: "3253-5200",
       valueCapacidade: 75,
       valueSatisfacao: 90,
       tempoEspera: 0.50,
    ),
    HospitalInfo(
      name: "PSM Barra Funda - Álvaro Dino de Almeida",
      address: "R. Vitorino Carmilo, 717 - Barra Funda",
      phoneNumber: "3826-5666",
       valueCapacidade: 15,
       valueSatisfacao: 10,
       tempoEspera: 0.30,
    ),
    HospitalInfo(
      name: "HM Prof. Dr. Waldomiro de Paula - Itaquera/Planalto",
      address: "R. Augusto Carlos Baumann, 1074 - Itaquera",
      phoneNumber: "3208-2211",
       valueCapacidade: 70,
       valueSatisfacao: 47,
       tempoEspera: 3,
    ),
    HospitalInfo(
      name: "HM Dr. Benedito Montenegro - Jardim Iva",
      address: "R. Antonio Lázaro, 226 - Jd. Iva",
      phoneNumber: "2721-8684",
       valueCapacidade: 12,
       valueSatisfacao: 7,
       tempoEspera: 2,
    ),
    HospitalInfo(
      name: "HM Prof. Mario Degni - Jardim Sarah",
      address: "R. Lucas de Leyde, 257 - V. Antonio",
      phoneNumber: "3768-4900",
       valueCapacidade: 35,
       valueSatisfacao: 78,
       tempoEspera: 1,
    ),
    // Adicione os outros hospitais com endereços e números de telefone aqui
  ];
  List<HospitalInfo> filteredItems = [];

@override
void initState() {
  super.initState();
  filteredItems.addAll(items);
}

void filterList(String query) {
  setState(() {
    filteredItems = items
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(20),
      padding: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          const Padding(padding: EdgeInsets.only(top: 20)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: filterList,
              decoration: const InputDecoration(
                  labelText: "Pesquisar hospital ou pronto-socorro",
                  prefixIcon: Icon(Icons.search),
                  fillColor: Colors.blue),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          Expanded(
            child: ListView.builder(
  itemCount: filteredItems.length,
  itemBuilder: (context, index) {
    return Column(
      children: [
        ListTile(
          title: Text(
            filteredItems[index].name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
          onTap: () {
            _onItemTap(context, filteredItems[index]);
          },
        ),
        const Divider(
          color: Color.fromRGBO(
              26, 117, 159, 1), // Cor da linha divisória
          thickness: 2.0, // Espessura da linha divisória
          height: 2.0, // Altura da linha divisória
        ),
      ],
    );
  },
),
          ),
        ],
      ),
    ));
  }
}

void _onItemTap(BuildContext context, HospitalInfo hospitalInfo) {
  
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Hospital(
        name: hospitalInfo.name,
        address: hospitalInfo.address,
        phoneNumber: hospitalInfo.phoneNumber,
        valueCapacidade: hospitalInfo.valueCapacidade,
        valueSatisfacao: hospitalInfo.valueSatisfacao,
        tempoEspera: hospitalInfo.tempoEspera
      ),
    ),
  );
}
