import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:zakat_calculator_app/AppData/calculProvider.dart';
import 'package:zakat_calculator_app/model/calcul.dart';
import 'package:zakat_calculator_app/wigdet/buttonWidget.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CalculProvider(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    // TODO: implement createState
    return MyAppState();
    throw UnimplementedError();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    // TODO: implement createState
    return MyHomePageState();
    throw UnimplementedError();
  }
}

class MyHomePageState extends State<MyHomePage> {
  List<ButtonWidget> items = ButtonWidget.items;
  Calcul calcul = Calcul();

  static var textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String b;
    return Scaffold(
        appBar: AppBar(
          title: Text("ff"),
        ),
        body: ScopedModel<Calcul>(
          model: calcul,
          child: Stack(children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return items[index];
                },
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: Text(
                    "Zakat :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                      child: Text(
                          context.watch<CalculProvider>().result.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700))),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      child: TextFormField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                          hintText: "Entrez le montant",
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // String b = textEditingController.text;
                      b = Provider.of<CalculProvider>(context, listen: false)
                          .operation
                          .toString();
                      String newOperation = "";
                      for (int i = 0; i < b.length - 1; i++) {
                        newOperation = newOperation + b[i];
                      }
                      textEditingController.text = newOperation;
                      Provider.of<CalculProvider>(context, listen: false)
                          .setOperation(newOperation);
                      print(newOperation);
                    },
                    icon: Icon(Icons.backspace_rounded),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
