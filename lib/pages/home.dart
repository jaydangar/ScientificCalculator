import 'package:calculator/bloc/calculator_bloc.dart';
import 'package:calculator/utils/actions.dart';
import 'package:calculator/widgets/button_widget.dart';
import 'package:calculator/utils/calculator_icons.dart';
import 'package:calculator/widgets/icon_button_widget.dart';
import 'package:calculator/widgets/outputdisplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculatorBloc>(
        create: (context) => CalculatorBloc(), child: CalculatorUI());
  }
}

class CalculatorUI extends StatelessWidget {
  const CalculatorUI({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).buttonColor,
      body: Column(
        children: <Widget>[
          BlocBuilder(
            bloc: BlocProvider.of<CalculatorBloc>(context),
            builder: (context, state) {
              if (state is CalculatorInitial) {
              } else if (state is CalculatorAddInputState) {
                return OutputDisplay(data: state.input);
              } else if (state is CalculatorDeleteState) {
                return OutputDisplay(data: state.input);
              } else if (state is CalculatorEvaluateState) {
                return OutputDisplay(data: state.output);
              }
              return OutputDisplay(
                data: '0',
              );
            },
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(child: RaisedButtonWidget(data: '7')),
                      Expanded(child: RaisedButtonWidget(data: '4')),
                      Expanded(child: RaisedButtonWidget(data: '1')),
                      Expanded(child: RaisedButtonWidget(data: '0')),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(child: RaisedButtonWidget(data: '8')),
                      Expanded(child: RaisedButtonWidget(data: '5')),
                      Expanded(child: RaisedButtonWidget(data: '2')),
                      Expanded(child: RaisedButtonWidget(data: '.')),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(child: RaisedButtonWidget(data: '9')),
                      Expanded(child: RaisedButtonWidget(data: '6')),
                      Expanded(child: RaisedButtonWidget(data: '3')),
                      Expanded(
                        child: RaisedIconButtonWidget(
                          icon: Calculator.eq,
                          buttoncolor: Colors.blue,
                          action: CalculatorActions.solve,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: RaisedIconButtonWidget(
                          icon: Icons.backspace,
                          buttoncolor: Colors.red,
                          action: CalculatorActions.delete,
                        ),
                      ),
                      Expanded(
                        child: RaisedIconButtonWidget(
                          icon: Calculator.divide,
                          buttoncolor: Colors.green,
                          action: CalculatorActions.divide,
                        ),
                      ),
                      Expanded(
                        child: RaisedIconButtonWidget(
                          icon: Calculator.cancel,
                          buttoncolor: Colors.green,
                          action: CalculatorActions.multiply,
                        ),
                      ),
                      Expanded(
                        child: RaisedIconButtonWidget(
                          icon: Calculator.minus,
                          buttoncolor: Colors.green,
                          action: CalculatorActions.substract,
                        ),
                      ),
                      Expanded(
                        child: RaisedIconButtonWidget(
                          icon: Calculator.plus_1,
                          buttoncolor: Colors.green,
                          action: CalculatorActions.add,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
