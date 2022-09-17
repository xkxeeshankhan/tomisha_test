import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState()) {
    scrollListener();
  }

  late ScrollController controller;

  scrollListener() {
    controller = ScrollController();
    controller.addListener(() {
      final scrollOffset = controller.offset;
      if (scrollOffset >= kToolbarHeight + 300) {
        emit(HomeState(
          body: state.body,
          showRegisterButtonInAppbar: true,
        ));
      } else {
        emit(HomeState(
          body: state.body,
          showRegisterButtonInAppbar: false,
        ));
      }
    });
  }

  void onTabChange(HomePageBody body) {
    emit(HomeState(body: body));
  }
}
