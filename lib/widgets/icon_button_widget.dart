import 'package:calculator/bloc/calculator_bloc.dart';
import 'package:calculator/utils/actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RaisedIconButtonWidget extends StatefulWidget {
  final double padding;
  final MaterialColor buttoncolor;
  final Color textcolor;
  final double margin;
  final IconData icon;
  final CalculatorActions onLongPressAction;
  final CalculatorActions onPressAction;

  RaisedIconButtonWidget(
      {this.padding,
      this.buttoncolor,
      this.textcolor,
      this.margin,
      @required this.onLongPressAction,
      @required this.onPressAction,
      @required this.icon});

  @override
  _RaisedIconButtonWidgetState createState() => _RaisedIconButtonWidgetState();
}

class _RaisedIconButtonWidgetState extends State<RaisedIconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(widget?.margin ?? 4),
      child: RawMaterialButton(
        
        onPressed: () => onPressAction(
          context,
          widget.onPressAction,
          BlocProvider.of<CalculatorBloc>(context),
        ),
        onLongPress: () => onLongPressAction(
          context,
          widget.onLongPressAction,
          BlocProvider.of<CalculatorBloc>(context),
        ),
        child: Icon(widget.icon),
      ),
    );
  }

  void onPressAction(
      BuildContext context, CalculatorActions action, CalculatorBloc bloc) {
    switch (action) {
      case CalculatorActions.add:
        bloc.add(CalculatorButtonPressed(buttonText: '+'));
        break;
      case CalculatorActions.substract:
        bloc.add(CalculatorButtonPressed(buttonText: '-'));
        break;
      case CalculatorActions.delete:
        bloc.add(CalculatorClearButtonPressed());
        break;
      case CalculatorActions.divide:
        bloc.add(CalculatorButtonPressed(buttonText: '/'));
        break;
      case CalculatorActions.multiply:
        bloc.add(CalculatorButtonPressed(buttonText: '*'));
        break;
      case CalculatorActions.solve:
        bloc.add(CalculatorSolveButtonPressed());
        break;
    }
  }

  void onLongPressAction(
      BuildContext context, CalculatorActions action, CalculatorBloc bloc) {
    switch (action) {
      case CalculatorActions.delete:
        bloc.add(CalculatorClearButtonLongPressed());
        break;
      case CalculatorActions.add:
        break;
      case CalculatorActions.substract:
        break;
      case CalculatorActions.divide:
        break;
      case CalculatorActions.multiply:
        break;
      case CalculatorActions.solve:
        break;
    }
  }
}
