// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class IncubationStatistics {
  /// Общее количество яиц, поставленных на инкубацию
  int totalEggsPlaced;

  /// Количество яиц, которые успешно вылупились
  int eggsHatched;

  /// Количество яиц, которые ещё находятся в процессе инкубации
  int eggsIncubating;

  IncubationStatistics({
    required this.totalEggsPlaced,
    required this.eggsHatched,
    required this.eggsIncubating,
  });

  /// Вычисляемое свойство: количество яиц, для которых инкубация завершена
  int get eggsRemaining => totalEggsPlaced - eggsHatched;

  /// Вычисляемое свойство: процент вылупившихся яиц
  double get hatchingRate =>
      totalEggsPlaced > 0 ? (eggsHatched / totalEggsPlaced) * 100 : 0.0;

  @override
  String toString() => 'IncubationStatistics(totalEggsPlaced: $totalEggsPlaced, eggsHatched: $eggsHatched, eggsIncubating: $eggsIncubating)';

  IncubationStatistics copyWith({
    int? totalEggsPlaced,
    int? eggsHatched,
    int? eggsIncubating,
  }) {
    return IncubationStatistics(
      totalEggsPlaced: totalEggsPlaced ?? this.totalEggsPlaced,
      eggsHatched: eggsHatched ?? this.eggsHatched,
      eggsIncubating: eggsIncubating ?? this.eggsIncubating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalEggsPlaced': totalEggsPlaced,
      'eggsHatched': eggsHatched,
      'eggsIncubating': eggsIncubating,
    };
  }

  factory IncubationStatistics.fromMap(Map<String, dynamic> map) {
    return IncubationStatistics(
      totalEggsPlaced: map['totalEggsPlaced'] as int,
      eggsHatched: map['eggsHatched'] as int,
      eggsIncubating: map['eggsIncubating'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory IncubationStatistics.fromJson(String source) => IncubationStatistics.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant IncubationStatistics other) {
    if (identical(this, other)) return true;
  
    return 
      other.totalEggsPlaced == totalEggsPlaced &&
      other.eggsHatched == eggsHatched &&
      other.eggsIncubating == eggsIncubating;
  }

  @override
  int get hashCode => totalEggsPlaced.hashCode ^ eggsHatched.hashCode ^ eggsIncubating.hashCode;
}
