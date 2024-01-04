import 'package:coromandal_app/module/common_widgets/common_widget.dart';
import 'package:coromandal_app/module/theme/convert_theme_colors.dart';
import 'package:flutter/material.dart';
import '../theme/theme_service.dart';
import '../utility/color_utility.dart';
import '../utility/common_methods.dart';
import '../utility/constants.dart';

class ThemeSettingScreen extends StatefulWidget {
  const ThemeSettingScreen({super.key});

  @override
  _ThemeSettingScreenState createState() => _ThemeSettingScreenState();
}

class _ThemeSettingScreenState extends State<ThemeSettingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  ThemeSettingEnum themeSettingSelection = ThemeSettingEnum.SystemDefault;


  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    themeChanges();
    super.initState();
  }

  themeChanges() async {
    if(readThemePref() == systemDefault){
      themeSettingSelection = ThemeSettingEnum.SystemDefault;
    }else if(readThemePref() == light){
      themeSettingSelection = ThemeSettingEnum.Light;
    }else{
      themeSettingSelection = ThemeSettingEnum.Dark;
    }
    setState(() {
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ConvertTheme.convertTheme.getBackGroundColor(),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: ConvertTheme.convertTheme.getBackGroundColor(),
            iconTheme: IconThemeData(color: ConvertTheme.convertTheme.getWhiteToBlackColor()),
            title: commonHeaderTitle(
              title: "Theme Setting",fontWeight: 2,fontSize: 1.3
            ),
          ),

          ///adding listView cause scroll issue
          body: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(12),
            color: Colors.transparent,
            child: Column(children: [
              commonVerticalSpacing(),
              themeRadioButton(title: systemDefault, buttonValue: ThemeSettingEnum.SystemDefault),
              commonVerticalSpacing(),
              themeRadioButton(title: light, buttonValue: ThemeSettingEnum.Light),
              commonVerticalSpacing(),
              themeRadioButton(title: dark, buttonValue: ThemeSettingEnum.Dark),
            ]),
          ),
        ),
      ],
    );
  }

  themeRadioButton({String title ="", ThemeSettingEnum buttonValue =ThemeSettingEnum.SystemDefault}) {
    return Card(
        color: ConvertTheme.convertTheme.getWidgetBgColor(),
        elevation: 7.0,
        shadowColor: Theme.of(context).colorScheme.onSecondary.withOpacity(0.14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: Radio<ThemeSettingEnum>(
                    activeColor: secondaryColor,
                    value: buttonValue,
                    groupValue: themeSettingSelection,
                    onChanged: (ThemeSettingEnum? value) async {
                      setState(() {
                        if (value == ThemeSettingEnum.SystemDefault) {
                          writeThemePref(value: ThemeSettingEnum.SystemDefault.name);
                          themeSettingSelection = ThemeSettingEnum.SystemDefault;
                          systemDefaultTheme();
                        }else if (value == ThemeSettingEnum.Light) {
                          writeThemePref(value: ThemeSettingEnum.Light.name);
                          themeSettingSelection = ThemeSettingEnum.Light;
                          lightTheme();
                        } else {
                          writeThemePref(value: ThemeSettingEnum.Dark.name);
                          themeSettingSelection = ThemeSettingEnum.Dark;
                          darkTheme();
                        }
                      });
                    },
                  ),
                ),commonHorizontalSpacing(spacing: 16),
                commonHeaderTitle(
                    title: title,fontWeight: 2,fontSize: 1.3
                )
              ],
            )
        )
    );
  }
}