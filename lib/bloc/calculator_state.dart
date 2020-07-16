part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorState extends Equatable {}

class CalculatorInitial extends CalculatorState {
  final String initValue = '0';

  @override
  List<Object> get props => [this.initValue];
}

class CalculatorAddInputState extends CalculatorState {
  final String input;

  CalculatorAddInputState({@required this.input});

  @override
  List<Object> get props => [this.input];
}

class CalculatorEvaluateState extends CalculatorState {
  final String output;

  CalculatorEvaluateState({@required this.output});

  @override
  List<Object> get props => [this.output];
}


class CalculatorDeleteState extends CalculatorState {
  final String input;

  CalculatorDeleteState({@required this.input});

  @override
  List<Object> get props => [this.input];
}