import 'package:flutter/material.dart';
import 'package:sicon_card/widget/app_bar_padrao.dart';

class DadosPessoais extends StatefulWidget {
  const DadosPessoais({super.key});

  @override
  State<DadosPessoais> createState() => _DadosPessoaisState();
}

class _DadosPessoaisState extends State<DadosPessoais> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(19, 55),
        child: AppBarPadrao(
          imagem: null,
          isMenu: true,
          titulo: 'Dados Pessoais',
          isArrowBack: true,
        ),
      ),
      body: Center(
        child: Text('Não a Dados Pessoais'),
      )
    );
  }
}
