import 'dart:async';

import 'dart:math';

class OrdersPlacedBloc {
  int _ordersPlaced = 0;

  final _ordersPlacedStateController = StreamController<int>();

  StreamSink<int> get _inOrdersPlaced => _ordersPlacedStateController.sink;

  Stream<int> get ordersPlaced => _ordersPlacedStateController.stream;

  OrdersPlacedBloc() {
    _inOrdersPlaced.addStream(_createIncrementingStream());
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
}
