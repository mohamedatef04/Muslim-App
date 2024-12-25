import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/features/Quran/data/models/surah_model.dart';
import 'package:quran_app/features/Quran/data/services/surah_information_service.dart';

part 'surahinformation_state.dart';

class SurahInformationCubit extends Cubit<SurahInformationState> {
  SurahInformationCubit() : super(SurahInformationInitial());
  late List<SurahModel> sewars;
  getSurahDetails() async {
    emit(SurahInformationLoadingState());
    try {
      sewars = await SurahInformationService().getSurahInformation();
      emit(SurahInformationLoadedState());
    } catch (e) {
      emit(SurahInformationFailureState());
    }
  }
}
