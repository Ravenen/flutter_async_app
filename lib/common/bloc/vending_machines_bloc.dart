import 'dart:async';

import 'package:flutter_async_app/common/bloc/vending_machines_event.dart';
import 'package:flutter_async_app/common/bloc/vending_machines_state.dart';

class VendingMachinesBloc {
  final _vendingMachinesEventController =
      StreamController<VendingMachinesEvent>.broadcast();
  final _singleVendingMachineEventController =
      StreamController<SingleVendingMachineEvent>.broadcast();
  final _vendingMachinesStateController =
      StreamController<VendingMachinesState>.broadcast();
  final _singleVendingMachineStateController =
      StreamController<SingleVendingMachineState>.broadcast();

  StreamSink<VendingMachinesEvent> get vendingMachinesEventSink =>
      _vendingMachinesEventController.sink;

  StreamSink<SingleVendingMachineEvent> get singleVendingMachineEventSink =>
      _singleVendingMachineEventController.sink;

  Stream<VendingMachinesState> get vendingMachinesStateStream =>
      _vendingMachinesStateController.stream;

  Stream<SingleVendingMachineState> get singleVendingMachinesStateStream =>
      _singleVendingMachineStateController.stream;


}
