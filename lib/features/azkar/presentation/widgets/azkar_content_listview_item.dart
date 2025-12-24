import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/azkar/data/models/askar_array_model.dart';
import 'package:quran_app/providers/askar_saved_item.dart';

class AzkarContentListviewItem extends StatefulWidget {
  const AzkarContentListviewItem({super.key, required this.azkarArrayModel});
  final AskarArrayModel azkarArrayModel;

  @override
  State<AzkarContentListviewItem> createState() =>
      _AzkarContentListviewItemState();
}

class _AzkarContentListviewItemState extends State<AzkarContentListviewItem> {
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
                        widget.azkarArrayModel.zkrId.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.sp),
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () async {
                      await FlutterClipboard.copy(
                          widget.azkarArrayModel.zkrText);
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              AppStrings.copySuccess,
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
                        AskarSavedItem askarSavedItem =
                            Provider.of<AskarSavedItem>(context, listen: false);
                        bool exist = false;
                        var itemInSaved = askarSavedItem.azkar;
                        for (var item in itemInSaved) {
                          if (item.zkrText == widget.azkarArrayModel.zkrText) {
                            exist = true;
                            break;
                          }
                        }
                        if (exist) {
                          QuickAlert.show(
                              context: context,
                              type: QuickAlertType.error,
                              text: AppStrings.alreadyInSaved);
                        } else {
                          askarSavedItem.addZkr(widget.azkarArrayModel);
                          QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              text: AppStrings.itemAdded);
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
              widget.azkarArrayModel.zkrText,
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
