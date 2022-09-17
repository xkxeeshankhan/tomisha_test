part of 'home_cubit.dart';

enum HomePageBody {
  worker,
  employer,
  temporary;

  bool get isWorker => this == HomePageBody.worker;
  bool get isEmployer => this == HomePageBody.employer;
  bool get isTemporary => this == HomePageBody.temporary;
}

class HomeState extends Equatable {
  const HomeState({
    this.body = HomePageBody.worker,
    this.showRegisterButtonInAppbar = false,
  });

  final HomePageBody body;
  final bool showRegisterButtonInAppbar;
  @override
  List<Object> get props => [
        body,
        showRegisterButtonInAppbar,
      ];
}
