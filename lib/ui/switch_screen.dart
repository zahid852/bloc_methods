import 'dart:developer';

import 'package:bloc_practice/bloc/switch_bloc/switch_bloc.dart';
import 'package:bloc_practice/bloc/switch_bloc/switch_event.dart';
import 'package:bloc_practice/bloc/switch_bloc/switch_state.dart';
import 'package:bloc_practice/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            20.0.h(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notification'),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state) {
                    return Switch(
                        value: state.isSwitched,
                        onChanged: (val) {
                          context
                              .read<SwitchBloc>()
                              .add(NotificationSwitchOrNotEvent());
                        });
                  },
                )
              ],
            ),
            20.0.h(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Sound'),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state) {
                    return Switch(
                        value: state.isSoundSwitched,
                        onChanged: (val) {
                          context
                              .read<SwitchBloc>()
                              .add(SoundSwitchOrNotEvent());
                        });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
