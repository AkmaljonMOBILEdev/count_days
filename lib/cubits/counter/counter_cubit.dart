import 'package:count_days/utils/extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit()
      : super(const CounterState(
          firstDate: '',
          secondDate: '',
          result: '',
        ));

  void getFirstDate(String date){
    emit(state.copyWith(first: date));
  }
  void getSecondDate(String date){
    emit(state.copyWith(second: date));
  }

  void count(){
    int resultOfDays = 0;
    bool isKabisa(int year){
      return (year % 4 == 0 && year %100!=0) || year % 400 == 0;
    }

    List<int> daysOfMonths(int year){
      return [31, isKabisa(year) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    }

    var startingDate = dateConverter(state.firstDate);
    var endingDate = dateConverter(state.secondDate);

    debugPrint("FIRST: $startingDate");
    debugPrint("Second: $endingDate");

    if (startingDate[2] > endingDate[2] ||
        (startingDate[2] == endingDate[2] && startingDate[1] > endingDate[1]) ||
        (startingDate[2] == endingDate[2] && startingDate[1] == endingDate[1] && startingDate[0] > endingDate[0])) {
      return;
    }

    if(startingDate[2]>9999 || endingDate[2]>9999 || startingDate[2]<999 || endingDate[2]<999){
      return;
    }

    for (int year = startingDate[2]; year < endingDate[2]; year++) {
      debugPrint("yil: $resultOfDays");
      resultOfDays += isKabisa(year) ? 366 : 365;
    }

    for (int month = 1; month < startingDate[1]; month++) {
      resultOfDays -= daysOfMonths(startingDate[2])[month - 1];
      debugPrint("start input: $resultOfDays");

    }
    resultOfDays -= startingDate[0];

    for (int month = 1; month < endingDate[1]; month++) {
      debugPrint("end input: $resultOfDays");
      resultOfDays += daysOfMonths(endingDate[2])[month - 1];
    }
    resultOfDays += endingDate[0];
    debugPrint("RESULT: $resultOfDays");
    emit(state.copyWith(result: resultOfDays.toString()));
  }

}
