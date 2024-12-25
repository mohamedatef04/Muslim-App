import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/features/Quran/data/models/surah_model.dart';
import 'package:quran_app/features/Quran/data/services/surah_information_service.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  late List<SurahModel> sewars;
  getSurahDetails() async {
    emit(SearchLoadingState());
    try {
      sewars = await SurahInformationService().getSurahInformation();
      emit(SearchSuccessState());
    } catch (e) {
      emit(SearchFailureState());
    }
  }
}
