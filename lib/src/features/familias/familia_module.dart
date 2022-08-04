import 'package:flutter_modular/flutter_modular.dart';

import 'package:cartallum_app/src/features/familias/data/datasource/remote/familia_api.dart';
import 'package:cartallum_app/src/features/familias/data/infra/familia_infra.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/create_familia_usecase.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/create_report_familia_usecase.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/get_familia_usecase.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/get_familias_usecase.dart';
import 'package:cartallum_app/src/features/familias/domain/usecases/update_familia_usecase.dart';
import 'package:cartallum_app/src/features/familias/presentation/familia_controller.dart';
import 'package:cartallum_app/src/features/familias/presentation/pages/familia_page.dart';
import 'package:cartallum_app/src/features/familias/presentation/pages/familias_form_stepper.dart';
import 'package:cartallum_app/src/features/familias/presentation/pages/familias_home_filtro.dart';
import 'package:cartallum_app/src/features/familias/presentation/pages/familias_home_page.dart';
import 'package:cartallum_app/src/features/familias/presentation/stores/familias_home_store.dart';

class FamiliaModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => FamiliaApi(i()), export: true),
        Bind.factory((i) => FamiliaInfra(i()), export: true),
        Bind.factory((i) => GetFamiliasUsecase(i()), export: true),
        Bind.factory((i) => GetFamiliaUsecase(i()), export: true),
        Bind.factory((i) => CreateFamiliaUsecase(i()), export: true),
        Bind.factory((i) => UpdateFamiliaUsecase(i()), export: true),
        Bind.factory((i) => CreateReportFamiliaUsecase(), export: true),
        Bind.lazySingleton((i) => FamiliaController(i(), i(), i(), i(), i()),
            export: true),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const FamiliasHomePage(),
            transition: TransitionType.rightToLeft),
        ChildRoute('/familia',
            child: (context, args) =>
                FamiliasFormStepper(familiaId: args.queryParams['familiaId']),
            transition: TransitionType.rightToLeft),
        ChildRoute('/familia/filter',
            child: (context, args) =>
                FamiliasHomeFiltro(store: FamiliasHomeStore()),
            transition: TransitionType.rightToLeft),
        ChildRoute('/familia/:familiaId',
            child: (context, args) =>
                FamiliaPage(familiaId: args.params['familiaId']),
            transition: TransitionType.rightToLeft),
      ];
}
