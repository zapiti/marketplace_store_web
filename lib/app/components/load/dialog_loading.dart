import 'package:flutter_modular/flutter_modular.dart';
import '../../app_store.dart';

showLoading(bool) {
  final _appBloc = Modular.get<AppStore>();
  if (bool == false) {
    Future.delayed(Duration(seconds: 0), () {
      _appBloc.loadElement.sink.add(bool);
    });
  } else {
    _appBloc.loadElement.sink.add(bool);
    Future.delayed(Duration(seconds: 15), () {
      _appBloc.loadElement.sink.add(false);
    });
  }
}
