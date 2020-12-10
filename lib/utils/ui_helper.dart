import 'package:flutter/material.dart';

double getHeight(BuildContext context, {double divideBy = 1}) {
  return MediaQuery.of(context).size.height / divideBy;
}

double getWidth(BuildContext context, {double divideBy = 1}) {
  return MediaQuery.of(context).size.width / divideBy;
}
