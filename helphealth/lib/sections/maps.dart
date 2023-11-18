
import 'package:flutter/material.dart';
import 'package:helphealth/main.dart';




class SearchBarPage extends StatelessWidget {
  const SearchBarPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Image.network(
            'https://t.ctcdn.com.br/W1LsMRpsIK0SzYMKqBzj92y-8qI=/512x288/smart/filters:format(webp)/i325697.jpeg', // Substitua pelo caminho da sua imagem
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Pesquisar',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 88, 226, 208),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Myapp()));
                        },
                        child: const Icon(Icons.home, size: 60),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
