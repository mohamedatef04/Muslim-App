import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/utils/app_strings.dart';
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
          automaticallyImplyLeading: false,
          backgroundColor: kPrimaryColor,
          title: Text(
            AppStrings.quran,
            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(
                  '/SearchView',
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: CustomHeadText(),
                  ),
                  const SliverToBoxAdapter(
                    child: CustomNextText(),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20.h,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: CustomImageContainer(),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 10.h,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: CustomListView(),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

