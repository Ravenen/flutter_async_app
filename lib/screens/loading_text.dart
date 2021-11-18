import 'package:flutter/widgets.dart';

class LoadingText extends StatelessWidget {
  const LoadingText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(50.0),
      child: Center(child: Text("Loading...")),
    );
  }
}
