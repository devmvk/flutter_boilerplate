
import 'custom_raised_button.dart';
import 'package:flutter/material.dart';

class SocialSignInButton extends CustomRaisedButton{
  SocialSignInButton({
    String assetName,
    @required String text,
    Color textColor,
    Color color,
    VoidCallback onPressed
}) : assert(text != null),
      super(
        onPressed: onPressed,
        color: color,
        child: Row(
          children: <Widget>[
            assetName != null ? Image.asset(assetName) : SizedBox(),
            Expanded(child: SizedBox(),),
            Text(text,
              style: TextStyle(
                color: textColor,
                fontSize: 15.0),
              ),
            Expanded(child: SizedBox(),)
          ],
        ),
      );
}