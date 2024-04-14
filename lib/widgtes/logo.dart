import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final String sourceImage;
  final double widthImage;
  final double heightImage;

  const LogoWidget(
      {super.key,
      required this.sourceImage,
      required this.widthImage,
      required this.heightImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0), // Espaçamento ao redor da imagem
      child: Image.asset(
        sourceImage,
        width: widthImage,
        height: heightImage,
        fit: BoxFit
            .contain, // Use BoxFit para controlar o ajuste da imagem dentro do espaço definido
      ),
    );
  }
}
