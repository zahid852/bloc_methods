import 'package:equatable/equatable.dart';

class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object?> get props => [];
}

class NotificationSwitchOrNotEvent extends SwitchEvent {}

class SoundSwitchOrNotEvent extends SwitchEvent {}
