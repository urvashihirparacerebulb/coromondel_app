import 'package:coromandal_app/module/plant/overview_page.dart';
import 'package:coromandal_app/module/theme/convert_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common_widgets/common_widget.dart';
import '../utility/color_utility.dart';

class PlantListView extends StatefulWidget {
  const PlantListView({Key? key}) : super(key: key);

  @override
  State<PlantListView> createState() => _PlantListViewState();
}

class _PlantListViewState extends State<PlantListView> {

  @override
  Widget build(BuildContext context) {
    return commonStructure(
      body: Column(
        children: [
          commonHeader(title: "Overall"),
          commonVerticalSpacing(spacing: 20),
          Obx(() => Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: ConvertTheme.convertTheme.getWidgetBgColor(),
                borderRadius: BorderRadius.circular(10)
            ),
            child: ListView.separated(
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              itemCount: 3,
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    if(index == 0) {
                      // Get.to(() => const PlantOverview());
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        commonHeaderTitle(
                            title: index == 0 ? "All plants" : index == 1 ? "Products" : "All Plant EMS",
                            fontSize: 1.1,fontWeight: 1
                        ),
                        commonHorizontalSpacing(spacing: 20),
                        commonHeaderTitle(
                            title: index == 0 ? "19.25 L" : index == 1 ? "22.00 L" : "22.00 L",
                            fontSize: 1.1, isChangeColor: true,color: lightFontColor
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
