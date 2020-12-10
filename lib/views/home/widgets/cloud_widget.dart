import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:strooper/utils/ui_helper.dart';

class CloudWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      // TODO: Animate clouds using [RIVE]
      'images/clouds.svg',
      width: getWidth(context),
    );
  }
}
