import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
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
                          widget.hadeethDetailsModel.hadeethId.toString(),
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
                            widget.hadeethDetailsModel.hadeethText);
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
                          HadeethSavedItem hadeethSavedItem =
                              Provider.of<HadeethSavedItem>(context,
                                  listen: false);

                          bool exist = false;

                          var itemInSaved = hadeethSavedItem.hadeeth;

                          for (var item in itemInSaved) {
                            if (item.hadeethText ==
                                widget.hadeethDetailsModel.hadeethText) {
                              exist = true;
                            }
                          }
                          if (exist) {
                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.error,
                              text: 'Already in your Saved',
                            );
                          } else {
                            hadeethSavedItem
                                .addHadeeth(widget.hadeethDetailsModel);

                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              text: 'Item added',
                            );
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
                widget.hadeethDetailsModel.hadeethText,
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
