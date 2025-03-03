import 'package:chicken_hatchery/routes/route_value.dart';
import 'package:chicken_hatchery/ui_kit/app_button.dart';
import 'package:flutter/material.dart';
import 'package:chicken_hatchery/src/feature/rituals/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});
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
                  const Expanded(child: Text('Articles')),
                ],
              ),
              // Тело с ListView.separated, обёрнутое в AppButton
              Expanded(
                child: ListView.separated(
                  itemCount: 5, // Количество статей (пример)
                  itemBuilder: (context, index) {
                    final article = state.articles[index];
                    return AppButton(
                      text:'Статья №$index',
                      onPressed: () {
                        context.push(
                          "${RouteValue.home.path}/${RouteValue.articles.path}/${RouteValue.article.path}",
                          extra: article,
                        );
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
