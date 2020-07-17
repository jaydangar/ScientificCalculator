import 'package:flutter/material.dart';

class OutputDisplay extends StatelessWidget {
  const OutputDisplay({
    Key key,
    @required this.data,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Card(
        child: Container(
          margin: EdgeInsets.all(8),
          alignment: Alignment.bottomRight,
          child: Text(
            data,
            style: Theme.of(context).textTheme.headline4,
            maxLines: 3,
            textAlign: TextAlign.end,
          ),
        ),
      ),
    );
  }
}
