import 'package:app/src/core/common_widgets/empty_message_widget.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'custom_progress_indicator.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
    this.loading,
  });
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget? loading;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error:
          (e, st) => Padding(
            padding: const EdgeInsets.all(Sizes.p12),
            child: CenteredMessageWidget(e.toString()),
          ),
      loading: () => loading ?? CenteredProgressIndicator(),
    );
  }
}

/// Sliver equivalent of [AsyncValueWidget]
class AsyncValueSliverWidget<T> extends StatelessWidget {
  const AsyncValueSliverWidget({
    super.key,
    required this.value,
    required this.data,
    this.loading,
  });
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget? loading;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading:
          () =>
              SliverToBoxAdapter(child: loading ?? CenteredProgressIndicator()),
      error:
          (e, st) => SliverPadding(
            padding: const EdgeInsets.all(Sizes.p12),
            sliver: SliverToBoxAdapter(
              child: CenteredMessageWidget(e.toString()),
            ),
          ),
    );
  }
}
