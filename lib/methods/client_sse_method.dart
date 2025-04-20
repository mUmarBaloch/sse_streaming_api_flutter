import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';

void subscribViaClientSSE (){
  SSEClient.subscribeToSSE(method: SSERequestType.GET, url: 'https://sse-fake.andros.dev/events/', header: {}).listen((event)=>print(event));
}

// elevenlabsTTS
void subscribeTextToSpeechToSSE ()async {
  SSEClient.subscribeToSSE(
      method: SSERequestType.POST,
      url: 'https://api.elevenlabs.io/v1/text-to-speech/CwhRBWXzGAHq8TQ4Fs17/stream',
      header: {
      "Content-Type":"application/json",
      "xi-api-key":"/keyHere",
      },
      body:{
        
  "text": "Hello World!!",
  "voice_settings": {
    "stability": 0.75,
    "similarity_boost": 0.85
  
}
      }).listen(
    (event) {
      print('Id: ' + (event.id ?? ""));
      print('Event: ' + (event.event ?? ""));
      print('Data: ' + (event.data ?? ""));
    },
  );
}