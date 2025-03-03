// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chicken_hatchery/src/feature/rituals/model/incubation_statistics.dart';

class EggBatch {
  final String name;
  final int dayLaying;
  final int eggCount;
  final double currentTemperature;
  final double currentHumidity;

  // Рекомендуемые параметры инкубации (можно адаптировать под конкретный вид яиц)
  static const double recommendedTemperature = 37.8;
  static const double temperatureTolerance = 0.5;
  static const double recommendedHumidity = 55.0;
  static const double humidityTolerance = 5.0;
  static const int incubationPeriod = 21; // например, 21 день для куриных яиц

  EggBatch({
    required this.name,
    required this.dayLaying,
    required this.eggCount,
    required this.currentTemperature,
    required this.currentHumidity,
  });

  /// Проверяет, соответствуют ли текущие температура и влажность рекомендуемым параметрам
  bool conditionsGood() {
    bool temperatureOk = currentTemperature >=
            (recommendedTemperature - temperatureTolerance) &&
        currentTemperature <= (recommendedTemperature + temperatureTolerance);
    bool humidityOk =
        currentHumidity >= (recommendedHumidity - humidityTolerance) &&
            currentHumidity <= (recommendedHumidity + humidityTolerance);
    return temperatureOk && humidityOk;
  }

  /// Вычисляет, сколько дней осталось до вылупления яиц
  /// currentDay – текущий день инкубации (например, если яйца заложены в день 5, а incubationPeriod = 21, то дней осталось 21 - (currentDay - 5))
  int daysToHatch(int currentDay) {
    int elapsedDays = currentDay - dayLaying;
    return incubationPeriod - elapsedDays;
  }

  /// Определяет, когда стоит в следующий раз проверить температуру и влажность.
  /// Если до вылупления больше 7 дней – проверка через 3 дня, иначе – ежедневно.
  int nextCheckDay(int currentDay) {
    int daysRemaining = daysToHatch(currentDay);
    if (daysRemaining > 7) {
      return currentDay + 3;
    } else {
      return currentDay + 1;
    }
  }

  EggBatch copyWith({
    String? name,
    int? dayLaying,
    int? eggCount,
    double? currentTemperature,
    double? currentHumidity,
  }) {
    return EggBatch(
      name: name ?? this.name,
      dayLaying: dayLaying ?? this.dayLaying,
      eggCount: eggCount ?? this.eggCount,
      currentTemperature: currentTemperature ?? this.currentTemperature,
      currentHumidity: currentHumidity ?? this.currentHumidity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'dayLaying': dayLaying,
      'eggCount': eggCount,
      'currentTemperature': currentTemperature,
      'currentHumidity': currentHumidity,
    };
  }

  factory EggBatch.fromMap(Map<String, dynamic> map) {
    return EggBatch(
      name: map['name'] as String,
      dayLaying: map['dayLaying'] as int,
      eggCount: map['eggCount'] as int,
      currentTemperature: map['currentTemperature'] as double,
      currentHumidity: map['currentHumidity'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory EggBatch.fromJson(String source) =>
      EggBatch.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EggBatch(name: $name, dayLaying: $dayLaying, eggCount: $eggCount, currentTemperature: $currentTemperature, currentHumidity: $currentHumidity)';
  }

  @override
  bool operator ==(covariant EggBatch other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.dayLaying == dayLaying &&
        other.eggCount == eggCount &&
        other.currentTemperature == currentTemperature &&
        other.currentHumidity == currentHumidity;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        dayLaying.hashCode ^
        eggCount.hashCode ^
        currentTemperature.hashCode ^
        currentHumidity.hashCode;
  }
}
