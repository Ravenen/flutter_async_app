class VendingMachinesEvent {}

class VendingMachinesLoadEvent extends VendingMachinesEvent {}

class SingleVendingMachineEvent {}

class SingleVendingMachineLoadEvent extends SingleVendingMachineEvent {
  final int id;

  SingleVendingMachineLoadEvent({required this.id});
}
