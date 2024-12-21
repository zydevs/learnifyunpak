import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:learnifyunpak/main.dart';


abstract class NetworkInfoI {
  Future<bool> isConnected();

  Future<List<ConnectivityResult>> get ConnectivityResult;

  Stream<List<ConnectivityResult>> get onConnectivityChanged;
}

class NetworkInfo implements NetworkInfoI {
  Connectivity connectivity;

  static final NetworkInfoI _networkInfo = NetworkInfo._internal(connectivity());

  factory NetworkInfo() {
    return _networkInfo;
  }

  NetworkInfo._internal(this.connectivity) {
    connectivity = this.connectivity;
  }

  ///cheks internet is connected or not
  ///returns [true] if intnernet is connected
  ///else it will return [false]
  @override
  Future<bool> isConnected() async {
    final result = await ConnectivityResult;
    return !result.contains(ConnectivityResult.none);
  }

  // to check type of internet connectivity
  @override
  Future<List<ConnectivityResult>> get ConnectivityResult async {
    return connectivity.checkConnectivity();
  }

  //check the type on internet connection on changed of internet connection
  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      connectivity.onConnectivityChanged;
}

abstract class Failure {}

// General failures
class ServerFailure extends Failure {}

class ChacheFailure extends Failure {}

class NetworkFailure extends Failure {}

class ServerException implements Exception {}

class ChaheException implements Exception {}

class NetworkException implements Exception {}

///can be used for throwing [NoInternetException]
class NoInternetException implements Exception {
  late String _message;

  NoInternetException([String message = 'NointernetException Occurred']) {
    this._message = message;
  }

  @override
  String toString() {
    return _message;
  }
}