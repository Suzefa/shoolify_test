import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoolify_test/shoolify_test.dart';

class CustomRouteGenerator {
  CustomRouteGenerator._();

  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name){
      case CustomRouteNames.kInitialRoute:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context)=> HomeScreenBloc(),
              child: const HomeScreen(),
            );
          },
        );
      case CustomRouteNames.kResultScreenRoute:
        String resultText = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) {
            return ResultScreen(
              resultText: resultText,
            );
          },
        );
      default:
        return null;
    }
  }
}