// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hiring_task/model/user_model.dart';

class MainState {
  final List<Results> userModel;
  final int limit;
  final int page;
  final bool isLoading;
  const MainState({
    required this.userModel,
    required this.limit,
    required this.isLoading,
    required this.page
  });

  MainState copyWith({
    List<Results>? userModel,
    int? limit,
    bool? isLoading,
    int? page,
  }) {
    return MainState(
      userModel: userModel ?? this.userModel,
      limit: limit ?? this.limit,
      page: page ?? this.page,
      isLoading: isLoading ?? this.isLoading,
    );
  }
 }

