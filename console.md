[GoRouter] getting location for name: "auth"
[GoRouter] going to /auth
[INFO] ℹ️ INFO [AppLogger]: FakeAuth: Sent OTP "123456" to +923169298833
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
package:app/src/features/auth/presentation/widgets/otp_content.dart 41:5          dispose
otp_content.dart:41
package:flutter/src/widgets/framework.dart 5922:5                                 unmount
framework.dart:5922
package:flutter_riverpod/src/consumer.dart 575:11                                 unmount
consumer.dart:575
package:flutter/src/widgets/framework.dart 2075:12                                [_unmount]
framework.dart:2075
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 6994:7                                 visitChildren
framework.dart:6994
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 6994:7                                 visitChildren
framework.dart:6994
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 6994:7                                 visitChildren
framework.dart:6994
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 6994:7                                 visitChildren
framework.dart:6994
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 6994:7                                 visitChildren
framework.dart:6994
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 6994:7                                 visitChildren
framework.dart:6994
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 6994:7                                 visitChildren
framework.dart:6994
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 6994:7                                 visitChildren
framework.dart:6994
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 6994:7                                 visitChildren
framework.dart:6994
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 6994:7                                 visitChildren
framework.dart:6994
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 6994:7                                 visitChildren
framework.dart:6994
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 6994:7                                 visitChildren
framework.dart:6994
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 6994:7                                 visitChildren
framework.dart:6994
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 6994:7                                 visitChildren
framework.dart:6994
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 6994:7                                 visitChildren
framework.dart:6994
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 6994:7                                 visitChildren
framework.dart:6994
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 6994:7                                 visitChildren
framework.dart:6994
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 6994:7                                 visitChildren
framework.dart:6994
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 7118:9                                 visitChildren
framework.dart:7118
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 6994:7                                 visitChildren
framework.dart:6994
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 7118:9                                 visitChildren
framework.dart:7118
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
[GoRouter] refreshing /auth
As of February 21st, 2024, google.maps.Marker is deprecated. Please use google.maps.marker.AdvancedMarkerElement instead. At this time, google.maps.Marker is not scheduled to be discontinued, but google.maps.marker.AdvancedMarkerElement is recommended over google.maps.Marker. While google.maps.Marker will continue to receive bug fixes for any major regressions, existing bugs in google.maps.Marker will not be addressed. At least 12 months notice will be given before support is discontinued. Please see https://developers.google.com/maps/deprecations for additional details and https://developers.google.com/maps/documentation/javascript/advanced-markers/migration for the migration guide.
[GoRouter] redirecting to RouteMatchList#9d2a9(uri: /profile, matches: [RouteMatch#dbb48(route: GoRoute#03752(name: "category", path: "/")), RouteMatch#11c49(route: GoRoute#c7859(name: "profile", path: "profile"))])
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 6994:7                                 visitChildren
framework.dart:6994
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 6994:7                                 visitChildren
framework.dart:6994
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
package:flutter/src/widgets/framework.dart 2073:7                                 <fn>
framework.dart:2073
package:flutter/src/widgets/framework.dart 5763:7                                 visitChildren
framework.dart:5763
package:flutter/src/widgets/framework.dart 2071:12                                [_unmount]
framework.dart:2071
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
DartError: Assertion failed: file:///C:/src/flutter/packages/flutter/lib/src/widgets/framework.dart:5238:12
framework.dart:5238
_lifecycleState != _ElementLifecycle.defunct
is not true
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 266:3                   throw_
errors.dart:266
dart-sdk/lib/_internal/js_dev_runtime/private/profile.dart 117:39                             assertFailed
profile.dart:117
package:flutter/src/widgets/framework.dart 5238:49                                            markNeedsBuild
framework.dart:5238
package:flutter_riverpod/src/consumer.dart 566:20                                             <fn>
consumer.dart:566
package:riverpod/src/framework/provider_base.dart 98:41                                       <fn>
provider_base.dart:98
dart-sdk/lib/async/zone.dart 1790:9                                                           runBinaryGuarded
zone.dart:1790
package:riverpod/src/framework/element.dart 542:20                                            <fn>
element.dart:542
package:riverpod/src/result.dart 74:16                                                        map
result.dart:74
package:riverpod/src/framework/element.dart 536:13                                            [_notifyListeners]
element.dart:536
package:riverpod/src/framework/element.dart 140:7                                             setState
element.dart:140
package:riverpod/src/common.dart 16:8                                                         AsyncTransition.asyncTransition
common.dart:16
package:riverpod/src/async_notifier/base.dart 228:5                                           [_onLoading]
base.dart:228
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77              tear
operations.dart:117
package:riverpod/src/common.dart 418:19                                                       map
common.dart:418
package:riverpod/src/async_notifier/base.dart 212:13                                          set state
base.dart:212
package:riverpod/src/async_notifier.dart 66:5                                                 set state
async_notifier.dart:66
package:app/src/features/auth/presentation/controllers/auth_controller.dart 72:5              <fn>
auth_controller.dart:72
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 622:19                           <fn>
async_patch.dart:622
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 647:23                           <fn>
async_patch.dart:647
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 541:3                            _asyncStartSync
async_patch.dart:541
package:app/src/features/auth/presentation/controllers/auth_controller.dart 68:28             createUser
auth_controller.dart:68
package:app/src/features/auth/presentation/widgets/profile_content.dart 104:27                <fn>
profile_content.dart:104
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 622:19                           <fn>
async_patch.dart:622
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 647:23                           <fn>
async_patch.dart:647
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 593:31                           <fn>
async_patch.dart:593
dart-sdk/lib/async/zone.dart 1849:54                                                          runUnary
zone.dart:1849
dart-sdk/lib/async/future_impl.dart 224:18                                                    handleValue
future_impl.dart:224
dart-sdk/lib/async/future_impl.dart 951:44                                                    handleValueCallback
future_impl.dart:951
dart-sdk/lib/async/future_impl.dart 980:13                                                    _propagateToListeners
future_impl.dart:980
dart-sdk/lib/async/future_impl.dart 723:5                                                     [_completeWithValue]
future_impl.dart:723
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 503:7                            complete
async_patch.dart:503
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 570:12                           _asyncReturn
async_patch.dart:570
package:app/src/features/auth/presentation/controllers/profile_location_controller.dart 54:3  <fn>
profile_location_controller.dart:54
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 622:19                           <fn>
async_patch.dart:622
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 647:23                           <fn>
async_patch.dart:647
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 593:31                           <fn>
async_patch.dart:593
dart-sdk/lib/async/zone.dart 1849:54                                                          runUnary
zone.dart:1849
dart-sdk/lib/async/future_impl.dart 224:18                                                    handleValue
future_impl.dart:224
dart-sdk/lib/async/future_impl.dart 951:44                                                    handleValueCallback
future_impl.dart:951
dart-sdk/lib/async/future_impl.dart 980:13                                                    _propagateToListeners
future_impl.dart:980
dart-sdk/lib/async/future_impl.dart 723:5                                                     [_completeWithValue]
future_impl.dart:723
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 503:7                            complete
async_patch.dart:503
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 570:12                           _asyncReturn
async_patch.dart:570
package:app/src/features/startup/data/real/user_location_repository.dart 28:3                 <fn>
user_location_repository.dart:28
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 622:19                           <fn>
async_patch.dart:622
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 647:23                           <fn>
async_patch.dart:647
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 593:31                           <fn>
async_patch.dart:593
dart-sdk/lib/async/zone.dart 1849:54                                                          runUnary
zone.dart:1849
dart-sdk/lib/async/future_impl.dart 224:18                                                    handleValue
future_impl.dart:224
dart-sdk/lib/async/future_impl.dart 951:44                                                    handleValueCallback
future_impl.dart:951
dart-sdk/lib/async/future_impl.dart 980:13                                                    _propagateToListeners
future_impl.dart:980
dart-sdk/lib/async/future_impl.dart 723:5                                                     [_completeWithValue]
future_impl.dart:723
dart-sdk/lib/async/future_impl.dart 1067:18                                                   <fn>
future_impl.dart:1067
dart-sdk/lib/async/zone.dart 1849:54                                                          runUnary
zone.dart:1849
dart-sdk/lib/async/future_impl.dart 224:18                                                    handleValue
future_impl.dart:224
dart-sdk/lib/async/future_impl.dart 951:44                                                    handleValueCallback
future_impl.dart:951
dart-sdk/lib/async/future_impl.dart 980:13                                                    _propagateToListeners
future_impl.dart:980
dart-sdk/lib/async/future_impl.dart 723:5                                                     [_completeWithValue]
future_impl.dart:723
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 503:7                            complete
async_patch.dart:503
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 570:12                           _asyncReturn
async_patch.dart:570
package:app/src/features/startup/data/real/user_location_repository.dart 25:27                <fn>
user_location_repository.dart:25
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 622:19                           <fn>
async_patch.dart:622
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 647:23                           <fn>
async_patch.dart:647
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 593:31                           <fn>
async_patch.dart:593
dart-sdk/lib/async/zone.dart 1849:54                                                          runUnary
zone.dart:1849
dart-sdk/lib/async/future_impl.dart 224:18                                                    handleValue
future_impl.dart:224
dart-sdk/lib/async/future_impl.dart 951:44                                                    handleValueCallback
future_impl.dart:951
dart-sdk/lib/async/future_impl.dart 980:13                                                    _propagateToListeners
future_impl.dart:980
dart-sdk/lib/async/future_impl.dart 723:5                                                     [_completeWithValue]
future_impl.dart:723
dart-sdk/lib/async/future_impl.dart 807:7                                                     callback
future_impl.dart:807
dart-sdk/lib/async/schedule_microtask.dart 40:11                                              _microtaskLoop
schedule_microtask.dart:40
dart-sdk/lib/async/schedule_microtask.dart 49:5                                               _startMicrotaskLoop
schedule_microtask.dart:49
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77              tear
operations.dart:117
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 186:7                            <fn>
async_patch.dart:186
[INFO] ℹ️ INFO [AppLogger]: FakeImageUpload: Storing image for user 70f60ac9-fd90-4b63-8a4c-3ac11d0ed1b6, size:336431
[INFO] ℹ️ INFO [AppLogger]: CustomImage: Reading in-memory image for user 70f60ac9-fd90-4b63-8a4c-3ac11d0ed1b6
[WARNING] ⚠️ WARNING [AppLogger]: CustomImage: No in-memory image found for user 70f60ac9-fd90-4b63-8a4c-3ac11d0ed1b6
[GoRouter] popping /profile
[GoRouter] restoring /
DartError: Assertion failed: file:///C:/src/flutter/packages/flutter/lib/src/widgets/framework.dart:5238:12
framework.dart:5238
_lifecycleState != _ElementLifecycle.defunct
is not true
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 266:3        throw_
errors.dart:266
dart-sdk/lib/_internal/js_dev_runtime/private/profile.dart 117:39                  assertFailed
profile.dart:117
package:flutter/src/widgets/framework.dart 5238:49                                 markNeedsBuild
framework.dart:5238
package:flutter_riverpod/src/consumer.dart 566:20                                  <fn>
consumer.dart:566
package:riverpod/src/framework/provider_base.dart 98:41                            <fn>
provider_base.dart:98
dart-sdk/lib/async/zone.dart 1790:9                                                runBinaryGuarded
zone.dart:1790
package:riverpod/src/framework/element.dart 542:20                                 <fn>
element.dart:542
package:riverpod/src/result.dart 74:16                                             map
result.dart:74
package:riverpod/src/framework/element.dart 536:13                                 [_notifyListeners]
element.dart:536
package:riverpod/src/framework/element.dart 140:7                                  setState
element.dart:140
package:riverpod/src/common.dart 16:8                                              AsyncTransition.asyncTransition
common.dart:16
package:riverpod/src/async_notifier/base.dart 284:7                                onData
base.dart:284
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77   tear
operations.dart:117
package:riverpod/src/common.dart 346:16                                            map
common.dart:346
package:riverpod/src/async_notifier/base.dart 212:13                               set state
base.dart:212
package:riverpod/src/async_notifier.dart 66:5                                      set state
async_notifier.dart:66
package:app/src/features/auth/presentation/controllers/auth_controller.dart 81:5   <fn>
auth_controller.dart:81
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 622:19                <fn>
async_patch.dart:622
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 647:23                <fn>
async_patch.dart:647
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 593:31                <fn>
async_patch.dart:593
dart-sdk/lib/async/zone.dart 1849:54                                               runUnary
zone.dart:1849
dart-sdk/lib/async/future_impl.dart 224:18                                         handleValue
future_impl.dart:224
dart-sdk/lib/async/future_impl.dart 951:44                                         handleValueCallback
future_impl.dart:951
dart-sdk/lib/async/future_impl.dart 980:13                                         _propagateToListeners
future_impl.dart:980
dart-sdk/lib/async/future_impl.dart 723:5                                          [_completeWithValue]
future_impl.dart:723
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 503:7                 complete
async_patch.dart:503
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 570:12                _asyncReturn
async_patch.dart:570
package:riverpod/src/common.dart 189:3                                             <fn>
common.dart:189
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 622:19                <fn>
async_patch.dart:622
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 647:23                <fn>
async_patch.dart:647
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 593:31                <fn>
async_patch.dart:593
dart-sdk/lib/async/zone.dart 1849:54                                               runUnary
zone.dart:1849
dart-sdk/lib/async/future_impl.dart 224:18                                         handleValue
future_impl.dart:224
dart-sdk/lib/async/future_impl.dart 951:44                                         handleValueCallback
future_impl.dart:951
dart-sdk/lib/async/future_impl.dart 980:13                                         _propagateToListeners
future_impl.dart:980
dart-sdk/lib/async/future_impl.dart 723:5                                          [_completeWithValue]
future_impl.dart:723
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 503:7                 complete
async_patch.dart:503
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 570:12                _asyncReturn
async_patch.dart:570
package:app/src/features/auth/presentation/controllers/auth_controller.dart 77:45  <fn>
auth_controller.dart:77
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 622:19                <fn>
async_patch.dart:622
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 647:23                <fn>
async_patch.dart:647
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 593:31                <fn>
async_patch.dart:593
dart-sdk/lib/async/zone.dart 1849:54                                               runUnary
zone.dart:1849
dart-sdk/lib/async/future_impl.dart 224:18                                         handleValue
future_impl.dart:224
dart-sdk/lib/async/future_impl.dart 951:44                                         handleValueCallback
future_impl.dart:951
dart-sdk/lib/async/future_impl.dart 980:13                                         _propagateToListeners
future_impl.dart:980
dart-sdk/lib/async/future_impl.dart 723:5                                          [_completeWithValue]
future_impl.dart:723
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 503:7                 complete
async_patch.dart:503
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 570:12                _asyncReturn
async_patch.dart:570
package:app/src/features/auth/application/fake_auth_service.dart 71:3              <fn>
fake_auth_service.dart:71
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 622:19                <fn>
async_patch.dart:622
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 647:23                <fn>
async_patch.dart:647
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 593:31                <fn>
async_patch.dart:593
dart-sdk/lib/async/zone.dart 1849:54                                               runUnary
zone.dart:1849
dart-sdk/lib/async/future_impl.dart 224:18                                         handleValue
future_impl.dart:224
dart-sdk/lib/async/future_impl.dart 951:44                                         handleValueCallback
future_impl.dart:951
dart-sdk/lib/async/future_impl.dart 980:13                                         _propagateToListeners
future_impl.dart:980
dart-sdk/lib/async/future_impl.dart 723:5                                          [_completeWithValue]
future_impl.dart:723
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 503:7                 complete
async_patch.dart:503
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 570:12                _asyncReturn
async_patch.dart:570
package:app/src/features/auth/data/fake/fake_user_repository.dart 28:3             <fn>
fake_user_repository.dart:28
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 622:19                <fn>
async_patch.dart:622
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 647:23                <fn>
async_patch.dart:647
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 593:31                <fn>
async_patch.dart:593
dart-sdk/lib/async/zone.dart 1849:54                                               runUnary
zone.dart:1849
dart-sdk/lib/async/future_impl.dart 224:18                                         handleValue
future_impl.dart:224
dart-sdk/lib/async/future_impl.dart 951:44                                         handleValueCallback
future_impl.dart:951
dart-sdk/lib/async/future_impl.dart 980:13                                         _propagateToListeners
future_impl.dart:980
dart-sdk/lib/async/future_impl.dart 723:5                                          [_completeWithValue]
future_impl.dart:723
dart-sdk/lib/async/future_impl.dart 807:7                                          callback
future_impl.dart:807
dart-sdk/lib/async/schedule_microtask.dart 40:11                                   _microtaskLoop
schedule_microtask.dart:40
dart-sdk/lib/async/schedule_microtask.dart 49:5                                    _startMicrotaskLoop
schedule_microtask.dart:49
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77   tear
operations.dart:117
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 186:7                 <fn>
async_patch.dart:186
DartError: Bad state: Cannot use "ref" after the widget was disposed.
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 266:3       throw_
errors.dart:266
package:flutter_riverpod/src/consumer.dart 550:7                                  [_assertNotDisposed]
consumer.dart:550
package:flutter_riverpod/src/consumer.dart 619:5                                  read
consumer.dart:619
package:app/src/features/auth/presentation/widgets/profile_content.dart 50:63     <fn>
profile_content.dart:50
dart-sdk/lib/async/future.dart 287:40                                             callback
future.dart:287
dart-sdk/lib/async/schedule_microtask.dart 40:11                                  _microtaskLoop
schedule_microtask.dart:40
dart-sdk/lib/async/schedule_microtask.dart 49:5                                   _startMicrotaskLoop
schedule_microtask.dart:49
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77  tear
operations.dart:117
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 186:7                <fn>