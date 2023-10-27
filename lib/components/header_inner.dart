import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../utils/const.dart';

class HeaderInner extends StatelessWidget {
  const HeaderInner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(50.0)),
              color: Constants.mainThemeColor.withOpacity(0.3),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -100,
                  right: -130,
                  child: Image.asset("assets/images/blob_2.png",
                      width: 352, height: 343, color: Constants.mainThemeColor),
                ),
                Positioned(
                  top: 20,
                  left: -100,
                  child: Image.asset("assets/images/blob_1.png",
                      width: 302, height: 343, color: Constants.mainThemeColor),
                ),
              ],
            ),
          ),
        ),
        Expanded(flex: 1, child: Container())
      ],
    );
  }
}
