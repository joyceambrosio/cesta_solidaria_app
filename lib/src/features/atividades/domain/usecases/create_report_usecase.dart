import 'dart:io';

import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/atividades/domain/entities/atividade_entity.dart';
import 'package:cartallum_app/src/features/atividades/domain/usecases/pdf_handler/tabela_atividades_componente.dart';
import 'package:cartallum_app/src/core/shared/composite_pdf/cabecalho_componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/componente_composite.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class CreateReportUsecase extends ErroHandler<File> {
  CreateReportUsecase();

  Future<Either<ErroApp, File>> relatorio(
    Map<String, dynamic> queryParams,
    List<AtividadeEntity> lista,
  ) async {
    final pdf = pw.Document();

    List<pw.Widget> children = await _children(
      queryParams,
      lista,
    );

    pdf.addPage(pw.MultiPage(
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        build: (context) {
          return children;
        }));

    final output = await getTemporaryDirectory();
    String appDocPath = output.path;
    final file = File("$appDocPath/example.pdf");

    await file.writeAsBytes(await pdf.save());
    return handleError(Right(file));
  }

  _children(
    Map<String, dynamic> queryParams,
    List<AtividadeEntity> lista,
  ) async {
    pw.MemoryImage logo = pw.MemoryImage(
      (await rootBundle.load(
        'assets/imgs/logo.png',
      ))
          .buffer
          .asUint8List(),
    );

    final documentoPdf = ComponenteComposite();
    final cabecalhoComponente = CabecalhoComponente(
      titulo: "Registro de Atividades",
      logo: logo,
    );

    documentoPdf.add(cabecalhoComponente);
    documentoPdf.add(TabelaAtividadesComponente(atividades: lista));

    List<pw.Widget> children = [];
    children = await documentoPdf.getChildren();
    return children;
  }
}
