import 'package:flutter/material.dart';

class OutputDisplay extends StatelessWidget {
  const OutputDisplay({
    Key key,
    @required this.data,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromHeight(MediaQuery.of(context).size.height * 0.25),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(
          data,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
