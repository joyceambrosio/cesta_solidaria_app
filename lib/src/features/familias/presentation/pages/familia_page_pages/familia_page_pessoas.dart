import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/display/image_collapse_shareable.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';
import 'package:cartallum_app/src/features/familias/presentation/widgets/pessoa_description.dart';
import 'package:cartallum_app/src/features/pessoas/domain/entities/pessoa_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FamiliaPagePessoas extends StatelessWidget {
  final FamiliaEntity familia;
  const FamiliaPagePessoas({
    required this.familia,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (familia.integrantes != null) {
      if (familia.integrantes!.isNotEmpty) {
        return SingleChildScrollView(
          child: Container(
            padding: Utils.paddingPadrao,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: familia.integrantes!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          Shadows.muitoLeve(),
                        ],
                        borderRadius: Utils.arredondamentoPadrao,
                        color: Cores.white,
                      ),
                      width: double.infinity,
                      margin: Utils.marginPadrao,
                      padding: Utils.paddingPadrao,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PessoaDescription(
                            pessoa: familia.integrantes![index],
                            isExibeDependente: true,
                          ),
                          _getDocumento(familia.integrantes![index]),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }
    }
    return Container();
  }

  _getDocumento(PessoaEntity pessoa) {
    return (pessoa.comprovante == null)
        ? const SizedBox()
        : (pessoa.comprovante!.isEmpty)
            ? const SizedBox()
            : ImageCollapseShareable(
                imageUrl: pessoa.comprovante!,
                title: "Documento",
              );
  }
}
