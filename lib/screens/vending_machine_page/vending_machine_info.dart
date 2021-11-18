import 'package:flutter/widgets.dart';
import 'package:flutter_async_app/common/vending_machine_api.dart';
import 'package:flutter_async_app/screens/loading_text.dart';

class VendingMachineInfo extends StatelessWidget {
  const VendingMachineInfo({Key? key, required this.vendingMachineId})
      : super(key: key);

  final int vendingMachineId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: VendingMachineApi.getById(vendingMachineId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(children: [],);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const LoadingText();
        });
  }
}
