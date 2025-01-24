import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_task/src/app_colors.dart';
import 'package:hiring_task/src/app_strings.dart';
import 'package:hiring_task/view/main_view/main_bloc/main_bloc.dart';
import 'package:hiring_task/view/main_view/main_bloc/main_state.dart';
import 'package:hiring_task/widgets/app_cached_image.dart';
import 'package:hiring_task/widgets/custome_textfield.dart';
import 'main_bloc/main_event.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  ScrollController scrollController = ScrollController();

  void onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      context.read<MainBloc>().add(LoadApi(context: context));
    }
  }

  @override
  void initState() {
    scrollController.addListener(onScroll);
    context.read<MainBloc>().add(LoadApi(context: context));
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onScroll);
    scrollController.dispose();
    super.dispose();
  }

  loadAPi() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back),
                        Text(AppStrings.datingList),
                        SizedBox()
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      hintText: "Search here...",
                      isSowPrefixcon: true,
                    ),
                    SizedBox(height: 20)
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(child: BlocBuilder<MainBloc, MainState>(
                builder: (context, state) {
                  return state.isLoading && state.page == 1
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: state.userModel.length,
                          controller: scrollController,
                          itemBuilder: (context, index) {
                            final user = state.userModel[index];

                            return Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(user.nat),
                                      const Icon(Icons.more_vert)
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Divider(
                                    height: 0,
                                    thickness: 1,
                                    color: AppColors.white,
                                  ),
                                  Row(
                                    children: [
                                      AppCacheImage(
                                        imageUrl: user.picture.medium,
                                        height: 60,
                                        round: 60,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                          "${user.name.title}, ${user.name.first} ${user.name.last} - ${user.dob.age}"),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Column(
                                        children: [
                                          Text(user.dob.date),
                                        ],
                                      )),
                                      const VerticalDivider(
                                        width: 0,
                                        color: AppColors.white,
                                        thickness: 1,
                                      ),
                                      Expanded(
                                          child: Column(
                                        children: [
                                          Text(
                                              "${user.location.country} ${user.location.city} ${user.location.street}"),
                                        ],
                                      )),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
