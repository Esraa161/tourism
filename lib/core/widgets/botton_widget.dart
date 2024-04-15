import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget.buttonWidget(this.text, this.buttonColor, this.height,
      {super.key});

  final String text;
  final Color buttonColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width / 1.1,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: buttonColor,
      ),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
