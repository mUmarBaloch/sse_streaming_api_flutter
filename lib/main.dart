import 'package:eventflux/eventflux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart' as sse;
import 'package:sse_streaming_api_flutter/chat_card.dart';
import 'package:sse_streaming_api_flutter/methods/even_flux_method.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SSE Api Connection',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Streaming API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int timer = 20;


List<EventFluxData>? events;
@override
void initState() {
  subscribeViaEventFlux(20, events);
    Future.delayed(Duration(seconds: 1)).then((_){
      --timer;
      setState(() {
        
      });
    })

    ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
              'Connection will end in : $timer',
            ),
           Expanded(child: ListView(
            children:events == null ? [SizedBox(height: 10,)]: events!.map((event)=>ChatCard(name: event.event, message: event.data)).toList(),
           )),
          ],
        ),
      ),
     
    );
  }
}
