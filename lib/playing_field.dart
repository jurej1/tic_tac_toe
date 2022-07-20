import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/cubits/field/field_cubit.dart';
import 'package:tic_tac_toe/cubits/playground/playground_cubit.dart';
import 'package:tic_tac_toe/cubits/winner_checker/winner_checker_cubit.dart';
import 'package:tic_tac_toe/models/playing_field.dart';

import 'cubits/turn/turn_cubit.dart';

class PlayingField extends StatelessWidget {
  const PlayingField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FieldCubit, PlayingFieldModel>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            final turnCubit = BlocProvider.of<TurnCubit>(context);
            final winnerCubitState = BlocProvider.of<WinnerCheckerCubit>(context).state;

            if (winnerCubitState == FieldState.none) {
              BlocProvider.of<PlaygroundCubit>(context).fieldValUpdated(
                state.key,
                turnCubit.state,
              );
              turnCubit.playerChanged();
            }
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            alignment: Alignment.center,
            child: Text(
              state.state.valToString(),
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
