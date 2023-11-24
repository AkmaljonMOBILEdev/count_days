part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final String firstDate;
  final String secondDate;
  final String result;

  const CounterState({
    required this.firstDate,
    required this.secondDate,
    required this.result,
  });

  CounterState copyWith({
    String? first,
    String? second,
    String? result,
  }) {
    return CounterState(
      firstDate: first ?? firstDate,
      secondDate: second ?? secondDate,
      result: result ?? this.result,
    );
  }

  @override
  List<Object?> get props => [
        firstDate,
        secondDate,
        result,
      ];
}
