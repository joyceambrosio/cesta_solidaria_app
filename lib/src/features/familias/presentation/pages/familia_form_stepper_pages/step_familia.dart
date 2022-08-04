import 'package:cartallum_app/src/core/shared/cores.dart';
import 'package:cartallum_app/src/core/shared/utils.dart';
import 'package:cartallum_app/src/core/shared/widgets/display/image_tile_collapse_removable.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/buttom_field.dart';
import 'package:cartallum_app/src/core/shared/widgets/inputs/form_text_field.dart';
import 'package:cartallum_app/src/features/familias/presentation/familia_controller.dart';
import 'package:cartallum_app/src/features/familias/presentation/stores/familia_form_stepper_pages_store/step_familia_store.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class StepFamilia extends StatelessWidget {
  final FamiliaController controller;
  final StepFamiliaStore store;
  const StepFamilia({
    required this.controller,
    required this.store,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: Utils.paddingPadrao,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Observer(
                  builder: (_) => FormTextField(
                    controller: store.controllerRenda,
                    labelText: "Renda familiar",
                    hintText: "Total da renda familiar",
                    errorText: store.error.renda ?? '',
                    fieldType: TextInputType.number,
                    isValid: store.error.renda == null,
                    enabled: store.isEdit,
                    validateAction: (value) {
                      store.validateRenda();
                    },
                    inputFormatters: [
                      TextInputMask(
                        mask: 'R!\$! 9+.999,99',
                        reverse: true,
                      )
                    ],
                  ),
                ),
                Observer(builder: (_) {
                  if (store.comprovante != null) {
                    return ImageTileCollapseRemovable(
                        file: store.comprovante!,
                        title: "Comprovante de endereço",
                        onClick: () {
                          store.comprovante = null;
                        });
                  } else {
                    return const SizedBox();
                  }
                }),
                ButtomField(
                  labelText: 'Comprovante de renda',
                  background: Cores.secondary,
                  icone: const FaIcon(
                    FontAwesomeIcons.camera,
                    size: 18,
                  ),
                  onClick: () async {
                    final ImagePicker _picker = ImagePicker();

                    final XFile? xfile =
                        await _picker.pickImage(source: ImageSource.camera);

                    if (xfile != null) {
                      store.comprovante = xfile;
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
