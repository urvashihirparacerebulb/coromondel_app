import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configurations/api_service.dart';
import '../common_widgets/common_widget.dart';
import '../theme/convert_theme_colors.dart';
import '../utility/color_utility.dart';

class VisagPlantDetailView extends StatefulWidget {
  final String title;
  final List<String> subElement;
  const VisagPlantDetailView({Key? key, required this.title, required this.subElement}) : super(key: key);

  @override
  State<VisagPlantDetailView> createState() => _VisagPlantDetailViewState();
}

class _VisagPlantDetailViewState extends State<VisagPlantDetailView> {

  List<String> sapLinks = [
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Qf4edZO2q7hGwgRjATTxq5w0JaSbCciWlsaRXLv2u6M6QV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcU0FQMDF8Q0FMQyAtIENVUlJFTlQgVEhST1VHSCBQVVQ/value",
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QV4idZO2q7hGwgRjATTxq5wD5eV346GZl4GREIsbB4zhgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcU0FQMDJ8Q0FMQyAtIENVUlJFTlQgVEhST1VHSCBQVVQ/value",
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q_YidZO2q7hGwgRjATTxq5wtA_f6C13CVs6kRXXNlV0WgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcU0FQMDN8Q1VSUkVOVCBUSFJPVUdIIFBVVA/value"
  ];

  List<String> papLinks = [
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QMIGdZO2q7hGwgRjATTxq5wdTbWhz0SNVoNGf09SNNoGwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcUEFQMDF8Q0FMQyAtIENVUlJFTlQgVEhST1VHSCBQVVQ/value",
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QiYSdZO2q7hGwgRjATTxq5wuo-cfInQMFYEXdKCc0rwQwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcUEFQMDJ8Q0FMQyAtIENVUlJFTlQgVEhST1VHSCBQVVQ/value"
  ];

  List<String> trainCLinks = [
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QsT-dau2q7hGwgRjATTxq5wN8GEZYVMc1MK1XwO1ZTYCgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcVFJBSU5fQ3xDQUxDIC0gQ1VSUkVOVCBUSFJPVUdIIFBVVA/value"
  ];

  List<String> trainABCLinks = [
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Qyj2dau2q7hGwgRjATTxq5wl-FAPWfkIFk4-tBDVjM8MgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcVFJBSU5fQXxDQUxDIC0gQ1VSUkVOVCBUSFJPVUdIIFBVVA/value",
    "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q2j6dau2q7hGwgRjATTxq5wqAsYWs-xolgSmwjcWpp0eQV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcVFJBSU5fQnxDQUxDIC0gQ1VSUkVOVCBUSFJPVUdIIFBVVA/value",
  ];

  List<String> emsMobileLinks = [];

  List<String> assetsLinks = [];

  getGivenURL({int? index}){
    if(widget.title == "SAP"){
      return sapLinks[index!];
    }else if(widget.title == "PAP"){
      return papLinks[index!];
    }else if(widget.title == "Train C"){
      return trainCLinks[index!];
    }else if(widget.title == "Train AB"){
      return trainABCLinks[index!];
    }else if(widget.title == "EMS-Mobile App"){
      return emsMobileLinks[index!];
    }else if(widget.title == "Asset Health"){
      return assetsLinks[index!];
    }
  }

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
      body: ListView(
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
                  children: widget.subElement[index] == "SAP 01" ? [
                    commonRows(title: "Today production",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Qf4edZO2q7hGwgRjATTxq5wcbytGU-rk1ATJ99ZAFN1cwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcU0FQMDF8Q0FMQyAtIFRPREFZIFBST0RVQ1RJT04/value"),
                    commonRows(title: "Furnace temp",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Qs4edZO2q7hGwgRjATTxq5wbWfP9xR5jVcDDMkcoNvckgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcU0FQMDFcQkY1MDR8RlVSTkFOQ0UgVEVNUEVSQVRVUkUgTk9SVEg/value"),
                    commonRows(title: "Blower rpm",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QP4idZO2q7hGwgRjATTxq5wlLkOm_ZTtlU9fT5kPlNIDAV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcU0FQMDFcR0I1MDFTfFNPVVRIIEJMT1dFUiBHT1ZFUk5FUiBDT05UUk9MIFBW/value"),
                    commonRows(title: "Steam Generation rate", link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QtoedZO2q7hGwgRjATTxq5wZvkN0ZmEUFwNJmGvl_C0zAV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcU0FQMDFcQkY1MDV8SElHSCBQUkVTU1VSRSBTVEVBTSBHRU5FUkFUSU9OIEZMT1cgQUZURVIgREVTVVBFUkhFQVRFUg/value"),
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
                  ] : widget.subElement[index] == "SAP 02" ? [
                    commonRows(title: "Today production",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QV4idZO2q7hGwgRjATTxq5wI7GUGyj-nlIKpuKdW6-3PgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcU0FQMDJ8Q0FMQyAtIFRPREFZIFBST0RVQ1RJT04/value"),
                    commonRows(title: "Furnace temp", link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QioidZO2q7hGwgRjATTxq5w6T1hkW3FPFww2Ar97me_bwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcU0FQMDJcQkY5MDR8RlVSTkFOQ0UgVEVNUEVSQVRVUkUgU09VVEg/value"),
                    commonRows(title: "Blower rpm", link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q9IidZO2q7hGwgRjATTxq5w66d9t7PerVomSURV4MgaSwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcU0FQMDJcR0I5MDF8QkxPV0VSIFJQTSBDT05UUk9MTEVSIFBW/value"),
                    commonRows(title: "Steam Generation rate",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QgYidZO2q7hGwgRjATTxq5wN7GNPihekFIi3tDYeb7eJQV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcU0FQMDJcQkY5MDF8SElHSCBQUkVTU1VSRSBTVEVBTSBGTE9XIEFGVEVSIFNVUEVSIEhFQVRFUiBFWFBPUlQ/value"),
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
                  ] : widget.subElement[index] == "SAP 03" ? [
                    commonRows(title: "Today production",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49Q_YidZO2q7hGwgRjATTxq5wB1xxphkyS10-Rv3MLVRGigV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcU0FQMDN8Q0FMQyAtIFRPREFZIFBST0RVQ1RJT04/value"),
                    commonRows(title: "Furnace temp",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QOImdZO2q7hGwgRjATTxq5w-EHdklLGqFo_7OFEZuQreAV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcU0FQMDNcQkYtNDUyMDF8RlVSTkFDRSBURU1QRVJBVFVSRSBFQVNUIFJFRFVOREFOVA/value"),
                    commonRows(title: "Blower rpm", link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QHT2dau2q7hGwgRjATTxq5wg31Nwhd2mV4D7bpCYWMfOwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcU0FQMDNcR0ItNDUyMDF8QkxPV0VSIFNQRUVE/value"),
                    commonRows(title: "Steam Generation rate",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QR4mdZO2q7hGwgRjATTxq5wELZ0LzvUo1EMyLFiG5bXlwV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcU0FQMDNcQkYtNDUzMDF8U1RFQU1EUlVNIExFVkVM/value"),
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
                  ] : widget.subElement[index] == "PAP 01" ? [
                    commonRows(title: "Plant status"),
                    commonRows(title: "Today production", link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QMIGdZO2q7hGwgRjATTxq5w_g499mcdpl8IKHEMX1cRZAV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcUEFQMDF8VE9EQVkgUFJPRFVDVElPTg/value"),
                    commonRows(title: "Onstream Hours",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QMIGdZO2q7hGwgRjATTxq5wsfVtATMwqVUfkIqEN5CFmQV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcUEFQMDF8Q0FMQyAtIFBMQU5UIFRPREFZIFJVTk5JTkcgVElNRSBIT1VSUw/value"),
                    commonRows(title: "Rock Ratio"),
                    commonRows(title: "Reactor temperature"),
                    commonRows(title: "Free Acid"),
                  ] : widget.subElement[index] == "PAP 02" ? [
                    commonRows(title: "Plant status"),
                    commonRows(title: "Today production",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QiYSdZO2q7hGwgRjATTxq5w02XRnNauM1ww7QIPtc2x7AV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcUEFQMDJ8VE9EQVkgUFJPRFVDVElPTg/value"),
                    commonRows(title: "Onstream Hours",link: "https://14.99.99.166:4080/piwebapi/streams/F1AbEsrqDYYGzckqgTi3xAtc49QiYSdZO2q7hGwgRjATTxq5wvdsAQVKS8V8K_gAp5EVmrgV0lOLTRPTlFHUFNSMkM1XENPUk9NQU5ERUxcQ09ST01BTkRFTCBJTlRFUk5BVElPTkFMXFZJU0FLSEFQQVROQU1cRUxFTUVOVFdJU0VcUEFQMDJ8Q0FMQyAtIFBMQU5UIFRPREFZIFJVTk5JTkcgVElNRSBIT1VSUw/value"),
                    commonRows(title: "Rock Ratio"),
                    commonRows(title: "Reactor temperature"),
                    commonRows(title: "Free Acid"),
                  ] : widget.subElement[index] == "Train C" ? [
                    commonRows(title: "Plant running status "),
                    commonRows(title: "Current day production"),
                    commonRows(title: "Previous day production"),
                    commonRows(title: "PR Back pressure(NH3 & NP acid)"),
                    commonRows(title: "Recycle elevator load"),
                    commonRows(title: "Stack parameters(NH3,HF & SPM)"),
                    commonRows(title: "Product temperature"),
                    commonRows(title: "Product moisture"),
                  ] : widget.subElement[index] == "Train A" ? [
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
                  ] : widget.subElement[index] == "Train B" ? [
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
