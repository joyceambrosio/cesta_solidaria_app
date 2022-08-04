import 'package:flutter/material.dart';

class Utils {
  static const double valMargimPadrao = 10;
  static const double valPaddingPadrao = 10;
  static const marginPadrao = EdgeInsets.all(valMargimPadrao);
  static const paddingPadrao = EdgeInsets.all(valPaddingPadrao);

  static BorderRadius arredondamentoPadrao = BorderRadius.circular(8);

  static List<DropdownMenuItem<String>> listaTipo = const [
    DropdownMenuItem(value: 'matriz', child: Text('Matriz')),
    DropdownMenuItem(value: 'filial', child: Text('Filial')),
  ];

  static List<DropdownMenuItem<String>> listaPaises = const [
    DropdownMenuItem(value: 'Brasil', child: Text('Brasil')),
  ];

  static List<DropdownMenuItem<String>> listaEstados = const [
    DropdownMenuItem(value: 'AC', child: Text('AC')),
    DropdownMenuItem(value: 'AL', child: Text('AL')),
    DropdownMenuItem(value: 'AP', child: Text('AP')),
    DropdownMenuItem(value: 'AM', child: Text('AM')),
    DropdownMenuItem(value: 'BA', child: Text('BA')),
    DropdownMenuItem(value: 'CE', child: Text('CE')),
    DropdownMenuItem(value: 'DF', child: Text('DF')),
    DropdownMenuItem(value: 'ES', child: Text('ES')),
    DropdownMenuItem(value: 'GO', child: Text('GO')),
    DropdownMenuItem(value: 'MA', child: Text('MA')),
    DropdownMenuItem(value: 'MT', child: Text('MT')),
    DropdownMenuItem(value: 'MS', child: Text('MS')),
    DropdownMenuItem(value: 'MG', child: Text('MG')),
    DropdownMenuItem(value: 'PA', child: Text('PA')),
    DropdownMenuItem(value: 'PB', child: Text('PB')),
    DropdownMenuItem(value: 'PR', child: Text('PR')),
    DropdownMenuItem(value: 'PE', child: Text('PE')),
    DropdownMenuItem(value: 'PI', child: Text('PI')),
    DropdownMenuItem(value: 'RJ', child: Text('RJ')),
    DropdownMenuItem(value: 'RN', child: Text('RN')),
    DropdownMenuItem(value: 'RS', child: Text('RS')),
    DropdownMenuItem(value: 'RO', child: Text('RO')),
    DropdownMenuItem(value: 'RR', child: Text('RR')),
    DropdownMenuItem(value: 'SC', child: Text('SC')),
    DropdownMenuItem(value: 'SP', child: Text('SP')),
    DropdownMenuItem(value: 'SE', child: Text('SE')),
    DropdownMenuItem(value: 'TO', child: Text('TO')),
  ];

  static List<DropdownMenuItem<String>> roleMembro = const [
    DropdownMenuItem(value: 'admin', child: Text('Administrador')),
    DropdownMenuItem(value: 'user', child: Text('Usuario')),
  ];

  static List<DropdownMenuItem<String>> sexo = const [
    DropdownMenuItem(value: 'f', child: Text('Feminino')),
    DropdownMenuItem(value: 'm', child: Text('Masculino')),
    DropdownMenuItem(value: 'o', child: Text('Outro')),
  ];
}
