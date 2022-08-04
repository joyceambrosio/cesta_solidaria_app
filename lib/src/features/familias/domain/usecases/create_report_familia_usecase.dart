import 'dart:io';

import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/core/shared/composite_pdf/cabecalho_componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/componente_composite.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/componentes_familia/endereco_familiar_componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/componentes_familia/estatisticas_cestas_componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/componentes_familia/piramide_etaria_componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/componentes_familia/renda_familiar_componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/componentes_familia/tabela_cestas_familiar_componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/componentes_familia/tabela_grupo_familiar_componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/familia_componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/familia_composite.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/filtro_info_component.dart';
import 'package:cartallum_app/src/core/shared/composite_pdf/titulo_sessao.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class CreateReportFamiliaUsecase extends ErroHandler<File> {
  CreateReportFamiliaUsecase();

  Future<Either<ErroApp, File>> relatorioGruposFamiliares(
    Map<String, dynamic> queryParams,
    List<FamiliaEntity> lista,
  ) async {
    final pdf = pw.Document();

    List<pw.Widget> children = await _getChildrenGruposFamiliares(
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

  Future<Either<ErroApp, File>> relatorioFamiliaSimples(
    FamiliaEntity familia,
  ) async {
    final pdf = pw.Document();

    List<pw.Widget> children = await _getChildrenFamiliaSimples(familia);

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

  _getChildrenFamiliaSimples(FamiliaEntity familia) async {
    pw.MemoryImage logo = pw.MemoryImage(
      (await rootBundle.load(
        'assets/imgs/logo.png',
      ))
          .buffer
          .asUint8List(),
    );

    final documentoPdf = ComponenteComposite();
    final cabecalhoComponente = CabecalhoComponente(
      titulo: "Família",
      logo: logo,
    );
    final tabelaFamilia = FamiliaComponente(familia: familia);

    documentoPdf.add(cabecalhoComponente);
    documentoPdf.add(tabelaFamilia);

    List<pw.Widget> children = [];
    children = await documentoPdf.getChildren();
    return children;
  }

  _getChildrenGruposFamiliares(
      Map<String, dynamic> queryParams, List<FamiliaEntity> lista) async {
    pw.MemoryImage logo = pw.MemoryImage(
      (await rootBundle.load(
        'assets/imgs/logo.png',
      ))
          .buffer
          .asUint8List(),
    );

    final documentoPdf = ComponenteComposite();
    final filtroInfoComponente = FiltroInfoComponente(queryParams: queryParams);
    final cabecalhoComponente = CabecalhoComponente(
      titulo: "Grupos familiares",
      logo: logo,
    );

    final piramide = PiramideEtariaComponente(lista: lista);

    final estatisticas = EstatisticasCestasComponente(listaFamilia: lista);

    var familiaSimplesComposite = FamiliaComposite();

    for (FamiliaEntity familia in lista) {
      if (familia.integrantes != null) {
        if (familia.integrantes!.isNotEmpty) {
          familiaSimplesComposite.add(TituloSessao(titulo: 'Grupo Familiar'));

          familiaSimplesComposite.add(
            RendaFamiliarComponente(familia: familia),
          );
          familiaSimplesComposite.add(
            EnderecoFamiliarComponente(familia: familia),
          );
          familiaSimplesComposite.add(
            TabelaGrupoFamiliarComponente(familia: familia),
          );
          familiaSimplesComposite.add(
            TabelaCestasFamiliarComponente(familia: familia),
          );
        }
      }
    }

    documentoPdf.add(cabecalhoComponente);
    documentoPdf.add(filtroInfoComponente);
    documentoPdf.add(piramide);
    documentoPdf.add(estatisticas);
    documentoPdf.add(familiaSimplesComposite);

    List<pw.Widget> children = [];
    children = await documentoPdf.getChildren();
    return children;
  }
}
