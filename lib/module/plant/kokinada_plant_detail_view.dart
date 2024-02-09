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

  // getGivenURL({int? index}) {
  //   if(widget.title == "Train C"){
  //     return trainCLinks[index!];
  //   }else if(widget.title == "Train AB"){
  //     return trainABCLinks[index!];
  //   }else if(widget.title == "EMS-Mobile App"){
  //     return emsMobileLinks[index!];
  //   }
  // }

  commonRows({String title = "", link = ""}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          commonHeaderTitle(title: title,fontWeight: 2,
              fontSize: 1.1),
          link != "" ?
          FutureBuilder(
              future: linkWiseAPICall(link),
              builder: (context, data) {
                return Expanded(child: commonHeaderTitle(
                    title: data.data.toString(),
                    fontSize: 1.1, isChangeColor: true,color: lightFontColor,
                    align: TextAlign.end
                ));
              }
          ) :
          commonHeaderTitle(title: "-----",fontSize: 1.1, isChangeColor: true,color: lightFontColor),
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
                        // Expanded(
                        //   flex: 3,
                        //   child: Align(
                        //     alignment: Alignment.bottomRight,
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.end,
                        //       crossAxisAlignment: CrossAxisAlignment.end,
                        //       children: [
                        //         commonHeaderTitle(
                        //             title: "Throughput: ",
                        //             fontWeight: 2,
                        //             fontSize: 1.1,align: TextAlign.end
                        //         ),
                        //         FutureBuilder(
                        //             future: linkWiseAPICall(getGivenURL(index: index)),
                        //             builder: (context, data) {
                        //               return Expanded(child: commonHeaderTitle(
                        //                   title: data.data.toString(),
                        //                   fontSize: 1.1, isChangeColor: true,color: lightFontColor,
                        //                   align: TextAlign.end
                        //               ));
                        //             }
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  children: widget.subElement[index] == "Train C" ? [
                    commonRows(title: "Plant running status "),
                    commonRows(title: "Current day production",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q2nSdZO2q7hGwgRjATTxq5wpsDyrBHCzVoNJhJArSvZfwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0N8Q0FMQyAtIFRPREFZIFBST0RVQ1RJT04/value"),
                    commonRows(title: "Previous day production",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q2nSdZO2q7hGwgRjATTxq5wsRCU9eLJplMteOsxO2Q63AV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0N8Q0FMQyAtIFlFU1RFUkRBWSBQUk9EVUNUSU9O/value"),
                    commonRows(title: "PR Back pressure(NH3 & NP acid)"),
                    commonRows(title: "Recycle elevator load",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QFHadZO2q7hGwgRjATTxq5whxObTpCs2lUY2_2gBXH4FAV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0NcQzJIMTh8RUxFVkFUT1IgQ1VSUkVOVA/value"),
                    commonRows(title: "Stack parameters(NH3)",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QM3WdZO2q7hGwgRjATTxq5w4-WHlP-v5VU9H-VhQ8KKcAV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0NcQzFKMDV8T05MSU5FIFNUQUNLIEFNTU9OSUEgRU1NSVNJT04/value"),
                    commonRows(title: "Stack parameters(HF)",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QM3WdZO2q7hGwgRjATTxq5wpgDmcxczH1sZC3EsJj31hgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0NcQzFKMDV8T05MSU5FIFNUQUNLIEhGIEVNTUlTSU9O/value"),
                    commonRows(title: "Stack parameters(SPM)",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QM3WdZO2q7hGwgRjATTxq5wxUSs59iRa1k9nMGl3f4fvgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0NcQzFKMDV8T05MSU5FIFNUQUNLIFNQTSBEVVNUIEVNTUlTSU9O/value"),
                    commonRows(title: "Product temperature",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QCHadZO2q7hGwgRjATTxq5wn6KNMOLEL1YkgMgCj6b2pwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0NcQzJIMTB8Q09OVkVZT1IgVEVNUEVSQVRVUkU/value"),
                    commonRows(title: "Product moisture",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QMHWdZO2q7hGwgRjATTxq5wj3MHN81g114tRh3_REkNsQV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0NcQzFIMTB8UFJPRFVDVCBNT0lTVFVSRSBBTkFMWVNFUiBPTiBQUk9EVUNUIENPTlZFWU9S/value"),
                  ] : widget.subElement[index] == "Train A" ? [
                    commonRows(title: "Plant status"),
                    commonRows(title: "Grade Opeartion"),
                    commonRows(title: "Today Production",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QKXKdZO2q7hGwgRjATTxq5wJQNBuK6YYVoaDQ_PKYLy0gV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0F8Q0FMQyAtIFRPREFZIFRPVEFMIFBST0RVQ1RJT04/value"),
                    commonRows(title: "Previous day Production",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QKXKdZO2q7hGwgRjATTxq5welC7GNbHiFwRV09ljHj-ogV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0F8Q0FMQyAtIFlFU1RFUkRBWSBUT1RBTCBQUk9EVUNUSU9O/value"),
                    commonRows(title: "Onstream hours",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QKXKdZO2q7hGwgRjATTxq5w9daV4n-V5FcEzYMikgR7EwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0F8Q0FMQyAtIFBMQU5UIFRPREFZIFJVTk5JTkcgVElNRSBIT1VSUw/value"),
                    commonRows(title: "PN reactor temperature"),
                    commonRows(title: "Pipe Reactor Skin temperature"),
                    commonRows(title: "Pipe Reactor back pressure"),
                    commonRows(title: "Product Temperature",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q_XKdZO2q7hGwgRjATTxq5waWN92eVlBFw9SeaAqapiswV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0FcMDUxLUlDLTEwM0F8Q09OVkVZT1IgVEVNUEVSQVRVUkU/value"),
                    commonRows(title: "Product Moisture"),
                    commonRows(title: "Ammonia stack Emission"),
                    commonRows(title: "HF stack Emission",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QXXOdZO2q7hGwgRjATTxq5wV_2mIwFPolgUtiiHuWgZZAV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0FcMy1ELTEwMUF8U1RBQ0sgSFlEUk9GTFVPUklERSBFTUlTU0lPTg/value"),
                    commonRows(title: "SPM stack Emission",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QXXOdZO2q7hGwgRjATTxq5wZI-ejfaaQVobPgmiPtLJmgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0FcMy1ELTEwMUF8U1RBQ0sgU1BNIEVNSVNTSU9O/value"),
                    commonRows(title: "Thioadd Flow/Molten sulphur flow"),
                    commonRows(title: "Tail Gas Scrubber PH"),
                    commonRows(title: "Sulphuric Acid to Tail gas scrubber"),
                  ] : widget.subElement[index] == "Train B" ? [
                    commonRows(title: "Plant status"),
                    commonRows(title: "Grade Opeartion"),
                    commonRows(title: "Today Production",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QjXOdZO2q7hGwgRjATTxq5w4uZnvTKWU1ItI3m7SkrLtAV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0J8Q0FMQyAtIFRPREFZIFBST0RVQ1RJT04/value"),
                    commonRows(title: "Previous day Production",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QjXOdZO2q7hGwgRjATTxq5w0sr_r0744lAr5h-0ZVaA7wV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0J8Q0FMQyAtIFlFU1RFUkRBWSBQUk9EVUNUSU9O/value"),
                    commonRows(title: "Onstream hours",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QjXOdZO2q7hGwgRjATTxq5wLg2k7TfTLFAP-Dckms6mKgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0J8Q0FMQyAtIFBMQU5UIFRPREFZIFJVTk5JTkcgVElNRSBIT1VSUw/value"),
                    commonRows(title: "PN reactor temperature"),
                    commonRows(title: "Pipe Reactor Skin temperature"),
                    commonRows(title: "Pipe Reactor back pressure"),
                    commonRows(title: "Product Temperature",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QUHSdZO2q7hGwgRjATTxq5wAu6TxwjlPVIQFQWjHBB-NwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0JcMDUxLUlDLTEwM0J8Q09OVkVZT1IgVEVNUEVSQVRVUkU/value"),
                    commonRows(title: "Product Moisture"),
                    commonRows(title: "Ammonia stack Emission"),
                    commonRows(title: "HF stack Emission",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QrXSdZO2q7hGwgRjATTxq5wp_qmIwFPolgUtiiHuWgZZAV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0JcMy1ELTEwMUJ8U1RBQ0sgSFlEUk9GTFVPUklERSBFTUlTU0lPTg/value"),
                    commonRows(title: "SPM stack Emission",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QrXSdZO2q7hGwgRjATTxq5wlIiejfaaQVobPgmiPtLJmgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0JcMy1ELTEwMUJ8U1RBQ0sgU1BNIEVNSVNTSU9O/value"),
                    commonRows(title: "Thioadd Flow/Molten sulphur flow"),
                    commonRows(title: "Tail Gas Scrubber PH"),
                    commonRows(title: "Sulphuric Acid to Tail gas scrubber"),
                  ] : widget.subElement[index] == "EMS-Mobile App" ? [
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
