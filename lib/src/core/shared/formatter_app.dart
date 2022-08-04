import 'package:easy_mask/easy_mask.dart';
import 'package:intl/intl.dart';

class FormatterApp {
  static tryFormatMonetario(double? value) {
    if (value == null) return 0;
    try {
      return formatMonetario(value);
    } catch (e) {
      return 0;
    }
  }

  static formatPercent(double value) {
    NumberFormat formatter = NumberFormat.decimalPercentPattern();
    return formatter.format(value);
  }

  static formatMonetario(double value) {
    NumberFormat formatter = NumberFormat.simpleCurrency();
    return formatter.format(value);
  }

  static fromatCpfPrivate(String value) {
    return value.isEmpty
        ? ''
        : MagicMask.buildMask('999.999.999-99')
            .getMaskedString(value)
            .replaceRange(8, 11, '***');
  }

  static fromatCpf(String? value) {
    if (value == null) return '';
    if (value.isEmpty) return '';
    return MagicMask.buildMask('999.999.999-99').getMaskedString(value);
  }

  static fromatDate(DateTime value) {
    return DateFormat("dd/MM/yyyy").format(value);
  }

  static fromatDateHora(DateTime value) {
    return DateFormat("dd/MM/yyyy HH:mm").format(value);
  }

  static fromatTelefone(String value) {
    if (value.isEmpty) return '';
    String clean = value
        .replaceAll(' ', '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll('-', '');

    if (value.length == 8) {
      return MagicMask.buildMask('9999 9999').getMaskedString(clean);
    }
    if (value.length == 9) {
      return MagicMask.buildMask('99999 9999').getMaskedString(clean);
    }

    if (value.length == 10) {
      return MagicMask.buildMask('(99) 9999 9999').getMaskedString(clean);
    }
    if (value.length == 11) {
      return MagicMask.buildMask('(99) 99999 9999').getMaskedString(clean);
    }
  }
}
