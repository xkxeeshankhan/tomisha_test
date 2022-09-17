import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:test_app/core/core.dart';
import 'package:test_app/l10n/l10n.dart';

class HomePageHandShake extends StatelessWidget {
  const HomePageHandShake({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizing) {
      final mobileSize = sizing.deviceScreenType == DeviceScreenType.mobile;
      return ClipPath(
        clipper: Wave1(),
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.lightBlue,
                AppColor.lightGreen,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: mobileSize ? _Mobile() : _Others(),
        ),
      );
    });
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = context.localizations;

    return Stack(
      children: [
        Positioned.fill(
          bottom: -50,
          left: -20,
          right: -20,
          top: 60,
          child: IllustrationAnimation(
            child: SvgPicture.asset(
              Assets.unDrawAgreement,
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 0,
          right: 0,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: IllustrationAnimation(
                  child: Text(
                    localization.about,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Others extends StatelessWidget {
  const _Others({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = context.localizations;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 320,
          child: IllustrationAnimation(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  localization.about,
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: 3.h,
                ),
                PrimaryButton(
                  width: double.maxFinite,
                  borderRadius: BorderRadius.circular(12),
                  onPressed: () {},
                  child: Text(
                    localization.registerText,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 1.w,
        ),
        Center(
          child: IllustrationAnimation(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Container(
                width: 180,
                height: 180,
                color: AppColor.white,
                child: SvgPicture.asset(Assets.unDrawAgreement),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
