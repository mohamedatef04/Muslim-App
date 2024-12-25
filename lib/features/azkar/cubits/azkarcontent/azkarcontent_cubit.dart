import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/features/azkar/data/models/askar_array_model.dart';
import 'package:quran_app/features/azkar/data/services/azkar_content_service.dart';

part 'azkarcontent_state.dart';

class AzkarcontentCubit extends Cubit<AzkarcontentState> {
  AzkarcontentCubit() : super(AzkarcontentInitial());
  late List<AskarArrayModel> askarContent;
  getAzkarContent({required int azkarId}) async {
    emit(AzkarContentLoadingState());
    try {
      askarContent =
          await AzkarContentService().getAzkarContent(azkarId: azkarId);
      emit(AzkarContentSuccessState());
    } catch (e) {
      emit(AzkarContentFailureState());
    }
  }
}
