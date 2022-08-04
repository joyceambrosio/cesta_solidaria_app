import 'package:cartallum_app/src/features/cesta/data/datasource/remote/cesta_api.dart';
import 'package:cartallum_app/src/features/cesta/data/infra/cesta_infra.dart';
import 'package:cartallum_app/src/features/cesta/domain/usecases/add_cesta_uscecase.dart';
import 'package:cartallum_app/src/features/cesta/domain/usecases/get_cesta_uscecase.dart';
import 'package:cartallum_app/src/features/cesta/domain/usecases/get_cestas_uscecase.dart';
import 'package:cartallum_app/src/features/cesta/presentation/cesta_controller.dart';

import 'package:flutter_modular/flutter_modular.dart';

class CestasModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => CestaApi(i()), export: true),
        Bind.factory((i) => CestaInfra(i()), export: true),
        Bind.factory((i) => AddCestaUsecase(i()), export: true),
        Bind.factory((i) => GetCestaUsecase(i()), export: true),
        Bind.factory((i) => GetCestasUsecase(i()), export: true),
        Bind.lazySingleton((i) => CestaController(i(), i(), i()), export: true),
      ];
}
