import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/ahadeeth/data/models/hadeeth_details_model.dart';
import 'package:quran_app/providers/hadeeth_saved_item.dart';

class AhadeethDetailsListViewItem extends StatefulWidget {
  const AhadeethDetailsListViewItem({
    super.key,
    required this.hadeethDetailsModel,
  });
  final HadeethDetailsModel hadeethDetailsModel;

  @override
  State<AhadeethDetailsListViewItem> createState() =>
      _AhadeethDetailsListViewItemState();
}

class _AhadeethDetailsListViewItemState
    extends State<AhadeethDetailsListViewItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: const Color(0xff121931),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffA44AFF),
                    ),
                    child: Center(
                      child: Text(
                        widget.hadeethDetailsModel.hadeethId.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.sp),
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () async {
                      await FlutterClipboard.copy(
                          widget.hadeethDetailsModel.hadeethText);
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'تم نسخ النص',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(20.r),
                            duration: const Duration(seconds: 1),
                            backgroundColor: const Color(0xffA44AFF),
                          ),
                        );
                      }
                    },
                    icon: Icon(
                      Icons.copy,
                      color: const Color(0xffA44AFF),
                      size: 22.r,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        HadeethSavedItem hadeethSavedItem =
                            Provider.of<HadeethSavedItem>(context,
                                listen: false);

                        bool exist = false;
                        var itemInSaved = hadeethSavedItem.hadeeth;

                        for (var item in itemInSaved) {
                          if (item.hadeethText ==
                              widget.hadeethDetailsModel.hadeethText) {
                            exist = true;
                            break;
                          }
                        }
                        if (exist) {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            text: AppStrings.alreadyInSaved,
                          );
                        } else {
                          hadeethSavedItem
                              .addHadeeth(widget.hadeethDetailsModel);
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            text: AppStrings.itemAdded,
                          );
                        }
                      },
                      icon: Icon(
                        Icons.bookmark_add,
                        color: const Color(0xffA44AFF),
                        size: 22.r,
                      )),
                ],
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              widget.hadeethDetailsModel.hadeethText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19.sp,
                height: 1.6,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          const Divider(color: Color(0xff121931))
        ],
      ),
    );
  }
}
