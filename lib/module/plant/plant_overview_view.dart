import 'package:coromandal_app/module/controllers/general_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configurations/api_service.dart';
import '../common_widgets/common_widget.dart';
import '../theme/convert_theme_colors.dart';
import '../utility/color_utility.dart';

class PlantDetailView extends StatefulWidget {
  final String title;
  final List<String> subElement;
  const PlantDetailView({Key? key, required this.title, required this.subElement}) : super(key: key);

  @override
  State<PlantDetailView> createState() => _PlantDetailViewState();
}

class _PlantDetailViewState extends State<PlantDetailView> {

  // 1 - Vizag
  // 2 - Ennore
  // 3 - Kakinada

  List<String> sapLinks = GeneralController.to.selectedDashboard.value == "1" ?
  [
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Qf4edZO2q7hGwgRjATTxq5w0JaSbCciWlsaRXLv2u6M6QV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcU0FQMDF8Q0FMQyAtIENVUlJFTlQgVEhST1VHSCBQVVQ/value",
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QV4idZO2q7hGwgRjATTxq5wD5eV346GZl4GREIsbB4zhgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcU0FQMDJ8Q0FMQyAtIENVUlJFTlQgVEhST1VHSCBQVVQ/value",
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q_YidZO2q7hGwgRjATTxq5wtA_f6C13CVs6kRXXNlV0WgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcU0FQMDN8Q1VSUkVOVCBUSFJPVUdIIFBVVA/value"
  ] : GeneralController.to.selectedDashboard.value == "2" ?
  [
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QQGmdZO2q7hGwgRjATTxq5wiEDu3pPtWF8FZT1MHFQgMgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMXxDQUxDIC0gUFJPRFVDVElPTiBSQVRF/value",
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q-WmdZO2q7hGwgRjATTxq5wEONJk7iYuFsTqqExP85xSgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxTQVAwMnxDQUxDIC0gUFJPRFVDVElPTiBSQVRF/value"
  ] :
  [];

  List<String> papLinks = GeneralController.to.selectedDashboard.value == "1" ?
  [
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QMIGdZO2q7hGwgRjATTxq5wdTbWhz0SNVoNGf09SNNoGwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcUEFQMDF8Q0FMQyAtIENVUlJFTlQgVEhST1VHSCBQVVQ/value",
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QiYSdZO2q7hGwgRjATTxq5wuo-cfInQMFYEXdKCc0rwQwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcUEFQMDJ8Q0FMQyAtIENVUlJFTlQgVEhST1VHSCBQVVQ/value"
  ] : GeneralController.to.selectedDashboard.value == "2" ?
  [
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QdmidZO2q7hGwgRjATTxq5w93w3q5H5tVcAz7LyxBpeEwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEVOTk9SRVxFTEVNRU5UV0lTRVxQQVB8Q0FMQyAtIFBST0RVQ1RJT04gUkFURQ/value"
  ] :
  [];

  List<String> trainCLinks = GeneralController.to.selectedDashboard.value == "1" ?
  [
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QsT-dau2q7hGwgRjATTxq5wN8GEZYVMc1MK1XwO1ZTYCgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcVFJBSU5fQ3xDQUxDIC0gQ1VSUkVOVCBUSFJPVUdIIFBVVA/value"
  ] : GeneralController.to.selectedDashboard.value == "2" ?
  [] :
  [
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q2nSdZO2q7hGwgRjATTxq5wDVGzeSgV9VMi20fuv5S0FAV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0N8Q0FMQyAtIFBST0RVQ1RJT04gUkFURQ/value"
  ];

  List<String> trainABCLinks = GeneralController.to.selectedDashboard.value == "1" ?
  [
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Qyj2dau2q7hGwgRjATTxq5wl-FAPWfkIFk4-tBDVjM8MgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcVFJBSU5fQXxDQUxDIC0gQ1VSUkVOVCBUSFJPVUdIIFBVVA/value",
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q2j6dau2q7hGwgRjATTxq5wqAsYWs-xolgSmwjcWpp0eQV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcVFJBSU5fQnxDQUxDIC0gQ1VSUkVOVCBUSFJPVUdIIFBVVA/value",
  ] : GeneralController.to.selectedDashboard.value == "2" ?
  [] :
  [
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QKXKdZO2q7hGwgRjATTxq5wCXf76yjrXlgr0QlWSHBFpwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0F8Q0FMQyAtIFBST0RVQ1RJT04gUkFURQ/value",
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QjXOdZO2q7hGwgRjATTxq5wajFLA_INXFENaAafebjEJwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXEtBS0lOQURBXEVMRU1FTlRXSVNFXFRSQUlOX0J8Q0FMQyAtIFBST0RVQ1RJT04gUkFURQ/value",
  ];

  getGivenURL({int? index}){
    if(widget.title == "SAP"){
      return sapLinks[index!];
    }else if(widget.title == "PAP"){
      return papLinks[index!];
    }else if(widget.title == "Train C"){
      return trainCLinks[index!];
    }else if(widget.title == "Train AB"){
      return trainABCLinks[index!];
    }
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
      body: Column(
        children: [
          commonHeader(title: "Vishakhapatnam (AP)"),
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
                return InkWell(
                  onTap: (){
                  },
                  child: Padding(
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
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
