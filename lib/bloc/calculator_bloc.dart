import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:meta/meta.dart';

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
    } else if (event is CalculatorClearButtonLongPressed) {
      yield* _mapButtonDeleteLongPressedEventToState(event);
    } else if (event is CalculatorSolveButtonPressed) {
      yield* _mapButtonSolveEventToState(event);
    }
  }

  Stream<CalculatorState> _mapButtonSolveEventToState(
      CalculatorSolveButtonPressed event) async* {
    String expressionStr = buffer.toString();
    String output;
    Expression expression;
    try {
      expression = Parser().parse(expressionStr);
      buffer.clear();
      buffer.write(expression.evaluate(EvaluationType.REAL, ContextModel()));
      output = buffer.toString();
      yield CalculatorEvaluateState(output: output);
    } on StateError catch(e){
      yield CalculatorEvaluateState(output: e.message);
    } on ArgumentError catch(e){
      yield CalculatorEvaluateState(output: e.message);
    }
  }

  Stream<CalculatorState> _mapButtonPressedEventToState(
      CalculatorButtonPressed event) async* {
    buffer.write(event.buttonText);
    yield CalculatorAddInputState(input: buffer.toString());
  }

  Stream<CalculatorState> _mapButtonDeletePressedEventToState(
      CalculatorClearButtonPressed event) async* {
    if (buffer.length > 0) {
      String strInput = buffer.toString();
      buffer.clear();
      buffer.write(strInput.substring(0, strInput.length - 1));
      yield CalculatorDeleteState(output: buffer.toString());
    }
  }

  Stream<CalculatorState> _mapButtonDeleteLongPressedEventToState(
      CalculatorClearButtonLongPressed event) async* {
    buffer.clear();
    yield CalculatorClearState(output: '0');
  }
}
