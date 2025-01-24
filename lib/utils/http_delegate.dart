import 'dart:convert';
import 'dart:io';

import 'package:automaat_app/utils/result.dart';
import 'package:logging/logging.dart';

mixin HttpDelegate {
  Future<Result<T?>> getRequest<T>(Uri uri, HttpClient Function() clientFactory,
      [T Function(Map<String, Object?>)? fromJson]) async {
    final client = clientFactory();
    try {
      final request = await client.getUrl(uri);
      final response = await request.close();
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        if (T == dynamic) {
          return Result.ok(null);
        } else {
          final stringData = await response.transform(utf8.decoder).join();
          if (fromJson == null) {
            throw Exception("Please provide fromjson for parsing");
          }
          return Result.ok(fromJson(jsonDecode(stringData)));
        }
      } else {
        return Result.error(Exception("Error fetching $uri"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<T>> postRequest<T>(
      Uri uri, HttpClient Function() clientFactory, Object body,
      [T Function(Map<String, Object?>)? fromJson, Logger? log]) async {
    final client = clientFactory();
    try {
      final request = await client.postUrl(uri);
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(body));
      final response = await request.close();
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        if (fromJson == null) {
          return Result.ok(null as T);
        } else {
          final stringData = await response.transform(utf8.decoder).join();
          return Result.ok(fromJson(jsonDecode(stringData)));
        }
      } else {
        return Result.error(Exception("Error posting to $uri"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }
}
