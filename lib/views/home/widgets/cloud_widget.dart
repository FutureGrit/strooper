import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'package:strooper/enums/game_images.dart';
import 'package:strooper/utils/methods.dart';

class CloudWidget extends StatefulWidget {
  @override
  _CloudWidgetState createState() => _CloudWidgetState();
}

class _CloudWidgetState extends State<CloudWidget> {
  Artboard _artboard;

  @override
  void initState() {
    _loadRiveFile();
    super.initState();
  }

  void _loadRiveFile() async {
    var bytes =
        Methods.getImageData(imageType: GameImages.CLOUDS).buffer.asByteData();

    final file = RiveFile();

    if (file.import(bytes)) {
      // Select an animation by its name
      setState(
        () => _artboard = file.mainArtboard
          ..addController(SimpleAnimation('floating'))
          ..addController(SimpleAnimation('twinkling')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _artboard != null
        ? Rive(artboard: _artboard, alignment: Alignment.bottomCenter)
        : Container();
  }
}
