import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool isSwitched;
  final bool isSoundSwitched;
  const SwitchState({this.isSwitched = false, this.isSoundSwitched = false});

  SwitchState copyWith({bool? isSwitched, bool? isSoundSwitched}) {
    return SwitchState(
      isSwitched: isSwitched ?? this.isSwitched,
      isSoundSwitched: isSoundSwitched ?? this.isSoundSwitched,
    );
  }

  @override
  List<Object?> get props => [isSwitched, isSoundSwitched];
}
