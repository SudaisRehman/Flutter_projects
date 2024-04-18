import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class homeProvider extends ChangeNotifier {
  int x = 0;
  Color individualContainerColor = Color(0xffC60000);
  Color organizationContainerColor = Colors.white;
  Color individualTextColor = Colors.white;
  Color organizationTextColor = Color(0xffC60000);
  void changeContainerColor(String containerType) {
    if (containerType == 'Individual') {
      individualContainerColor =
          Color(0xffc60000); // Change to the desired color
      organizationContainerColor =
          Colors.white; // Reset the other container's color
      individualTextColor = Colors.white;
      organizationTextColor = Color(0xffa4a4a4);
    } else if (containerType == 'Organization') {
      individualContainerColor =
          Colors.white; // Reset the other container's color
      organizationContainerColor =
          Color(0xffc60000); // Change to the desired color
      organizationTextColor = Colors.white;
      individualTextColor = Color(0xffa4a4a4);
    }
    notifyListeners();
  }

  void screenchange(value) {
    x = value;
    notifyListeners();
  }
}

class vedioProvider extends ChangeNotifier {
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;
  VideoPlayerController? get controller => _controller;
  Future<void>? get initializeVideoPlayerFuture => _initializeVideoPlayerFuture;
  void setController(VideoPlayerController? controller) {
    _controller = controller;
    notifyListeners();
  }

  void playvedio() {
    if (_controller!.value.isPlaying) {
      _controller!.pause();
    } else {
      _controller!.play();
    }
    notifyListeners();
  }

//   VideoPlayerController? _controller;
//   Future<void>? _initializeVideoPlayerFuture;
//   VideoPlayerController? get controller => _controller;
//   Future<void>? get initializeVideoPlayerFuture =>
//       _initializeVideoPlayerFuture;
//   void setController(VideoPlayerController? controller) {
//     _controller = controller;
//     notifyListeners();
//   }

//   if (_controller.value.isPlaying) {
//                                   _controller.pause();
//                                 } else {
//                                   _controller.play();
//                                 }
// }
}

class screenchangeProvider extends ChangeNotifier {}
