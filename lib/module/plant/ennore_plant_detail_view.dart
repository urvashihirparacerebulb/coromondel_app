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

  // getGivenURL({int? index}) {
  //   if(widget.title == "SAP") {
  //     return sapLinks[index!];
  //   }else if(widget.title == "PAP"){
  //     return papLinks[index!];
  //   }else if(widget.title == "EMS-Mobile App"){
  //     return emsMobileLinks[index!];
  //   }else if(widget.title == "Asset Health"){
  //     return assetsLinks[index!];
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
                  children: widget.subElement[index] == "SAP 01" ? [
                    commonRows(title: "Today production",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QQGmdZO2q7hGwgRjATTxq5w683AqmlKSVAb4KLcq6wWkwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMXxDQUxDIC0gVE9EQVkgUFJPRFVDVElPTg/value"),
                    commonRows(title: "Furnace temp",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QdWmdZO2q7hGwgRjATTxq5wq46yCcfGDlkfL8kneWuvywV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMVwwMi1GLTAxfEJVUk5FUiBPVVRMRVQ/value"),
                    commonRows(title: "Blower rpm",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QdWmdZO2q7hGwgRjATTxq5wq46yCcfGDlkfL8kneWuvywV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMVwwMi1GLTAxfEJVUk5FUiBPVVRMRVQ/value"),
                    commonRows(title: "Steam Generation rate",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Qw2mdZO2q7hGwgRjATTxq5wq3wgoBEnZVM_uZSc4Q7DTAV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMVwwMi1WLTIwMXxXSEIgT1VUTEVU/value"),
                    commonRows(title: "So2 emission",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QoGmdZO2q7hGwgRjATTxq5wVaaf6T2fOl0r8l9jVNdlpwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMVwwMi1TVC0wMXxTTzIgQU5BTFlTRVI/value"),
                    commonRows(title: "1st bed Inlet temperature",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QtGmdZO2q7hGwgRjATTxq5w6veYUVcREV4np04x6Ur2ngV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMVwwMi1ULTQwMHxQQVNTIEkgQkVEIElOTEVU/value"),
                    commonRows(title: "1st bed Outlet temperature", link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QtGmdZO2q7hGwgRjATTxq5wWuqf_U90zFkI9O_X0uE4YQV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMVwwMi1ULTQwMHxQQVNTIEkgQkVEIE9VVExFVA/value"),
                    commonRows(title: "IAT Outlet Acid Temperature"),
                    commonRows(title: "Sulphur pump rpm/flow",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QQGmdZO2q7hGwgRjATTxq5wWrWQhoxdnFYv2tWo7OACcgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMXxDQUxDIC0gU1VMUEhVUiBQVU1QIFRPVEFM/value"),
                    commonRows(title: "Boiler out gas temperature"),
                    commonRows(title: "Steam Drum pressure",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QcmmdZO2q7hGwgRjATTxq5wRjm6W3vLmFcJj7dJrd00mQV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMVwwMi1FLTMwMXxTVVBFUkhFQVRFUiBESVNDSEFSR0UgUFJFU1NVUkU/value"),
                    commonRows(title: "Product Acid temperature",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QxmmdZO2q7hGwgRjATTxq5wWnxTPhmwdlcW0OS1OOg4LgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMVwwMi1YLTAyfFBMQVRFIEhFQVQgRVhDSEFOR0VSIE9VVExFVCBURU1QRVJBVFVSRQ/value"),
                    commonRows(title: "Cooling tower Inlet temperature",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q0mmdZO2q7hGwgRjATTxq5wjqiq7n7Rgl4Zl_4SHdn-AwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMVwwMi1YLTMwNXxXQVRFUiBJTkxFVCBURU1QRVJBVFVSRQ/value"),
                    commonRows(title: "Cooling tower Outlet temperature",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q0mmdZO2q7hGwgRjATTxq5wvODhLzuxlVole8-YcUUnmQV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMVwwMi1YLTMwNXxXQVRFUiBPVVRMRVQgVEVNUEVSQVRVUkU/value"),
                  ] : widget.subElement[index] == "SAP 02" ? [
                    commonRows(title: "Today production",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q-WmdZO2q7hGwgRjATTxq5wLYMrbfERGVwlXm0oSmP-nwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMnxDQUxDIC0gVE9EQVkgUFJPRFVDVElPTg/value"),
                    commonRows(title: "Furnace temp",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QLWqdZO2q7hGwgRjATTxq5wfYhqjUzE4FErjnduOdniiwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMlwwMy1LLTAxfEJVUk5FUiBPVVRMRVQgVEVNUEVSQVRVUkU/value"),
                    commonRows(title: "Blower rpm",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QXGqdZO2q7hGwgRjATTxq5wubs7YTuI51gq9jmTpsW2QQV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMlwwMy1UQy0wMXxCTE9XRVIgRElTQ0hBUkdF/value"),
                    commonRows(title: "Steam Generation rate",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QIGqdZO2q7hGwgRjATTxq5woQ5LpnCrv1gLJA-q_oKZEgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMlwwMy1CLTAxfEJPSUxFUiBTVEVBTSBGTE9X/value"),
                    commonRows(title: "So2 emission",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QV2qdZO2q7hGwgRjATTxq5woqWf6T2fOl0r8l9jVNdlpwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMlwwMy1TVC0wMXxTTzIgQU5BTFlTRVI/value"),
                    commonRows(title: "1st bed Inlet temperature",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QY2qdZO2q7hGwgRjATTxq5wI3SOYZsa9Fo-czqlvsKjJgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMlwwMy1WLTAxfFBBU1MgMDEgQkVEIElOTEVUIFRFTVBFUkFUVVJF/value"),
                    commonRows(title: "1st bed Outlet temperature",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QY2qdZO2q7hGwgRjATTxq5wHFz5LCTvJ1kZykcDzfrpQQV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMlwwMy1WLTAxfFBBU1MgMDEgQkVEIE9VVExFVCBURU1QRVJBVFVSRQ/value"),
                    commonRows(title: "IAT Outlet Acid Temperature"),
                    commonRows(title: "Sulphur pump rpm/flow",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q-WmdZO2q7hGwgRjATTxq5w-AG4C2WT61kk2_9C12CaYwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMnxDQUxDIC0gU1VMUEhVUiBQVU1QIFRPVEFM/value"),
                    commonRows(title: "Boiler out gas temperature"),
                    commonRows(title: "Steam Drum pressure",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QIGqdZO2q7hGwgRjATTxq5w9_z7wdF28VQ3AtAu832l0gV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMlwwMy1CLTAxfEJPSUxFUiBEUlVNIFBSRVNTVVJF/value"),
                    commonRows(title: "Product Acid temperature",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QimqdZO2q7hGwgRjATTxq5wwzNawEsSz1EBQO8_iwJLNQV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMlwwMy1YLTA2fFBST0RVQ1QgQUNJRCBURU1QRVJBVFVSRQ/value"),
                    commonRows(title: "Cooling tower Inlet temperature",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q0mmdZO2q7hGwgRjATTxq5wjqiq7n7Rgl4Zl_4SHdn-AwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMVwwMi1YLTMwNXxXQVRFUiBJTkxFVCBURU1QRVJBVFVSRQ/value"),
                    commonRows(title: "Cooling tower Outlet temperature",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q0mmdZO2q7hGwgRjATTxq5wvODhLzuxlVole8-YcUUnmQV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMVwwMi1YLTMwNXxXQVRFUiBPVVRMRVQgVEVNUEVSQVRVUkU/value"),
                  ] : widget.subElement[index] == "PAP" ? [
                    commonRows(title: "Plant status"),
                    commonRows(title: "Today production",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QdmidZO2q7hGwgRjATTxq5weXt0IlQMh1s0sK8b42jDFgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxQQVB8Q0FMQyAtIFRPREFZIFBST0RVQ1RJT04gTkVX/value"),
                    commonRows(title: "Onstream Hours",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QdmidZO2q7hGwgRjATTxq5w_ixSxNYhUFIyp97zGH0YMQV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxQQVB8Q0FMQyAtIFBMQU5UIFRPREFZIFJVTk5JTkcgVElNRSBIT1VSUw/value"),
                    commonRows(title: "Rock Ratio",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QKWmdZO2q7hGwgRjATTxq5wraiUpvbRHVwY7NmAGWXAJQV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxQQVBcMDQtVC0wOS4xMTB8Q0FMQyAtIFRPVEFMIFJPQ0s/value"),
                    commonRows(title: "Reactor temperature",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QKWmdZO2q7hGwgRjATTxq5wKN_GV6QbWl0V2aG31Cs2aQV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxQQVBcMDQtVC0wOS4xMTB8UkVBQ1RPUiBMRVZFTA/value"),
                    commonRows(title: "Free Acid",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q2midZO2q7hGwgRjATTxq5w3e6eKMokXVw2jxHuY7TwEgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxQQVBcMDQtRi0yMi4yMTB8RlJFRSBBQ0lE/value"),
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
