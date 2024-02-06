import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configurations/api_service.dart';
import '../common_widgets/common_widget.dart';
import '../theme/convert_theme_colors.dart';
import '../utility/color_utility.dart';

class EnnorePlantDetailView extends StatefulWidget {
  final String title;
  final List<String> subElement;
  const EnnorePlantDetailView({Key? key, required this.title, required this.subElement}) : super(key: key);

  @override
  State<EnnorePlantDetailView> createState() => _EnnorePlantDetailViewState();
}

class _EnnorePlantDetailViewState extends State<EnnorePlantDetailView> {


  List<String> sapLinks = [
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QQGmdZO2q7hGwgRjATTxq5wiEDu3pPtWF8FZT1MHFQgMgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMXxDQUxDIC0gUFJPRFVDVElPTiBSQVRF/value",
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q-WmdZO2q7hGwgRjATTxq5wEONJk7iYuFsTqqExP85xSgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMnxDQUxDIC0gUFJPRFVDVElPTiBSQVRF/value"
  ];

  List<String> papLinks = [
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QdmidZO2q7hGwgRjATTxq5w93w3q5H5tVcAz7LyxBpeEwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxQQVB8Q0FMQyAtIFBST0RVQ1RJT04gUkFURQ/value"
  ];

  List<String> emsMobileLinks = [];

  List<String> assetsLinks = [];

  getGivenURL({int? index}) {
    if(widget.title == "SAP") {
      return sapLinks[index!];
    }else if(widget.title == "PAP"){
      return papLinks[index!];
    }else if(widget.title == "EMS-Mobile App"){
      return emsMobileLinks[index!];
    }else if(widget.title == "Asset Health"){
      return assetsLinks[index!];
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
          commonHeader(title: "Ennore (AP)"),
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
                  children: widget.title == "SAP" ? [
                    commonRows(title: "Today production"),
                    commonRows(title: "Furnace temp"),
                    commonRows(title: "Blower rpm"),
                    commonRows(title: "Steam Generation rate"),
                    commonRows(title: "So2 emission"),
                    commonRows(title: "1st bed Inlet temperature"),
                    commonRows(title: "1st bed Outlet temperature"),
                    commonRows(title: "IAT Outlet Acid Temperature"),
                    commonRows(title: "Sulphur pump rpm/flow"),
                    commonRows(title: "Boiler out gas temperature"),
                    commonRows(title: "Steam Drum pressure"),
                    commonRows(title: "Product Acid temperature"),
                    commonRows(title: "Cooling tower Inlet temperature"),
                    commonRows(title: "Cooling tower Outlet temperature"),
                  ] : widget.title == "PAP" ? [
                    commonRows(title: "Plant status"),
                    commonRows(title: "Today production"),
                    commonRows(title: "Onstream Hours"),
                    commonRows(title: "Rock Ratio"),
                    commonRows(title: "Reactor temperature"),
                    commonRows(title: "Free Acid"),
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
