import 'package:flutter/cupertino.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeachService {
  static final _speech = stt.SpeechToText();

  static Future<bool> toggleRecording({
     Function(String text)? onResult,
    @required ValueChanged<bool>? onListening,
  }) async {
    if (_speech.isListening) {
      _speech.stop();
      return true;
    }

    final isAvailable = await _speech.initialize(
      onStatus: (status) => onListening!(_speech.isListening),
      onError: (e) => print('Error: $e'),

    );

    if (isAvailable) {
      _speech.listen(onResult: (value) => onResult!(value.recognizedWords));
    }else{
      print("noooooooo");
    }

    return isAvailable;
  }
}