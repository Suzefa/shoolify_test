part of 'home_screen_bloc.dart';

class HomeScreenState extends Equatable {
  final bool isLoading;
  final String errorMsg;
  final String resultFromApi;

  const HomeScreenState.empty({
    this.isLoading = false,
    this.errorMsg = "",
    this.resultFromApi = "",
  });

  const HomeScreenState.required({
    required this.isLoading,
    required this.errorMsg,
    required this.resultFromApi,
  });

  HomeScreenState updateState({
    bool? isLoading,
    String? errorMsg,
    String? resultFromApi,
  }){
    return HomeScreenState.required(
      isLoading: isLoading ?? this.isLoading,
      errorMsg: errorMsg ?? this.errorMsg,
      resultFromApi: resultFromApi ?? this.resultFromApi,
    );
  }

  @override
  List<Object?> get props =>[
    isLoading,
    errorMsg,
    resultFromApi,
  ];
}

class HomeScreenInitial extends HomeScreenState {
  const HomeScreenInitial() : super.empty();
}
