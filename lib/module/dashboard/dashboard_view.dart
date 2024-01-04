import 'package:coromandal_app/module/dashboard/sub_dashbaord_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common_widgets/common_widget.dart';
import '../theme/convert_theme_colors.dart';
import '../utility/assets_utility.dart';
import '../utility/color_utility.dart';
import '../utility/constants.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  @override
  Widget build(BuildContext context) {
    return commonStructure(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonHeader(title: "Dashboard",isBack: false),
          commonVerticalSpacing(spacing: 20),
          commonHeaderTitle(title: "     Welcome Vizag",fontWeight: 2,fontSize: 1.4,
              align: TextAlign.start),
          commonVerticalSpacing(spacing: 20),
          Obx(() => Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
                color: ConvertTheme.convertTheme.getWidgetBgColor(),
                borderRadius: BorderRadius.circular(10)
            ),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 10),
              shrinkWrap: true,
              itemCount: 1,
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemBuilder: (context, index) {
                return InkWell (
                  onTap: () {
                    Get.to(() => const SubDashboardView());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(image: index == 0 ? dashboard1Image : otherServicesImage),
                          commonHorizontalSpacing(spacing: 20),
                          commonHeaderTitle(
                              title: index == 0 ? "Vizag" : otherText,
                              fontSize: 1.3,
                              fontWeight: 1
                          )
                        ],
                      ),
                      const Icon(Icons.arrow_forward_ios_sharp,color: greyColor,size: 20,)
                    ],
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
