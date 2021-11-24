import 'dart:async';

import 'package:flutter_async_app/common/bloc/vending_machines_event.dart';
import 'package:flutter_async_app/common/bloc/vending_machines_state.dart';
import 'package:flutter_async_app/common/data/vending_machine.dart';
import 'package:flutter_async_app/common/vending_machine_api.dart';

class VendingMachinesBloc {
  VendingMachinesState _vendingMachinesState = VendingMachinesEmptyState();
  SingleVendingMachineState _singleVendingMachineState =
      SingleVendingMachineEmptyState();

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

  VendingMachinesBloc() {
    _vendingMachinesEventController.stream
        .listen(_mapVendingMachinesEventToState);
    _singleVendingMachineEventController.stream
        .listen(_mapSingleVendingMachineEventToState);
  }

  Future<void> _mapVendingMachinesEventToState(
      VendingMachinesEvent event) async {
    if (event is VendingMachinesLoadEvent) {
      _vendingMachinesState = VendingMachinesLoadingState();
      _vendingMachinesStateController.add(_vendingMachinesState);
      final List<VendingMachine> _vendingMachines =
          await VendingMachineApi.getAll();
      _vendingMachinesState =
          VendingMachinesLoadedState(vendingMachines: _vendingMachines);
    }
    _vendingMachinesStateController.add(_vendingMachinesState);
  }

  Future<void> _mapSingleVendingMachineEventToState(
      SingleVendingMachineEvent event) async {
    if (event is SingleVendingMachineLoadEvent) {
      _singleVendingMachineState = SingleVendingMachineLoadingState();
      _singleVendingMachineStateController.add(_singleVendingMachineState);
      final VendingMachine _vendingMachine =
          await VendingMachineApi.getById(event.id);
      _singleVendingMachineState =
          SingleVendingMachineLoadedState(vendingMachine: _vendingMachine);
    }
    _singleVendingMachineStateController.add(_singleVendingMachineState);
  }
}
