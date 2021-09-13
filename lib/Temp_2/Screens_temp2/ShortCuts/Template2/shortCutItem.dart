import 'package:flutter/material.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class ShortCutItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        child: Card(
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: getScreenWidth(context),
                padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    shortcutImage(context),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    shortcutData(context),
                  ],
                ),
              ),
              border(),
            ],
          ),
        ),
      ),
    );
  }

  Container border() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    );
  }

  Expanded shortcutData(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          mainAxisSize: MainAxisSize.min,
          children: [
            FittedBox(
              child: Text(
                "caption",
                style: subtitlesTextStyle,
                // maxLines: 1,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: getScreenHeight(context) * 0.01,
            ),
            Text(
              "desssssssssssssssssssssss",
              style: normalTextStyle,
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget shortcutImage(BuildContext context) {
    return Container(
        width: 50, //getScreenWidth(context) * 0.15,//0.25
        child: Icon(
          Icons.image,
          color: BLACK.withOpacity(0.7),
          size: getScreenWidth(context) * 0.15,
        ));
  }
}
