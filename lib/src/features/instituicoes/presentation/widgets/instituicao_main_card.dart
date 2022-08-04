import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/shadows.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/display/description_list.dart';
import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InstituicaoMainCard extends StatelessWidget {
  final InstituicaoEntity instituicao;
  const InstituicaoMainCard({
    required this.instituicao,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    instituicao.nome,
                    style: const TextStyle(
                      overflow: TextOverflow.fade,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Cores.corDeTextDentroContainer,
                    ),
                  ),
                ),
              ),
              Tooltip(
                message: "Status de verificação da instituição",
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0),
                  child: Chip(
                    backgroundColor:
                        instituicao.verificado ? Cores.success : Cores.danger,
                    avatar: Icon(
                      instituicao.verificado ? Icons.verified : Icons.pending,
                      color: Cores.white,
                      size: 15,
                    ),
                    label: Text(
                      instituicao.verificado ? 'Ok' : 'Pendente',
                      style: const TextStyle(
                        color: Cores.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          DescriptionList(
            informacoes: <String, String>{
              "Uid": instituicao.id,
              "Sigla": instituicao.sigla,
              "Tipo": instituicao.tipo.toUpperCase(),
              "Telefone": instituicao.telefone
            },
          ),
          InkWell(
            onTap: () {
              Modular.to
                  .pushNamed('/instituicoes/instituicao/${instituicao.id}');
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: const [
                  Spacer(),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Cores.info,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
