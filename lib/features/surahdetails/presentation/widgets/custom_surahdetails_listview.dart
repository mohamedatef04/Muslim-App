import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quran_app/features/surahdetails/cubits/surahdetails/surahdetails_cubit.dart';
import 'package:quran_app/features/surahdetails/presentation/widgets/custom_listview_item.dart';

class CustomSurahDetailsListView extends StatelessWidget {
  const CustomSurahDetailsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahdetailsCubit, SurahdetailsState>(
      builder: (context, state) {
        if (state is SurahdetailsLoadedState) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: BlocProvider.of<SurahdetailsCubit>(context).sewrs.length,
            itemBuilder: (context, index) {
              return CustomSurahDetailsListViewItem(
                surahDetailsModel:
                    BlocProvider.of<SurahdetailsCubit>(context).sewrs[index],
              );
            },
          );
        } else if (state is SurahdetailsFailureState) {
          return Center(child: Text('Oops there was an error'));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
