import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/features/ahadeeth/data/models/hadeeth_details_model.dart';
import 'package:quran_app/features/ahadeeth/data/services/hadeeth_details_service.dart';

part 'ahadeethdetails_state.dart';

class AhadeethdetailsCubit extends Cubit<AhadeethdetailsState> {
  AhadeethdetailsCubit() : super(AhadeethdetailsInitial());
  late List<HadeethDetailsModel> ahadeeth;
  getHadeethDetails({required int categoryIndex}) async {
    emit(AhadeethdetailsLoadingState());
    try {
      ahadeeth = await HadeethDetailsService()
          .getAllAhadeeth(categoryIndex: categoryIndex);
      emit(AhadeethdetailsLoadedState());
    } catch (e) {
      emit(AhadeethdetailsFailureState());
    }
  }
}

