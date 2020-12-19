import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

import '../home_view_model.dart';

class CloudWidget extends StatefulWidget {
  @override
  _CloudWidgetState createState() => _CloudWidgetState();
}

class _CloudWidgetState extends State<CloudWidget> {
  final riveFileName = 'assets/clouds.riv';
  Artboard _artboard;

  @override
  void initState() {
    //_loadRiveFile();
    setState(() {
      _artboard =
          Provider.of<HomeViewModel>(context, listen: false).getArtboard();
    });
    super.initState();
  }

  // void _loadRiveFile() async {
  //   final bytes = await rootBundle.load(riveFileName);
  //   final file = RiveFile();
  //
  //  if (file.import(bytes)) {
  //   // Select an animation by its name
  //   setState(() => _artboard = file.mainArtboard
  //         ..addController(SimpleAnimation('floating'))
  //         ..addController(SimpleAnimation('twinkling')),
  //       );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return _artboard != null
        ? Rive(artboard: _artboard, alignment: Alignment.center)
        : Container();
  }
}
