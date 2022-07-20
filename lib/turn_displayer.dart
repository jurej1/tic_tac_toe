import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/cubits/playground/playground_cubit.dart';

import 'cubits/turn/turn_cubit.dart';

class TurnDisplayer extends StatelessWidget {
  const TurnDisplayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TurnCubit, FieldState>(
      builder: (context, state) {
        return Text('Now the player ${state.valToString()}s turn');
      },
    );
  }
}
