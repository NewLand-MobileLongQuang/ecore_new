import 'package:audioplayers/audioplayers.dart';

class AudioService {

  AudioService._();

  static final AudioService _instance = AudioService._();

  final player = AudioPlayer();
  factory AudioService() {
    return _instance;
  }

  void playSound(String filePath, bool loop) async{
    if(loop) player.setReleaseMode(ReleaseMode.loop);
    player.play(AssetSource(filePath), mode: PlayerMode.lowLatency); // faster play low latency eg for a game...

  }

  void stopPlaying(){
    player.stop();
  }
}