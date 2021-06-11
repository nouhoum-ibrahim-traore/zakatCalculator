import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CalculProvider with ChangeNotifier, DiagnosticableTreeMixin {
  double _result = 0;
  String _operation = "";

  double get result => _result;
  String get operation => _operation;

  void setOperation(String nothing) {
    _operation = nothing;
    print(_operation);
  }

  void updateResult(double ourResult) {
    _result = ourResult;
    notifyListeners();
    print("Result: " + _result.toString());
  }

  void updateOperation(String ourOperation) {
    _operation = _operation + ourOperation;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('result', result));
    properties.add(StringProperty('operation', operation));
  }
}
