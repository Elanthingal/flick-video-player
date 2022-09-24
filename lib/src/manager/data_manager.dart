library flick_manager;

import 'dart:async';

import 'flick_manager.dart';

class DataManager {
  DataManager({this.flickManager, this.urls});

  int currentPlaying = 0;
  final FlickManager? flickManager;
  final urls;

  Timer videoChangeTimer;

  String getNextVideo() {
    currentPlaying++;
    return urls[currentPlaying].cycleLink;
  }

  bool hasNextVideo() {
    return currentPlaying != urls.length - 1;
  }

  bool hasPreviousVideo() {
    return currentPlaying != 0;
  }

  skipToNextVideo([Duration duration]) {
    if (hasNextVideo()) {
      flickManager?.handleChangeVideo(
          VideoPlayerController.network(urls[currentPlaying + 1].cycleLink),
          videoChangeDuration: duration);

      currentPlaying++;
    }
  }

  skipToPreviousVideo() {
    if (hasPreviousVideo()) {
      currentPlaying--;
      flickManager.handleChangeVideo(
          VideoPlayerController.network(urls[currentPlaying].cycleLink));
    }
  }
}
