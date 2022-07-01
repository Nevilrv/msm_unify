import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:msm_unify/App/common/AppConfig/CommonAppBar/widget/common_app_bar.dart';
import 'package:msm_unify/App/common/AppConfig/CommonDrawer/widget/common_drawer.dart';
import 'package:msm_unify/App/common/AppConfig/support_section.dart';
import 'package:msm_unify/App/common/color_constant.dart';

import '../../../Api/api_response.dart';
import '../../../model/responseModek/defferal_detail_response_model.dart';
import '../../../viewModel/defferal_detail_view_model.dart';

class NewDeferralRequest extends StatefulWidget {
  final int? applicationId;

  const NewDeferralRequest({Key? key, this.applicationId}) : super(key: key);

  @override
  _NewDeferralRequestState createState() => _NewDeferralRequestState();
}

class _NewDeferralRequestState extends State<NewDeferralRequest> {
  DefferalDetailViewModel defferalDetailViewModel =
      Get.put(DefferalDetailViewModel());

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        endDrawer: commonDrawer(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildPreferredSize(context, _key),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: SvgPicture.asset(
                                'assets/icons/back.svg',
                                height: 22,
                                width: 22,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Back',
                              style: TextStyle(
                                  color: kGrey5,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Text(
                          'Deferral Request',
                          style: TextStyle(
                              color: kNavy,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<DefferalDetailViewModel>(
                      builder: (controller) {
                        if (controller.apiResponse.status == Status.COMPLETE) {
                          print('STATUS COMPLETED');
                          List<DetailResModel> detailResponse =
                              controller.apiResponse.data;
                          return Container(
                            height: Get.height * 0.55,
                            child: ListView.builder(
                              itemCount: detailResponse.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      width: Get.width,
                                      height: Get.height * 0.15,
                                      decoration: BoxDecoration(
                                          color: Color(0xffF4F5F7),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'MSM Application ID',
                                            style: TextStyle(
                                                color: Color(0xff79747E),
                                                fontSize: 15,
                                                fontFamily: "Poppins"),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${detailResponse[index].applicationId}',
                                            style: TextStyle(
                                                color: Color(0xff192A3E),
                                                fontSize: 15,
                                                fontFamily: 'Poppins'),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      width: Get.width,
                                      height: Get.height * 0.15,
                                      decoration: BoxDecoration(
                                          color: Color(0xffF4F5F7),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Defer Intake',
                                            style: TextStyle(
                                                color: Color(0xff79747E),
                                                fontSize: 15,
                                                fontFamily: "Poppins"),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${detailResponse[index].intakeName}',
                                            style: const TextStyle(
                                                color: Color(0xff192A3E),
                                                fontSize: 15,
                                                fontFamily: 'Poppins'),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      width: Get.width,
                                      height: Get.height * 0.15,
                                      decoration: BoxDecoration(
                                          color: Color(0xffF4F5F7),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Created by',
                                            style: TextStyle(
                                                color: Color(0xff79747E),
                                                fontSize: 15,
                                                fontFamily: "Poppins"),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${detailResponse[index].addUser}',
                                            style: TextStyle(
                                                color: Color(0xff192A3E),
                                                fontSize: 15,
                                                fontFamily: 'Poppins'),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      width: Get.width,
                                      height: Get.height * 0.15,
                                      decoration: BoxDecoration(
                                          color: Color(0xffF4F5F7),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Defer Date',
                                            style: TextStyle(
                                                color: Color(0xff79747E),
                                                fontSize: 15,
                                                fontFamily: "Poppins"),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${detailResponse[index].addStamp}',
                                            style: TextStyle(
                                                color: Color(0xff192A3E),
                                                fontSize: 15,
                                                fontFamily: 'Poppins'),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      width: Get.width,
                                      height: Get.height * 0.15,
                                      decoration: BoxDecoration(
                                          color: Color(0xffF4F5F7),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Defer Status',
                                            style: TextStyle(
                                                color: Color(0xff79747E),
                                                fontSize: 15,
                                                fontFamily: "Poppins"),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${detailResponse[index].status}',
                                            style: TextStyle(
                                                color: Color(0xff192A3E),
                                                fontSize: 15,
                                                fontFamily: 'Poppins'),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      width: Get.width,
                                      height: Get.height * 0.15,
                                      decoration: BoxDecoration(
                                          color: Color(0xffF4F5F7),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Name',
                                            style: TextStyle(
                                                color: Color(0xff79747E),
                                                fontSize: 15,
                                                fontFamily: "Poppins"),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${detailResponse[index].name}',
                                            style: TextStyle(
                                                color: Color(0xff192A3E),
                                                fontSize: 15,
                                                fontFamily: 'Poppins'),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      width: Get.width,
                                      height: Get.height * 0.15,
                                      decoration: BoxDecoration(
                                          color: Color(0xffF4F5F7),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Institution',
                                            style: TextStyle(
                                                color: Color(0xff79747E),
                                                fontSize: 15,
                                                fontFamily: "Poppins"),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${detailResponse[index].institution}',
                                            style: TextStyle(
                                                color: Color(0xff192A3E),
                                                fontSize: 15,
                                                fontFamily: 'Poppins'),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      width: Get.width,
                                      height: Get.height * 0.15,
                                      decoration: BoxDecoration(
                                          color: Color(0xffF4F5F7),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Program',
                                            style: TextStyle(
                                                color: Color(0xff79747E),
                                                fontSize: 15,
                                                fontFamily: "Poppins"),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${detailResponse[index].program}',
                                            style: TextStyle(
                                                color: Color(0xff192A3E),
                                                fontSize: 15,
                                                fontFamily: 'Poppins'),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      width: Get.width,
                                      height: Get.height * 0.15,
                                      decoration: BoxDecoration(
                                          color: Color(0xffF4F5F7),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Intake',
                                            style: TextStyle(
                                                color: Color(0xff79747E),
                                                fontSize: 15,
                                                fontFamily: "Poppins"),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${detailResponse[index].currentIntake}',
                                            style: TextStyle(
                                                color: Color(0xff192A3E),
                                                fontSize: 15,
                                                fontFamily: 'Poppins'),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      width: Get.width,
                                      height: Get.height * 0.15,
                                      decoration: BoxDecoration(
                                          color: Color(0xffF4F5F7),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Student ID',
                                            style: TextStyle(
                                                color: Color(0xff79747E),
                                                fontSize: 15,
                                                fontFamily: "Poppins"),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${detailResponse[index].intakeId}',
                                            style: TextStyle(
                                                color: Color(0xff192A3E),
                                                fontSize: 15,
                                                fontFamily: 'Poppins'),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        } else {
                          if (controller.apiResponse.status == Status.ERROR) {
                            return const Center(
                              child: Text('NO DATA FOUND'),
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                    supportSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
