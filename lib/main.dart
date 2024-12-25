import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/app_router.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/features/home/data/cubits/monthdays/monthdays_cubit.dart';

import 'package:quran_app/providers/askar_saved_item.dart';
import 'package:quran_app/providers/hadeeth_saved_item.dart';
import 'package:quran_app/providers/quran_saved_item.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MonthdaysCubit(),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<QuranSavedItem>(
            create: (context) => QuranSavedItem(),
          ),
          ChangeNotifierProvider<HadeethSavedItem>(
            create: (context) => HadeethSavedItem(),
          ),
          ChangeNotifierProvider<AskarSavedItem>(
            create: (context) => AskarSavedItem(),
          ),
        ],
        child: ScreenUtilInit(
          designSize: Size(375, 812),
          child: MaterialApp.router(
            routerConfig: AppRouter().router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(brightness: Brightness.dark)
                .copyWith(scaffoldBackgroundColor: kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
