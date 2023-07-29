class GeneralResponse {
  final int statusCode;
  final String? message;
  final dynamic data;

  GeneralResponse({required this.statusCode, this.message, this.data});

  factory GeneralResponse.onlineSuccess() =>
      GeneralResponse(statusCode: 200, message: 'Success');
  factory GeneralResponse.onlineFailure() =>
      GeneralResponse(statusCode: 500, message: 'Failure');

  factory GeneralResponse.fromJson(Map<String, dynamic> json) =>
      GeneralResponse(
          statusCode: json['status'],
          message: json['message'],
          data: json['data']);

  GeneralResponse copyWith({String? message, dynamic data}) => GeneralResponse(
        statusCode: statusCode,
        message: message ?? this.message,
        data: data ?? this.data,
      );
}
