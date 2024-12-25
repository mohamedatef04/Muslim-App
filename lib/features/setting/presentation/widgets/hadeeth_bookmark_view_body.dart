import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/features/ahadeeth/data/models/hadeeth_details_model.dart';
import 'package:quran_app/providers/hadeeth_saved_item.dart';

class HadeethBookmarkViewBody extends StatelessWidget {
  const HadeethBookmarkViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<HadeethDetailsModel> hadeeth =
        Provider.of<HadeethSavedItem>(context).hadeeth;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Hadeeth BookMarks',
          style: GoogleFonts.amiri(textStyle: TextStyle(color: Colors.white)),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (hadeeth.isNotEmpty) {
            return ListView.builder(
              itemCount: hadeeth.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      spacing: 18,
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
                                      hadeeth[index].hadeethId.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Spacer(
                                  flex: 8,
                                ),
                                IconButton(
                                  onPressed: () async {
                                    await FlutterClipboard.copy(
                                        hadeeth[index].hadeethText);
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
                                        margin:
                                            EdgeInsets.symmetric(vertical: 20),
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

                                    hadeethSavedItem
                                        .deleteHadeeth(hadeeth[index]);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    size: 25,
                                    color: Color(0xffA44AFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            hadeeth[index].hadeethText,
                            textAlign: TextAlign.end,
                            style: GoogleFonts.amiri(
                              textStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Divider()
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/empty-folder.png',
                    width: 200,
                  ),
                  Text(
                    'No Saved Items',
                    style: GoogleFonts.amiri(
                      textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffA19CC5),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
