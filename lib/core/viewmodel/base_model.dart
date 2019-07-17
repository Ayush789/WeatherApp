import '../../core/enums/viewstates.dart';
import 'package:flutter/foundation.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState newstate) {
    _state = newstate;
    notifyListeners();
  }
}
