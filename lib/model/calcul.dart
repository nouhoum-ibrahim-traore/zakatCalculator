import 'package:scoped_model/scoped_model.dart';

class Calcul extends Model {
  double amount = 0;
  double result;
  Calcul();
  updateAmount({double ourAmount}) {
    amount = ourAmount;
    notifyListeners();
    return amount;
  }

  updateResult(double _result) {
    result = _result;
    notifyListeners();
  }
}
