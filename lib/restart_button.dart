import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/cubits/playground/playground_cubit.dart';

import 'cubits/winner_checker/winner_checker_cubit.dart';

class RestartButton extends StatelessWidget {
  const RestartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WinnerCheckerCubit, FieldState>(
      builder: (context, state) {
        if (state != FieldState.none) {
          return _restartButton(context);
        }

        return BlocBuilder<PlaygroundCubit, PlaygroundState>(
          builder: (context, state) {
            if (state.areAllFieldsFull()) {
              return _restartButton(context);
            }
            return Container();
          },
        );
      },
    );
  }

  Widget _restartButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<PlaygroundCubit>(context).resetFieldValues();
      },
      child: const Text('Restart'),
    );
  }
}
