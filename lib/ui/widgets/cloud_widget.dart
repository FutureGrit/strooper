import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CloudWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      // TODO: Animate clouds using [RIVE]
      'images/clouds.svg',
      width: MediaQuery.of(context).size.width,
    );
  }
}
