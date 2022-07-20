import 'package:bloc/bloc.dart';
import 'package:tic_tac_toe/models/playing_field.dart';

class FieldCubit extends Cubit<PlayingFieldModel> {
  FieldCubit(PlayingFieldModel val) : super(val);
}
