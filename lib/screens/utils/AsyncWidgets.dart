import 'package:flutter/material.dart';
import 'package:greenland_stock/screens/utils/ColorLoader.dart';
import 'package:greenland_stock/screens/utils/CustomColors.dart';
import 'package:greenland_stock/screens/utils/GradientText.dart';

class AsyncWidgets {
  static asyncWaiting(
      {dotOneColor = CustomColors.green,
      dotTwoColor = CustomColors.alertRed,
      dotThreeColor = CustomColors.black}) {
    return <Widget>[
      ColorLoader(
        dotOneColor: dotOneColor,
        dotTwoColor: dotTwoColor,
        dotThreeColor: dotThreeColor,
        dotIcon: Icon(Icons.arrow_forward_ios),
      ),
      GradientText(
        'LOADING...',
        size: 16.0,
        gradient: LinearGradient(
          colors: [
            CustomColors.green,
            CustomColors.alertRed,
          ],
        ),
      ),
    ];
  }

  static asyncSearching(
      {dotOneColor = CustomColors.green,
      dotTwoColor = CustomColors.alertRed,
      dotThreeColor = CustomColors.black}) {
    return <Widget>[
      ColorLoader(
        dotOneColor: dotOneColor,
        dotTwoColor: dotTwoColor,
        dotThreeColor: dotThreeColor,
        dotIcon: Icon(Icons.arrow_forward_ios),
      ),
      GradientText(
        'Searching...',
        size: 16.0,
        gradient: LinearGradient(
          colors: [
            CustomColors.green,
            CustomColors.alertRed,
          ],
        ),
      ),
    ];
  }

  static asyncError() {
    return <Widget>[
      Icon(
        Icons.error_outline,
        color: CustomColors.alertRed,
        size: 60,
      ),
      Text(
        'Unable to load, Error!',
        style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: CustomColors.alertRed),
      ),
    ];
  }
}
