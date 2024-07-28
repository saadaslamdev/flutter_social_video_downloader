import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) =>
    TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);

TextStyle getBlackTitleStyle(
        {double fontSize = FontSize.details, required Color color}) =>
    _getTextStyle(fontSize, FontWeightManager.black, color);

TextStyle getTitleStyle(
        {double fontSize = FontSize.details, required Color color}) =>
    _getTextStyle(fontSize, FontWeightManager.bold, color);

TextStyle getBoldStyle(
        {double fontSize = FontSize.details, required Color color}) =>
    _getTextStyle(fontSize, FontWeightManager.bold, color);

TextStyle getMediumStyle(
        {double fontSize = FontSize.details, required Color color}) =>
    _getTextStyle(fontSize, FontWeightManager.medium, color);

TextStyle getRegularStyle(
        {double fontSize = FontSize.details, required Color color}) =>
    _getTextStyle(fontSize, FontWeightManager.regular, color);

TextStyle getLightStyle(
        {double fontSize = FontSize.details, required Color color}) =>
    _getTextStyle(fontSize, FontWeightManager.light, color);
