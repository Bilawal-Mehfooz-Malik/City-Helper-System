══╡ EXCEPTION CAUGHT BY WIDGETS LIBRARY ╞═══════════════════════════════════════════════════════════
The following assertion was thrown while finalizing the widget tree:
A TextEditingController was used after being disposed.
Once you have called dispose() on a TextEditingController, it can no longer be used.

When the exception was thrown, this was the stack:
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 266:3       throw_
errors.dart:266
package:flutter/src/foundation/change_notifier.dart 182:9                         <fn>
change_notifier.dart:182
package:flutter/src/foundation/change_notifier.dart 188:14                        debugAssertNotDisposed
change_notifier.dart:188
package:flutter/src/foundation/change_notifier.dart 377:27                        dispose
change_notifier.dart:377
package:app/src/features/auth/presentation/auth_flow_screen.dart 59:16            dispose
auth_flow_screen.dart:59
package:flutter/src/widgets/framework.dart 5922:5                                 unmount
framework.dart:5922
package:flutter_riverpod/src/consumer.dart 575:11                                 unmount
consumer.dart:575
package:flutter/src/widgets/framework.dart 2075:12                                [_unmount]
framework.dart:2075
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77  tear
operations.dart:117
dart-sdk/lib/internal/iterable.dart 49:7                                          forEach
iterable.dart:49
package:flutter/src/widgets/framework.dart 2084:15                                [_unmountAll]
framework.dart:2084
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77  tear
operations.dart:117
package:flutter/src/widgets/framework.dart 2965:7                                 lockState
framework.dart:2965
package:flutter/src/widgets/framework.dart 3288:7                                 finalizeTree
framework.dart:3288
package:flutter/src/widgets/binding.dart 1247:7                                   drawFrame
binding.dart:1247
package:flutter/src/rendering/binding.dart 495:5                                  [_handlePersistentFrameCallback]
binding.dart:495
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77  tear
operations.dart:117
package:flutter/src/scheduler/binding.dart 1438:7                                 [_invokeFrameCallback]
binding.dart:1438
package:flutter/src/scheduler/binding.dart 1351:9                                 handleDrawFrame
binding.dart:1351
package:flutter/src/scheduler/binding.dart 1204:5                                 [_handleDrawFrame]
binding.dart:1204
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77  tear
operations.dart:117
lib/_engine/engine/platform_dispatcher.dart 1312:5                                invoke
platform_dispatcher.dart:1312
lib/_engine/engine/platform_dispatcher.dart 255:5                                 invokeOnDrawFrame
platform_dispatcher.dart:255
lib/_engine/engine/frame_service.dart 189:32                                      [_renderFrame]
frame_service.dart:189
lib/_engine/engine/frame_service.dart 101:9                                       <fn>
frame_service.dart:101
dart-sdk/lib/async/zone.dart 1849:54                                              runUnary
zone.dart:1849
dart-sdk/lib/async/zone.dart 1804:26                                              <fn>
zone.dart:1804
dart-sdk/lib/_internal/js_dev_runtime/patch/js_allow_interop_patch.dart 224:27    _callDartFunctionFast1
js_allow_interop_patch.dart:224
════════════════════════════════════════════════════════════════════════════════════════════════════
[GoRouter] refreshing /auth
[GoRouter] redirecting to RouteMatchList#852e8(uri: /profile, matches: [RouteMatch#a3524(route: GoRoute#6a0e2(name: "category", path: "/")), RouteMatch#aac27(route: GoRoute#d1aec(name: "profile", path: "profile"))])