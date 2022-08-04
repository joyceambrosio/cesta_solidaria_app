import 'package:cartallum_app/src/core/errors/erro_app.dart';
import 'package:dartz/dartz.dart';

class ErroHandler<T> {
  Either<ErroApp, T> handleError(Either<ErroApp, T> result) {
    return result.fold((l) {
      switch (l.mensagem) {
        default:
          return Left(
            ErroApp(mensagem: l.mensagem),
          );
      }
    }, (r) {
      return Right(r);
    });
  }
}
