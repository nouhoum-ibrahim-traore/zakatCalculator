import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zakat_calculator_app/AppData/calculProvider.dart';
import 'package:zakat_calculator_app/main.dart';

class ButtonWidget extends StatelessWidget {
  final String number;
  static List<ButtonWidget> items = [
    ButtonWidget(number: "1"),
    ButtonWidget(number: "2"),
    ButtonWidget(number: "3"),
    ButtonWidget(number: "Calcul"),
    ButtonWidget(number: "4"),
    ButtonWidget(number: "5"),
    ButtonWidget(number: "6"),
    ButtonWidget(number: "."),
    ButtonWidget(number: "7"),
    ButtonWidget(number: "8"),
    ButtonWidget(number: "9"),
    ButtonWidget(number: "0"),
  ];

  ButtonWidget({Key key, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return Card(
      // ignore: deprecated_member_use
      color: Colors.blue,
      child: RaisedButton(
        onPressed: () {
          if ([".", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
              .contains(number)) {
            context.read<CalculProvider>().updateOperation(number);
            MyHomePageState.textEditingController.text =
                context.read<CalculProvider>().operation;
          } else if ("Calcul" == number) {
            double a =
                0.025 * double.parse(context.read<CalculProvider>().operation);
            Provider.of<CalculProvider>(context, listen: false).updateResult(a);
            // context.watch<CalculProvider>().updateResult(a); // this throw in error; above line is better Provider.of....
            Provider.of<CalculProvider>(context, listen: false)
                .setOperation("");
            MyHomePageState.textEditingController.clear();
          }
        },
        child: Text(this.number.toString()),
        highlightColor: Colors.blue, //Replace with actual colors
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
