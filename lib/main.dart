import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sicon_card/pages/contatos_pessoais.dart';
import 'package:sicon_card/pages/dados_pessoais.dart';
import 'package:sicon_card/pages/duvidas.dart';
import 'package:sicon_card/pages/inicial_page.dart';
import 'package:sicon_card/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/loginpage',
      getPages: [
        GetPage(name: '/loginpage', page: () => const LoginPage()),
        GetPage(name: '/inicialpage', page: () => const InicialPage()),
        GetPage(name: '/duvidasajudas', page: () => const DuvidasAjudas()),
        GetPage(name: '/dadospessoais', page: () => const DadosPessoais()),
        GetPage(name: '/contatospessoais', page: () => const ContatosPessoais()),
      ],
    );
  }
}
