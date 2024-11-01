import 'package:bloc/bloc.dart';
import 'package:bloc_practice/bloc/switch_bloc/switch_event.dart';
import 'package:bloc_practice/bloc/switch_bloc/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<NotificationSwitchOrNotEvent>(_notificationSwitchedOrNot);
    on<SoundSwitchOrNotEvent>(_soundSwitchedOrNot);
  }

  void _notificationSwitchedOrNot(
      NotificationSwitchOrNotEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitched: !state.isSwitched));
  }

  void _soundSwitchedOrNot(
      SoundSwitchOrNotEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSoundSwitched: !state.isSoundSwitched));
  }
}
