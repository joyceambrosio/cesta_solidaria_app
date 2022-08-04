import 'package:cartallum_app/src/core/shared/formatter_app.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/features/familias/presentation/storestates/step_pessoas_error_state.dart';
import 'package:cartallum_app/src/features/pessoas/domain/entities/pessoa_entity.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'step_pessoas_store.g.dart';

class StepPessoasStore = _StepPessoasStore with _$StepPessoasStore;

abstract class _StepPessoasStore with Store {
  final StepPessoasErrorState error = StepPessoasErrorState();

  @observable
  bool isEdit = true;

  @observable
  bool isAdmin = false;

  @observable
  bool isLoadingAddPessoa = false;

  @observable
  FamiliaEntity? familia;

  @observable
  List<PessoaEntity> pessoas = [];

  @observable
  PessoaEntity? pessoa;

  @action
  cleanForm() {
    responsavel = false;
    controllerNome.text = '';
    controllerCpf.text = '';
    controllerDataNascimento.text = '';
    controllerTelefone.text = '';
    sexo = 'f';
    comprovante = null;
  }

  @action
  setPessoa(PessoaEntity? pessoa) {
    pessoa = pessoa;
    responsavel = pessoa == null ? false : true;
    controllerNome.text = pessoa == null ? '' : pessoa.nome;
    controllerCpf.text = pessoa == null ? '' : pessoa.cpf ?? '';
    controllerDataNascimento.text = pessoa == null
        ? ''
        : FormatterApp.fromatDate(pessoa.dataNascimento) ?? '';
    controllerTelefone.text = pessoa == null
        ? ''
        : FormatterApp.fromatTelefone(pessoa.telefone ?? '');
    sexo = pessoa == null ? '' : pessoa.sexo;
    comprovante = null;
  }

  @observable
  int pessoasLength = 0;

  @observable
  XFile? comprovante;

  @action
  removePessoasAt(int index) {
    pessoas.removeAt(index);
    pessoasLength = pessoas.length;
  }

  @action
  addPessoas(PessoaEntity pessoaEntity) {
    pessoas.add(pessoaEntity);
    pessoasLength = pessoas.length;
  }

  @action
  removePessoas(PessoaEntity pessoaEntity) {
    pessoas.remove(pessoaEntity);
    pessoasLength = pessoas.length;
  }

  @observable
  TextEditingController controllerNome = TextEditingController();

  @observable
  TextEditingController controllerCpf = TextEditingController();

  @observable
  TextEditingController controllerDataNascimento = TextEditingController();

  @observable
  TextEditingController controllerTelefone = TextEditingController();

  @observable
  String sexo = 'f';

  @observable
  bool responsavel = true;

  @action
  check() {
    responsavel = !responsavel;
  }

  @action
  setFamilia(FamiliaEntity? familiaEntity) {
    familia = familiaEntity;
    if (familiaEntity != null) {
      if (familiaEntity.integrantes != null) {
        if (familiaEntity.integrantes!.isNotEmpty) {
          pessoas = familiaEntity.integrantes!;
          pessoasLength = pessoas.length;
        }
      }
    }
  }

  @action
  void validateAll() {
    validateNome();
    validateCpf();
    validateDataNascimento();
    validateSexo();
    validateTelefone();
  }

  @action
  void validateCpf() {
    if (controllerCpf.text.isEmpty && responsavel) {
      error.cpf = 'Por favor, informe o cpf';
      return;
    }
    if (!responsavel) {
      if (pessoas.isEmpty) {
        error.cpf = 'Por favor, faça o cadastro de um responsável';
        return;
      } else {
        final numResponsaveis =
            pessoas.where((element) => element.responsavel = true).length;

        if (numResponsaveis == 0) {
          error.cpf = 'Por favor, faça o cadastro de um responsável';
          return;
        }
      }
    }
    if (!CPFValidator.isValid(controllerCpf.text)) {
      error.cpf = 'Por favor, insira um CPF válido';
      return;
    }

    error.cpf = null;
  }

  @action
  void validateNome() {
    if (controllerNome.text.isEmpty) {
      error.nome = 'Por favor, informe o nome completo';
      return;
    }
    error.nome = null;
  }

  @action
  void validateDataNascimento() {
    if (controllerDataNascimento.text.isEmpty) {
      error.dataNascimento = 'Por favor, informe a data de nascimento';
      return;
    }
    error.dataNascimento = null;
  }

  @action
  void validateSexo() {
    if (sexo.isEmpty) {
      error.sexo = 'Por favor, informe o sexo';
      return;
    }
    error.sexo = null;
  }

  @action
  void validateTelefone() {
    if (controllerTelefone.text.isEmpty && responsavel) {
      error.telefone = 'Por favor, informe um telefone';
      return;
    }
    error.telefone = null;
  }
}
