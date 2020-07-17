import 'package:calculator/bloc/calculator_bloc.dart';
import 'package:calculator/utils/actions.dart';
import 'package:calculator/widgets/button_widget.dart';
import 'package:calculator/utils/calculator_icons.dart';
import 'package:calculator/widgets/icon_button_widget.dart';
import 'package:calculator/widgets/materialbuttonwidget.dart';
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
      body: Column(
        children: <Widget>[
          BlocBuilder(
            bloc: BlocProvider.of<CalculatorBloc>(context),
            builder: (context, state) {
              if (state is CalculatorInitial) {
                return OutputDisplay(
                  data: state.initValue,
                );
              } else if (state is CalculatorAddInputState) {
                return OutputDisplay(data: state.input);
              } else if (state is CalculatorEvaluateState) {
                return OutputDisplay(data: state.output);
              } else if (state is CalculatorDeleteState) {
                return OutputDisplay(data: state.output);
              } else if (state is CalculatorClearState) {
                return OutputDisplay(data: state.output);
              }
              return OutputDisplay(
                data: '0',
              );
            },
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(4),
            alignment: Alignment.center,
            child: SizedBox(
              child: Table(
                children: [
                  TableRow(
                    children: [
                      MaterialButtonWidget(
                        buttoncolor: Colors.orange,
                        data: '√',
                      ),
                      MaterialButtonWidget(
                        buttoncolor: Colors.orange,
                        data: 'π',
                      ),
                      MaterialButtonWidget(
                        buttoncolor: Colors.orange,
                        data: 'tan',
                      ),
                      MaterialButtonWidget(
                        buttoncolor: Colors.orange,
                        data: 'log',
                      ),
                      MaterialButtonWidget(
                        buttoncolor: Colors.orange,
                        data: 'ln',
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      MaterialButtonWidget(
                        buttoncolor: Colors.orange,
                        data: '^',
                      ),
                      MaterialButtonWidget(
                        buttoncolor: Colors.orange,
                        data: 'e',
                      ),
                      MaterialButtonWidget(
                        buttoncolor: Colors.orange,
                        data: '%',
                      ),
                      MaterialButtonWidget(
                        buttoncolor: Colors.orange,
                        data: '(',
                      ),
                      MaterialButtonWidget(
                        buttoncolor: Colors.orange,
                        data: ')',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Expanded(
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
                          onLongPressAction: CalculatorActions.solve,
                          onPressAction: CalculatorActions.solve,
                        ),
                      ),
                    ],
                  ),
                ),
                VerticalDivider(color: Colors.black26),
                Expanded(
                  child: BasicCalculatorOperationWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BasicCalculatorOperationWidget extends StatelessWidget {
  const BasicCalculatorOperationWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: RaisedIconButtonWidget(
              onLongPressAction: CalculatorActions.delete,
              icon: Icons.backspace,
              buttoncolor: Colors.red,
              onPressAction: CalculatorActions.delete,
            ),
          ),
          Expanded(
            child: RaisedIconButtonWidget(
              icon: Calculator.divide,
              buttoncolor: Colors.green,
              onLongPressAction: CalculatorActions.divide,
              onPressAction: CalculatorActions.divide,
            ),
          ),
          Expanded(
            child: RaisedIconButtonWidget(
              icon: Calculator.cancel,
              buttoncolor: Colors.green,
              onLongPressAction: CalculatorActions.multiply,
              onPressAction: CalculatorActions.multiply,
            ),
          ),
          Expanded(
            child: RaisedIconButtonWidget(
              icon: Calculator.minus,
              buttoncolor: Colors.green,
              onLongPressAction: CalculatorActions.substract,
              onPressAction: CalculatorActions.substract,
            ),
          ),
          Expanded(
            child: RaisedIconButtonWidget(
              icon: Calculator.plus_1,
              buttoncolor: Colors.green,
              onLongPressAction: CalculatorActions.add,
              onPressAction: CalculatorActions.add,
            ),
          ),
        ],
      ),
    );
  }
}
