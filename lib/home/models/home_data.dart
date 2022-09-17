import 'package:equatable/equatable.dart';
import 'package:test_app/core/core.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeData extends Equatable {
  HomeData({
    required this.text,
    required this.asset,
  });

  final String text;
  final String asset;

  @override
  List<Object?> get props => [
        text,
        asset,
      ];
}

List<HomeData> workerData(AppLocalizations localization) {
  return [
    HomeData(
      asset: Assets.step1,
      text: localization.workerStep1,
    ),
    HomeData(
      asset: Assets.workerStep2,
      text: localization.workerStep2,
    ),
    HomeData(
      asset: Assets.workerStep3,
      text: localization.workerStep3,
    ),
  ];
}

List<HomeData> employerData(AppLocalizations localization) => [
      HomeData(
        asset: Assets.step1,
        text: localization.employerStep1,
      ),
      HomeData(
        asset: Assets.employerStep2,
        text: localization.employerStep2,
      ),
      HomeData(
        asset: Assets.employerStep3,
        text: localization.employerStep3,
      ),
    ];

List<HomeData> temporaryData(AppLocalizations localization) => [
      HomeData(
        asset: Assets.step1,
        text: localization.temporaryStep1,
      ),
      HomeData(
        asset: Assets.temporaryStep2,
        text: localization.temporaryStep2,
      ),
      HomeData(
        asset: Assets.temporaryStep3,
        text: localization.temporaryStep3,
      ),
    ];
