import 'package:flutter/material.dart';

class AppBarPadrao extends StatelessWidget {
  final String? imagem;
  final String titulo;
  final bool? isMenu;
  final bool isArrowBack;

  const AppBarPadrao({
    Key? key,
    this.imagem, // tornando imagem opcional
    required this.isMenu,
    required this.titulo,
    required this.isArrowBack
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF550F12),
      automaticallyImplyLeading: isArrowBack,
      title: Row(
        children: [
          Text(titulo),
          if (imagem != null) // exibe a imagem se ela não for nula
            Image.asset(
              imagem!,
              width: 139,
              height: 29,
            ),
          const Spacer(),
          const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person_outline,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
