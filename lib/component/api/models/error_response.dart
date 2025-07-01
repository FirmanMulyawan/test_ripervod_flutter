class ErrorResponse {
  final String? innerMessage;
  final String? message;
  final int? code;
  final dynamic payload;

  ErrorResponse({
    this.innerMessage,
    this.message,
    this.code,
    this.payload,
  });

  ErrorResponse copyWith({
    String? innerMessage,
    String? message,
    int? code,
    dynamic payload,
  }) =>
      ErrorResponse(
        innerMessage: innerMessage ?? this.innerMessage,
        message: message ?? this.message,
        code: code ?? this.code,
        payload: payload ?? this.payload,
      );

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        innerMessage: json["innerMessage"],
        message: json["message"],
        code: json["code"],
        payload: json["payload"],
      );

  Map<String, dynamic> toJson() => {
        "innerMessage": innerMessage,
        "message": message,
        "code": code,
        "payload": payload,
      };
}

class ErrorPayload {
  final String? propertyName;
  final String? attemptedValue;
  final String? errorCode;
  final String? message;

  ErrorPayload({
    this.propertyName,
    this.attemptedValue,
    this.errorCode,
    this.message,
  });

  factory ErrorPayload.fromJson(Map<String, dynamic> json) => ErrorPayload(
        propertyName: json["propertyName"],
        attemptedValue: json["attemptedValue"],
        errorCode: json["errorCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "propertyName": propertyName,
        "attemptedValue": attemptedValue,
        "errorCode": errorCode,
        "message": message,
      };
}
