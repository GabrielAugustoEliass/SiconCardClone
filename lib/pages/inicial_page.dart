import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sicon_card/pages/contatos_pessoais.dart';
import 'package:sicon_card/pages/dados_pessoais.dart';
import 'package:sicon_card/pages/duvidas.dart';
import 'package:sicon_card/widget/app_bar_padrao.dart';
import 'package:sicon_card/widget/card_limite_compras.dart';
import 'package:sicon_card/widget/items_cartao.dart';
import 'package:sicon_card/widget/menu_inferior.dart';

class InicialPage extends StatefulWidget {
  const InicialPage({super.key});

  @override
  State<InicialPage> createState() => _InicialPageState();
}

class _InicialPageState extends State<InicialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(19, 55),
        child: AppBarPadrao(
          imagem: 'images/siconcardlogo.png',
          isMenu: true,
          titulo: '',
          isArrowBack: false,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CartaoPadrao(),
                    ItemsCartao(
                        textoSituacao: 'Situação', textoTipo: 'Tipo do Cartão'),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFFFFFFFF),
                        boxShadow: const [
                          BoxShadow(blurRadius: 0.1),
                        ],
                      ),
                      child: const CardLimiteCompras(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MenuInferior(
                  icon: const Icon(
                    Icons.person,
                    size: 30,
                    color: Color(0xFF550F12),
                  ),
                  text: 'Dados Pessoais',
                  onTap: () {
                    Get.to(const DadosPessoais());
                  },
                  index: 1,
                ),
                MenuInferior(
                  icon: const Icon(
                    Icons.person_add_alt_outlined,
                    size: 30,
                    color: Color(0xFF550F12),
                  ),
                  text: 'Contatos',
                  onTap: () {
                    Get.to(const ContatosPessoais());
                  },
                  index: 2,
                ),
                MenuInferior(
                  icon: const Icon(
                    Icons.featured_play_list,
                    size: 30,
                    color: Color(0xFF550F12),
                  ),
                  text: 'Fatura',
                  onTap: () {},
                  index: 3,
                ),
                MenuInferior(
                  icon: const Icon(
                    Icons.help_outline_outlined,
                    size: 30,
                    color: Color(0xFF550F12),
                  ),
                  text: 'Duvidas e ajudas',
                  onTap: () {
                    Get.to(const DuvidasAjudas());
                  },
                  index: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  ClipRRect CartaoPadrao() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        'images/cartaosiconcard.png',
        width: 360,
        height: 230,
        fit: BoxFit.cover,
      ),
    );
  }
}
