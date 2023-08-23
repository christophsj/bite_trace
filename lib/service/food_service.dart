import 'package:bite_trace/dtos/myfitnesspal_api/api_response.dart';
import 'package:bite_trace/providers.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class FitnessPalFoodService {
  FitnessPalFoodService({required this.ref}) {
    _dio.interceptors.add(LogInterceptor());
  }
  static const String baseUrl = 'https://www.myfitnesspal.com/api';
  final Logger _logger = Logger();
  final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));
  final Ref ref;

  Future<ApiResponse> searchFoods({required String query, int page = 1}) async {
    try {
      final response = await _dio.get(
        '/nutrition',
        queryParameters: {
          'page': page,
          'query': query,
        },
      );
      final data = response.data;
      return ApiResponse.fromJson(data as Map<String, Object?>);
    } on DioException catch (e, stackTrace) {
      _logger.e('Failed to load data:', error: e, stackTrace: stackTrace);
      ref.read(snackbarServiceProvider).showBasic('Failed to load data: $e');
      rethrow;
    }
  }
}
