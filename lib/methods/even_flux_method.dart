import 'dart:async';

import 'package:eventflux/eventflux.dart';
void subscribeViaEventFlux (){
  late StreamSubscription<EventFluxData>? eventListener;
final event = EventFlux.instance.connect(EventFluxConnectionType.get, 'https://sse-fake.andros.dev/events/', onSuccessCallback: (res){
eventListener = res?.stream?.listen((event)=>print(event));
},
onError: (exception){
  print(exception);
  eventListener?.cancel();
});

}