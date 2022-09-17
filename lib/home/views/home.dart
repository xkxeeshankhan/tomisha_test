import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:test_app/core/core.dart';
import 'package:test_app/home/home.dart';
import 'package:test_app/l10n/l10n.dart';

extension PageControllerX on PageController {
  Stream<double?> pageStream(BuildContext context) async* {
    // ignore: close_sinks
    final stream = StreamController<double?>();
    this.addListener(() {
      stream.add(this.page);
    });
    yield* stream.stream;
  }
}

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => HomePage());
  }

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = context.localizations;
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        backgroundColor: AppColor.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 2),
          child: AppBar(
            actions: [
              AppTextButton(
                child: Text(
                  localization.loginTitle,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                onPressed: () {},
              ),
              AppTextButton(
                child: Text(
                  'EN',
                  style: Theme.of(context).textTheme.headline6,
                ),
                onPressed: () {
                  context.read<LocalizationCubit>().changeLocale(Locale('en'));
                },
              ),
              AppTextButton(
                child: Text(
                  'DE',
                  style: Theme.of(context).textTheme.headline6,
                ),
                onPressed: () {
                  context.read<LocalizationCubit>().changeLocale(Locale('de'));
                },
              ),
            ],
            elevation: 3,
          ),
        ),
        body: _Template(),
        bottomNavigationBar: _BottomNavigation(),
      ),
    );
  }
}

class _Template extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomePageHandShake(),
          _Tabs(),
          _Body(),
        ],
      ),
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(12);
    final localization = context.localizations;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ResponsiveBuilder(builder: (context, sizing) {
          final mobileSize = sizing.deviceScreenType == DeviceScreenType.mobile;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _TabItem(
                  title: localization.workerTitle,
                  selected: state.body.isWorker,
                  width: mobileSize ? null : 160,
                  onPressed: () {
                    context.read<HomeCubit>().onTabChange(HomePageBody.worker);
                  },
                  borderRadius: BorderRadius.only(
                    topLeft: radius,
                    bottomLeft: radius,
                  ),
                ),
                _TabItem(
                  title: localization.employerTitle,
                  width: mobileSize ? null : 160,
                  onPressed: () {
                    context
                        .read<HomeCubit>()
                        .onTabChange(HomePageBody.employer);
                  },
                  selected: state.body.isEmployer,
                ),
                _TabItem(
                  title: localization.temporaryTitle,
                  selected: state.body.isTemporary,
                  width: mobileSize ? null : 160,
                  onPressed: () {
                    context
                        .read<HomeCubit>()
                        .onTabChange(HomePageBody.temporary);
                  },
                  borderRadius: BorderRadius.only(
                    topRight: radius,
                    bottomRight: radius,
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    Key? key,
    required this.selected,
    required this.title,
    this.width,
    this.borderRadius,
    this.onPressed,
  }) : super(key: key);

  final bool selected;
  final String title;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final child = InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: selected ? AppColor.aqua : AppColor.borderGrey,
          ),
          borderRadius: borderRadius,
          color: selected ? AppColor.aqua : null,
        ),
        width: width,
        height: 40,
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: selected ? AppColor.white : null,
                ),
          ),
        ),
      ),
    );
    if (width == null) return Expanded(child: child);
    return child;
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = context.localizations;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (_, state) {
        switch (state.body) {
          case HomePageBody.worker:
            return HomeDataView(
              data: workerData(localization),
              title: localization.workerStepTitle,
            );
          case HomePageBody.employer:
            return HomeDataView(
              data: employerData(localization),
              title: localization.employerStepTitle,
            );
          case HomePageBody.temporary:
            return HomeDataView(
              data: temporaryData(localization),
              title: localization.temporaryStepTitle,
            );
        }
      },
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_, size) {
        switch (size.deviceScreenType) {
          case DeviceScreenType.mobile:
            return Material(
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: AppColor.white,
              shadowColor: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 20,
                ),
                child: SafeArea(
                  bottom: true,
                  top: false,
                  child: PrimaryButton(
                    onPressed: () {},
                    borderRadius: BorderRadius.circular(12),
                    child: Text(
                      'Kostenlos Registrieren',
                    ),
                  ),
                ),
              ),
            );
          default:
        }
        return SizedBox();
      },
    );
  }
}
