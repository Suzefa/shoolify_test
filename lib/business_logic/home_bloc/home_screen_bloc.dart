import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoolify_test/shoolify_test.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(const HomeScreenInitial()) {
    on<SearchEvent>(_onSearchEvent);
  }
  final GlobalKey<ScaffoldState> screenKey = GlobalKey<ScaffoldState>();
  final TextEditingController searchController = TextEditingController();
  final ChatGPTService _chatGPTService = ChatGPTService();

  void _onSearchEvent(SearchEvent event, Emitter emit) async {
    if(searchController.text.isEmpty) {
      emit(
        state.updateState(
          errorMsg: "Please insert something in field to ask.",
        ),
      );
      return;
    }
    emit(
      state.updateState(
        isLoading: true,
        errorMsg: "",
        resultFromApi: "",
      ),
    );
    var result = await _chatGPTService.askToGPT(
      question: searchController.text,
    );
    emit(
      state.updateState(
        isLoading: false,
      ),
    );
    if(result is String) {
      emit(
        state.updateState(
          resultFromApi: result,
          errorMsg: "",
        ),
      );
    } else {
      emit(
        state.updateState(
          resultFromApi: "",
          errorMsg: "${result["message"]}",
        ),
      );
    }
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
