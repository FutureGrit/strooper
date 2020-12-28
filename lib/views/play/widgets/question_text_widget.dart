import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../question_view_model.dart';

class QuestionTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<QuestionViewModel>(context, listen: true)
          .question
          .colorName
          .toString(),
      style: TextStyle(
        fontSize: 52.0,
        fontFamily: "Bungee",
        color: Provider.of<QuestionViewModel>(context, listen: true)
            .question
            .colorValue,
      ),
    );
  }
}
