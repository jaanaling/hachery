import 'package:chicken_hatchery/src/feature/rituals/model/articles.dart';
import 'package:flutter/material.dart';
import 'package:chicken_hatchery/src/feature/rituals/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleScreen extends StatelessWidget {
  final Articles articles;
  const ArticleScreen({super.key, required this.articles});

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
              // "AppBar" без AppButton
              Container(
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(child: Text(articles.title)),
                  ],
                ),
              ),
              // Тело экрана
              Expanded(
                child: const Center(
                  child: Text('Содержимое отдельной статьи'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
