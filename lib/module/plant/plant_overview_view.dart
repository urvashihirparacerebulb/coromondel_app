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

  List<String> sapLinks = [
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Qf4edZO2q7hGwgRjATTxq5w0JaSbCciWlsaRXLv2u6M6QV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcU0FQMDF8Q0FMQyAtIENVUlJFTlQgVEhST1VHSCBQVVQ/value",
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QV4idZO2q7hGwgRjATTxq5wD5eV346GZl4GREIsbB4zhgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcU0FQMDJ8Q0FMQyAtIENVUlJFTlQgVEhST1VHSCBQVVQ/value",
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q_YidZO2q7hGwgRjATTxq5wtA_f6C13CVs6kRXXNlV0WgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcU0FQMDN8Q1VSUkVOVCBUSFJPVUdIIFBVVA/value"
  ];

  List<String> papLinks = [
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QMIGdZO2q7hGwgRjATTxq5wdTbWhz0SNVoNGf09SNNoGwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcUEFQMDF8Q0FMQyAtIENVUlJFTlQgVEhST1VHSCBQVVQ/value",
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QiYSdZO2q7hGwgRjATTxq5wuo-cfInQMFYEXdKCc0rwQwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcUEFQMDJ8Q0FMQyAtIENVUlJFTlQgVEhST1VHSCBQVVQ/value"
  ];

  List<String> trainLinks = [
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Qyj2dau2q7hGwgRjATTxq5wl-FAPWfkIFk4-tBDVjM8MgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcVFJBSU5fQXxDQUxDIC0gQ1VSUkVOVCBUSFJPVUdIIFBVVA/value",
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q2j6dau2q7hGwgRjATTxq5wqAsYWs-xolgSmwjcWpp0eQV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcVFJBSU5fQnxDQUxDIC0gQ1VSUkVOVCBUSFJPVUdIIFBVVA/value",
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QsT-dau2q7hGwgRjATTxq5wN8GEZYVMc1MK1XwO1ZTYCgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcVFJBSU5fQ3xDQUxDIC0gQ1VSUkVOVCBUSFJPVUdIIFBVVA/value"
  ];

  getGivenURL({int? index}){
    if(widget.title == "SAP"){
      return sapLinks[index!];
    }else if(widget.title == "PAP"){
      return sapLinks[index!];
    }else if(widget.title == "Train"){
      return sapLinks[index!];
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
