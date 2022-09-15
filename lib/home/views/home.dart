import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:test_app/core/core.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => HomePage());
  }

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 2),
        child: AppBar(
          actions: [
            AppTextButton(
              child: Text(
                'Login',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              onPressed: () {},
            ),
          ],
          elevation: 3,
        ),
      ),
      body: _Body(),
      bottomNavigationBar: _BottomNavigation(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
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
