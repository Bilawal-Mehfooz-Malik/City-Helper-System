import 'package:app/src/core/common_widgets/custom_progress_indicator.dart';
import 'package:app/src/core/common_widgets/empty_message_widget.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A simple widget to handle AsyncValue states: data, loading, and error.
class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
    this.loading,
    this.error,
    this.errorPadding = const EdgeInsets.all(Sizes.p16),
  });

  final Widget? loading;
  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final Widget Function(Object error, StackTrace stackTrace)? error;
  final EdgeInsetsGeometry errorPadding;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () => loading ?? const CenteredProgressIndicator(),
      error: (e, st) {
        if (error != null) {
          return error!(e, st);
        }
        return Padding(
          padding: errorPadding,
          child: CenteredMessageWidget(message: e.toString()),
        );
      },
    );
  }
}

/// Sliver equivalent of [AsyncValueWidget]
class AsyncValueSliverWidget<T> extends StatelessWidget {
  const AsyncValueSliverWidget({
    super.key,
    required this.value,
    required this.data,
    required this.loading,
    required this.error,
    required this.errorPadding,
  });

  final Widget loading;
  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final EdgeInsetsGeometry errorPadding;
  final Widget Function(Object error, StackTrace stackTrace) error;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AsyncValueWidget(
        value: value,
        data: data,
        error: error,
        loading: loading,
        errorPadding: errorPadding,
      ),
    );
  }
}
