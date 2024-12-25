import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/features/Quran/cubits/surah/surahinformation/surahinformation_cubit.dart';
import 'package:quran_app/features/Quran/presentation/widgets/custom_head_text.dart';
import 'package:quran_app/features/Quran/presentation/widgets/custom_image_container.dart';
import 'package:quran_app/features/Quran/presentation/widgets/custom_listview.dart';
import 'package:quran_app/features/Quran/presentation/widgets/custom_next_text.dart';

class QuranViewBody extends StatefulWidget {
  const QuranViewBody({
    super.key,
  });

  @override
  State<QuranViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<QuranViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SurahInformationCubit>(context).getSurahDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(
            'Quran - القران',
            style: GoogleFonts.amiri(
              textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(
                  '/SearchView',
                );
              },
              icon: Icon(Icons.search),
            ),
          ],
        ),
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: CustomHeadText(),
                  ),
                  SliverToBoxAdapter(
                    child: CustomNextText(),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomImageContainer(),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomListView(),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
