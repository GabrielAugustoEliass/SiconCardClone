import 'package:flutter/material.dart';

class CardLimiteCompras extends StatefulWidget {
  const CardLimiteCompras({super.key});

  @override
  State<CardLimiteCompras> createState() => _CardLimiteComprasState();
}

class _CardLimiteComprasState extends State<CardLimiteCompras> {
  bool isMoney = true;

  void isMoneyTrue() {
    setState(() {
      isMoney = !isMoney;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10,top: 10, right: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Limite Disponivel de Compras',
                style: TextStyle(fontSize: 19),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  isMoneyTrue();
                },
                child: Icon(
                  isMoney ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xFF550F12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            isMoney ? 'R\$17,90' : '*****',
            style: const TextStyle(
              fontSize: 25,
              color: Color(0xFF550F12),
            ),
          ),
        ],
      ),
    );
  }
}
