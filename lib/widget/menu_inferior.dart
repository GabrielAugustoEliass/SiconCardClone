import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MenuInferior extends StatelessWidget {
  Icon icon;
  String text;
  final Function()? onTap;
  int index;
  MenuInferior({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(blurRadius: 1),
          ],
          borderRadius: BorderRadius.circular(4),
        ),
        width: 85,
        height: 85,
        child: Padding(
          padding: const EdgeInsets.only(left: 7, top: 4, bottom: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon,
              Text(
                text,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF550F12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
