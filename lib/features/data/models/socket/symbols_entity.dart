import 'package:price_picker/generated/json/base/json_field.dart';
import 'package:price_picker/generated/json/symbols_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class SymbolsEntity {
  @JSONField(name: "active_symbols")
  List<SymbolsActiveSymbols>? activeSymbols;
  @JSONField(name: "echo_req")
  SymbolsEchoReq? echoReq;
  @JSONField(name: "msg_type")
  String? msgType;

  SymbolsEntity();

  factory SymbolsEntity.fromJson(Map<String, dynamic> json) =>
      $SymbolsEntityFromJson(json);

  Map<String, dynamic> toJson() => $SymbolsEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SymbolsActiveSymbols {
  @JSONField(name: "allow_forward_starting")
  int? allowForwardStarting;
  @JSONField(name: "display_name")
  String? displayName;
  @JSONField(name: "exchange_is_open")
  int? exchangeIsOpen;
  @JSONField(name: "is_trading_suspended")
  int? isTradingSuspended;
  String? market;
  @JSONField(name: "market_display_name")
  String? marketDisplayName;
  double? pip;
  String? submarket;
  @JSONField(name: "submarket_display_name")
  String? submarketDisplayName;
  String? symbol;
  @JSONField(name: "symbol_type")
  String? symbolType;

  SymbolsActiveSymbols();

  factory SymbolsActiveSymbols.fromJson(Map<String, dynamic> json) =>
      $SymbolsActiveSymbolsFromJson(json);

  Map<String, dynamic> toJson() => $SymbolsActiveSymbolsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SymbolsEchoReq {
  @JSONField(name: "active_symbols")
  String? activeSymbols;
  @JSONField(name: "product_type")
  String? productType;

  SymbolsEchoReq();

  factory SymbolsEchoReq.fromJson(Map<String, dynamic> json) =>
      $SymbolsEchoReqFromJson(json);

  Map<String, dynamic> toJson() => $SymbolsEchoReqToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
