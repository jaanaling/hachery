// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:chicken_hatchery/src/feature/rituals/model/articles.dart';
import 'package:chicken_hatchery/src/feature/rituals/model/egg_batch.dart';
import 'package:chicken_hatchery/src/feature/rituals/model/incubation_statistics.dart';

class User {
  final List<EggBatch> eggBatches;
  final IncubationStatistics statistics;

  User({
    required this.eggBatches,
    required this.statistics,
  });

  static User get init => User(
        eggBatches: [],
        statistics: IncubationStatistics(
          totalEggsPlaced: 0,
          eggsHatched: 0,
          eggsIncubating: 0,
        ),
      );

  /// Обновляет статистику инкубации на основе всех партий яиц.
  /// currentDay – текущий день инкубации (например, количество дней с начала закладки).
  void updateStatistics(int currentDay) {
    int totalEggs = 0;
    int hatchedEggs = 0;
    int incubatingEggs = 0;

    for (var batch in eggBatches) {
      totalEggs += batch.eggCount;
      // Если дни до вылупления <= 0, считаем, что партия завершила инкубацию (яйца вылупились)
      if (batch.daysToHatch(currentDay) <= 0) {
        hatchedEggs += batch.eggCount;
      } else {
        incubatingEggs += batch.eggCount;
      }
    }

    statistics.totalEggsPlaced = totalEggs;
    statistics.eggsHatched = hatchedEggs;
    statistics.eggsIncubating = incubatingEggs;
  }

  User copyWith({
    List<EggBatch>? eggBatches,
    IncubationStatistics? statistics,
  }) {
    return User(
      eggBatches: eggBatches ?? this.eggBatches,
      statistics: statistics ?? this.statistics,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'eggBatches': eggBatches.map((x) => x.toMap()).toList(),
      'statistics': statistics.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      eggBatches: List<EggBatch>.from(
        (map['eggBatches'] as List<dynamic>).map<EggBatch>(
          (x) => EggBatch.fromMap(x as Map<String, dynamic>),
        ),
      ),
      statistics: IncubationStatistics.fromMap(
          map['statistics'] as Map<String, dynamic>,),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(eggBatches: $eggBatches, statistics: $statistics)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return listEquals(other.eggBatches, eggBatches) &&
        other.statistics == statistics;
  }

  @override
  int get hashCode => eggBatches.hashCode ^ statistics.hashCode;
}
