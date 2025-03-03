import 'package:chicken_hatchery/routes/route_value.dart';
import 'package:chicken_hatchery/ui_kit/app_button.dart';
import 'package:flutter/material.dart';
import 'package:chicken_hatchery/src/feature/rituals/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is! UserLoaded) {
          return const Center(child: CircularProgressIndicator());
        }

        return SafeArea(
          child: Column(
            children: [
              // "AppBar" с использованием AppButton
              AppButton(
                text: 'Add',
                onPressed: () {
                  context
                      .push("${RouteValue.home.path}/${RouteValue.add.path}");
                },
              ),
              // Тело экрана, обёрнутое в AppButton
              AppButton(
                text: 'Monitoring',
                onPressed: () {
                  context.push(
                      "${RouteValue.home.path}/${RouteValue.monitoring.path}");
                },
              ),
              AppButton(
                text: 'Statistic',
                onPressed: () {
                  context.push(
                      "${RouteValue.home.path}/${RouteValue.statistic.path}");
                },
              ),
              AppButton(
                text: 'Articels',
                onPressed: () {
                  context.push(
                      "${RouteValue.home.path}/${RouteValue.articles.path}");
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
