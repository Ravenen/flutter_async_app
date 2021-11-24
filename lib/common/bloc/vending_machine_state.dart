import 'package:flutter_async_app/common/data/vending_machine.dart';

class VendingMachineState {}

class VendingMachineLoadingState extends VendingMachineState {}

class VendingMachineLoadedState extends VendingMachineState {
  final VendingMachine vendingMachine;

  VendingMachineLoadedState({required this.vendingMachine});
}
