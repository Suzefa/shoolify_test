import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocListProvider {
  MultiBlocListProvider._();

  static List<BlocProvider> list(){
    return <BlocProvider>[];
  }
}