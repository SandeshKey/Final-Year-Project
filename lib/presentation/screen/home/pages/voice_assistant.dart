import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';

class VoiceAssistant extends StatefulWidget {
  const VoiceAssistant({Key? key}) : super(key: key);

  @override
  State<VoiceAssistant> createState() => _VoiceAssistantState();
}

class _VoiceAssistantState extends State<VoiceAssistant> {
  late bool _isAlanActivated;

  @override
  void initState() {
    super.initState();
    _isAlanActivated = false;
    AlanVoice.addButton(
        "b9ff7ee2122ffcf62b7adebaf40163da2e956eca572e1d8b807a3e2338fdd0dc/stage");
    AlanVoice.onCommand.add((command) {
    debugPrint("got new command ${command.toString()}");
  });
  }

  @override
  void dispose() {
    AlanVoice.deactivate();
    super.dispose();
  }

  void _handleCommand(String command) {
    print("Received command: $command");
    // handle the command as needed
  }

  void _toggleAlanActivation() {
    setState(() {
      _isAlanActivated = !_isAlanActivated;
      if (_isAlanActivated) {
        AlanVoice.activate();
      } else {
        AlanVoice.deactivate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Assistant'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Press the Alan AI button and start speaking'),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.mic),
              onPressed: _toggleAlanActivation,
              color: _isAlanActivated ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
