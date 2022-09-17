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
  });

  final HomePageBody body;

  @override
  List<Object> get props => [
        body,
      ];
}
