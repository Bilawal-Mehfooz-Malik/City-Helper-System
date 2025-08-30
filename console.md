[INFO] ℹ️ INFO [AppLogger]: FakeAuth: Sent OTP "123456" to +923169298833
══╡ EXCEPTION CAUGHT BY WIDGETS LIBRARY ╞═══════════════════════════════════════════════════════════
The following assertion was thrown building OtpContent-[<AuthFlowStep.otp>](dependencies:
[InheritedCupertinoTheme, UncontrolledProviderScope, _InheritedTheme,
_LocalizationsScope-[GlobalKey#f654a]], state: _ConsumerState#69ee6):
A TextEditingController was used after being disposed.
Once you have called dispose() on a TextEditingController, it can no longer be used.

The relevant error-causing widget was:
  OtpContent-[<AuthFlowStep.otp>]
  OtpContent:file:///D:/Flutter%20Apps/City%20Helper%20System/app/lib/src/features/auth/presentation/auth_flow_screen.dart:111:17

When the exception was thrown, this was the stack:
dart-sdk/lib/_internal/js_dev_runtime/private/ddc_runtime/errors.dart 266:3       throw_
errors.dart:266
package:flutter/src/foundation/change_notifier.dart 182:9                         <fn>
change_notifier.dart:182
package:flutter/src/foundation/change_notifier.dart 188:14                        debugAssertNotDisposed
change_notifier.dart:188
package:flutter/src/foundation/change_notifier.dart 271:27                        addListener
change_notifier.dart:271
package:pin_code_fields/src/pin_code_fields.dart 454:29                           [_assignController]
pin_code_fields.dart:454
package:pin_code_fields/src/pin_code_fields.dart 347:5                            initState
pin_code_fields.dart:347
package:flutter/src/widgets/framework.dart 5842:55                                [_firstBuild]
framework.dart:5842
package:flutter/src/widgets/framework.dart 5691:5                                 mount
framework.dart:5691
package:flutter/src/widgets/framework.dart 4539:15                                inflateWidget
framework.dart:4539
package:flutter/src/widgets/framework.dart 7159:36                                inflateWidget
framework.dart:7159
package:flutter/src/widgets/framework.dart 7175:32                                mount
framework.dart:7175
...     Normal element mounting (9 frames)
package:flutter/src/widgets/framework.dart 4539:15                                inflateWidget
framework.dart:4539
package:flutter/src/widgets/framework.dart 3998:20                                updateChild
framework.dart:3998
package:flutter/src/widgets/framework.dart 7015:14                                update
framework.dart:7015
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 7015:14                                update
framework.dart:7015
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 7015:14                                update
framework.dart:7015
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 5787:5                                 update
framework.dart:5787
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 7015:14                                update
framework.dart:7015
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 7015:14                                update
framework.dart:7015
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 7015:14                                update
framework.dart:7015
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 7015:14                                update
framework.dart:7015
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 7015:14                                update
framework.dart:7015
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5874:11                                performRebuild
framework.dart:5874
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 5899:5                                 update
framework.dart:5899
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 7015:14                                update
framework.dart:7015
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 6041:5                                 update
framework.dart:6041
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 7015:14                                update
framework.dart:7015
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 6041:5                                 update
framework.dart:6041
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 7015:14                                update
framework.dart:7015
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 7015:14                                update
framework.dart:7015
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 7015:14                                update
framework.dart:7015
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 7015:14                                update
framework.dart:7015
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 7015:14                                update
framework.dart:7015
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5874:11                                performRebuild
framework.dart:5874
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 5899:5                                 update
framework.dart:5899
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 7015:14                                update
framework.dart:7015
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 7015:14                                update
framework.dart:7015
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 6041:5                                 update
framework.dart:6041
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 6041:5                                 update
framework.dart:6041
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5874:11                                performRebuild
framework.dart:5874
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 5899:5                                 update
framework.dart:5899
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 5787:5                                 update
framework.dart:5787
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5874:11                                performRebuild
framework.dart:5874
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 5899:5                                 update
framework.dart:5899
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 5787:5                                 update
framework.dart:5787
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 5787:5                                 update
framework.dart:5787
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 7015:14                                update
framework.dart:7015
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 5787:5                                 update
framework.dart:5787
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 4140:11                                updateChildren
framework.dart:4140
package:flutter/src/widgets/framework.dart 7192:17                                update
framework.dart:7192
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5874:11                                performRebuild
framework.dart:5874
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 5899:5                                 update
framework.dart:5899
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 6041:5                                 update
framework.dart:6041
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 7015:14                                update
framework.dart:7015
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 5787:5                                 update
framework.dart:5787
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 5787:5                                 update
framework.dart:5787
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 5787:5                                 update
framework.dart:5787
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 6041:5                                 update
framework.dart:6041
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 6041:5                                 update
framework.dart:6041
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 4140:11                                updateChildren
framework.dart:4140
package:flutter/src/widgets/framework.dart 7192:17                                update
framework.dart:7192
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 6041:5                                 update
framework.dart:6041
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5874:11                                performRebuild
framework.dart:5874
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 5899:5                                 update
framework.dart:5899
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5874:11                                performRebuild
framework.dart:5874
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 5899:5                                 update
framework.dart:5899
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 6041:5                                 update
framework.dart:6041
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5874:11                                performRebuild
framework.dart:5874
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 5899:5                                 update
framework.dart:5899
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 7015:14                                update
framework.dart:7015
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 6041:5                                 update
framework.dart:6041
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 7015:14                                update
framework.dart:7015
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5874:11                                performRebuild
framework.dart:5874
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 5899:5                                 update
framework.dart:5899
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5874:11                                performRebuild
framework.dart:5874
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 5899:5                                 update
framework.dart:5899
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 6041:5                                 update
framework.dart:6041
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 6041:5                                 update
framework.dart:6041
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 6041:5                                 update
framework.dart:6041
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5874:11                                performRebuild
framework.dart:5874
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 5899:5                                 update
framework.dart:5899
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 6041:5                                 update
framework.dart:6041
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5874:11                                performRebuild
framework.dart:5874
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 5899:5                                 update
framework.dart:5899
package:flutter/src/widgets/framework.dart 3982:14                                updateChild
framework.dart:3982
package:flutter/src/widgets/framework.dart 5738:16                                performRebuild
framework.dart:5738
package:flutter/src/widgets/framework.dart 5874:11                                performRebuild
framework.dart:5874
package:flutter/src/widgets/framework.dart 5427:7                                 rebuild
framework.dart:5427
package:flutter/src/widgets/framework.dart 2694:14                                [_tryRebuild]
framework.dart:2694
package:flutter/src/widgets/framework.dart 2752:11                                [_flushDirtyElements]
framework.dart:2752
package:flutter/src/widgets/framework.dart 3056:17                                buildScope
framework.dart:3056
package:flutter/src/widgets/binding.dart 1240:9                                   drawFrame
binding.dart:1240
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