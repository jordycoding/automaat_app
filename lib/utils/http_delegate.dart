import 'dart:convert';
import 'dart:io';

import 'package:automaat_app/data/services/shared_preferences_service.dart';
import 'package:automaat_app/utils/connectivity_check.dart';
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
    SharedPreferencesService? sharedPreferencesService,
  ]) async {
    if (!(await checkInternetConnectivity())) {
      if (sharedPreferencesService != null) {
        final cacheResult =
            await sharedPreferencesService.fetchData(uri.toString());
        if (returnRaw) {
          switch (cacheResult) {
            case Ok<String>():
              return Result.ok(cacheResult.value as T);
            case Error<String>():
              return Result.error(Exception("No cache available"));
          }
        } else if (fromList != null) {
          switch (cacheResult) {
            case Ok<String>():
              final rawList = jsonDecode(cacheResult.value);
              return Result.ok(fromList(rawList));
            case Error<String>():
              return Result.error(Exception("No cache available"));
          }
        } else if (fromJson != null) {
          switch (cacheResult) {
            case Ok<String>():
              return Result.ok(fromJson(jsonDecode(cacheResult.value)));
            case Error<String>():
              return Result.error(Exception("No cache available"));
          }
        }
      }
    }

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
          sharedPreferencesService?.saveData(uri.toString(), stringData);
          return Result.ok(stringData as T);
        } else if (fromList != null) {
          final stringData = await response.transform(utf8.decoder).join();
          sharedPreferencesService?.saveData(uri.toString(), stringData);
          final rawList = jsonDecode(stringData);
          return Result.ok(fromList(rawList));
        } else if (fromJson != null) {
          final stringData = await response.transform(utf8.decoder).join();
          sharedPreferencesService?.saveData(uri.toString(), stringData);
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
        if (fromJson == null && fromList == null) {
          return Result.ok(null as T);
        } else if (fromList != null) {
          final stringData = await response.transform(utf8.decoder).join();
          return Result.ok(fromList(jsonDecode(stringData)));
        } else if (fromJson != null) {
          final stringData = await response.transform(utf8.decoder).join();
          return Result.ok(fromJson(jsonDecode(stringData)));
        } else {
          return Result.error(Exception("Please provide a parsing function"));
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

  Future<Result<T>> patchRequest<T>(
      Uri uri, HttpClient Function() clientFactory, Object body,
      [T Function(Map<String, Object?>)? fromJson,
      T Function(List<Object?>)? fromList,
      Future<void> Function(HttpHeaders)? addHeaders]) async {
    final client = clientFactory();
    try {
      final request = await client.patchUrl(uri);
      if (addHeaders != null) {
        addHeaders(request.headers);
      }
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(body));
      final response = await request.close();
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        if (fromJson == null && fromList == null) {
          return Result.ok(null as T);
        } else if (fromList != null) {
          final stringData = await response.transform(utf8.decoder).join();
          return Result.ok(fromList(jsonDecode(stringData)));
        } else if (fromJson != null) {
          final stringData = await response.transform(utf8.decoder).join();
          return Result.ok(fromJson(jsonDecode(stringData)));
        } else {
          return Result.error(Exception("Please provide a parsing function"));
        }
      } else {
        return Result.error(Exception("Error patching $uri"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<void>> deleteRequest(
      Uri uri,
      HttpClient Function() clientFactory,
      Future<void> Function(HttpHeaders)? addHeaders) async {
    final client = clientFactory();
    try {
      final request = await client.deleteUrl(uri);
      if (addHeaders != null) {
        addHeaders(request.headers);
      }
      final response = await request.close();
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        return Result.ok(null);
      } else {
        return Result.error(Exception("Error deleting $uri"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }
}
