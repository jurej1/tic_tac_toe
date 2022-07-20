import 'package:bloc/bloc.dart';
import 'package:tic_tac_toe/cubits/playground/playground_cubit.dart';

class WinnerCheckerCubit extends Cubit<FieldState> {
  WinnerCheckerCubit() : super(FieldState.none);

  void listUpdatedCheckWinner(List<FieldState> values) {
    //first row
    final a0 = values[0];
    final a1 = values[1];
    final a2 = values[2];

    //second row
    final a3 = values[3];
    final a4 = values[4];
    final a5 = values[5];

    //third row
    final a6 = values[6];
    final a7 = values[7];
    final a8 = values[8];

    //rows
    if (a0 == a1 && a0 == a2 && a0 != FieldState.none) {
      emit(a0);
    } else if (a3 == a4 && a3 == a5 && a3 != FieldState.none) {
      emit(a3);
    } else if (a6 == a7 && a6 == a8 && a6 != FieldState.none) {
      emit(a6);
    }

    //colums
    else if (a0 == a3 && a0 == a6 && a0 != FieldState.none) {
      emit(a0);
    } else if (a1 == a4 && a1 == a7 && a1 != FieldState.none) {
      emit(a1);
    } else if (a2 == a5 && a2 == a8 && a2 != FieldState.none) {
      emit(a2);
    }

    // diagonal
    else if (a0 == a4 && a0 == a8 && a0 != FieldState.none) {
      emit(a0);
    } else if (a2 == a4 && a2 == a6 && a2 != FieldState.none) {
      emit(a2);
    } else {
      emit(FieldState.none);
    }
  }
}
