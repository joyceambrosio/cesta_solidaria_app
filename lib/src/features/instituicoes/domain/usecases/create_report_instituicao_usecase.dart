import 'dart:io';

import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:cartallum_app/src/core/errors/erro_handler.dart';
import 'package:cartallum_app/src/core/shared/composite_pdf/cabecalho_componente.dart';
import 'package:cartallum_app/src/core/shared/composite_pdf/titulo_sessao.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/componente_composite.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/componentes_familia/endereco_familiar_componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/componentes_familia/estatisticas_cestas_tabelas_componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/componentes_familia/renda_familiar_componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/componentes_familia/tabela_cestas_familiar_componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/componentes_familia/tabela_grupo_familiar_componente.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/pdf_handler/familia_composite.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/usecases/pdf_handler/componentes/tabela_membros_componente.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/usecases/pdf_handler/componentes/instituicao_componente.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/usecases/pdf_handler/instituicao_composite.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class CreateReportInstituicaoUsecase extends ErroHandler<File> {
  CreateReportInstituicaoUsecase();

  Future<Either<ErroApp, File>> relatorioGruposInstituicoes(
    List<InstituicaoEntity> lista,
  ) async {
    final pdf = pw.Document();

    List<pw.Widget> children = await _getChildrenGruposInstituicoes(
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

  Future<Either<ErroApp, File>> relatorioInstituicaoSimples(
    InstituicaoEntity instituicao,
  ) async {
    final pdf = pw.Document();

    List<pw.Widget> children = await _getChildrenInstituicaoSimples(
      instituicao,
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

  _getChildrenInstituicaoSimples(InstituicaoEntity instituicao) async {
    pw.MemoryImage logo = pw.MemoryImage(
      (await rootBundle.load(
        'assets/imgs/logo.png',
      ))
          .buffer
          .asUint8List(),
    );

    final documentoPdf = ComponenteComposite();
    final cabecalhoComponente = CabecalhoComponente(
      titulo: "Instituição",
      logo: logo,
    );
    final tabelaInstituicao = InstituicaoComponente(instituicao: instituicao);

    documentoPdf.add(cabecalhoComponente);
    documentoPdf.add(tabelaInstituicao);

    List<pw.Widget> children = [];
    children = await documentoPdf.getChildren();
    return children;
  }

  _getChildrenGruposInstituicoes(List<InstituicaoEntity> lista) async {
    pw.MemoryImage logo = pw.MemoryImage(
      (await rootBundle.load(
        'assets/imgs/logo.png',
      ))
          .buffer
          .asUint8List(),
    );

    final documentoPdf = ComponenteComposite();
    // final filtroInfoComponente = FiltroInfoComponente(queryParams: queryParams);
    final cabecalhoComponente = CabecalhoComponente(
      titulo: "Instituições",
      logo: logo,
    );

    var instituicaoSimplesComposite = InstituicaoComposite();
    var familiaSimplesComposite = FamiliaComposite();

    for (InstituicaoEntity instituicao in lista) {
      if (instituicao.membros != null) {
        if (instituicao.membros!.isNotEmpty) {
          instituicaoSimplesComposite.add(InstituicaoComponente(
            instituicao: instituicao,
          ));

          instituicaoSimplesComposite.add(TabelaMembrosComponente(
            instituicao: instituicao,
          ));

          if (instituicao.familias != null) {
            if (instituicao.familias!.isNotEmpty) {
              instituicaoSimplesComposite
                  .add(EstatisticasCestasTabelasComponente(
                listaFamilia: instituicao.familias!,
              ));
            }
          }

          if (instituicao.familias != null) {
            if (instituicao.familias!.isNotEmpty) {
              for (FamiliaEntity familia in instituicao.familias!) {
                familiaSimplesComposite
                    .add(TituloSessao(titulo: 'Grupo Familiar'));

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
          documentoPdf.add(instituicaoSimplesComposite);
          documentoPdf.add(familiaSimplesComposite);
        }
      }
    }

    List<pw.Widget> children = [];
    children = await documentoPdf.getChildren();
    return children;
  }
}
