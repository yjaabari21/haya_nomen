import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:haya_nomen/constant/api_constant.dart';

class ApiClient {
  ApiClient({this.baseUrl = ApiConstants.baseUrl, http.Client? client})
    : _client = client ?? http.Client();

  final String baseUrl;
  final http.Client _client;

  static const Duration _timeout = Duration(seconds: 20);

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _client
        .get(_uri(path, queryParameters), headers: _headers)
        .timeout(_timeout);

    return _handleResponse(response);
  }

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _client
        .post(
          _uri(path, queryParameters),
          headers: _headers,
          body: jsonEncode(body ?? const {}),
        )
        .timeout(_timeout);

    return _handleResponse(response);
  }

  Uri _uri(String path, Map<String, dynamic>? queryParameters) {
    final normalizedBaseUrl = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;
    final normalizedPath = path.startsWith('/') ? path : '/$path';

    return Uri.parse('$normalizedBaseUrl$normalizedPath').replace(
      queryParameters: queryParameters?.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );
  }

  Map<String, String> get _headers => {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  dynamic _handleResponse(http.Response response) {
    dynamic data;

    try {
      data = response.body.isEmpty ? null : jsonDecode(response.body);
    } on FormatException {
      data = response.body;
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    }

    throw ApiException(
      statusCode: response.statusCode,
      message: _errorMessage(data) ?? 'حدث خطأ أثناء الاتصال بالخادم.',
    );
  }

  String? _errorMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['message']?.toString() ?? data['error']?.toString();
    }
    return null;
  }

  void dispose() => _client.close();
}

class ApiException implements Exception {
  const ApiException({required this.statusCode, required this.message});

  final int statusCode;
  final String message;

  @override
  String toString() => 'ApiException ($statusCode): $message';
}
