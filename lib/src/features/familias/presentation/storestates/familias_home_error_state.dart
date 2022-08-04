import 'package:mobx/mobx.dart';

part 'familias_home_error_state.g.dart';

class FamiliasHomeErrorState = _FamiliasHomeErrorState
    with _$FamiliasHomeErrorState;

abstract class _FamiliasHomeErrorState with Store {
  @observable
  String? busca;

  @computed
  bool get hasErrors => busca != null;
}
