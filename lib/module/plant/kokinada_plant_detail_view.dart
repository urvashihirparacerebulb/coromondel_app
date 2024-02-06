import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configurations/api_service.dart';
import '../common_widgets/common_widget.dart';
import '../theme/convert_theme_colors.dart';
import '../utility/color_utility.dart';

class KokinadaPlantDetailView extends StatefulWidget {
  final String title;
  final List<String> subElement;
  const KokinadaPlantDetailView({Key? key, required this.title, required this.subElement}) : super(key: key);

  @override
  State<KokinadaPlantDetailView> createState() => _KokinadaPlantDetailViewState();
}

class _KokinadaPlantDetailViewState extends State<KokinadaPlantDetailView> {

  List<String> trainCLinks = [
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q2nSdZO2q7hGwgRjATTxq5wDVGzeSgV9VMi20fuv5S0FAV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0N8Q0FMQyAtIFBST0RVQ1RJT04gUkFURQ/value"
  ];

  List<String> trainABCLinks = [
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QKXKdZO2q7hGwgRjATTxq5wCXf76yjrXlgr0QlWSHBFpwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0F8Q0FMQyAtIFBST0RVQ1RJT04gUkFURQ/value",
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QjXOdZO2q7hGwgRjATTxq5wajFLA_INXFENaAafebjEJwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0J8Q0FMQyAtIFBST0RVQ1RJT04gUkFURQ/value",
  ];

  List<String> emsMobileLinks = [];

  getGivenURL({int? index}) {
    if(widget.title == "Train C"){
      return trainCLinks[index!];
    }else if(widget.title == "Train AB"){
      return trainABCLinks[index!];
    }else if(widget.title == "EMS-Mobile App"){
      return emsMobileLinks[index!];
    }
  }

  commonRows({String title = ""}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          commonHeaderTitle(title: title,fontWeight: 2,
              fontSize: 1.1),
          commonHeaderTitle(title: "30 L",fontSize: 1.1, isChangeColor: true,color: lightFontColor),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
      body: Column(
        children: [
          commonHeader(title: "Kokinada (AP)"),
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
              itemCount: widget.subElement.length,
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemBuilder: (context, index) {
                return ExpansionTile(
                  tilePadding: const EdgeInsets.only(right: 0),
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(height: 12,width: 12,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: greenColor
                                  )),
                              commonHorizontalSpacing(),
                              Expanded(child: commonHeaderTitle(
                                  title: widget.subElement[index],
                                  fontSize: 1.15,fontWeight: 2,
                                  height: 1.2
                              ))
                            ],
                          ),
                        ),

                        commonHorizontalSpacing(spacing: 20),
                        Expanded(
                          flex: 3,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                commonHeaderTitle(
                                    title: "Throughput: ",
                                    fontWeight: 2,
                                    fontSize: 1.1,align: TextAlign.end
                                ),
                                FutureBuilder(
                                    future: linkWiseAPICall(getGivenURL(index: index)),
                                    builder: (context, data) {
                                      return Expanded(child: commonHeaderTitle(
                                          title: data.data.toString(),
                                          fontSize: 1.1, isChangeColor: true,color: lightFontColor,
                                          align: TextAlign.end
                                      ));
                                    }
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  children: widget.title == "Train C" ? [
                    commonRows(title: "Plant running status "),
                    commonRows(title: "Current & Previous day production"),
                    commonRows(title: "PR Back pressure(NH3 & NP acid)"),
                    commonRows(title: "Recycle elevator load"),
                    commonRows(title: "Stack parameters(NH3,HF & SPM)"),
                    commonRows(title: "Product temperature"),
                    commonRows(title: "Product moisture"),
                  ] : widget.title == "Train AB" ? [
                    commonRows(title: "Plant status"),
                    commonRows(title: "Grade Opeartion"),
                    commonRows(title: "Today Production"),
                    commonRows(title: "Previous day Production"),
                    commonRows(title: "Onstream hours"),
                    commonRows(title: "PN reactor temperature"),
                    commonRows(title: "Pipe Reactor Skin temperature"),
                    commonRows(title: "Pipe Reactor back pressure"),
                    commonRows(title: "Product Temperature"),
                    commonRows(title: "Product Moisture"),
                    commonRows(title: "Ammonia stack Emission"),
                    commonRows(title: "HF stack Emission"),
                    commonRows(title: "SPM stack Emission"),
                    commonRows(title: "Thioadd Flow/Molten sulphur flow"),
                    commonRows(title: "Tail Gas Scrubber PH"),
                    commonRows(title: "Sulphuric Acid to Tail gas scrubber"),
                  ] : widget.title == "EMS-Mobile App" ? [
                    commonRows(title: "Total Active Power(KW)"),
                    commonRows(title: "Total Grid Power (MW)"),
                    commonRows(title: "Total Captive Power (MW)"),
                    commonRows(title: "MD Alert (MVA)"),
                    commonRows(title: "Unproductive Energy Consumption (KW)"),
                    commonRows(title: "Power factor"),
                    commonRows(title: "Energy Losses(KW)"),
                  ] : [],
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
