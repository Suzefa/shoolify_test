import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoolify_test/shoolify_test.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeScreenBloc screenBloc;

  @override
  void initState() {
    screenBloc = BlocProvider.of<HomeScreenBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenBloc, HomeScreenState>(
      listener: (context, state) {
        if(state.errorMsg.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMsg,
              ),
              backgroundColor: Colors.red,
            ),
          );
        } else if(state.resultFromApi.isNotEmpty) {
          Navigator.pushNamed(
            context,
            CustomRouteNames.kResultScreenRoute,
            arguments: state.resultFromApi,
          );
        }
      },
      builder: (context, state) {
        return CustomLoadingWidget(
          isLoading: state.isLoading,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              key: screenBloc.screenKey,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomTextField(
                      controller: screenBloc.searchController,
                      maxLines: 5,
                      minLines: 1,
                      hintText: "Ask anything...",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 25.0,
                      ),
                      child: CustomButton(
                        buttonTitle: "Ask ChatGPT",
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          screenBloc.add(SearchEvent());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    screenBloc.close();
    super.dispose();
  }
}
