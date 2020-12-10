import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:strooper/constants/shared_style.dart';
import 'package:strooper/constants/ui_utils.dart';
import 'package:strooper/helpers/ui_helper.dart';
import 'package:strooper/home/home_view.dart';
import 'package:strooper/home/home_view_model.dart';
import 'package:strooper/services/local_db/database_setup.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: DatabaseSetup.initialise(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return Text(snapshot.error.toString());
            else
              return ChangeNotifierProvider<HomeViewModel>(
                  create: (context) => HomeViewModel(), child: HomeView());
          } else {
            return _splashWidget(context);
          }
        },
      ),
    );
  }

  Widget _splashWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: appBackgroundDecoration,
      padding: EdgeInsets.all(paddingLarge),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'images/logo.svg',
                height: getWidth(context, divideBy: 4),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'From',
                style: TextStyle(
                    color: Colors.white70, fontSize: 12, letterSpacing: 2),
              ),
              Text(
                'FUTUREGRIT',
                style: TextStyle(
                    color: Colors.white70, fontSize: 16, letterSpacing: 4),
              )
            ],
          )
        ],
      ),
    );
  }
}
