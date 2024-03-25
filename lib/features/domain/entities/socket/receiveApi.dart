class ReceiveApi<T> {
  final String msgType;
  final T data;

  ReceiveApi({
    required this.msgType,
    required this.data,
  });

  @override
  Map<String, dynamic> toJson() => {
        "msgType": msgType,
        "message": data,
      };
}
