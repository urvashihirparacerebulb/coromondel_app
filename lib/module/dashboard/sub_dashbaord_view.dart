import 'package:coromandal_app/module/plant/plant_detail_page.dart';
import 'package:coromandal_app/module/plant/plant_list_view.dart';
import 'package:coromandal_app/module/plant/plant_overview_view.dart';
import 'package:coromandal_app/module/theme/convert_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/common_widget.dart';
import '../utility/assets_utility.dart';
import '../utility/color_utility.dart';

class SubDashboardView extends StatefulWidget {
  const SubDashboardView({Key? key}) : super(key: key);

  @override
  State<SubDashboardView> createState() => _SubDashboardViewState();
}

class _SubDashboardViewState extends State<SubDashboardView> {

  @override
  Widget build(BuildContext context) {
    return commonStructure(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          commonHeader(title: "Vizag",isBack: true),
          commonVerticalSpacing(spacing: 20),
          Expanded(
            child: Obx(() => Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: ConvertTheme.convertTheme.getWidgetBgColor(),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: ListView.separated(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                itemCount: 7,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  return InkWell (
                    onTap: () {
                      if(index == 0) {
                        Get.to(() => const PlantListView());
                      }else{
                        Get.to(() => PlantDetailView(
                          title: index == 1 ? "SAP" : index == 2 ? "PAP" : index == 3 ? "Train" : index == 4 ? "Utility Complex" : index == 5 ? "Power" : "Maintenance",
                          subElement: index == 1 ? [
                            "SAP 01","SAP 02","SAP 03",
                          ] : index == 2 ? [
                            "PAP 01","PAP 02"
                          ] : index == 3 ? [
                            "Train A","Train B","Train C",
                          ] : index == 4 ? [
                            "AAST 01","AAST 02","Utility","Deal",
                          ] : index == 5 ? [
                            "And","TG 01","TG 02","TG 03",
                          ] : [
                            "O/S hrs","R/D Plants","Critical Equipment"
                          ]
                        ));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image
                                (image: index == 0 ? overallImage
                                  : index == 1 ? sapImage
                                  : index == 2 ? papImage
                                  : index == 3 ? complexImage
                                  : index == 4 ? utilityComplexImage
                                  : index == 5 ? powerImage
                                  : maintenanceImage,height: 44,width: 44,),
                              commonHorizontalSpacing(spacing: 20),
                              commonHeaderTitle(
                                  title: index == 0 ? "Overall" : index == 1 ? "SAP" : index == 2 ? "PAP" : index == 3 ? "Train" : index == 4 ? "Utility Complex" : index == 5 ? "Power" : "Maintenance",
                                  fontSize: 1.3,
                                  fontWeight: 1
                              )
                            ],
                          ),
                          const Icon(Icons.arrow_forward_ios_sharp,color: greyColor,size: 20,)
                        ],
                      ),
                    ),
                  );
                },
              ),
            )),
          )
        ],
      ),
    );
  }
}