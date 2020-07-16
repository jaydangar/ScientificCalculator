import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:function_tree/function_tree.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final buffer = StringBuffer('0');

  CalculatorBloc() : super(CalculatorInitial());

  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {
    if (event is CalculatorButtonPressed) {
      yield* _mapButtonPressedEventToState(event);
    } else if (event is CalculatorClearButtonPressed) {
      yield* _mapButtonDeletePressedEventToState(event);
    } else if (event is CalculatorSolveButtonPressed) {
      yield* _mapButtonSolveEventToState(event);
    }
  }

  Stream<CalculatorState> _mapButtonSolveEventToState(
      CalculatorSolveButtonPressed event) async* {
    String expressionStr = buffer.toString();
    String output = 'Invalid Expression';
    try {
      output = expressionStr.interpret().toString();
      buffer.clear();
      buffer.write(output);
    } catch (e) {}

    yield CalculatorEvaluateState(output: output);
  }

  Stream<CalculatorState> _mapButtonPressedEventToState(
      CalculatorButtonPressed event) async* {
    buffer.write(event.buttonText);
    yield CalculatorAddInputState(input: buffer.toString());
  }

  Stream<CalculatorState> _mapButtonDeletePressedEventToState(
      CalculatorClearButtonPressed event) async* {
    String strInput = buffer.toString();
    if (strInput.length > 1) {
      buffer.clear();
      buffer.write(strInput.substring(0, strInput.length - 1));
    } else {
      strInput = '0';
    }
    yield CalculatorDeleteState(input: strInput);
  }
}
