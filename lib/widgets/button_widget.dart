import 'package:calculator/bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RaisedButtonWidget extends StatefulWidget {
  final String data;
  final double padding;
  final Color buttoncolor;
  final Color textcolor;
  final double margin;

  RaisedButtonWidget(
      {this.padding,
      this.buttoncolor,
      this.textcolor,
      this.margin,
      @required this.data});

  @override
  _RaisedButtonWidgetState createState() => _RaisedButtonWidgetState();
}

class _RaisedButtonWidgetState extends State<RaisedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(widget?.margin ?? 4),
      child: RawMaterialButton(
        shape: CircleBorder(),
        onPressed: () => BlocProvider.of<CalculatorBloc>(context)
            .add(CalculatorButtonPressed(buttonText: widget.data)),
        child: Text(
          widget.data,
          style: TextStyle(color: widget?.textcolor ?? Colors.white),
        ),
        fillColor: widget?.buttoncolor ?? Colors.black,
      ),
    );
  }
}
