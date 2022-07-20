import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/cubits/field/field_cubit.dart';
import 'package:tic_tac_toe/cubits/winner_checker/winner_checker_cubit.dart';
import 'package:tic_tac_toe/models/playing_field.dart';
import 'package:tic_tac_toe/playing_field.dart';
import 'package:tic_tac_toe/restart_button.dart';
import 'package:tic_tac_toe/turn_displayer.dart';
import 'package:tic_tac_toe/winner_displayer.dart';

import 'cubits/playground/playground_cubit.dart';
import 'cubits/turn/turn_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Widget provider(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TurnCubit(),
        ),
        BlocProvider(
          create: (context) => WinnerCheckerCubit(),
        ),
        BlocProvider(
          create: (context) => PlaygroundCubit(),
        )
      ],
      child: const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SizedBox(
        width: 600,
        child: Column(
          children: [
            SizedBox(
              width: 600,
              height: 600,
              child: BlocConsumer<PlaygroundCubit, PlaygroundState>(
                listener: (context, state) {
                  BlocProvider.of<WinnerCheckerCubit>(context).listUpdatedCheckWinner(state.val);
                },
                builder: (context, state) {
                  return GridView.builder(
                    itemCount: 9,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      final model = PlayingFieldModel(
                        key: index,
                        state: state.val[index],
                      );
                      return BlocProvider(
                        key: UniqueKey(),
                        create: (context) => FieldCubit(model),
                        child: const PlayingField(),
                      );
                    },
                  );
                },
              ),
            ),
            const TurnDisplayer(),
            const WinnerDisplayer(),
            const RestartButton(),
          ],
        ),
      ),
    );
  }
}
