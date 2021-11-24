import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_async_app/common/bloc/vending_machines_bloc.dart';
import 'package:flutter_async_app/common/bloc/vending_machines_event.dart';
import 'package:flutter_async_app/common/bloc/vending_machines_state.dart';
import 'package:flutter_async_app/screens/loading_text.dart';
import 'package:flutter_async_app/screens/vending_machines_page/vending_machine_card.dart';

class VendingMachinesCardsList extends StatelessWidget {
  const VendingMachinesCardsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VendingMachinesBloc _vendingMachinesBloc = VendingMachinesBloc();
    _vendingMachinesBloc.vendingMachinesEventSink
        .add(VendingMachinesLoadEvent());

    return StreamBuilder<VendingMachinesState>(
        stream: _vendingMachinesBloc.vendingMachinesStateStream,
        builder: (context, snapshot) {
          if (snapshot.data is VendingMachinesLoadedState) {
            return Expanded(
              child: ListView.builder(
                itemCount: (snapshot.data as VendingMachinesLoadedState)
                    .vendingMachines
                    .length,
                itemBuilder: (context, index) {
                  return VendingMachineCard(
                      vendingMachine:
                          (snapshot.data as VendingMachinesLoadedState)
                              .vendingMachines[index]);
                },
              ),
            );
          } else if (snapshot.data is VendingMachinesLoadingState) {
            return const LoadingText();
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Text("Undefined");
        });
  }
}
