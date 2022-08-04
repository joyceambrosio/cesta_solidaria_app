import 'package:cartallum_app/src/features/cesta/domain/entities/cesta_entity.dart';
import 'package:cartallum_app/src/features/familias/domain/entities/familia_entity.dart';

abstract class DoacaoCestaHandler {
  DoacaoCestaHandler? _proximo;

  DoacaoCestaHandler();

  set proximo(DoacaoCestaHandler proximo) => _proximo = proximo;

  DoacaoCestaHandler link(DoacaoCestaHandler proximo) {
    _proximo = proximo;
    return proximo;
  }

  Future<bool> verificaProximo(FamiliaEntity familia, CestaEntity cesta) async {
    if (_proximo == null) {
      return true;
    }
    return _proximo!.processsar(familia, cesta);
  }

  Future<bool> processsar(FamiliaEntity familia, CestaEntity cesta);
}
