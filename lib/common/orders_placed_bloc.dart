import 'dart:async';
import 'dart:math';

import 'package:flutter_async_app/common/orders_placed_event.dart';

class OrdersPlacedBloc {
  int _ordersPlaced = 0;

  final _ordersPlacedStateController = StreamController<int>();

  StreamSink<int> get _inOrdersPlaced => _ordersPlacedStateController.sink;

  Stream<int> get ordersPlaced => _ordersPlacedStateController.stream;

  final _ordersPlacedEventController = StreamController<OrdersPlacedEvent>();

  StreamSink<OrdersPlacedEvent> get ordersPlacedEventSink =>
      _ordersPlacedEventController.sink;

  OrdersPlacedBloc() {
    _inOrdersPlaced.add(_ordersPlaced);
    _inOrdersPlaced.addStream(_createIncrementingStream());
    _ordersPlacedEventController.stream.listen(_mapEventToState);
  }

  // This stream is kind of imitation of server-sent events of the placed orders
  // or the polling of the placed orders
  Stream<int> _createIncrementingStream() async* {
    while (true) {
      int _min = 500;
      int _max = 2500;
      final _random = Random();
      int _randMillisecond = _min + _random.nextInt(_max - _min);
      await Future.delayed(Duration(milliseconds: _randMillisecond));
      _ordersPlaced++;
      yield _ordersPlaced;
    }
  }

  void _mapEventToState(OrdersPlacedEvent event) {
    if (event is ClearEvent) {
      _ordersPlaced = 0;
    }
    _inOrdersPlaced.add(_ordersPlaced);
  }
}
