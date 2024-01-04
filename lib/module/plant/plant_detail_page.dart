import 'package:coromandal_app/module/plant/plant_overview_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/common_widget.dart';
import '../theme/convert_theme_colors.dart';
import '../utility/color_utility.dart';

class PlantOverview extends StatefulWidget {
  const PlantOverview({Key? key}) : super(key: key);

  @override
  State<PlantOverview> createState() => _PlantOverviewState();
}

class _PlantOverviewState extends State<PlantOverview> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
      body: Column(
        children: [
          commonHeader(title: "Plant Overview"),
          commonVerticalSpacing(spacing: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(child: RichText(
                  text: const TextSpan(
                    text: 'Site: ',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: blackColor),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Vizag',
                          style: TextStyle(fontWeight: FontWeight.normal,color: greyColor,fontSize: 14)),
                    ],
                  ),
                )),
                Expanded(child: RichText(
                  text: const TextSpan(
                    text: 'Plant: ',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: blackColor),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'SAP-03',
                          style: TextStyle(fontWeight: FontWeight.normal,color: greyColor,fontSize: 14)),
                    ],
                  ),
                )),
                Expanded(child: RichText(
                  text: const TextSpan(
                    text: 'Status: ',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: blackColor),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' ⬤  ',
                          style: TextStyle(color: Colors.green,fontSize: 14)),
                      TextSpan(
                          text: 'Running',
                          style: TextStyle(fontWeight: FontWeight.normal,color: greyColor,fontSize: 14)),
                    ],
                  ),
                ))
              ],
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.all(20),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Obx(() => Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: ConvertTheme.convertTheme.getWidgetBgColor(),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: InkWell(
                  onTap: (){
                    // Get.to(() => const PlantDetailView());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        commonHeaderTitle(
                            title:
                            index == 0 ? "Production Overview" :
                            index == 1 ? "Efficiency" :
                            index == 2 ? "Critical Parameters" :
                            "Current Value",
                            fontSize: 1.2,fontWeight: 1
                        ),
                        commonHorizontalSpacing(spacing: 20),
                        const Icon(Icons.arrow_forward_ios_sharp,color: greyColor,size: 20,)
                      ],
                    ),
                  ),
                ),
              ));
            },
          )
        ],
      ),
    );
  }
}
