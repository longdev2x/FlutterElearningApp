import 'package:dio/dio.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/global.dart';

class HttpUtil {
  late Dio dio;
  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.serverApiUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: 'application/json: charset=utf-8',
      responseType: ResponseType.json,
    );
    Dio(options);
  }

  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {

    Options requestOptions = options?? Options(); //Options() sẽ lấy dữ liêu từ BaseOptions nếu ta k đưa options cho hàm
    requestOptions.headers = requestOptions.headers?? {}; // BaseOptions để {} nên có thể null, trường hợp đó thì gán cho {}

    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if(authorization!=null) {
      requestOptions.headers!.addAll(authorization);
    }

    var response = await dio.post(
      path,
      data: data, 
      queryParameters: queryParameters,
      options: requestOptions,
    );

    return response.data;
  }
}

