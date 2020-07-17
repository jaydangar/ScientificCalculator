part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent extends Equatable {}

class CalculatorButtonPressed extends CalculatorEvent {
  final String buttonText;

  CalculatorButtonPressed({@required this.buttonText});

  @override
  List<Object> get props => [this.buttonText];
}

class CalculatorClearButtonPressed extends CalculatorEvent {
  @override
  List<Object> get props => [];
}

class CalculatorClearButtonLongPressed extends CalculatorEvent {
  @override
  List<Object> get props => [];
}

class CalculatorSolveButtonPressed extends CalculatorEvent {
  @override
  List<Object> get props => [];
}
