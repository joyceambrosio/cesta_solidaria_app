import 'package:adaptive_dialog/adaptive_dialog.dart';

mixin AlertDialogApp {
  exibirDialogo(
    context,
    String title,
    String okLabel,
    String mensagem,
  ) async {
    final escolha = await showConfirmationDialog<int>(
      context: context,
      cancelLabel: "Cancelar",
      okLabel: okLabel,
      title: title,
      message: mensagem,
      actions: [
        const AlertDialogAction(
          key: 1,
          label: "Sim",
          isDestructiveAction: true,
        ),
      ],
    );
    return escolha;
  }
}
