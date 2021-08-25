
abstract class NewsState {}

class InitialNewsState extends NewsState  {}
class NewsBottomNavState extends NewsState  {}
class NewGetBusinessLoadingState extends NewsState  {}
class NewGetBusinessSuccessState extends NewsState  {}
class NewGetBusinessErrorState extends NewsState  {
  final String error;
  NewGetBusinessErrorState(this.error);
}

class NewGetSportsLoadingState extends NewsState  {}
class NewGetSportsSuccessState extends NewsState  {}
class NewGetSportsErrorState extends NewsState  {
  final String error;
  NewGetSportsErrorState(this.error);
}

class NewGetScienceLoadingState extends NewsState  {}
class NewGetScienceSuccessState extends NewsState  {}
class NewGetScienceErrorState extends NewsState  {
  final String error;
  NewGetScienceErrorState(this.error);
}
class AppChangeModeState extends NewsState{}
