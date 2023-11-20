import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemsCartao extends StatelessWidget {
  String textoSituacao;
  String textoTipo;
  ItemsCartao(
      {super.key, required this.textoSituacao, required this.textoTipo});

  @override
  Widget build(BuildContext context) {
    TextStyle textoStyle = const TextStyle(fontSize: 18);
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Situação',
                style: textoStyle,
              ),
              Text(
                'Tipo de Cartão',
                style: textoStyle,
              ),
            ],
          ),
          SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ativo',
                style: TextStyle(fontSize: 17, color: Colors.green),
              ),
              Text(
                'Adiantamento Salarial',
                style: TextStyle(fontSize: 17, color: Color(0xFF550F12)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
