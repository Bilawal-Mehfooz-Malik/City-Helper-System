class UIError {
  final String title;
  final String message;
  final String? cancel;
  final String confirm;
  final Future<void> Function()? onConfirm;

  UIError({
    required this.title,
    required this.message,
    this.cancel,
    required this.confirm,
    this.onConfirm,
  });
}
