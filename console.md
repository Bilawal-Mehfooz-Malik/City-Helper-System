I went from auth to otp screen and then clicked on change button went back to phone number screen and this is what i see in console:
-------------------------------
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
package:app/src/features/auth/presentation/widgets/otp_content.dart 44:5          dispose
otp_content.dart:44
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
-------------------------------
look went to otp again:
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
package:riverpod/src/async_notifier/base.dart 228:5                                [_onLoading]
base.dart:228
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77   tear
operations.dart:117
package:riverpod/src/common.dart 418:19                                            map
common.dart:418
package:riverpod/src/async_notifier/base.dart 212:13                               set state
base.dart:212
package:riverpod/src/async_notifier.dart 66:5                                      set state
async_notifier.dart:66
package:app/src/features/auth/presentation/controllers/auth_controller.dart 33:5   <fn>
auth_controller.dart:33
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 622:19                <fn>
async_patch.dart:622
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 647:23                <fn>
async_patch.dart:647
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 541:3                 _asyncStartSync
async_patch.dart:541
package:app/src/features/auth/presentation/controllers/auth_controller.dart 31:28  sendOtp
auth_controller.dart:31
package:app/src/features/auth/presentation/auth_flow_screen.dart 40:38             <fn>
auth_flow_screen.dart:40
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 622:19                <fn>
async_patch.dart:622
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 647:23                <fn>
async_patch.dart:647
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 541:3                 _asyncStartSync
async_patch.dart:541
package:app/src/features/auth/presentation/auth_flow_screen.dart 38:16             [_submitPhoneNumber]
auth_flow_screen.dart:38
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77   tear
operations.dart:117
package:flutter/src/material/ink_well.dart 1203:21                                 handleTap
ink_well.dart:1203
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77   tear
operations.dart:117
package:flutter/src/gestures/recognizer.dart 345:24                                invokeCallback
recognizer.dart:345
package:flutter/src/gestures/tap.dart 737:11                                       handleTapUp
tap.dart:737
package:flutter/src/gestures/tap.dart 362:5                                        [_checkUp]
tap.dart:362
package:flutter/src/gestures/tap.dart 293:7                                        handlePrimaryPointer
tap.dart:293
package:flutter/src/gestures/recognizer.dart 706:9                                 handleEvent
recognizer.dart:706
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77   tear
operations.dart:117
package:flutter/src/gestures/pointer_router.dart 97:7                              [_dispatch]
pointer_router.dart:97
package:flutter/src/gestures/pointer_router.dart 143:9                             <fn>
pointer_router.dart:143
dart-sdk/lib/_internal/js_dev_runtime/private/linked_hash_map.dart 21:7            forEach
linked_hash_map.dart:21
package:flutter/src/gestures/pointer_router.dart 141:17                            [_dispatchEventToRoutes]
pointer_router.dart:141
package:flutter/src/gestures/pointer_router.dart 131:7                             route
pointer_router.dart:131
package:flutter/src/gestures/binding.dart 530:5                                    handleEvent
binding.dart:530
package:flutter/src/gestures/binding.dart 499:14                                   dispatchEvent
binding.dart:499
package:flutter/src/rendering/binding.dart 473:11                                  dispatchEvent
binding.dart:473
package:flutter/src/gestures/binding.dart 437:7                                    [_handlePointerEventImmediately]
binding.dart:437
package:flutter/src/gestures/binding.dart 394:5                                    handlePointerEvent
binding.dart:394
package:flutter/src/gestures/binding.dart 341:7                                    [_flushPointerEventQueue]
binding.dart:341
package:flutter/src/gestures/binding.dart 308:9                                    [_handlePointerDataPacket]
binding.dart:308
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77   tear
operations.dart:117
lib/_engine/engine/platform_dispatcher.dart 1327:5                                 invoke1
platform_dispatcher.dart:1327
lib/_engine/engine/platform_dispatcher.dart 281:5                                  invokeOnPointerDataPacket
platform_dispatcher.dart:281
lib/_engine/engine/pointer_binding.dart 411:30                                     [_sendToFramework]
pointer_binding.dart:411
lib/_engine/engine/pointer_binding.dart 231:7                                      onPointerData
pointer_binding.dart:231
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77   tear
operations.dart:117
lib/_engine/engine/pointer_binding.dart 1029:20                                    <fn>
pointer_binding.dart:1029
lib/_engine/engine/pointer_binding.dart 912:7                                      <fn>
pointer_binding.dart:912
lib/_engine/engine/pointer_binding.dart 535:9                                      loggedHandler
pointer_binding.dart:535
dart-sdk/lib/async/zone.dart 1849:54                                               runUnary
zone.dart:1849
dart-sdk/lib/async/zone.dart 1804:26                                               <fn>
zone.dart:1804
dart-sdk/lib/_internal/js_dev_runtime/patch/js_allow_interop_patch.dart 224:27     _callDartFunctionFast1
js_allow_interop_patch.dart:224
[INFO] ℹ️ INFO [AppLogger]: FakeAuth: Sent OTP "123456" to +923169298833
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
package:app/src/features/auth/presentation/controllers/auth_controller.dart 45:5   <fn>
auth_controller.dart:45
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
package:app/src/features/auth/presentation/controllers/auth_controller.dart 36:59  <fn>
auth_controller.dart:36
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
package:app/src/features/auth/data/fake/fake_auth_repository.dart 25:3             <fn>
fake_auth_repository.dart:25
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
dart-sdk/lib/async/future_impl.dart 714:7                                          [_complete]
future_impl.dart:714
dart-sdk/lib/async/future.dart 415:15                                              <fn>
future.dart:415
dart-sdk/lib/_internal/js_dev_runtime/private/isolate_helper.dart 47:11            internalCallback
isolate_helper.dart:47
-------------------------------------------
went to profile i was on profile still redirection called again no purpose of it:
------------------------------------------
artError: Assertion failed: file:///C:/src/flutter/packages/flutter/lib/src/widgets/framework.dart:5238:12
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
package:riverpod/src/async_notifier/base.dart 228:5                                [_onLoading]
base.dart:228
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77   tear
operations.dart:117
package:riverpod/src/common.dart 418:19                                            map
common.dart:418
package:riverpod/src/async_notifier/base.dart 212:13                               set state
base.dart:212
package:riverpod/src/async_notifier.dart 66:5                                      set state
async_notifier.dart:66
package:app/src/features/auth/presentation/controllers/auth_controller.dart 50:5   <fn>
auth_controller.dart:50
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 622:19                <fn>
async_patch.dart:622
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 647:23                <fn>
async_patch.dart:647
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 541:3                 _asyncStartSync
async_patch.dart:541
package:app/src/features/auth/presentation/controllers/auth_controller.dart 49:28  verifyOtp
auth_controller.dart:49
package:app/src/features/auth/presentation/auth_flow_screen.dart 55:38             <fn>
auth_flow_screen.dart:55
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 622:19                <fn>
async_patch.dart:622
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 647:23                <fn>
async_patch.dart:647
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 541:3                 _asyncStartSync
async_patch.dart:541
package:app/src/features/auth/presentation/auth_flow_screen.dart 53:16             [_verifyOtp]
auth_flow_screen.dart:53
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77   tear
operations.dart:117
package:app/src/features/auth/presentation/widgets/otp_content.dart 121:43         <fn>
otp_content.dart:121
package:flutter/src/material/ink_well.dart 1203:21                                 handleTap
ink_well.dart:1203
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77   tear
operations.dart:117
package:flutter/src/gestures/recognizer.dart 345:24                                invokeCallback
recognizer.dart:345
package:flutter/src/gestures/tap.dart 737:11                                       handleTapUp
tap.dart:737
package:flutter/src/gestures/tap.dart 362:5                                        [_checkUp]
tap.dart:362
package:flutter/src/gestures/tap.dart 293:7                                        handlePrimaryPointer
tap.dart:293
package:flutter/src/gestures/recognizer.dart 706:9                                 handleEvent
recognizer.dart:706
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77   tear
operations.dart:117
package:flutter/src/gestures/pointer_router.dart 97:7                              [_dispatch]
pointer_router.dart:97
package:flutter/src/gestures/pointer_router.dart 143:9                             <fn>
pointer_router.dart:143
dart-sdk/lib/_internal/js_dev_runtime/private/linked_hash_map.dart 21:7            forEach
linked_hash_map.dart:21
package:flutter/src/gestures/pointer_router.dart 141:17                            [_dispatchEventToRoutes]
pointer_router.dart:141
package:flutter/src/gestures/pointer_router.dart 131:7                             route
pointer_router.dart:131
package:flutter/src/gestures/binding.dart 530:5                                    handleEvent
binding.dart:530
package:flutter/src/gestures/binding.dart 499:14                                   dispatchEvent
binding.dart:499
package:flutter/src/rendering/binding.dart 473:11                                  dispatchEvent
binding.dart:473
package:flutter/src/gestures/binding.dart 437:7                                    [_handlePointerEventImmediately]
binding.dart:437
package:flutter/src/gestures/binding.dart 394:5                                    handlePointerEvent
binding.dart:394
package:flutter/src/gestures/binding.dart 341:7                                    [_flushPointerEventQueue]
binding.dart:341
package:flutter/src/gestures/binding.dart 308:9                                    [_handlePointerDataPacket]
binding.dart:308
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77   tear
operations.dart:117
lib/_engine/engine/platform_dispatcher.dart 1327:5                                 invoke1
platform_dispatcher.dart:1327
lib/_engine/engine/platform_dispatcher.dart 281:5                                  invokeOnPointerDataPacket
platform_dispatcher.dart:281
lib/_engine/engine/pointer_binding.dart 411:30                                     [_sendToFramework]
pointer_binding.dart:411
lib/_engine/engine/pointer_binding.dart 231:7                                      onPointerData
pointer_binding.dart:231
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77   tear
operations.dart:117
lib/_engine/engine/pointer_binding.dart 1029:20                                    <fn>
pointer_binding.dart:1029
lib/_engine/engine/pointer_binding.dart 912:7                                      <fn>
pointer_binding.dart:912
lib/_engine/engine/pointer_binding.dart 535:9                                      loggedHandler
pointer_binding.dart:535
dart-sdk/lib/async/zone.dart 1849:54                                               runUnary
zone.dart:1849
dart-sdk/lib/async/zone.dart 1804:26                                               <fn>
zone.dart:1804
dart-sdk/lib/_internal/js_dev_runtime/patch/js_allow_interop_patch.dart 224:27     _callDartFunctionFast1
js_allow_interop_patch.dart:224
Another exception was thrown: A TextEditingController was used after being disposed.
[GoRouter] refreshing /auth
[GoRouter] redirecting to RouteMatchList#bbc47(uri: /profile, matches: [RouteMatch#078ad(route: GoRoute#fe377(name: "category", path: "/")), RouteMatch#624da(route: GoRoute#77315(name: "profile", path: "profile"))])
DartError: Assertion failed: file:///C:/src/flutter/packages/flutter/lib/src/widgets/framework.dart:5238:12
framework.dart:5238
_lifecycleState != _ElementLifecycle.defunct
is not true
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 266:3       throw_
errors.dart:266
dart-sdk/lib/_internal/js_dev_runtime/private/profile.dart 117:39                 assertFailed
profile.dart:117
package:flutter/src/widgets/framework.dart 5238:49                                markNeedsBuild
framework.dart:5238
package:flutter_riverpod/src/consumer.dart 566:20                                 <fn>
consumer.dart:566
package:riverpod/src/framework/provider_base.dart 98:41                           <fn>
provider_base.dart:98
dart-sdk/lib/async/zone.dart 1790:9                                               runBinaryGuarded
zone.dart:1790
package:riverpod/src/framework/element.dart 542:20                                <fn>
element.dart:542
package:riverpod/src/result.dart 74:16                                            map
result.dart:74
package:riverpod/src/framework/element.dart 536:13                                [_notifyListeners]
element.dart:536
package:riverpod/src/framework/element.dart 140:7                                 setState
element.dart:140
package:riverpod/src/common.dart 16:8                                             AsyncTransition.asyncTransition
common.dart:16
package:riverpod/src/async_notifier/base.dart 284:7                               onData
base.dart:284
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/operations.dart 117:77  tear
operations.dart:117
package:riverpod/src/common.dart 346:16                                           map
common.dart:346
package:riverpod/src/async_notifier/base.dart 212:13                              set state
base.dart:212
package:riverpod/src/async_notifier.dart 66:5                                     set state
async_notifier.dart:66
package:app/src/features/auth/presentation/controllers/auth_controller.dart 62:5  <fn>
auth_controller.dart:62
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 622:19               <fn>
async_patch.dart:622
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 647:23               <fn>
async_patch.dart:647
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 593:31               <fn>
async_patch.dart:593
dart-sdk/lib/async/zone.dart 1849:54                                              runUnary
zone.dart:1849
dart-sdk/lib/async/future_impl.dart 224:18                                        handleValue
future_impl.dart:224
dart-sdk/lib/async/future_impl.dart 951:44                                        handleValueCallback
future_impl.dart:951
dart-sdk/lib/async/future_impl.dart 980:13                                        _propagateToListeners
future_impl.dart:980
dart-sdk/lib/async/future_impl.dart 723:5                                         [_completeWithValue]
future_impl.dart:723
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 503:7                complete
async_patch.dart:503
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 570:12               _asyncReturn
async_patch.dart:570
package:riverpod/src/common.dart 189:3                                            <fn>
common.dart:189
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 622:19               <fn>
async_patch.dart:622
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 647:23               <fn>
async_patch.dart:647
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 593:31               <fn>
async_patch.dart:593
dart-sdk/lib/async/zone.dart 1849:54                                              runUnary
zone.dart:1849
dart-sdk/lib/async/future_impl.dart 224:18                                        handleValue
future_impl.dart:224
dart-sdk/lib/async/future_impl.dart 951:44                                        handleValueCallback
future_impl.dart:951
dart-sdk/lib/async/future_impl.dart 980:13                                        _propagateToListeners
future_impl.dart:980
dart-sdk/lib/async/future_impl.dart 723:5                                         [_completeWithValue]
future_impl.dart:723
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 503:7                complete
async_patch.dart:503
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 570:12               _asyncReturn
async_patch.dart:570
package:app/src/features/auth/data/fake/fake_auth_repository.dart 53:3            <fn>
fake_auth_repository.dart:53
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 622:19               <fn>
async_patch.dart:622
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 647:23               <fn>
async_patch.dart:647
dart-sdk/lib/_internal/js_dev_runtime/patch/async_patch.dart 593:31               <fn>
async_patch.dart:593
dart-sdk/lib/async/zone.dart 1849:54                                              runUnary
zone.dart:1849
dart-sdk/lib/async/future_impl.dart 224:18                                        handleValue
future_impl.dart:224
dart-sdk/lib/async/future_impl.dart 951:44                                        handleValueCallback
future_impl.dart:951
dart-sdk/lib/async/future_impl.dart 980:13                                        _propagateToListeners
future_impl.dart:980
dart-sdk/lib/async/future_impl.dart 714:7                                         [_complete]
future_impl.dart:714
dart-sdk/lib/async/future.dart 415:15                                             <fn>
future.dart:415
dart-sdk/lib/_internal/js_dev_runtime/private/isolate_helper.dart 47:11           internalCallback
isolate_helper.dart:47
------------------------------------------------------
when i click finish signup i get this:
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
package:app/src/features/auth/presentation/widgets/profile_content.dart 100:27                <fn>
profile_content.dart:100
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
package:app/src/features/auth/presentation/widgets/profile_content.dart 100:27                <fn>
profile_content.dart:100
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