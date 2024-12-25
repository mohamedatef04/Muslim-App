// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:quran_app/features/azkar/cubits/azkarcategory/azkarcategory_cubit.dart';
// import 'package:quran_app/features/azkar/presentation/widgets/azkar_list_view_item.dart';
// import 'package:quran_app/features/azkar/presentation/widgets/azkar_listview_item.dart';

// class AzkarListview extends StatelessWidget {
//   const AzkarListview({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AzkarcategoryCubit, AzkarcategoryState>(
//       builder: (context, state) {
//         if (state is AzkarcategorySuccessState) {
//           return ListView.builder(
//             itemCount:
//                 BlocProvider.of<AzkarcategoryCubit>(context).azkar.length,
//             itemBuilder: (context, index) {
//               return AzkarListViewItem(
//                 azkarCategoryModel:
//                     BlocProvider.of<AzkarcategoryCubit>(context).azkar[index],
//               );
//             },
//           );
//         } else if (state is AzkarcategoryFailureState) {
//           return Center(
//             child: Text('Oops there was an error'),
//           );
//         } else {
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }
