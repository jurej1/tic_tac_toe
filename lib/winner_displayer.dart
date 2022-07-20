import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/cubits/playground/playground_cubit.dart';
import 'package:tic_tac_toe/cubits/winner_checker/winner_checker_cubit.dart';

class WinnerDisplayer extends StatelessWidget {
  const WinnerDisplayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WinnerCheckerCubit, FieldState>(
      builder: (context, state) {
        if (state == FieldState.none) {
          return Container();
        } else {
          return Text('The winner is: ${state.valToString()}');
        }
      },
    );
  }
}
