import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:quran_app/features/surahdetails/data/models/surah_details_model.dart';

import 'package:quran_app/features/surahdetails/data/services/surah_details_services.dart';

part 'surahdetails_state.dart';

class SurahdetailsCubit extends Cubit<SurahdetailsState> {
  SurahdetailsCubit() : super(SurahdetailsInitial());
  late List<SurahDetailsModel> sewrs;
  getALLSurahDetails({required int suraIndex}) async {
    emit(SurahdetailsLoadingState());
    try {
      sewrs =
          await SurahDetailsServices().getSurahDetails(suraIndex: suraIndex);
      emit(SurahdetailsLoadedState());
    } catch (e) {
      emit(SurahdetailsFailureState());
    }
  }
}

