import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:test_app/core/core.dart';
import 'package:test_app/home/home.dart';

class HomeDataView extends StatelessWidget {
  const HomeDataView({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  final String title;
  final List<HomeData> data;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizing) {
      final isMobile = sizing.deviceScreenType == DeviceScreenType.mobile;
      return IgnorePointer(
        ignoring: true,
        child: SizedBox(
          height: isMobile
              ? 3.h + 260 + 320 + 260 + 300
              : 3.h + 90 + 400 + 370 + 600,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: isMobile ? 21 : null,
                          ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    _Step1(
                      data: data[0],
                      isMobile: isMobile,
                    ),
                    _Step2(
                      data: data[1],
                      isMobile: isMobile,
                    ),
                    _Step3(
                      data: data[2],
                      isMobile: isMobile,
                    ),
                  ],
                ),
              ),
              if (!isMobile)
                Positioned(
                  top: 3.h + 90 + 280 + 40,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 260,
                          width: 250 + 15.w,
                          // color: Colors.red,
                          child: SvgPicture.asset(
                            Assets.arrow1,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 12.w + 20,
                        ),
                      ],
                    ),
                  ),
                ),
              if (!isMobile)
                Positioned(
                  top: 3.h + 90 + 400 + 270,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 15.w,
                        ),
                        Container(
                          height: 240,
                          width: 350,
                          child: SvgPicture.asset(
                            Assets.arrow2,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 60 + 1.w,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}

class _Step1 extends StatelessWidget {
  const _Step1({
    Key? key,
    required this.data,
    required this.isMobile,
  }) : super(key: key);

  final HomeData data;
  final bool isMobile;
  @override
  Widget build(BuildContext context) {
    if (isMobile)
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 80,
                ),
                Container(
                  height: 144,
                  child: SvgPicture.asset(
                    data.asset,
                  ),
                ),
              ],
            ),
            Transform(
              transform: Matrix4.translationValues(0, -60, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '1.',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 130),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Text(
                        data.text,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );

    return Container(
      height: 400,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              width: 300 + 50,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.lightWhite.withOpacity(.5),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 50,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '1.',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 2.h),
                          child: Text(
                            data.text,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 1.w,
            ),
            Container(
              height: 200,
              width: 250,
              child: SvgPicture.asset(
                data.asset,
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
          ],
        ),
      ),
    );
  }
}

class _Step2 extends StatelessWidget {
  const _Step2({
    Key? key,
    required this.data,
    required this.isMobile,
  }) : super(key: key);

  final HomeData data;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final child = isMobile
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 2.h + 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 17,
                    ),
                    Text(
                      '2.',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 130),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Text(
                          data.text,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 65),
                  child: Container(
                    height: 150,
                    child: SvgPicture.asset(
                      data.asset,
                    ),
                  ),
                ),
              ],
            ),
          )
        : Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 18.w,
                ),
                Container(
                  height: 200,
                  width: 250,
                  child: SvgPicture.asset(
                    data.asset,
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '2.',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: FittedBox(
                        child: Text(
                          data.text,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
    return ClipPath(
      clipper: Wave3(),
      child: ClipPath(
        clipper: Wave2(),
        child: Container(
          height: (isMobile ? 50 : 0) + 370,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.lightGreen,
                AppColor.lightBlue,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _Step3 extends StatelessWidget {
  const _Step3({
    Key? key,
    required this.data,
    required this.isMobile,
  }) : super(key: key);

  final HomeData data;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    if (isMobile)
      return Transform(
        transform: Matrix4.translationValues(0, -80, 0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 36,
                  ),
                  Text(
                    '3.',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 130),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 50),
                      child: Text(
                        data.text,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              Transform(
                transform: Matrix4.translationValues(0, -20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 210,
                      width: 280,
                      child: SvgPicture.asset(
                        data.asset,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    return Container(
      height: 380,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 12.w,
                  ),
                  SizedBox(
                    height: 200,
                    width: 100 + 235 + 80,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.lightWhite,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 70,
                          top: 10,
                          child: Container(
                            width: 100 + 235,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '3.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 2.h),
                                  child: Text(
                                    data.text,
                                    maxLines: 3,
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  SizedBox(
                    height: 375,
                    width: 20.w,
                    child: SvgPicture.asset(
                      data.asset,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
