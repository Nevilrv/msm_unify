import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:msm_unify/App/common/AppConfig/CommonAppBar/widget/common_app_bar.dart';
import 'package:msm_unify/App/common/AppConfig/CommonDrawer/widget/common_drawer.dart';
import 'package:msm_unify/App/common/color_constant.dart';
import 'package:msm_unify/model/responseModek/commission_institution_response_model.dart';
import 'package:msm_unify/model/responseModek/commission_intake_dropdown_response_model.dart';
import 'package:msm_unify/viewModel/commision_intake_dropdown_view_model.dart';
import 'package:msm_unify/viewModel/commission_institution_view_model.dart';

import 'widget/institution_dropdown.dart';

class RefundTrackerScreen extends StatefulWidget {
  const RefundTrackerScreen({Key? key}) : super(key: key);

  @override
  _RefundTrackerScreenState createState() => _RefundTrackerScreenState();
}

class _RefundTrackerScreenState extends State<RefundTrackerScreen> {
  final CommissionIntakeDropdownViewModel _commissionIntakeDropdownViewModel =
      Get.put(CommissionIntakeDropdownViewModel());

  final CommissionInstitutionViewModel _commissionInstitutionViewModel =
      Get.put(CommissionInstitutionViewModel());

  final List<String> _country = [
    'Yemen',
    'India',
    "USA",
    "Afghanistan",
    "Argentina"
  ];
  String? _selectedCountry;
  String? _selectedPartner;

  String? _selectedInstitution;
  List<CommissionInstitutionResponseModel> institutions = [];
  Future<void> getInstitution() async {
    await _commissionInstitutionViewModel.commissionInstitutionViewModel();
    List<CommissionInstitutionResponseModel> response =
        _commissionInstitutionViewModel.apiResponse.data;
    response.forEach((element) {
      institutions.add(element);
    });
    setState(() {});
  }

  String? _selectedIntake;
  List<CommissionIntakeDropdownResponseModel> intakes = [];
  Future<void> getIntake() async {
    await _commissionIntakeDropdownViewModel
        .commissionIntakeDropdownViewModel();
    List<CommissionIntakeDropdownResponseModel> response =
        _commissionIntakeDropdownViewModel.apiResponse.data;
    response.forEach((element) {
      intakes.add(element);
    });
    setState(() {});
  }

  final List<String> _partner = ['All', 'GMO', 'MSM Unify'];

  final TextEditingController _dob = TextEditingController();
  final TextEditingController _dob2 = TextEditingController();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  bool show = false;
  String? add;
  String? add1;
  bool _addCondition = false;
  bool _addGroup = false;

  @override
  void initState() {
    getInstitution();
    getIntake();
    super.initState();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        endDrawer: commonDrawer(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildPreferredSize(context, _key),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Refund tracker',
                  style: TextStyle(
                      color: kNavy,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _dob,
                          cursorColor: kRed,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.today),
                                onPressed: () async {
                                  DateTime date = DateTime(1900);
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());

                                  date = (await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now()))!;
                                  _dob.text = formatter.format(date);
                                },
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  )),
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.2),
                                  fontFamily: 'Roboto'),
                              hintText: '01/05/2022',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'DD/MM/YYYY',
                          style: TextStyle(
                            color: Color(0xff565656),
                            fontFamily: 'Roboto',
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: _dob2,
                          cursorColor: kRed,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.today),
                                onPressed: () async {
                                  DateTime date = DateTime(1900);
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());

                                  date = (await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now()))!;
                                  _dob2.text = formatter.format(date);
                                },
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  )),
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.2),
                                  fontFamily: 'Roboto'),
                              hintText: '01/06/2022',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'DD/MM/YYYY',
                          style: TextStyle(
                            color: Color(0xff565656),
                            fontFamily: 'Roboto',
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InstitutionDropdown(
                            selectedInstitute: _selectedInstitution,
                            institution: institutions),
                        const SizedBox(
                          height: 20,
                        ),
                        IntakeDropdown(
                            selectedIntake: _selectedIntake, intake: intakes),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: Get.height * 0.04,
                          width: Get.width * 0.20,
                          decoration: BoxDecoration(
                              color: kRed,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                            child: Text(
                              'Get',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        show == false
                            ? Container(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              show = true;
                                            });
                                          },
                                          child: Container(
                                            height: Get.height * 0.045,
                                            width: Get.width * 0.25,
                                            decoration: BoxDecoration(
                                                color: kRed,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: const Center(
                                              child: Text(
                                                'Advance',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 11,
                                                    fontFamily: 'Roboto'),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SvgPicture.asset(
                                          'assets/icons/Filter.svg',
                                          height: 30,
                                          width: 30,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SvgPicture.asset(
                                          'assets/icons/XLSX.svg',
                                          height: 30,
                                          width: 30,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SvgPicture.asset(
                                          'assets/icons/Group 2222.svg',
                                          height: 30,
                                          width: 30,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    PaginatedDataTable(
                                        onRowsPerPageChanged: (perPage) {},
                                        columnSpacing: 0,
                                        rowsPerPage: 10,
                                        dataRowHeight: Get.height * 0.05,
                                        headingRowHeight: Get.height * 0.08,
                                        horizontalMargin: 1,
                                        columns: [
                                          DataColumn(
                                              label: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 2),
                                                  height: Get.height * 0.10,
                                                  width: Get.width * 0.33,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF5F5F5),
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            // colorsValue = true;
                                                            Future.delayed(
                                                                const Duration(
                                                                    seconds: 2),
                                                                () {
                                                              // colorsValue = false;
                                                              setState(() {});
                                                            });
                                                          });
                                                        },
                                                        child: const Text(
                                                          'S No',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              // colorsValue = true;
                                                              Future.delayed(
                                                                  const Duration(
                                                                      seconds:
                                                                          1),
                                                                  () {
                                                                // colorsValue = false;
                                                                setState(() {});
                                                              });
                                                            });

                                                            // showDialog(
                                                            //     context: context,
                                                            //     builder: (BuildContext context) {
                                                            //       return AlertDialog(
                                                            //         actions: [
                                                            //           Container(
                                                            //             height: Get.height * 0.30,
                                                            //             width: Get.width,
                                                            //             child: StatefulBuilder(
                                                            //               builder: (BuildContext
                                                            //               context,
                                                            //                   void Function(
                                                            //                       void
                                                            //                       Function())
                                                            //                   setState) {
                                                            //                 return Column(
                                                            //                   children: [
                                                            //                     Container(
                                                            //                         width:
                                                            //                         Get.width,
                                                            //                         color: Colors
                                                            //                             .black
                                                            //                             .withOpacity(
                                                            //                             0.1),
                                                            //                         child:
                                                            //                         TextFormField(
                                                            //                           decoration:
                                                            //                           const InputDecoration(
                                                            //                             hoverColor:
                                                            //                             Colors
                                                            //                                 .red,
                                                            //                             prefixIcon:
                                                            //                             Icon(Icons
                                                            //                                 .search_outlined),
                                                            //                             hintText:
                                                            //                             'Search',
                                                            //                           ),
                                                            //                         )),
                                                            //                     Row(
                                                            //                       children: [
                                                            //                         Checkbox(
                                                            //                           activeColor:
                                                            //                           Colors
                                                            //                               .orange,
                                                            //                           value:
                                                            //                           _checkbox,
                                                            //                           onChanged:
                                                            //                               (value) {
                                                            //                             setState(
                                                            //                                     () {
                                                            //                                   _checkbox =
                                                            //                                   !_checkbox;
                                                            //                                   _1number =
                                                            //                                   !_1number;
                                                            //                                 });
                                                            //                           },
                                                            //                         ),
                                                            //                         const Text(
                                                            //                             'Select All'),
                                                            //                       ],
                                                            //                     ),
                                                            //                     const Divider(),
                                                            //                     CheckboxListTile(
                                                            //                       activeColor:
                                                            //                       Colors.orange,
                                                            //                       controlAffinity:
                                                            //                       ListTileControlAffinity
                                                            //                           .leading,
                                                            //                       title: const Text(
                                                            //                           '107395'),
                                                            //                       value: _1number,
                                                            //                       onChanged:
                                                            //                           (value) {
                                                            //                         setState(() {
                                                            //                           _1number =
                                                            //                           !_1number;
                                                            //                         });
                                                            //                       },
                                                            //                     ),
                                                            //                     const Divider(),
                                                            //                     const SizedBox(
                                                            //                       height: 5,
                                                            //                     ),
                                                            //                     Row(
                                                            //                       mainAxisAlignment:
                                                            //                       MainAxisAlignment
                                                            //                           .end,
                                                            //                       children: [
                                                            //                         InkWell(
                                                            //                           onTap: () {
                                                            //                             Get.back();
                                                            //                           },
                                                            //                           child:
                                                            //                           const Text(
                                                            //                             "OK",
                                                            //                             style: TextStyle(
                                                            //                                 color: Color(
                                                            //                                     0xffFF5722),
                                                            //                                 fontFamily:
                                                            //                                 'Roboto',
                                                            //                                 fontWeight:
                                                            //                                 FontWeight
                                                            //                                     .w500,
                                                            //                                 fontSize:
                                                            //                                 16),
                                                            //                           ),
                                                            //                         ),
                                                            //                         const SizedBox(
                                                            //                           width: 20,
                                                            //                         ),
                                                            //                         InkWell(
                                                            //                           onTap: () {
                                                            //                             Get.back();
                                                            //                           },
                                                            //                           child:
                                                            //                           const Text(
                                                            //                             "CANCEL",
                                                            //                             style: TextStyle(
                                                            //                                 color: Color(
                                                            //                                     0xffFF5722),
                                                            //                                 fontFamily:
                                                            //                                 'Roboto',
                                                            //                                 fontWeight:
                                                            //                                 FontWeight
                                                            //                                     .w500,
                                                            //                                 fontSize:
                                                            //                                 16),
                                                            //                           ),
                                                            //                         ),
                                                            //                         const SizedBox(
                                                            //                           width: 10,
                                                            //                         ),
                                                            //                       ],
                                                            //                     ),
                                                            //                   ],
                                                            //                 );
                                                            //               },
                                                            //             ),
                                                            //           ),
                                                            //         ],
                                                            //       );
                                                            //     });
                                                          },
                                                          // onTap: () {},
                                                          child: const Icon(
                                                            Icons.filter_list,
                                                            color: Colors.black,
                                                          ))
                                                    ],
                                                  ))),
                                          DataColumn(
                                              label: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 2),
                                                  height: Get.height * 0.10,
                                                  width: Get.width * 0.33,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF5F5F5),
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            // colorsValue = true;
                                                            Future.delayed(
                                                                const Duration(
                                                                    seconds: 2),
                                                                () {
                                                              // colorsValue = false;
                                                              setState(() {});
                                                            });
                                                          });
                                                        },
                                                        child: const Text(
                                                          'Intake',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              // colorsValue = true;
                                                              Future.delayed(
                                                                  const Duration(
                                                                      seconds:
                                                                          1),
                                                                  () {
                                                                // colorsValue = false;
                                                                setState(() {});
                                                              });
                                                            });

                                                            // showDialog(
                                                            //     context: context,
                                                            //     builder: (BuildContext context) {
                                                            //       // return AlertDialog(
                                                            //       //   actions: [
                                                            //       //     Container(
                                                            //       //       height: Get.height * 0.46,
                                                            //       //       child: StatefulBuilder(
                                                            //       //         builder: (BuildContext
                                                            //       //         context,
                                                            //       //             void Function(
                                                            //       //                 void Function())
                                                            //       //             setState) {
                                                            //       //           return Column(
                                                            //       //             children: [
                                                            //       //               Container(
                                                            //       //                   color: Colors
                                                            //       //                       .black
                                                            //       //                       .withOpacity(
                                                            //       //                       0.1),
                                                            //       //                   child:
                                                            //       //                   TextFormField(
                                                            //       //                     decoration:
                                                            //       //                     const InputDecoration(
                                                            //       //                       hoverColor:
                                                            //       //                       Colors
                                                            //       //                           .red,
                                                            //       //                       prefixIcon:
                                                            //       //                       Icon(Icons
                                                            //       //                           .search_outlined),
                                                            //       //                       hintText:
                                                            //       //                       'Search',
                                                            //       //                     ),
                                                            //       //                   )),
                                                            //       //               Row(
                                                            //       //                 children: [
                                                            //       //                   Checkbox(
                                                            //       //                     activeColor:
                                                            //       //                     Colors
                                                            //       //                         .orange,
                                                            //       //                     value:
                                                            //       //                     _checkbox,
                                                            //       //                     onChanged:
                                                            //       //                         (value) {
                                                            //       //                       setState(() {
                                                            //       //                         _checkbox =
                                                            //       //                         !_checkbox;
                                                            //       //                         _checkboxListTile =
                                                            //       //                         !_checkboxListTile;
                                                            //       //                         _checkboxListTile1 =
                                                            //       //                         !_checkboxListTile1;
                                                            //       //                         _checkboxListTile2 =
                                                            //       //                         !_checkboxListTile2;
                                                            //       //                         _checkboxListTile3 =
                                                            //       //                         !_checkboxListTile3;
                                                            //       //                       });
                                                            //       //                     },
                                                            //       //                   ),
                                                            //       //                   const Text(
                                                            //       //                       'Select All'),
                                                            //       //                 ],
                                                            //       //               ),
                                                            //       //               const Divider(),
                                                            //       //               CheckboxListTile(
                                                            //       //                 activeColor:
                                                            //       //                 Colors.orange,
                                                            //       //                 controlAffinity:
                                                            //       //                 ListTileControlAffinity
                                                            //       //                     .leading,
                                                            //       //                 title: const Text(
                                                            //       //                     '107395'),
                                                            //       //                 value:
                                                            //       //                 _checkboxListTile,
                                                            //       //                 onChanged: (value) {
                                                            //       //                   setState(() {
                                                            //       //                     _checkboxListTile =
                                                            //       //                     !_checkboxListTile;
                                                            //       //                   });
                                                            //       //                 },
                                                            //       //               ),
                                                            //       //               CheckboxListTile(
                                                            //       //                 activeColor:
                                                            //       //                 Colors.orange,
                                                            //       //                 controlAffinity:
                                                            //       //                 ListTileControlAffinity
                                                            //       //                     .leading,
                                                            //       //                 title: const Text(
                                                            //       //                     '107217'),
                                                            //       //                 value:
                                                            //       //                 _checkboxListTile1,
                                                            //       //                 onChanged: (value) {
                                                            //       //                   setState(() {
                                                            //       //                     _checkboxListTile1 =
                                                            //       //                     !_checkboxListTile1;
                                                            //       //                   });
                                                            //       //                 },
                                                            //       //               ),
                                                            //       //               CheckboxListTile(
                                                            //       //                 activeColor:
                                                            //       //                 Colors.orange,
                                                            //       //                 controlAffinity:
                                                            //       //                 ListTileControlAffinity
                                                            //       //                     .leading,
                                                            //       //                 title: const Text(
                                                            //       //                     '104575'),
                                                            //       //                 value:
                                                            //       //                 _checkboxListTile2,
                                                            //       //                 onChanged: (value) {
                                                            //       //                   setState(() {
                                                            //       //                     _checkboxListTile2 =
                                                            //       //                     !_checkboxListTile2;
                                                            //       //                   });
                                                            //       //                 },
                                                            //       //               ),
                                                            //       //               CheckboxListTile(
                                                            //       //                 activeColor:
                                                            //       //                 Colors.orange,
                                                            //       //                 controlAffinity:
                                                            //       //                 ListTileControlAffinity
                                                            //       //                     .leading,
                                                            //       //                 title: const Text(
                                                            //       //                     '123456'),
                                                            //       //                 value:
                                                            //       //                 _checkboxListTile3,
                                                            //       //                 onChanged: (value) {
                                                            //       //                   setState(() {
                                                            //       //                     _checkboxListTile3 =
                                                            //       //                     !_checkboxListTile3;
                                                            //       //                   });
                                                            //       //                 },
                                                            //       //               ),
                                                            //       //               const Divider(),
                                                            //       //               const SizedBox(
                                                            //       //                 height: 5,
                                                            //       //               ),
                                                            //       //               Row(
                                                            //       //                 mainAxisAlignment:
                                                            //       //                 MainAxisAlignment
                                                            //       //                     .end,
                                                            //       //                 children: [
                                                            //       //                   InkWell(
                                                            //       //                     onTap: () {
                                                            //       //                       Get.back();
                                                            //       //                     },
                                                            //       //                     child:
                                                            //       //                     const Text(
                                                            //       //                       "OK",
                                                            //       //                       style: TextStyle(
                                                            //       //                           color: Color(
                                                            //       //                               0xffFF5722),
                                                            //       //                           fontFamily:
                                                            //       //                           'Roboto',
                                                            //       //                           fontWeight:
                                                            //       //                           FontWeight
                                                            //       //                               .w500,
                                                            //       //                           fontSize:
                                                            //       //                           16),
                                                            //       //                     ),
                                                            //       //                   ),
                                                            //       //                   const SizedBox(
                                                            //       //                     width: 20,
                                                            //       //                   ),
                                                            //       //                   InkWell(
                                                            //       //                     onTap: () {
                                                            //       //                       Get.back();
                                                            //       //                     },
                                                            //       //                     child:
                                                            //       //                     const Text(
                                                            //       //                       "CANCEL",
                                                            //       //                       style: TextStyle(
                                                            //       //                           color: Color(
                                                            //       //                               0xffFF5722),
                                                            //       //                           fontFamily:
                                                            //       //                           'Roboto',
                                                            //       //                           fontWeight:
                                                            //       //                           FontWeight
                                                            //       //                               .w500,
                                                            //       //                           fontSize:
                                                            //       //                           16),
                                                            //       //                     ),
                                                            //       //                   ),
                                                            //       //                   const SizedBox(
                                                            //       //                     width: 10,
                                                            //       //                   ),
                                                            //       //                 ],
                                                            //       //               ),
                                                            //       //             ],
                                                            //       //           );
                                                            //       //         },
                                                            //       //       ),
                                                            //       //     ),
                                                            //       //   ],
                                                            //       // );
                                                            //     });
                                                          },
                                                          // onTap: () {},
                                                          child: const Icon(
                                                            Icons.filter_list,
                                                            color: Colors.black,
                                                          ))
                                                    ],
                                                  ))),
                                          DataColumn(
                                              label: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 2),
                                                  height: Get.height * 0.10,
                                                  width: Get.width * 0.70,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF5F5F5),
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            // colorsValue = true;
                                                            Future.delayed(
                                                                const Duration(
                                                                    seconds: 2),
                                                                () {
                                                              // colorsValue = false;
                                                              setState(() {});
                                                            });
                                                          });
                                                        },
                                                        child: const Text(
                                                          'MSM Application ID',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              // colorsValue = true;
                                                              Future.delayed(
                                                                  const Duration(
                                                                      seconds:
                                                                          1),
                                                                  () {
                                                                // colorsValue = false;
                                                                setState(() {});
                                                              });
                                                            });
                                                          },
                                                          // onTap: () {},
                                                          child: const Icon(
                                                            Icons.filter_list,
                                                            color: Colors.black,
                                                          ))
                                                    ],
                                                  ))),
                                          DataColumn(
                                              label: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 2),
                                                  height: Get.height * 0.10,
                                                  width: Get.width * 0.70,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF5F5F5),
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            // colorsValue = true;
                                                            Future.delayed(
                                                                const Duration(
                                                                    seconds: 2),
                                                                () {
                                                              // colorsValue = false;
                                                              setState(() {});
                                                            });
                                                          });
                                                        },
                                                        child: const Text(
                                                          'First Name',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              // colorsValue = true;
                                                              Future.delayed(
                                                                  const Duration(
                                                                      seconds:
                                                                          1),
                                                                  () {
                                                                // colorsValue = false;
                                                                setState(() {});
                                                              });
                                                            });
                                                          },
                                                          // onTap: () {},
                                                          child: const Icon(
                                                            Icons.filter_list,
                                                            color: Colors.black,
                                                          ))
                                                    ],
                                                  ))),
                                          DataColumn(
                                              label: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 2),
                                                  height: Get.height * 0.10,
                                                  width: Get.width * 0.40,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF5F5F5),
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            // colorsValue = true;
                                                            Future.delayed(
                                                                const Duration(
                                                                    seconds: 2),
                                                                () {
                                                              // colorsValue = false;
                                                              setState(() {});
                                                            });
                                                          });
                                                        },
                                                        child: const Text(
                                                          'Middle Name',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              // colorsValue = true;
                                                              Future.delayed(
                                                                  const Duration(
                                                                      seconds:
                                                                          1),
                                                                  () {
                                                                // colorsValue = false;
                                                                setState(() {});
                                                              });
                                                            });
                                                          },
                                                          // onTap: () {},
                                                          child: const Icon(
                                                            Icons.filter_list,
                                                            color: Colors.black,
                                                          ))
                                                    ],
                                                  ))),
                                          DataColumn(
                                              label: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 2),
                                                  height: Get.height * 0.10,
                                                  width: Get.width * 0.50,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF5F5F5),
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            // colorsValue = true;
                                                            Future.delayed(
                                                                const Duration(
                                                                    seconds: 2),
                                                                () {
                                                              // colorsValue = false;
                                                              setState(() {});
                                                            });
                                                          });
                                                        },
                                                        child: const Text(
                                                          'Last name',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              // colorsValue = true;
                                                              Future.delayed(
                                                                  const Duration(
                                                                      seconds:
                                                                          1),
                                                                  () {
                                                                // colorsValue = false;
                                                                setState(() {});
                                                              });
                                                            });
                                                          },
                                                          // onTap: () {},
                                                          child: const Icon(
                                                            Icons.filter_list,
                                                            color: Colors.black,
                                                          ))
                                                    ],
                                                  ))),
                                          DataColumn(
                                              label: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 2),
                                                  height: Get.height * 0.10,
                                                  width: Get.width * 0.50,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF5F5F5),
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            // colorsValue = true;
                                                            Future.delayed(
                                                                const Duration(
                                                                    seconds: 2),
                                                                () {
                                                              // colorsValue = false;
                                                              setState(() {});
                                                            });
                                                          });
                                                        },
                                                        child: const Text(
                                                          'Study country',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              // colorsValue = true;
                                                              Future.delayed(
                                                                  const Duration(
                                                                      seconds:
                                                                          1),
                                                                  () {
                                                                // colorsValue = false;
                                                                setState(() {});
                                                              });
                                                            });
                                                          },
                                                          // onTap: () {},
                                                          child: const Icon(
                                                            Icons.filter_list,
                                                            color: Colors.black,
                                                          ))
                                                    ],
                                                  ))),
                                          DataColumn(
                                              label: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 2),
                                                  height: Get.height * 0.10,
                                                  width: Get.width * 0.40,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF5F5F5),
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            // colorsValue = true;
                                                            Future.delayed(
                                                                const Duration(
                                                                    seconds: 2),
                                                                () {
                                                              // colorsValue = false;
                                                              setState(() {});
                                                            });
                                                          });
                                                        },
                                                        child: const Text(
                                                          'Student ID',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              // colorsValue = true;
                                                              Future.delayed(
                                                                  const Duration(
                                                                      seconds:
                                                                          1),
                                                                  () {
                                                                // colorsValue = false;
                                                                setState(() {});
                                                              });
                                                            });
                                                          },
                                                          // onTap: () {},
                                                          child: const Icon(
                                                            Icons.filter_list,
                                                            color: Colors.black,
                                                          ))
                                                    ],
                                                  ))),
                                          DataColumn(
                                              label: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 2),
                                                  height: Get.height * 0.10,
                                                  width: Get.width * 0.40,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF5F5F5),
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            // colorsValue = true;
                                                            Future.delayed(
                                                                const Duration(
                                                                    seconds: 2),
                                                                () {
                                                              // colorsValue = false;
                                                              setState(() {});
                                                            });
                                                          });
                                                        },
                                                        child: const Text(
                                                          'Program',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              // colorsValue = true;
                                                              Future.delayed(
                                                                  const Duration(
                                                                      seconds:
                                                                          1),
                                                                  () {
                                                                // colorsValue = false;
                                                                setState(() {});
                                                              });
                                                            });
                                                          },
                                                          // onTap: () {},
                                                          child: const Icon(
                                                            Icons.filter_list,
                                                            color: Colors.black,
                                                          ))
                                                    ],
                                                  ))),
                                          DataColumn(
                                              label: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 2),
                                                  height: Get.height * 0.10,
                                                  width: Get.width * 0.60,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF5F5F5),
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              // colorsValue = true;
                                                              Future.delayed(
                                                                  const Duration(
                                                                      seconds:
                                                                          2),
                                                                  () {
                                                                // colorsValue = false;
                                                                setState(() {});
                                                              });
                                                            });
                                                          },
                                                          child: const Text(
                                                            'Refusal application status',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                // colorsValue = true;
                                                                Future.delayed(
                                                                    const Duration(
                                                                        seconds:
                                                                            1),
                                                                    () {
                                                                  // colorsValue = false;
                                                                  setState(
                                                                      () {});
                                                                });
                                                              });
                                                            },
                                                            // onTap: () {},
                                                            child: const Icon(
                                                              Icons.filter_list,
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                      )
                                                    ],
                                                  ))),
                                          DataColumn(
                                              label: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 2),
                                                  height: Get.height * 0.10,
                                                  width: Get.width * 0.60,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF5F5F5),
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              // colorsValue = true;
                                                              Future.delayed(
                                                                  const Duration(
                                                                      seconds:
                                                                          2),
                                                                  () {
                                                                // colorsValue = false;
                                                                setState(() {});
                                                              });
                                                            });
                                                          },
                                                          child: const Text(
                                                            'Refund request recived data',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                // colorsValue = true;
                                                                Future.delayed(
                                                                    const Duration(
                                                                        seconds:
                                                                            1),
                                                                    () {
                                                                  // colorsValue = false;
                                                                  setState(
                                                                      () {});
                                                                });
                                                              });
                                                            },
                                                            // onTap: () {},
                                                            child: const Icon(
                                                              Icons.filter_list,
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                      )
                                                    ],
                                                  ))),
                                          DataColumn(
                                              label: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 2),
                                                  height: Get.height * 0.10,
                                                  width: Get.width * 0.75,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF5F5F5),
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              // colorsValue = true;
                                                              Future.delayed(
                                                                  const Duration(
                                                                      seconds:
                                                                          2),
                                                                  () {
                                                                // colorsValue = false;
                                                                setState(() {});
                                                              });
                                                            });
                                                          },
                                                          child: const Text(
                                                            'Date of refund processed to intl team',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                // colorsValue = true;
                                                                Future.delayed(
                                                                    const Duration(
                                                                        seconds:
                                                                            1),
                                                                    () {
                                                                  // colorsValue = false;
                                                                  setState(
                                                                      () {});
                                                                });
                                                              });
                                                            },
                                                            // onTap: () {},
                                                            child: const Icon(
                                                              Icons.filter_list,
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                      )
                                                    ],
                                                  ))),
                                          DataColumn(
                                              label: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 2),
                                                  height: Get.height * 0.10,
                                                  width: Get.width * 0.34,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF5F5F5),
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              // colorsValue = true;
                                                              Future.delayed(
                                                                  const Duration(
                                                                      seconds:
                                                                          2),
                                                                  () {
                                                                // colorsValue = false;
                                                                setState(() {});
                                                              });
                                                            });
                                                          },
                                                          child: const Text(
                                                            'TAT for refund',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                // colorsValue = true;
                                                                Future.delayed(
                                                                    const Duration(
                                                                        seconds:
                                                                            1),
                                                                    () {
                                                                  // colorsValue = false;
                                                                  setState(
                                                                      () {});
                                                                });
                                                              });
                                                            },
                                                            // onTap: () {},
                                                            child: const Icon(
                                                              Icons.filter_list,
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                      )
                                                    ],
                                                  ))),
                                          DataColumn(
                                              label: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 2),
                                                  height: Get.height * 0.10,
                                                  width: Get.width * 0.80,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF5F5F5),
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              // colorsValue = true;
                                                              Future.delayed(
                                                                  const Duration(
                                                                      seconds:
                                                                          2),
                                                                  () {
                                                                // colorsValue = false;
                                                                setState(() {});
                                                              });
                                                            });
                                                          },
                                                          child: const Text(
                                                            'Date-Refund money received by student',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                // colorsValue = true;
                                                                Future.delayed(
                                                                    const Duration(
                                                                        seconds:
                                                                            1),
                                                                    () {
                                                                  // colorsValue = false;
                                                                  setState(
                                                                      () {});
                                                                });
                                                              });
                                                            },
                                                            // onTap: () {},
                                                            child: const Icon(
                                                              Icons.filter_list,
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                      )
                                                    ],
                                                  ))),
                                          DataColumn(
                                              label: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 2),
                                                  height: Get.height * 0.10,
                                                  width: Get.width * 0.50,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF5F5F5),
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            // colorsValue = true;
                                                            Future.delayed(
                                                                const Duration(
                                                                    seconds: 2),
                                                                () {
                                                              // colorsValue = false;
                                                              setState(() {});
                                                            });
                                                          });
                                                        },
                                                        child: const Text(
                                                          'Reason for refund',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              // colorsValue = true;
                                                              Future.delayed(
                                                                  const Duration(
                                                                      seconds:
                                                                          1),
                                                                  () {
                                                                // colorsValue = false;
                                                                setState(() {});
                                                              });
                                                            });
                                                          },
                                                          // onTap: () {},
                                                          child: const Icon(
                                                            Icons.filter_list,
                                                            color: Colors.black,
                                                          ))
                                                    ],
                                                  ))),
                                          DataColumn(
                                              label: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 2),
                                                  height: Get.height * 0.10,
                                                  width: Get.width * 0.45,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF5F5F5),
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            // colorsValue = true;
                                                            Future.delayed(
                                                                const Duration(
                                                                    seconds: 2),
                                                                () {
                                                              // colorsValue = false;
                                                              setState(() {});
                                                            });
                                                          });
                                                        },
                                                        child: const Text(
                                                          'Remarks',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              // colorsValue = true;
                                                              Future.delayed(
                                                                  const Duration(
                                                                      seconds:
                                                                          1),
                                                                  () {
                                                                // colorsValue = false;
                                                                setState(() {});
                                                              });
                                                            });
                                                          },
                                                          // onTap: () {},
                                                          child: const Icon(
                                                            Icons.filter_list,
                                                            color: Colors.black,
                                                          ))
                                                    ],
                                                  ))),
                                        ],
                                        source: TableRow()),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: Container(
                                        height: Get.height * 0.08,
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black
                                                  .withOpacity(0.2)),
                                        ),
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/Filter.svg',
                                              height: 30,
                                              width: 30,
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        actions: [
                                                          Stack(
                                                            children: [
                                                              SizedBox(
                                                                height:
                                                                    Get.height *
                                                                        0.80,
                                                                width:
                                                                    Get.width,
                                                                child:
                                                                    StatefulBuilder(
                                                                  builder: (BuildContext
                                                                          context,
                                                                      void Function(
                                                                              void Function())
                                                                          setState) {
                                                                    return Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        const Text(
                                                                          'Filter Builder',
                                                                          style: TextStyle(
                                                                              fontFamily: 'Roboto',
                                                                              fontSize: 22,
                                                                              color: Colors.black),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              Get.height * 0.04,
                                                                        ),
                                                                        const Divider(),
                                                                        SizedBox(
                                                                          height:
                                                                              Get.height * 0.04,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            PopupMenuButton(
                                                                                child: Container(
                                                                                  padding: const EdgeInsets.all(10),
                                                                                  decoration: BoxDecoration(
                                                                                    color: Colors.red.withOpacity(0.2),
                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                  ),
                                                                                  child: Text(add.toString()),
                                                                                ),
                                                                                itemBuilder: (context) => [
                                                                                      PopupMenuItem(
                                                                                        onTap: () {
                                                                                          setState(() {
                                                                                            add = 'Not And';
                                                                                          });
                                                                                        },
                                                                                        child: const Text('Not And'),
                                                                                      ),
                                                                                      PopupMenuItem(
                                                                                        onTap: () {
                                                                                          setState(() {
                                                                                            add = 'or';
                                                                                          });
                                                                                        },
                                                                                        child: const Text('or'),
                                                                                      ),
                                                                                      PopupMenuItem(
                                                                                        onTap: () {
                                                                                          setState(() {
                                                                                            add = 'Not or';
                                                                                          });
                                                                                        },
                                                                                        child: const Text('Not or'),
                                                                                      ),
                                                                                      PopupMenuItem(
                                                                                        onTap: () {
                                                                                          setState(() {
                                                                                            add = 'And';
                                                                                          });
                                                                                        },
                                                                                        child: const Text('And'),
                                                                                      ),
                                                                                    ]),
                                                                            const SizedBox(
                                                                              width: 10,
                                                                            ),
                                                                            PopupMenuButton(
                                                                              child: Container(
                                                                                padding: const EdgeInsets.all(10),
                                                                                child: Text(
                                                                                  "+",
                                                                                  style: TextStyle(color: Colors.green.withOpacity(0.5), fontSize: 25),
                                                                                ),
                                                                              ),
                                                                              itemBuilder: (context) => [
                                                                                PopupMenuItem(
                                                                                  onTap: () {
                                                                                    setState(() {
                                                                                      _addCondition = true;
                                                                                    });
                                                                                  },
                                                                                  child: const Text('Add Condition'),
                                                                                ),
                                                                                PopupMenuItem(
                                                                                  onTap: () {
                                                                                    setState(() {
                                                                                      _addGroup = true;
                                                                                    });
                                                                                  },
                                                                                  child: const Text('Add Group'),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        _addGroup ==
                                                                                true
                                                                            ? Row(
                                                                                children: [
                                                                                  const SizedBox(
                                                                                    width: 5,
                                                                                  ),
                                                                                  InkWell(
                                                                                    onTap: () {
                                                                                      setState(() {
                                                                                        _addGroup = false;
                                                                                      });
                                                                                    },
                                                                                    child: const Icon(
                                                                                      Icons.close,
                                                                                      color: Colors.red,
                                                                                      size: 25,
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 10,
                                                                                  ),
                                                                                  PopupMenuButton(
                                                                                      child: Container(
                                                                                        padding: const EdgeInsets.all(10),
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.red.withOpacity(0.2),
                                                                                          borderRadius: BorderRadius.circular(10),
                                                                                        ),
                                                                                        child: Text(add1.toString()),
                                                                                      ),
                                                                                      itemBuilder: (context) => [
                                                                                            PopupMenuItem(
                                                                                              onTap: () {
                                                                                                setState(() {
                                                                                                  add1 = 'Not And';
                                                                                                });
                                                                                              },
                                                                                              child: const Text('Not And'),
                                                                                            ),
                                                                                            PopupMenuItem(
                                                                                              onTap: () {
                                                                                                setState(() {
                                                                                                  add1 = 'or';
                                                                                                });
                                                                                              },
                                                                                              child: const Text('or'),
                                                                                            ),
                                                                                            PopupMenuItem(
                                                                                              onTap: () {
                                                                                                setState(() {
                                                                                                  add1 = 'Not or';
                                                                                                });
                                                                                              },
                                                                                              child: const Text('Not or'),
                                                                                            ),
                                                                                            PopupMenuItem(
                                                                                              onTap: () {
                                                                                                setState(() {
                                                                                                  add1 = 'And';
                                                                                                });
                                                                                              },
                                                                                              child: const Text('And'),
                                                                                            ),
                                                                                          ]),
                                                                                  const SizedBox(
                                                                                    width: 10,
                                                                                  ),
                                                                                  PopupMenuButton(
                                                                                    child: Container(
                                                                                      padding: const EdgeInsets.all(10),
                                                                                      child: Text(
                                                                                        "+",
                                                                                        style: TextStyle(color: Colors.green.withOpacity(0.5), fontSize: 25),
                                                                                      ),
                                                                                    ),
                                                                                    itemBuilder: (context) => [
                                                                                      PopupMenuItem(
                                                                                        onTap: () {
                                                                                          setState(() {
                                                                                            _addCondition = true;
                                                                                          });
                                                                                        },
                                                                                        child: const Text('Add Condition'),
                                                                                      ),
                                                                                      PopupMenuItem(
                                                                                        onTap: () {
                                                                                          setState(() {});
                                                                                        },
                                                                                        child: const Text('Add Group'),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              )
                                                                            : const SizedBox(),
                                                                        const SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        _addCondition ==
                                                                                true
                                                                            ? Row(
                                                                                children: [
                                                                                  const SizedBox(
                                                                                    width: 5,
                                                                                  ),
                                                                                  InkWell(
                                                                                    onTap: () {
                                                                                      setState(() {
                                                                                        _addCondition = false;
                                                                                      });
                                                                                    },
                                                                                    child: const Icon(
                                                                                      Icons.close,
                                                                                      color: Colors.red,
                                                                                      size: 25,
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 10,
                                                                                  ),
                                                                                  PopupMenuButton(
                                                                                      child: Container(
                                                                                        padding: const EdgeInsets.all(10),
                                                                                        decoration: BoxDecoration(
                                                                                          color: Colors.red.withOpacity(0.2),
                                                                                          borderRadius: BorderRadius.circular(10),
                                                                                        ),
                                                                                        child: Text(add1.toString()),
                                                                                      ),
                                                                                      itemBuilder: (context) => [
                                                                                            PopupMenuItem(
                                                                                              onTap: () {
                                                                                                setState(() {
                                                                                                  add1 = 'Not And';
                                                                                                });
                                                                                              },
                                                                                              child: const Text('Not And'),
                                                                                            ),
                                                                                            PopupMenuItem(
                                                                                              onTap: () {
                                                                                                setState(() {
                                                                                                  add1 = 'or';
                                                                                                });
                                                                                              },
                                                                                              child: const Text('or'),
                                                                                            ),
                                                                                            PopupMenuItem(
                                                                                              onTap: () {
                                                                                                setState(() {
                                                                                                  add1 = 'Not or';
                                                                                                });
                                                                                              },
                                                                                              child: const Text('Not or'),
                                                                                            ),
                                                                                            PopupMenuItem(
                                                                                              onTap: () {
                                                                                                setState(() {
                                                                                                  add1 = 'And';
                                                                                                });
                                                                                              },
                                                                                              child: const Text('And'),
                                                                                            ),
                                                                                          ]),
                                                                                  const SizedBox(
                                                                                    width: 10,
                                                                                  ),
                                                                                  Container(
                                                                                    padding: const EdgeInsets.all(10),
                                                                                    decoration: BoxDecoration(
                                                                                      color: Colors.green.withOpacity(0.5),
                                                                                      borderRadius: BorderRadius.circular(10),
                                                                                    ),
                                                                                    child: const Text('Contains'),
                                                                                  ),
                                                                                ],
                                                                              )
                                                                            : const SizedBox(),
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              Positioned(
                                                                right: 5,
                                                                bottom: 5,
                                                                child: Row(
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Get.back();
                                                                      },
                                                                      child:
                                                                          const Text(
                                                                        'OK',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.red,
                                                                            fontSize: 16),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 25,
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Get.back();
                                                                      },
                                                                      child:
                                                                          const Text(
                                                                        'CANCEL',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.red,
                                                                            fontSize: 16),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      );
                                                    });
                                              },
                                              child: const Text(
                                                "Create Filter",
                                                style: TextStyle(
                                                  color: Color(0xffe8252a),
                                                  fontFamily: 'Roboto',
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              show = false;
                                            });
                                          },
                                          child: Container(
                                            height: Get.height * 0.045,
                                            width: Get.width * 0.25,
                                            decoration: BoxDecoration(
                                                color: kRed,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: const Center(
                                              child: Text(
                                                'Basic',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 11,
                                                    fontFamily: 'Roboto'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        width: double.infinity,
                                        height: 300,
                                        child: LineChart(
                                          LineChartData(
                                              gridData: FlGridData(
                                                drawHorizontalLine: true,
                                                drawVerticalLine: false,
                                              ),
                                              titlesData: FlTitlesData(
                                                show: true,
                                                rightTitles: AxisTitles(
                                                    sideTitles: SideTitles(
                                                        showTitles: false)),
                                                topTitles: AxisTitles(
                                                    sideTitles: SideTitles(
                                                        showTitles: false)),
                                              ),
                                              borderData:
                                                  FlBorderData(show: false),
                                              lineBarsData: [
                                                LineChartBarData(
                                                    isCurved: true,
                                                    spots: [
                                                      const FlSpot(0, 1),
                                                      const FlSpot(0, 0),
                                                      const FlSpot(2, 10),
                                                      const FlSpot(3, 7),
                                                      const FlSpot(4, 12),
                                                      const FlSpot(5, 13),
                                                      const FlSpot(6, 17),
                                                      const FlSpot(7, 15),
                                                      const FlSpot(8, 20)
                                                    ])
                                              ]),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                          color: Colors.black.withOpacity(0.2),
                                        )),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Drop Filter Fileds Here',
                                                    style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontSize: 15,
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog();
                                                              });
                                                        },
                                                        child: SvgPicture.asset(
                                                          'assets/icons/Group 2222.svg',
                                                          height: 23,
                                                          width: 23,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      SvgPicture.asset(
                                                          'assets/icons/XLSX.svg'),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Divider(
                                              thickness: 1,
                                            ),
                                            Container(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              width: Get.width,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Drop Data Filed Here',
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 15,
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Flexible(
                                                      child: Container(
                                                        height:
                                                            Get.height * 0.05,
                                                        child: ListView.builder(
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount: 3,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return Container(
                                                              margin: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      5),
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      5),
                                                              height:
                                                                  Get.height *
                                                                      0.05,
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      0xffE0E0E0),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              13)),
                                                              child: Row(
                                                                children: const [
                                                                  Text(
                                                                    'Applications',
                                                                    style:
                                                                        TextStyle(),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 7,
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .filter_list,
                                                                    color: Colors
                                                                        .grey,
                                                                  )
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              width: Get.width,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'Drop Data Filed Here',
                                                      style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 12,
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Container(
                                                      height: Get.height * 0.05,
                                                      width: Get.width * 0.30,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            color: Colors.grey,
                                                          )),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Container(
                                                      height: Get.height * 0.05,
                                                      width: Get.width * 0.245,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                        color: Colors.grey,
                                                      )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                color: Colors.grey,
                                              )),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: Get.height * 0.05,
                                                    width: Get.width * 0.25,
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(0.2),
                                                        border: const Border
                                                                .symmetric(
                                                            vertical: BorderSide(
                                                                color: Colors
                                                                    .grey))),
                                                    child: const Center(
                                                      child: Text(
                                                        'Grand Total ',
                                                        style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TableRow extends DataTableSource {
  final BuildContext;
  // void setState(void Function() fn) setState ;

  TableRow({
    this.BuildContext,
  });
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: index.isOdd ? Get.width * 0.33 : Get.width * 0.33,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.33,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.70,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.70,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.40,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.50,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.50,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.40,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.40,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.60,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.60,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.75,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.34,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.80,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.50,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
        ),
      ),
      DataCell(
        Container(
          height: Get.height * 0.17,
          width: Get.width * 0.45,
          decoration: const BoxDecoration(
            border: Border.symmetric(
              vertical: BorderSide(width: 2, color: Color(0xffF5F5F5)),
            ),
          ),
        ),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 3;

  @override
  int get selectedRowCount => 0;
}
