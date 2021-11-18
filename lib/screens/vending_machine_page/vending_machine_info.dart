import 'package:flutter/widgets.dart';
import 'package:flutter_async_app/common/vending_machine_api.dart';

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

          return const Padding(
            padding: EdgeInsets.all(50.0),
            child: Center(child: Text("Loading...")),
          );
        });
  }
}
