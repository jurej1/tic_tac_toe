import 'package:tic_tac_toe/cubits/playground/playground_cubit.dart';

class PlayingFieldModel {
  final int key;
  final FieldState state;

  const PlayingFieldModel({
    required this.key,
    required this.state,
  });

  PlayingFieldModel copyWith({
    int? key,
    FieldState? state,
  }) {
    return PlayingFieldModel(
      key: key ?? this.key,
      state: state ?? this.state,
    );
  }
}
