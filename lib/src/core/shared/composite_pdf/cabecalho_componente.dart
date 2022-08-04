import 'package:cartallum_app/src/core/shared/formatter_app.dart';
import 'package:cartallum_app/src/core/shared/composite_pdf/componente.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class CabecalhoComponente implements Componente {
  String titulo;
  MemoryImage logo;
  PdfColor? textColor;
  PdfColor? backgroundColor;

  CabecalhoComponente(
      {required this.titulo,
      required this.logo,
      this.textColor,
      this.backgroundColor});

  @override
  Future<List<Widget>> getChildren() async {
    List<Widget> child = [createCabecalho(titulo)];
    return child;
  }

  createCabecalho(String titulo) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: backgroundColor ?? PdfColor.fromHex('#FFFFFF'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            height: 60,
            width: 60,
            child: Image(logo),
          ),
          Text(
            titulo,
            style: TextStyle(
                fontSize: 22,
                color: textColor ?? PdfColor.fromHex('#FF4F5A'),
                fontWeight: FontWeight.bold),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                FormatterApp.fromatDate(DateTime.now()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
