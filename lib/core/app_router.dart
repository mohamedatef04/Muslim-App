import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/features/ahadeeth/data/cubits/ahadeethdetails_cubit.dart';
import 'package:quran_app/features/ahadeeth/data/models/ahadeeth_category_model.dart';
import 'package:quran_app/features/ahadeeth/presentation/views/ahadeeth_details_view.dart';
import 'package:quran_app/features/azkar/cubits/azkarcategory/azkarcategory_cubit.dart';
import 'package:quran_app/features/azkar/cubits/azkarcontent/azkarcontent_cubit.dart';
import 'package:quran_app/features/azkar/data/models/azkar_category_model.dart';
import 'package:quran_app/features/azkar/presentation/views/azkar_content_view.dart';
import 'package:quran_app/features/azkar/presentation/views/azkar_view.dart';
import 'package:quran_app/features/Quran/cubits/surah/surahinformation/surahinformation_cubit.dart';
import 'package:quran_app/features/Quran/data/models/surah_model.dart';
import 'package:quran_app/features/Quran/presentation/views/quran_view.dart';
import 'package:quran_app/features/ahadeeth/presentation/views/ahadeeth_view.dart';
import 'package:quran_app/features/home/presentation/views/praytime_view.dart';
import 'package:quran_app/features/search/data/cubit/search_cubit.dart';
import 'package:quran_app/features/search/presentation/views/search_view.dart';
import 'package:quran_app/features/setting/presentation/views/azkar_bookmark_view.dart';
import 'package:quran_app/features/setting/presentation/views/hadeeth_bookmark_view.dart';
import 'package:quran_app/features/setting/presentation/views/quran_bookmark_view.dart';
import 'package:quran_app/features/setting/presentation/views/setting_view.dart';
import 'package:quran_app/features/splash/presentation/views/splash_view.dart';
import 'package:quran_app/features/surahdetails/cubits/surahdetails/surahdetails_cubit.dart';
import 'package:quran_app/features/surahdetails/presentation/views/surah_details_view.dart';

class AppRouter {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: '/PraytimeView',
        builder: (context, state) => PraytimeView(),
      ),
      GoRoute(
        path: '/QuranView',
        builder: (context, state) => BlocProvider(
          create: (context) => SurahInformationCubit(),
          child: QuranView(),
        ),
      ),
      GoRoute(
        path: '/SurahDetailsView',
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SurahdetailsCubit(),
            ),
          ],
          child: SurahDetailsView(
            surahModel: state.extra as SurahModel,
          ),
        ),
      ),
      GoRoute(
        path: '/PraytimesView',
        builder: (context, state) => AhadeethView(),
      ),
      GoRoute(
        path: '/AzkarView',
        builder: (context, state) => BlocProvider(
          create: (context) => AzkarcategoryCubit(),
          child: AzkarView(),
        ),
      ),
      GoRoute(
        path: '/AzkarContentView',
        builder: (context, state) => BlocProvider(
          create: (context) => AzkarcontentCubit(),
          child: AzkarContentView(
            azkarCategoryModel: state.extra as AzkarCategoryModel,
          ),
        ),
      ),
      GoRoute(
        path: '/AhadeethView',
        builder: (context, state) => AhadeethView(),
      ),
      GoRoute(
        path: '/AhadeethDetailsView',
        builder: (context, state) => BlocProvider(
          create: (context) => AhadeethdetailsCubit(),
          child: AhadeethDetailsView(
            ahadeethCategoryModel: state.extra as AhadeethCategoryModel,
          ),
        ),
      ),
      GoRoute(
        path: '/SearchView',
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(),
          child: SearchView(),
        ),
      ),
      GoRoute(
        path: '/SettingView',
        builder: (context, state) => SettingView(),
      ),
      GoRoute(
        path: '/QuranBookmarkView',
        builder: (context, state) => QuranBookmarkView(),
      ),
      GoRoute(
        path: '/HadeethBookmarkView',
        builder: (context, state) => HadeethBookmarkView(),
      ),
      GoRoute(
        path: '/AzkarBookmarkView',
        builder: (context, state) => AzkarBookmarkView(),
      ),
    ],
  );
}
