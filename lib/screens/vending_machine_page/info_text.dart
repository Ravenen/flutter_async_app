import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InfoText extends StatelessWidget {
  const InfoText({Key? key, required this.heading, this.value = ""}) : super(key: key);

  final String heading;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black54),
          children: [
            TextSpan(
              text: "$heading: ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
