import 'package:bloc/bloc.dart';

enum FieldState { x, o, none }

extension FieldStateX on FieldState {
  String valToString() {
    if (FieldState.o == this) {
      return 'O';
    } else if (FieldState.x == this) {
      return 'X';
    }

    return '';
  }

  FieldState returnOpposite() {
    if (this == FieldState.o) {
      return FieldState.x;
    } else if (this == FieldState.x) {
      return FieldState.o;
    } else {
      return FieldState.none;
    }
  }
}

class PlaygroundCubit extends Cubit<PlaygroundState> {
  PlaygroundCubit() : super(PlaygroundState.inital());

  void fieldValUpdated(int index, FieldState val) {
    List<FieldState> oldList = List.from(state.val);

    oldList[index] = val;

    List<FieldState> newList = List.from(oldList);

    emit(PlaygroundState(newList));
  }

  void resetFieldValues() {
    emit(PlaygroundState.inital());
  }
}

class PlaygroundState {
  const PlaygroundState(this.val);

  final List<FieldState> val;

  static PlaygroundState inital() {
    return PlaygroundState(List.generate(9, (index) => FieldState.none));
  }

  PlaygroundState copyWith({
    List<FieldState>? val,
  }) {
    return PlaygroundState(
      val ?? this.val,
    );
  }

  bool areAllFieldsFull() {
    return !val.contains(FieldState.none);
  }
}
