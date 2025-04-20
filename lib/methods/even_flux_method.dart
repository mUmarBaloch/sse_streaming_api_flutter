import 'dart:async';

import 'package:eventflux/eventflux.dart';

void subscribeViaEventFlux(int maxSeconds, List<EventFluxData>? events) {
  late StreamSubscription<EventFluxData>? eventListener;
  final event = EventFlux.instance.connect(
      EventFluxConnectionType.get, 'https://sse-fake.andros.dev/events/',
      onSuccessCallback: (res) {
    eventListener = res?.stream?.listen((event) {
      print('event: ${event.event}, data: ${event.data}');
      events?.add(event);
    });
  }, onError: (exception) {
    print(exception);
    eventListener?.cancel();
  });
// close connection after x second
  Future.delayed(Duration(seconds: maxSeconds)).then((_) {
    eventListener?.cancel();
  });
}
