import 'package:btalk/view/widgets/framework/RFButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../widgets/RFText.dart';
import '../../../widgets/backButton.dart';
import '../../../widgets/framework/RFRichText.dart';
import 'controller/friendrequest_controller.dart';

class FriendRequestPage extends StatelessWidget {
   FriendRequestPage({super.key});
  final FriendRequestController controller = Get.put(FriendRequestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(
          onTap: () => Get.back(),
        ),
        title: RFRichText(text: "Friend Request", isMandatory: false),
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.friendRequestList.isEmpty) {
          return const Center(child: Text("No Request found"));
        }

        return ListView.builder(
          itemCount: controller.friendRequestList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Picture
                  Container(
                    height: 45.h,
                    width: 45.h,
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.grey.shade300,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                          "assets/girl.jpg", fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 10.w),

                  // Name, Number and Buttons
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RFText(text: "MR.XXXXXX"),
                            RFText(text: "01302XXXXXXX", fontSize: 12.sp),
                            SizedBox(height: 6.h),

                          ],
                        ),
                        Row(
                          children: [
                            RFButton(
                              buttonPadding: EdgeInsets.all(5),
                              buttonWidth: 40,
                              buttonHeight: 30,
                              text: "Accept",
                              buttonTextSize: 10,
                              onPressed: () {},
                            ),
                            SizedBox(width: 10.w),
                            RFButton(
                              buttonPadding: EdgeInsets.all(5),
                              buttonWidth: 40,
                              buttonHeight: 30,
                              text: "Reject",
                              buttonTextSize: 10,
                              buttonColor: Colors.red,
                              onPressed: () {},
                            ),

                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      }),
      // body: Obx(() {
      //   return Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 16.w),
      //     child: ListView.builder(
      //       itemCount: 10,
      //       shrinkWrap: true,
      //       padding: EdgeInsets.symmetric(vertical: 10.h),
      //       itemBuilder: (context, index) {
      //         return Padding(
      //           padding: EdgeInsets.symmetric(vertical: 8.h),
      //           child: Row(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               // Profile Picture
      //               Container(
      //                 height: 45.h,
      //                 width: 45.h,
      //                 padding: EdgeInsets.all(2.w),
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(10.r),
      //                   color: Colors.grey.shade300,
      //                 ),
      //                 child: ClipRRect(
      //                   borderRadius: BorderRadius.circular(10.r),
      //                   child: Image.asset(
      //                       "assets/girl.jpg", fit: BoxFit.cover),
      //                 ),
      //               ),
      //               SizedBox(width: 10.w),
      //
      //               // Name, Number and Buttons
      //               Expanded(
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         RFText(text: "MR.XXXXXX"),
      //                         RFText(text: "01302XXXXXXX", fontSize: 12.sp),
      //                         SizedBox(height: 6.h),
      //
      //                       ],
      //                     ),
      //                     Row(
      //                       children: [
      //                         RFButton(
      //                           buttonPadding: EdgeInsets.all(5),
      //                           buttonWidth: 40,
      //                           buttonHeight: 30,
      //                           text: "Accept",
      //                           buttonTextSize: 10,
      //                           onPressed: () {},
      //                         ),
      //                         SizedBox(width: 10.w),
      //                         RFButton(
      //                           buttonPadding: EdgeInsets.all(5),
      //                           buttonWidth: 40,
      //                           buttonHeight: 30,
      //                           text: "Reject",
      //                           buttonTextSize: 10,
      //                           buttonColor: Colors.red,
      //                           onPressed: () {},
      //                         ),
      //
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               )
      //             ],
      //           ),
      //         );
      //       },
      //     ),
      //   );
      // }),
    );
  }
}
