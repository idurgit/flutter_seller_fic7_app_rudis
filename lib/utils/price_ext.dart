import 'package:money_formatter/money_formatter.dart';

extension PriceExtention on String {
  String formatPrice() {
    MoneyFormatter fmf = MoneyFormatter(
        amount: double.parse(this),
        settings: MoneyFormatterSettings(
          symbol: 'Rp.',
          thousandSeparator: '.',
          decimalSeparator: ',',
          symbolAndNumberSeparator: ' ',
          fractionDigits: 2,
        ));
    return fmf.output.symbolOnLeft;
  }
}
