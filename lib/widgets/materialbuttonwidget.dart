import 'package:calculator/bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialButtonWidget extends StatefulWidget {
  final String data;
  final double padding;
  final Color buttoncolor;
  final Color textcolor;
  final double margin;

  MaterialButtonWidget(
      {this.padding,
      this.buttoncolor,
      this.textcolor,
      this.margin,
      @required this.data});

  @override
  State<StatefulWidget> createState() => _MaterialButtonWidgetState();
}

class _MaterialButtonWidgetState extends State<MaterialButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(widget?.margin ?? 4),
      child: MaterialButton(
        onPressed: () => BlocProvider.of<CalculatorBloc>(context)
            .add(CalculatorButtonPressed(buttonText: widget.data)),
        child: Text(
          widget.data,
          textAlign: TextAlign.center,
          style: TextStyle(color: widget?.textcolor ?? Colors.white),
        ),
        color: widget?.buttoncolor ?? Colors.black,
      ),
    );
  }
}
