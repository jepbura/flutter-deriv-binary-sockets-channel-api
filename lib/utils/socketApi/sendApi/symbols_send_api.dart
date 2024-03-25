import 'base_send_api.dart';

class SymbolsSendApi extends SendApi {
  final String activeSymbols;
  final String productType;

  SymbolsSendApi({
    this.activeSymbols = "",
    this.productType = "",
  });

  @override
  Map<String, dynamic> toJson() => {
        "active_symbols": activeSymbols,
        "product_type": productType,
      };
}
