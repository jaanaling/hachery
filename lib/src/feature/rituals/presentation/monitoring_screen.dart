import 'package:chicken_hatchery/ui_kit/app_button.dart';
import 'package:flutter/material.dart';
import 'package:chicken_hatchery/src/feature/rituals/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MonitoringScreen extends StatelessWidget {
  const MonitoringScreen({super.key});
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
              // "AppBar" с AppButton
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ],
              ),
              // Тело с ListView.separated, обёрнутое в AppButton
              Expanded(
                child: ListView.separated(
                  itemCount: state
                      .user.eggBatches.length, // Количество элементов (пример)
                  itemBuilder: (context, index) {
                    final batch = state.user.eggBatches[index];
                    return AppButton(
                      text: 'Элемент $index',
                      onPressed: () {
                        // Обработка нажатия
                      },
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
