import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/core/constants.dart';
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
        backgroundColor: kPrimaryColor,
        title: Text(
          'Search View',
          style: GoogleFonts.amiri(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          CustomSearchTextField(
            onChanged: searchSura,
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccessState) {
                  return ListView.builder(
                    itemCount:
                        BlocProvider.of<SearchCubit>(context).sewars.length,
                    itemBuilder: (context, index) {
                      return SearchViewListviewItem(
                        surahModel:
                            BlocProvider.of<SearchCubit>(context).sewars[index],
                      );
                    },
                  );
                } else if (state is SearchFailureState) {
                  return Center(child: Text('Oops There Was an Error'));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ],
      ),
    );
  }

  void searchSura(String query) {
    final suggestions = BlocProvider.of<SearchCubit>(context).sewars.where(
      (element) {
        final suraText = element.arSurahName.toLowerCase();
        final input = query.toLowerCase();
        return suraText.contains(input);
      },
    ).toList();
    setState(() {
      BlocProvider.of<SearchCubit>(context).sewars = suggestions;
    });
  }
}
