import 'package:flutter/material.dart';

class FetchHooks {
  final dynamic data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback refetch;

  FetchHooks(
      {required this.data,
      required this.isLoading,
      required this.error,
      required this.refetch});
}
