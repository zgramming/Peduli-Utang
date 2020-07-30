import 'dart:async';
import 'dart:io';

class ReusableRequestServer<T> {
  Future<T> requestServer(
    FutureOr<T> Function() requestServer, {
    Duration durationTimeout = const Duration(seconds: 30),
  }) async {
    assert(requestServer != null);
    try {
      return await requestServer();
    } on FormatException catch (error) {
      throw error.source;
    } on TimeoutException catch (_) {
      rethrow;
    } on SocketException catch (_) {
      rethrow;
    } catch (e) {
      throw e.toString();
    }
  }
}

final ReusableRequestServer reusableRequestServer = ReusableRequestServer();
