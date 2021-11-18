import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InfoText extends StatelessWidget {
  const InfoText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    List<String> _textParsed = text.split(": ");
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black54),
          children: [
            TextSpan(
              text: "${_textParsed[0]}: ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: _textParsed[1]),
          ],
        ),
      ),
    );
  }
}
