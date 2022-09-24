import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';

/// Default portrait controls.
class FlickPortraitControls extends StatelessWidget {
  const FlickPortraitControls(
      {Key? key,
      this.iconSize = 20,
      this.fontSize = 12,
      this.progressBarSettings,
      this.dataManager})
      : super(key: key);

  /// Icon size.
  ///
  /// This size is used for all the player icons.
  final double iconSize;

  /// Data Manager
  ///
  /// This is used to handle multiple URL
  final DataManager? dataManager;

  /// Font size.
  ///
  /// This size is used for all the text.
  final double fontSize;

  /// [FlickProgressBarSettings] settings.
  final FlickProgressBarSettings? progressBarSettings;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: FlickShowControlsAction(
            child: FlickSeekVideoAction(
              child: Center(
                child: FlickVideoBuffer(
                  bufferingChild: const Center(
                      child: CircularProgressIndicator(
                    color: Colors.red,
                  )),
                  child: FlickAutoHideChild(
                      showIfVideoNotInitialized: false,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                dataManager!.skipToPreviousVideo();
                              },
                              child: Icon(
                                Icons.skip_previous,
                                color: dataManager!.hasPreviousVideo()
                                    ? Colors.white
                                    : Colors.white38,
                                size: 35,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FlickPlayToggle(size: 50),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                dataManager!.skipToNextVideo();
                              },
                              child: Icon(
                                Icons.skip_next,
                                color: dataManager!.hasNextVideo()
                                    ? Colors.white
                                    : Colors.white38,
                                size: 35,
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: FlickAutoHideChild(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlickVideoProgressBar(
                    flickProgressBarSettings: progressBarSettings,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlickPlayToggle(
                        size: iconSize,
                      ),
                      SizedBox(
                        width: iconSize / 2,
                      ),
                      FlickSoundToggle(
                        size: iconSize,
                      ),
                      SizedBox(
                        width: iconSize / 2,
                      ),
                      Row(
                        children: <Widget>[
                          FlickAutoHideChild(
                            child: Text(
                              '• LIVE',
                              style: TextStyle(
                                  color: Colors.red, fontSize: fontSize),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      FlickSubtitleToggle(
                        size: iconSize,
                      ),
                      SizedBox(
                        width: iconSize / 2,
                      ),
                      FlickFullScreenToggle(
                        size: iconSize,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
