part of 'localization_cubit.dart';

class LocalizationState extends Equatable {
  LocalizationState({this.locale});

  final Locale? locale;

  @override
  List<Object?> get props => [locale];
}
