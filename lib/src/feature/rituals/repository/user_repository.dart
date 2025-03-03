import 'package:chicken_hatchery/src/feature/rituals/model/articles.dart';

import 'package:chicken_hatchery/src/feature/rituals/model/user.dart';

import '../../../core/utils/json_loader.dart';

class Repository {
  final String articles = 'articles';
  final String user = 'user';

  Future<List<User>> load() {
    return JsonLoader.loadData<User>(
      user,
      'assets/json/$user.json',
      (json) => User.fromMap(json),
    );
  }

  Future<List<Articles>> loadArticles() {
    return JsonLoader.loadData<Articles>(
      articles,
      'assets/json/$articles.json',
      (json) => Articles.fromMap(json),
    );
  }

  Future<void> save(User item) {
    return JsonLoader.saveData<User>(
      user,
      item,
      () async => await load(),
      (item) => item.toMap(),
    );
  }

  Future<void> update(User updated) async {
    return JsonLoader.modifyDataList<User>(
      user,
      updated,
      () async => await load(),
      (item) => item.toMap(),
      (itemList) async {
        final index = 0;
        if (index != -1) {
          itemList[index] = updated;
        }
      },
    );
  }
}
