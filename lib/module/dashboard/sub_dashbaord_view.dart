import 'package:coromandal_app/module/plant/visag_plant_view.dart';
import 'package:coromandal_app/module/theme/convert_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common_widgets/common_widget.dart';
import '../controllers/general_controller.dart';
import '../plant/ennore_plant_detail_view.dart';
import '../plant/kokinada_plant_detail_view.dart';
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
          commonHeader(title: GeneralController.to.selectedDashboard.value == "1" ? "Vizag" : GeneralController.to.selectedDashboard.value == "2" ? "Ennore" : "Kakinada",isBack: true),
          commonVerticalSpacing(spacing: 20),
          Expanded(
            child: Obx(() => Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: ConvertTheme.convertTheme.getWidgetBgColor(),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: GeneralController.to.selectedDashboard.value == "1" ?
              ListView.separated(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                itemCount: 5,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  return InkWell (
                    onTap: () {
                      // if(index == 0 && index == 4) {
                      //   Get.to(() => const PlantListView());
                      // } else{
                        Get.to(() => VisagPlantDetailView(
                            title: index == 0 ? "SAP" :
                            index == 1 ? "PAP" :
                            index == 2 ? "Train" :
                            index == 3 ? "EMS-Mobile App" :
                            "Asset Health",
                          // title: index == 1 ? "SAP" : index == 2 ? "PAP" : index == 3 ? "Train" : index == 4 ? "Utility Complex" : index == 5 ? "Power" : "Maintenance",
                          subElement: index == 0 ? [
                            "SAP 01","SAP 02","SAP 03"
                          ] : index == 1 ? [
                            "PAP 01","PAP 02"
                          ] : index == 2 ? [
                            "Train A","Train B","Train C"
                          ] : index == 3 ? [
                            "AAST 01","AAST 02","Utility","Deal"
                          ] : [
                            "O/S hrs","R/D Plants","Critical Equipment"
                          ]
                        ));
                      // }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image
                                (image:  index == 0 ? sapImage
                                  : index == 1 ? papImage
                                  : index == 2 ? complexImage
                                  : index == 3 ? complexImage
                                  : overallImage,
                                  height: 44,width: 44),
                              commonHorizontalSpacing(spacing: 20),
                              commonHeaderTitle(
                                  title: index == 0 ? "SAP" :
                                  index == 1 ? "PAP" :
                                  index == 2 ? "Train" :
                                  index == 3 ? "Energy Management System" :
                                  "Asset Health",
                                  fontSize: 1.3,
                                  fontWeight: 1
                              )
                              // Image
                              //   (image: index == 0 ? overallImage
                              //     : index == 1 ? sapImage
                              //     : index == 2 ? papImage
                              //     : index == 3 ? complexImage
                              //     : index == 4 ? utilityComplexImage
                              //     : index == 5 ? powerImage
                              //     : maintenanceImage,height: 44,width: 44),
                              // commonHorizontalSpacing(spacing: 20),
                              // commonHeaderTitle(
                              //     title: index == 0 ? "Overall" : index == 1 ? "SAP" : index == 2 ? "PAP" : index == 3 ? "Train" : index == 4 ? "Utility Complex" : index == 5 ? "Power" : "Maintenance",
                              //     fontSize: 1.3,
                              //     fontWeight: 1
                              // )
                            ],
                          ),
                          const Icon(Icons.arrow_forward_ios_sharp,color: greyColor,size: 20,)
                        ],
                      ),
                    ),
                  );
                },
              ) :
              GeneralController.to.selectedDashboard.value == "2" ?
              ListView.separated(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                itemCount: 4,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  return InkWell (
                    onTap: () {
                        Get.to(() => EnnorePlantDetailView(
                            title: index == 0 ? "SAP" : index == 1 ? "PAP" : index == 2 ? "Asset Health" : "EMS-Mobile App",
                            subElement: index == 0 ? [
                              "SAP 01","SAP 02"
                            ] : index == 1 ? [
                              "PAP"
                            ] : index == 2 ? [
                              "AAST 01","AAST 02","Utility","Deal"
                            ] : [
                              "O/S hrs","R/D Plants","Critical Equipment"
                            ]
                        ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image
                                (image: index == 0 ? sapImage
                                  : index == 1 ? papImage
                                  : index == 2 ? overallImage
                                  : overallImage
                                  ,height: 44,width: 44,),
                              commonHorizontalSpacing(spacing: 20),
                              commonHeaderTitle(
                                  title: index == 0 ? "SAP" : index == 1 ? "PAP" : index == 2 ? "Asset Health" : "Energy Management System",
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
              ) :
              ListView.separated(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                itemCount: 2,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  return InkWell (
                    onTap: () {
                        Get.to(() => KokinadaPlantDetailView(
                            title: index == 0 ? "Train" : "EMS-Mobile App",
                            subElement: index == 0 ? [
                              "Train A","Train B", "Train C"
                            ] : [
                              "AAST 01","AAST 02","Utility","Deal"
                            ]
                        ));
                    },
                    child: Padding (
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image
                                (image: index == 0 ? complexImage
                                  : overallImage,height: 44,width: 44,),
                              commonHorizontalSpacing(spacing: 20),
                              commonHeaderTitle(
                                  title: index == 0 ? "Train": "Energy Management System",
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
