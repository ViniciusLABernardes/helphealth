import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:helphealth/sections/LoginFuncionario.dart';
import 'package:helphealth/sections/list.dart';


void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Help Health',
      theme: ThemeData(
        fontFamily: 'Calibri'
      ),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: Stack(
          children: [
           const PagLogin(), 
          ],
        ),
        
      ),
    );
  }
}

class PagLogin extends StatefulWidget {

  const PagLogin({Key? key}) : super(key: key);

  @override
  State<PagLogin> createState() => _PagLoginState();
}

class _PagLoginState extends State<PagLogin> {
  final keyIsFirstLoaded = 'is_first_loaded';
  bool _dialogShown = false;

   @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      showDialogIfFirstLoaded(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white, // cor do topo
            Color.fromARGB(176, 34, 216, 192), // cor do fundo
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.57, 0.57], // metade do gradiente
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Padding(padding: EdgeInsets.all(46)),
                Center(
                  child: Text(
                    'Bem-vindo ao Help Health',
                    style: TextStyle(fontSize: 60),
                    textAlign: TextAlign.center,
                  ),
                ),
                Image(image: AssetImage('assets/images/imgHome.png')),
              ],
            ),
            Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 30)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const ListPage()),
                    ));
                  },
                  style: const ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(250, 50)),
                    backgroundColor:
                        MaterialStatePropertyAll(Color.fromRGBO(24, 78, 119, 1)),
                  ),
                  child: const Text(
                    'Sou usuario',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginFuncionario(),
                    ));
                  },
                  style: const ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(250, 50)),
                    backgroundColor:
                        MaterialStatePropertyAll(Color.fromRGBO(24, 78, 119, 1)),
                  ),
                  child: const Text(
                    'Sou funcionario',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showDialogIfFirstLoaded(BuildContext context) async {
    if (!_dialogShown) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
      if (isFirstLoaded == null) {
        showModalBottomSheet(
           shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            isScrollControlled: true,
            
            backgroundColor: const Color(0xff184e77),
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
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
                      
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 20, right: 20),
                          child: Container(
                            height: 600,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
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
        _dialogShown = true;
      }
    }
  }
}