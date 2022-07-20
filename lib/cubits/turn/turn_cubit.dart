import 'package:bloc/bloc.dart';
import 'package:tic_tac_toe/cubits/playground/playground_cubit.dart';

class TurnCubit extends Cubit<FieldState> {
  TurnCubit() : super(FieldState.o);

  void playerChanged() {
    emit(state.returnOpposite());
  }
}
