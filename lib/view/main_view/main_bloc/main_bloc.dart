import 'dart:developer';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hiring_task/model/user_model.dart';

import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState( userModel: [],limit: 10,page: 1,isLoading: false)) {
    on<LoadApi>(_loadApi);
  }

  _loadApi(LoadApi event, Emitter<MainState>emit)async{
    if(state.limit < 10){
      return;
    }
    emit(state.copyWith(isLoading: true));
    final dio = Dio();
try{
      Response response = await dio.get("https://randomuser.me/api/?page=${state.page}&results=10");
    if(response.statusCode == 200){

      final model = AutoGenerate.fromJson(response.data);

      log("^^^^^^^^^^^^${model.results.length}");
   List<Results> list = List.from(state.userModel);
      list.addAll(model.results);
      int count = state.page;
      count++;
      emit(state.copyWith(limit: list.length,userModel: list,page: count));
    emit(state.copyWith(isLoading: false));

    }
    log("^^^^^^^^^^^^^^^^^^^${state.userModel.length}");
} catch (e){
    emit(state.copyWith(isLoading: false));
  showOkAlertDialog(context: event.context,message: e.toString(),title: "Error");
}
  }
}
