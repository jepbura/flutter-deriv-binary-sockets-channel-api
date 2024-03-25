import 'package:price_picker/generated/json/base/json_convert_content.dart';
import 'package:price_picker/features/data/models/socket/symbols_entity.dart';

SymbolsEntity $SymbolsEntityFromJson(Map<String, dynamic> json) {
  final SymbolsEntity symbolsEntity = SymbolsEntity();
  final List<SymbolsActiveSymbols>? activeSymbols = jsonConvert
      .convertListNotNull<SymbolsActiveSymbols>(json['active_symbols']);
  if (activeSymbols != null) {
    symbolsEntity.activeSymbols = activeSymbols;
  }
  final SymbolsEchoReq? echoReq =
      jsonConvert.convert<SymbolsEchoReq>(json['echo_req']);
  if (echoReq != null) {
    symbolsEntity.echoReq = echoReq;
  }
  final String? msgType = jsonConvert.convert<String>(json['msg_type']);
  if (msgType != null) {
    symbolsEntity.msgType = msgType;
  }
  return symbolsEntity;
}

Map<String, dynamic> $SymbolsEntityToJson(SymbolsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['active_symbols'] =
      entity.activeSymbols?.map((v) => v.toJson()).toList();
  data['echo_req'] = entity.echoReq?.toJson();
  data['msg_type'] = entity.msgType;
  return data;
}

SymbolsActiveSymbols $SymbolsActiveSymbolsFromJson(Map<String, dynamic> json) {
  final SymbolsActiveSymbols symbolsActiveSymbols = SymbolsActiveSymbols();
  final int? allowForwardStarting =
      jsonConvert.convert<int>(json['allow_forward_starting']);
  if (allowForwardStarting != null) {
    symbolsActiveSymbols.allowForwardStarting = allowForwardStarting;
  }
  final String? displayName = jsonConvert.convert<String>(json['display_name']);
  if (displayName != null) {
    symbolsActiveSymbols.displayName = displayName;
  }
  final int? exchangeIsOpen =
      jsonConvert.convert<int>(json['exchange_is_open']);
  if (exchangeIsOpen != null) {
    symbolsActiveSymbols.exchangeIsOpen = exchangeIsOpen;
  }
  final int? isTradingSuspended =
      jsonConvert.convert<int>(json['is_trading_suspended']);
  if (isTradingSuspended != null) {
    symbolsActiveSymbols.isTradingSuspended = isTradingSuspended;
  }
  final String? market = jsonConvert.convert<String>(json['market']);
  if (market != null) {
    symbolsActiveSymbols.market = market;
  }
  final String? marketDisplayName =
      jsonConvert.convert<String>(json['market_display_name']);
  if (marketDisplayName != null) {
    symbolsActiveSymbols.marketDisplayName = marketDisplayName;
  }
  final double? pip = jsonConvert.convert<double>(json['pip']);
  if (pip != null) {
    symbolsActiveSymbols.pip = pip;
  }
  final String? submarket = jsonConvert.convert<String>(json['submarket']);
  if (submarket != null) {
    symbolsActiveSymbols.submarket = submarket;
  }
  final String? submarketDisplayName =
      jsonConvert.convert<String>(json['submarket_display_name']);
  if (submarketDisplayName != null) {
    symbolsActiveSymbols.submarketDisplayName = submarketDisplayName;
  }
  final String? symbol = jsonConvert.convert<String>(json['symbol']);
  if (symbol != null) {
    symbolsActiveSymbols.symbol = symbol;
  }
  final String? symbolType = jsonConvert.convert<String>(json['symbol_type']);
  if (symbolType != null) {
    symbolsActiveSymbols.symbolType = symbolType;
  }
  return symbolsActiveSymbols;
}

Map<String, dynamic> $SymbolsActiveSymbolsToJson(SymbolsActiveSymbols entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['allow_forward_starting'] = entity.allowForwardStarting;
  data['display_name'] = entity.displayName;
  data['exchange_is_open'] = entity.exchangeIsOpen;
  data['is_trading_suspended'] = entity.isTradingSuspended;
  data['market'] = entity.market;
  data['market_display_name'] = entity.marketDisplayName;
  data['pip'] = entity.pip;
  data['submarket'] = entity.submarket;
  data['submarket_display_name'] = entity.submarketDisplayName;
  data['symbol'] = entity.symbol;
  data['symbol_type'] = entity.symbolType;
  return data;
}

SymbolsEchoReq $SymbolsEchoReqFromJson(Map<String, dynamic> json) {
  final SymbolsEchoReq symbolsEchoReq = SymbolsEchoReq();
  final String? activeSymbols =
      jsonConvert.convert<String>(json['active_symbols']);
  if (activeSymbols != null) {
    symbolsEchoReq.activeSymbols = activeSymbols;
  }
  final String? productType = jsonConvert.convert<String>(json['product_type']);
  if (productType != null) {
    symbolsEchoReq.productType = productType;
  }
  return symbolsEchoReq;
}

Map<String, dynamic> $SymbolsEchoReqToJson(SymbolsEchoReq entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['active_symbols'] = entity.activeSymbols;
  data['product_type'] = entity.productType;
  return data;
}
