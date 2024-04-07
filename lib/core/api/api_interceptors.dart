import 'package:dio/dio.dart';
import 'package:first_app/cache/cache_helper.dart';
import 'package:first_app/core/api/end_ponits.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['lang'] = 'ar';
    options.headers['Content-Type'] = 'application/json';
    options.headers[ApiKey.token] =
        CacheHelper().getData(key: ApiKey.token) != null
            ? '${CacheHelper().getData(key: ApiKey.token)}'
            : null;

    super.onRequest(options, handler);
  }
}
