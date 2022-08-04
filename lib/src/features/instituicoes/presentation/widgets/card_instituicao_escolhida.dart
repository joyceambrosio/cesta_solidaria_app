// import 'package:cartallum_app/src/core/shared/cores.dart';
// import 'package:cartallum_app/src/core/shared/shadows.dart';
// import 'package:cartallum_app/src/core/shared/utils.dart';
// import 'package:cartallum_app/src/features/instituicoes/domain/entities/instituicao_entity.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';

// class CardInstituicaoEscolhida extends StatelessWidget {
//   final InstituicaoEntity? instituicao;

//   const CardInstituicaoEscolhida({
//     required this.instituicao,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     if (instituicao == null) return const SizedBox();
//     return InkWell(
//       onTap: () {
//         Modular.to.pushNamed('/instituicoes/instituicao/${instituicao!.id}');
//       },
//       child: Container(
//         margin: Utils.marginPadrao,
//         padding: const EdgeInsets.all(0),
//         decoration: BoxDecoration(
//           boxShadow: [
//             Shadows.leve(),
//           ],
//           borderRadius: Utils.arredondamentoPadrao,
//           color: Cores.corDeCardCesta,
//         ),
//         child: Container(
//           width: double.infinity,
//           margin: Utils.marginPadrao,
//           padding: Utils.paddingPadrao,
//           child: Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 opacity: 0.1,
//                 image: AssetImage(
//                   "assets/imgs/pessoas-caixas.png",
//                 ),
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       "Minha instituição",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           color: Cores.corDeTextDentroContainer),
//                     ),
//                     Tooltip(
//                       message: "Status de verificação da instituição",
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 0, right: 0),
//                         child: Chip(
//                           backgroundColor: instituicao!.verificado
//                               ? Cores.success
//                               : Cores.danger,
//                           avatar: Icon(
//                             instituicao!.verificado
//                                 ? Icons.verified
//                                 : Icons.pending,
//                             color: Cores.white,
//                             size: 15,
//                           ),
//                           label: Text(
//                             instituicao!.verificado ? 'Ok' : 'Pendente',
//                             style: const TextStyle(
//                               color: Cores.white,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   width: double.infinity,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Expanded(
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.symmetric(vertical: 10),
//                                   child: Text(
//                                     instituicao!.nome,
//                                     style: const TextStyle(
//                                       overflow: TextOverflow.fade,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15,
//                                       color: Cores.corDeTextDentroContainer,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 10),
//                                 child: Text(
//                                   instituicao!.sigla,
//                                   style: const TextStyle(
//                                     overflow: TextOverflow.fade,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 15,
//                                     color: Cores.corDeTextDentroContainer,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
