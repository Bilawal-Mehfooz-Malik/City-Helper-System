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

  final AsyncValue<T> value;
  final Widget? loading;
  final EdgeInsetsGeometry errorPadding;
  final Widget Function(T data) data;
  final Widget Function(Object error, StackTrace stackTrace)? error;

  @override
  Widget build(BuildContext context) {
    if (value.isLoading) {
      return loading ?? const CenteredCircularProgressIndicator();
    } else if (value.hasError) {
      return error?.call(value.error!, value.stackTrace!) ??
          CenteredMessageWidget(
            useResponsiveDesign: true,
            padding: errorPadding,
            message: value.error.toString(),
          );
    } else if (value.hasValue) {
      return data(value.value as T);
    } else {
      return const SizedBox.shrink();
    }
  }
}

/// Sliver equivalent of [AsyncValueWidget]
class AsyncValueSliverWidget<T> extends StatelessWidget {
  const AsyncValueSliverWidget({
    super.key,
    required this.value,
    required this.data,
    this.loading,
    this.error,
    this.errorPadding = const EdgeInsets.all(Sizes.p16),
  });

  final AsyncValue<T> value;
  final Widget? loading;
  final EdgeInsetsGeometry errorPadding;
  final Widget Function(T data) data;
  final Widget Function(Object error, StackTrace stackTrace)? error;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AsyncValueWidget<T>(
        value: value,
        data: data,
        error: error,
        loading: loading,
        errorPadding: errorPadding,
      ),
    );
  }
}
