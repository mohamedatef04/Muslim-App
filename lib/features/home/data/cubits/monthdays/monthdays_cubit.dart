import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/features/home/data/models/month_day_model.dart';
import 'package:quran_app/features/home/data/services/get_month_days_sercice.dart';

part 'monthdays_state.dart';

class MonthdaysCubit extends Cubit<MonthdaysState> {
  MonthdaysCubit() : super(MonthdaysInitial());
  late MonthDayModel days;
  getMonthDays() async {
    emit(MonthdaysLoadingState());
    try {
      days = await GetMonthDaysSercice().getMonthDays();
      emit(MonthdaysLoadedState());
    } catch (e) {
      emit(MonthdaysFailureState());
    }
  }
}
