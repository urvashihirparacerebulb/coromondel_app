import 'package:coromandal_app/module/theme/convert_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../setting/setting_view.dart';
import '../utility/color_utility.dart';
import '../utility/theme_utils.dart';

BorderRadius commonButtonBorderRadius = BorderRadius.circular(10.0);

commonHeader({String title = "", bool isBack = true}){
  return Container(
    height: 170,
    decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 1.0],
          colors: [
            firstColor,secondaryColor
          ],
        ),
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40)
        )
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 34),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          isBack ? InkWell(
              onTap: (){
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios_outlined,color: whiteColor)) :
              Image.asset('assets/images/black_icon.png',color: whiteColor,),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: whiteColor
            ),textAlign: TextAlign.center,
          ),
          InkWell(
            onTap: () {
              Get.to(() => const ThemeSettingScreen());
            },
              child: Image.asset('assets/images/menu.png',color: whiteColor,))
        ],
      ),
    ),
  );
}


commonVerticalSpacing({double spacing = 10}){
  return SizedBox(height: spacing);
}

commonHorizontalSpacing({double spacing = 10}){
  return SizedBox(width: spacing);
}

commonStructure({required Widget body}){
  return Obx(() => Scaffold(
    backgroundColor: ConvertTheme.convertTheme.getBackGroundColor(),
    body: body,
  ));
}

Widget commonHeaderTitle({String title = "",
  double height = 1.0,
  double fontSize = 1,int fontWeight = 0,
  Color color = fontColor,
  bool isChangeColor = false,
  TextAlign align = TextAlign.start,
  FontStyle fontStyle = FontStyle.normal}) {
  return Text(
    title,
    style: white14PxNormal
        .apply(
        color: isChangeColor ? color : ConvertTheme.convertTheme.getWhiteToBlackColor(),
        fontStyle: fontStyle,
        fontSizeFactor: fontSize,
        fontFamily: "Inter",
        fontWeightDelta: fontWeight)
        .merge(TextStyle(height: height)),
    textAlign: align,
  );
}