import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/features/familias/presentation/storestates/step_familia_error_state.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'step_familia_store.g.dart';

class StepFamiliaStore = _StepFamiliaStore with _$StepFamiliaStore;

abstract class _StepFamiliaStore with Store {
  final StepFamiliaErrorState error = StepFamiliaErrorState();

  @observable
  bool isEdit = true;

  @observable
  bool isAdmin = false;

  @observable
  FamiliaEntity? familia;

  @observable
  TextEditingController controllerRenda = TextEditingController();

  @observable
  XFile? comprovante;

  @action
  setFamilia(FamiliaEntity? familiaEntity) {
    familia = familiaEntity;
    if (familiaEntity != null) {
      MagicMask mask = MagicMask.buildMask('R!\$! 9+.999,99');
      double renda = familia?.renda != null ? familia!.renda : 0.0;

      controllerRenda.text = mask.getMaskedString(renda.toString());
    }
  }

  @action
  void validateTodos() {
    validateRenda();
  }

  @action
  void validateRenda() {
    if (controllerRenda.text.isEmpty) {
      error.renda = 'Por favor, informe a renda da família';
      return;
    }
    try {
      double.tryParse(controllerRenda.text);
    } catch (e) {
      error.renda = 'Por favor, informe a renda com o formato correto';
      return;
    }
    error.renda = null;
  }
}
