import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/features/surahdetails/data/models/surah_details_model.dart';

part 'quran_bookmark_state.dart';

class QuranBookmarkCubit extends Cubit<QuranBookmarkState> {
  List<SurahDetailsModel> suras = [];
  QuranBookmarkCubit() : super(QuranBookmarkInitialState());
  void addSura() {}
}

