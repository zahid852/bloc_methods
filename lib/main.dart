import 'package:bloc_practice/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_practice/bloc/switch_bloc/switch_bloc.dart';
import 'package:bloc_practice/ui/features_screen.dart';
import 'package:bloc_practice/ui/switch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'resources/route_assets.dart';

void main() {
  runApp(const MyApp());
}

extension HeightDouble on double {
  SizedBox h() {
    return SizedBox(
      height: this,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterBloc()),
          BlocProvider(create: (_) => SwitchBloc()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Bloc Practice',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
            useMaterial3: true,
          ),
          routerConfig: route,
        ));
  }
}

final GoRouter route = GoRouter(initialLocation: Routes.featuresRoute, routes: [
  GoRoute(
      name: Routes.featuresRoute,
      path: Routes.featuresRoute,
      pageBuilder: (context, state) {
        return buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const FeaturesScreen(),
        );
      }),
  GoRoute(
      name: Routes.counterRoute,
      path: Routes.counterRoute,
      pageBuilder: (context, state) {
        return buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const FeaturesScreen(),
        );
      }),
  GoRoute(
      name: Routes.switchRoute,
      path: Routes.switchRoute,
      pageBuilder: (context, state) {
        return buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const SwitchScreen(),
        );
      }),
]);

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 150),
    reverseTransitionDuration: const Duration(milliseconds: 150),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SlideTransition(
            position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                .animate(animation),
            child: child),
  );
}
