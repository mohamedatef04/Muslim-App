// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:quran_app/features/home/data/models/month_day_model.dart';
// import 'package:quran_app/features/home/data/services/get_month_days_sercice.dart';
// part 'praytimes_state.dart';

// class PraytimesCubit extends Cubit<PraytimesState> {
//   PraytimesCubit() : super(PraytimesInitial());
//   late List<MonthDayModel> prayTimes;
//   getPrayTimes() async {
//     emit(PraytimesLoadingState());
//     try {
//       prayTimes = await GetMonthDaysSercice().getMonthDays();
//       emit(PraytimesLoadedState());
//     } catch (e) {
//       emit(PraytimesFailureState());
//     }
//   }
// }

