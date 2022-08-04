// import 'package:cartallum_app/src/core/errors/erro_app.dart';
// import 'package:cartallum_app/src/core/errors/erro_handler.dart';
// import 'package:cartallum_app/src/features/config/domain/entities/config_entity.dart';
// import 'package:cartallum_app/src/features/config/domain/repository/config_repository.dart';

// import 'package:dartz/dartz.dart';

// class GetConfigUsecase extends ErroHandler<ConfigEntity> {
//   final ConfigRepository repository;

//   GetConfigUsecase(this.repository);

//   Future<Either<ErroApp, ConfigEntity>> getConfig(
//     String instituicaoUid,
//     String pessoaUid,
//   ) async {
//     var result = await repository.getConfig(instituicaoUid, pessoaUid);
//     return handleError(result);
//   }
// }
