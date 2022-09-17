import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/l10n/supported_locales.dart';

part 'localization_state.dart';

/// To change the localy using the UI
class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationState());

  changeLocale(Locale locale) {
    if (supportedLocales.contains(locale)) {
      emit(LocalizationState(locale: locale));
    }
  }
}
