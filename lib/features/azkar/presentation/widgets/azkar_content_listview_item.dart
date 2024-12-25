import 'package:audioplayers/audioplayers.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
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
  final player = AudioPlayer();
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          spacing: 15,
          children: [
            Container(
              width: 327,
              height: 47,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xff121931),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 27,
                      height: 27,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffA44AFF),
                      ),
                      child: Center(
                        child: Text(
                          widget.azkarArrayModel.zkrId.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 8,
                    ),
                    IconButton(
                      onPressed: () async {
                        await FlutterClipboard.copy(
                            widget.azkarArrayModel.zkrText);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Text Copied to Clipboard',
                              style: GoogleFonts.amiri(
                                textStyle: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.symmetric(vertical: 20),
                            duration: Duration(seconds: 1),
                            backgroundColor: Color(0xff121931),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.copy,
                        color: Color(0xffA44AFF),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          AskarSavedItem askarSavedItem =
                              Provider.of<AskarSavedItem>(context,
                                  listen: false);
                          bool exist = false;
                          var itemInSaved = askarSavedItem.azkar;
                          for (var item in itemInSaved) {
                            if (item.zkrText ==
                                widget.azkarArrayModel.zkrText) {
                              exist = true;
                            }
                          }
                          if (exist) {
                            QuickAlert.show(
                                context: context,
                                type: QuickAlertType.error,
                                text: 'Already in Your Saved');
                          } else {
                            askarSavedItem.addZkr(widget.azkarArrayModel);

                            QuickAlert.show(
                                context: context,
                                type: QuickAlertType.success,
                                text: 'Item Added');
                          }
                        },
                        icon: Icon(
                          Icons.bookmark_add,
                          color: Color(0xffA44AFF),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                widget.azkarArrayModel.zkrText,
                textAlign: TextAlign.end,
                style: GoogleFonts.abrilFatface(
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
