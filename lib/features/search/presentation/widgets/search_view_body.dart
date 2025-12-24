import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/search/data/cubit/search_cubit.dart';
import 'package:quran_app/features/search/presentation/widgets/custom_search_textfield.dart';
import 'package:quran_app/features/search/presentation/widgets/search_view_listview_item.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchCubit>(context).getSurahDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: kPrimaryColor,
        title: Text(
          AppStrings.search,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          CustomSearchTextField(
            onChanged: (query) {
              BlocProvider.of<SearchCubit>(context).searchSurahs(query);
            },
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccessState) {
                  final searchCubit = BlocProvider.of<SearchCubit>(context);

                  if (searchCubit.filteredSewars.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 64.r,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'لا توجد نتائج',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: searchCubit.filteredSewars.length,
                    itemBuilder: (context, index) {
                      return SearchViewListviewItem(
                        surahModel: searchCubit.filteredSewars[index],
                      );
                    },
                  );
                } else if (state is SearchFailureState) {
                  return Center(child: Text(AppStrings.errorOccurred));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
