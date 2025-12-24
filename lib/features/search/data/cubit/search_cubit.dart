import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/features/Quran/data/models/surah_model.dart';
import 'package:quran_app/features/Quran/data/services/surah_information_service.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  List<SurahModel> allSewars = [];
  List<SurahModel> filteredSewars = [];

  Future<void> getSurahDetails() async {
    emit(SearchLoadingState());
    try {
      allSewars = await SurahInformationService().getSurahInformation();
      filteredSewars = List.from(allSewars);
      emit(SearchSuccessState());
    } catch (e) {
      emit(SearchFailureState());
    }
  }

  void searchSurahs(String query) {
    if (query.isEmpty) {
      filteredSewars = List.from(allSewars);
    } else {
      final input = query.toLowerCase().trim();
      filteredSewars = allSewars.where((surah) {
        final arName = surah.arSurahName.toLowerCase();
        final enName = surah.enSurahName.toLowerCase();
        final surahNumber = surah.surahNumber.toString();

        return arName.contains(input) ||
            enName.contains(input) ||
            surahNumber.contains(input);
      }).toList();
    }
    emit(SearchSuccessState());
  }
}
