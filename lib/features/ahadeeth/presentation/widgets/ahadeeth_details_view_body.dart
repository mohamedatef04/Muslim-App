import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/constants.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/features/ahadeeth/data/cubits/ahadeethdetails_cubit.dart';
import 'package:quran_app/features/ahadeeth/data/models/ahadeeth_category_model.dart';
import 'package:quran_app/features/ahadeeth/data/models/hadeeth_details_model.dart';
import 'package:quran_app/features/ahadeeth/presentation/widgets/ahadeeth_details_listview_item.dart';

class AhadeethDetailsViewBody extends StatefulWidget {
  const AhadeethDetailsViewBody(
      {super.key, required this.ahadeethCategoryModel});
  final AhadeethCategoryModel ahadeethCategoryModel;

  @override
  State<AhadeethDetailsViewBody> createState() =>
      _AhadeethDetailsViewBodyState();
}

class _AhadeethDetailsViewBodyState extends State<AhadeethDetailsViewBody> {
  final ScrollController _scrollController = ScrollController();
  List<HadeethDetailsModel> displayedAhadeeth = [];
  int currentPage = 1;
  final int itemsPerPage = 10;
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AhadeethdetailsCubit>(context).getHadeethDetails(
        categoryIndex: widget.ahadeethCategoryModel.categoryNumber - 1);
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
    final allAhadeeth = BlocProvider.of<AhadeethdetailsCubit>(context).ahadeeth;
    if (displayedAhadeeth.length < allAhadeeth.length) {
      setState(() {
        isLoadingMore = true;
      });

      // Simulate a small delay for better UX
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) {
          int nextLimit = displayedAhadeeth.length + itemsPerPage;
          if (nextLimit > allAhadeeth.length) nextLimit = allAhadeeth.length;

          setState(() {
            displayedAhadeeth.addAll(
                allAhadeeth.getRange(displayedAhadeeth.length, nextLimit));
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
          widget.ahadeethCategoryModel.categoryAr,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<AhadeethdetailsCubit, AhadeethdetailsState>(
        listener: (context, state) {
          if (state is AhadeethdetailsLoadedState) {
            final allAhadeeth =
                BlocProvider.of<AhadeethdetailsCubit>(context).ahadeeth;
            setState(() {
              displayedAhadeeth = allAhadeeth.take(itemsPerPage).toList();
            });
          }
        },
        builder: (context, state) {
          if (state is AhadeethdetailsLoadedState ||
              displayedAhadeeth.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.only(top: 20),
                    itemCount: displayedAhadeeth.length,
                    itemBuilder: (context, index) {
                      return AhadeethDetailsListViewItem(
                        hadeethDetailsModel: displayedAhadeeth[index],
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
          } else if (state is AhadeethdetailsFailureState) {
            return Center(child: Text(AppStrings.errorOccurred));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

