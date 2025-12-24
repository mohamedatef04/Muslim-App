import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/azkar/cubits/azkarcontent/azkarcontent_cubit.dart';
import 'package:quran_app/features/azkar/data/models/askar_array_model.dart';
import 'package:quran_app/features/azkar/data/models/azkar_category_model.dart';
import 'package:quran_app/features/azkar/presentation/widgets/azkar_content_listview_item.dart';

class AzkarContentViewBody extends StatefulWidget {
  const AzkarContentViewBody({super.key, required this.azkarCategoryModel});
  final AzkarCategoryModel azkarCategoryModel;

  @override
  State<AzkarContentViewBody> createState() => _AzkarContentViewBodyState();
}

class _AzkarContentViewBodyState extends State<AzkarContentViewBody> {
  final ScrollController _scrollController = ScrollController();
  List<AskarArrayModel> displayedAzkar = [];
  final int itemsPerPage = 10;
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AzkarcontentCubit>(context)
        .getAzkarContent(azkarId: widget.azkarCategoryModel.categoryNumber - 1);
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !isLoadingMore) {
      _loadMore();
    }
  }

  void _loadMore() {
    final allAzkar = BlocProvider.of<AzkarcontentCubit>(context).askarContent;
    if (displayedAzkar.length < allAzkar.length) {
      setState(() {
        isLoadingMore = true;
      });
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) {
          int nextLimit = displayedAzkar.length + itemsPerPage;
          if (nextLimit > allAzkar.length) nextLimit = allAzkar.length;
          setState(() {
            displayedAzkar
                .addAll(allAzkar.getRange(displayedAzkar.length, nextLimit));
            isLoadingMore = false;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
          widget.azkarCategoryModel.categoryAr,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<AzkarcontentCubit, AzkarcontentState>(
        listener: (context, state) {
          if (state is AzkarContentSuccessState) {
            final allAzkar =
                BlocProvider.of<AzkarcontentCubit>(context).askarContent;
            setState(() {
              displayedAzkar = allAzkar.take(itemsPerPage).toList();
            });
          }
        },
        builder: (context, state) {
          if (state is AzkarContentSuccessState || displayedAzkar.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(10),
                    itemCount: displayedAzkar.length,
                    itemBuilder: (context, index) {
                      return AzkarContentListviewItem(
                        azkarArrayModel: displayedAzkar[index],
                      );
                    },
                  ),
                ),
                if (isLoadingMore)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: CircularProgressIndicator(),
                  ),
              ],
            );
          } else if (state is AzkarContentFailureState) {
            return Center(child: Text(AppStrings.errorOccurred));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

