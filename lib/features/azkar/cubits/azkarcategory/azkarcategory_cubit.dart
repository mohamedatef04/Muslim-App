import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/features/azkar/data/models/azkar_model.dart';
import 'package:quran_app/features/azkar/data/services/azkar_category_service.dart';

part 'azkarcategory_state.dart';

class AzkarcategoryCubit extends Cubit<AzkarcategoryState> {
  AzkarcategoryCubit() : super(AzkarcategoryInitial());
  late List<AzkarModel> azkar;
  getAzkarCtegory() async {
    emit(AzkarcategoryLoadingState());
    try {
      azkar = await AzkarCategoryService().getAzkarCategory();
      emit(AzkarcategorySuccessState());
    } catch (e) {
      emit(AzkarcategoryFailureState());
    }
  }
}

