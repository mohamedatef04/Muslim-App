import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/Quran/cubits/surah/surahinformation/surahinformation_cubit.dart';
import 'package:quran_app/features/Quran/presentation/widgets/custom_listview_item.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahInformationCubit, SurahInformationState>(
      builder: (context, state) {
        if (state is SurahInformationLoadedState) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount:
                BlocProvider.of<SurahInformationCubit>(context).sewars.length,
            itemBuilder: (context, index) {
              return CustomListViewItem(
                surahModel: BlocProvider.of<SurahInformationCubit>(context)
                    .sewars[index],
              );
            },
          );
        } else if (state is SurahInformationFailureState) {
          return Center(child: Text('Oops there was an error'));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

