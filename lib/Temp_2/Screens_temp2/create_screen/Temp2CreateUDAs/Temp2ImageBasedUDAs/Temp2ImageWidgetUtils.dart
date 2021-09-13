import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/Temp2BoxedBlueButtonWidget.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

Widget emptyImageWidget(
    {Function onButtonTapped,
    bool isMandatory,
    String title,
    String buttonTitle}) {
  return BoxedButtonWidget(
    isMandatory: isMandatory,
    title: title,
    onButtonTapped: onButtonTapped,
    buttonTitle: buttonTitle ?? "Upload Image",
    buttonLogo: IC_IMG_UPLOAD,
  );
  // return Temp2WidgetBorder(
  //   isMandatoryUDA: isMandatory,
  //   title: title,
  //   decoration: BoxDecoration(
  //     color: WHITE,
  //     borderRadius: BorderRadius.all(Radius.circular(12.0)),
  //     border: Border.all(
  //       color: DARK_GREY,
  //     ),
  //     boxShadow: [
  //       BoxShadow(
  //           blurRadius: 5.0,
  //           spreadRadius: 0.0,
  //           offset: Offset(2.0, 3.0),
  //           color: DARK_GREY)
  //     ],
  //   ),
  //   child: Padding(
  //     padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
  //     child: BasicButton(
  //         bgColor: Colors.blue[700],
  //         buttonChild: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: [
  //             Text(
  //               "Upload Image",
  //               style: FontUtils.buttonTitlesTextStyle(WHITE),
  //             ),
  //             Image.asset(
  //               IC_IMG_UPLOAD,
  //               color: WHITE,
  //             )
  //           ],
  //         ),
  //         onPressedButton: onButtonTapped),
  //   ),
  // );
}

Widget selectedImageWidget(
    BuildContext context, Widget image, String imageTitle) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: image,
          width: getScreenWidth(context) * 0.15,
        ),
        SizedBox(width: 10),
        Expanded(
            child: Text(
          imageTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ))
      ],
    ),
  );
}
