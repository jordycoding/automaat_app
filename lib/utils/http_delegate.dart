import 'dart:convert';
import 'dart:io';

import 'package:automaat_app/utils/result.dart';
import 'package:logging/logging.dart';

enum RequestType { json, plain }

mixin HttpDelegate {
  Future<Result<T>> getRequest<T>(
    Uri uri,
    HttpClient Function() clientFactory, [
    T Function(Map<String, Object?>)? fromJson,
    T Function(List<Object?>)? fromList,
    Future<void> Function(HttpHeaders)? addHeaders,
    bool returnRaw = false,
    Logger? log,
  ]) async {
    final client = clientFactory();
    try {
      final request = await client.getUrl(uri);
      if (addHeaders != null) {
        await addHeaders(request.headers);
      }
      final response = await request.close();
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        if (fromJson == null && fromList == null && !returnRaw) {
          return Result.ok(null as T);
        } else if (returnRaw) {
          final stringData = await response.transform(utf8.decoder).join();
          return Result.ok(stringData as T);
        } else if (fromList != null) {
          final stringData = await response.transform(utf8.decoder).join();
          final rawList = jsonDecode(stringData);
          return Result.ok(fromList(rawList));
        } else if (fromJson != null) {
          final stringData = await response.transform(utf8.decoder).join();
          return Result.ok(fromJson(jsonDecode(stringData)));
        } else {
          return Result.error(
            Exception(
                "Please provide a fromsjon function, or set returnRaw to true"),
          );
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
      [T Function(Map<String, Object?>)? fromJson,
      T Function(List<Object?>)? fromList,
      Logger? log,
      RequestType type = RequestType.json,
      Future<void> Function(HttpHeaders)? addHeaders]) async {
    final client = clientFactory();
    try {
      final request = await client.postUrl(uri);
      if (addHeaders != null) {
        addHeaders(request.headers);
      }
      if (type == RequestType.json) {
        request.headers.contentType = ContentType.json;
        request.write(jsonEncode(body));
      } else if (type == RequestType.plain) {
        request.headers.contentType = ContentType.text;
        request.write(body);
      }
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
