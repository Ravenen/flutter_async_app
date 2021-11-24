import 'package:flutter_async_app/common/data/vending_machine.dart';

class VendingMachinesState {}

class VendingMachinesLoadingState extends VendingMachinesState {}

class VendingMachinesLoadedState extends VendingMachinesState {
  final List<VendingMachine> vendingMachines;

  VendingMachinesLoadedState({required this.vendingMachines});
}

class VendingMachineState {}

class VendingMachineLoadingState extends VendingMachineState {}

class VendingMachineLoadedState extends VendingMachineState {
  final VendingMachine vendingMachine;

  VendingMachineLoadedState({required this.vendingMachine});
}
