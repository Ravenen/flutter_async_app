import 'package:flutter_async_app/common/data/vending_machine.dart';

class VendingMachinesState {}

class VendingMachinesLoadingState extends VendingMachinesState {}

class VendingMachinesLoadedState extends VendingMachinesState {
  final List<VendingMachine> vendingMachines;

  VendingMachinesLoadedState({required this.vendingMachines});
}

class SingleVendingMachineState {}

class SingleVendingMachineLoadingState extends SingleVendingMachineState {}

class SingleVendingMachineLoadedState extends SingleVendingMachineState {
  final VendingMachine vendingMachine;

  SingleVendingMachineLoadedState({required this.vendingMachine});
}
