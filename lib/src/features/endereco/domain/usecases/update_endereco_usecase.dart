// import 'package:cartallum_app/src/core/errors/erro_app.dart';
// import 'package:cartallum_app/src/core/errors/erro_handler.dart';
// import 'package:cartallum_app/src/features/endereco/domain/entities/endereco_entity.dart';
// import 'package:cartallum_app/src/features/endereco/domain/repository/endereco_repository.dart';
// import 'package:dartz/dartz.dart';

// class UpdateEnderecoUsecase extends ErroHandler<EnderecoEntity> {
//   final EnderecoRepository repository;

//   UpdateEnderecoUsecase(this.repository);

//   Future<Either<ErroApp, EnderecoEntity>> updateEndereco(
//     String familia,
//     EnderecoEntity endereco,
//   ) async {
//     var result = await repository.updateEndereco(familia, endereco);
//     return handleError(result);
//   }
// }
