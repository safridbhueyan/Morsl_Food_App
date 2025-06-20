import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morsl_app_celina0057/core/utils/utils.dart';
import 'package:morsl_app_celina0057/src/feature/Reset_screen/widgets/succesfully_clear_bottomsheet.dart';
import 'package:morsl_app_celina0057/src/feature/favorite_screen/widgets/custom_button.dart';
import 'package:morsl_app_celina0057/src/feature/settings_screen/riverpod/feedback_provider.dart';

void feedbackSheet(BuildContext context) {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 20.h),
        child: SingleChildScrollView(
          reverse: true,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),

          child: Wrap(
            children: [
              ClipPath(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24.r),
                      bottom: Radius.circular(24.r),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Container(
                          height: 5.w,
                          width: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color(0xff171717),
                          ),
                        ),
                      ),
                      SizedBox(height: 28.h),

                      Text(
                        "Feedback",
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: Color(0xff4B4B4B),
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      SizedBox(height: 16.h),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(hintText: "Name"),
                      ),
                      SizedBox(height: 16.h),

                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(hintText: "E-mail"),
                      ),
                      SizedBox(height: 16.h),

                      SizedBox(
                        height: 100.h,
                        width: 366.w,
                        child: TextFormField(
                          controller: discriptionController,
                          maxLines: null,
                          expands: true,
                          decoration: InputDecoration(hintText: "Description"),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              color: Color(0xffD7CCC8),
                              text: "Cancel",
                              textColor: Color(0xff4A4C56),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          SizedBox(width: 12.h),
                          Expanded(
                            child: Consumer(
                              builder: (context, ref, _) {
                                return CustomButton(
                                  color: Color(0xff9CADA6),
                                  text: "Continue",
                                  textColor: Color(0xffFFFFFF),
                                  onTap: () async {
                                    final feedbackNotifier = ref.read(
                                      feedbackprovider.notifier,
                                    );

                                    await feedbackNotifier.sendFeedback(
                                      name: nameController.text.trim(),
                                      email: emailController.text.trim(),
                                      discription: discriptionController.text
                                          .trim(),
                                    );

                                 
                                    await Future.delayed(
                                      const Duration(milliseconds: 50),
                                    );

                                    final updated = ref.read(
                                      feedbackprovider,
                                    ); 

                                    if (updated.message ==
                                        "Feedback created successfully") {
                                      Navigator.pop(context);
                                      showsuccesConfirmSheet(
                                        context,
                                        "Feedback Successfully Given",
                                      );
                                    } else if (updated.error!.isNotEmpty) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            updated.error.toString(),
                                          ),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text("Something went wrong"),
                                        ),
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
