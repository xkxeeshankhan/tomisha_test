import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:test_app/core/core.dart';
import 'package:test_app/home/home.dart';
import 'package:test_app/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => HomeCubit(),
        child: HomePage(),
      ),
    );
  }

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = context.localizations;
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 2),
        child: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (_old, _new) =>
              _old.showRegisterButtonInAppbar !=
              _new.showRegisterButtonInAppbar,
          builder: (context, state) {
            return ResponsiveBuilder(
              builder: (context, sizing) {
                final isMobile = sizing.deviceScreenType == DeviceScreenType.mobile;
                return AppBar(
                  actions: [
                    if (state.showRegisterButtonInAppbar && !isMobile) ...[
                      SizedBox(
                        height: kToolbarHeight,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              localization.clickHere,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(color: AppColor.black2),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 255,
                        child: Center(
                          child: SecondaryButton(
                            width: 255,
                            borderRadius: BorderRadius.circular(12),
                            child: Text(
                              localization.registerText,
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                    AppTextButton(
                      child: Text(
                        localization.loginTitle,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: AppColor.green,
                            ),
                      ),
                      onPressed: () {},
                    ),
                    AppTextButton(
                      child: Text(
                        'EN',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      onPressed: () {
                        context
                            .read<LocalizationCubit>()
                            .changeLocale(Locale('en'));
                      },
                    ),
                    AppTextButton(
                      child: Text(
                        'DE',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      onPressed: () {
                        context
                            .read<LocalizationCubit>()
                            .changeLocale(Locale('de'));
                      },
                    ),
                  ],
                  elevation: 3,
                );
              }
            );
          },
        ),
      ),
      body: _Template(),
      bottomNavigationBar: _BottomNavigation(),
    );
  }
}

class _Template extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: context.read<HomeCubit>().controller,
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
