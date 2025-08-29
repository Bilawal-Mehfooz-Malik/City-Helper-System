Performing hot reload...                                            3.6s
Reloaded application in 3,572ms.
══╡ EXCEPTION CAUGHT BY GESTURE ╞═══════════════════════════════════════════════════════════════════
The following assertion was thrown while handling a gesture:
Assertion failed:
file:///C:/Users/Bilawal%20Mehfooz/AppData/Local/Pub/Cache/hosted/pub.dev/go_router-16.0.0/lib/src/configuration.dart:268:12
_nameToPath.containsKey(name)
"unknown route name: pickYourLocation"

When the exception was thrown, this was the stack:
dart:sdk_internal 3747:11                                         throw_
dart:sdk_internal 3675:15                                         assertFailed
package:go_router/src/route_data.dart.lib.js 9237:56              namedLocation
package:go_router/src/route_data.dart.lib.js 4752:33              namedLocation
package:go_router/src/route_data.dart.lib.js 4795:80              pushNamed
package:go_router/src/route_data.dart.lib.js 1477:38              GoRouterHelper.pushNamed
package:app/src/routers/not_found_screen.dart.lib.js 14576:816    <fn>
package:flutter/src/gestures/recognizer.dart.lib.js 396:18        invokeCallback
package:flutter/src/gestures/tap.dart.lib.js 767:20               handleTapUp
package:flutter/src/gestures/tap.dart.lib.js 470:12               [_checkUp]
package:flutter/src/gestures/tap.dart.lib.js 415:23               handlePrimaryPointer
package:flutter/src/gestures/recognizer.dart.lib.js 800:16        handleEvent
dart:sdk_internal 3792:46                                         tear
package:flutter/src/gestures/pointer_router.dart.lib.js 92:9      [_dispatch]
package:flutter/src/gestures/pointer_router.dart.lib.js 118:26    <fn>
dart:sdk_internal 26455:9                                         forEach
package:flutter/src/gestures/pointer_router.dart.lib.js 116:29    [_dispatchEventToRoutes]
package:flutter/src/gestures/pointer_router.dart.lib.js 111:37    route
package:flutter/src/gestures/binding.dart.lib.js 545:26           handleEvent
package:flutter/src/gestures/binding.dart.lib.js 533:24           dispatchEvent
package:flutter/src/widgets/widget_preview.dart.lib.js 313625:13  dispatchEvent
package:flutter/src/gestures/binding.dart.lib.js 506:14           [_handlePointerEventImmediately]
package:flutter/src/gestures/binding.dart.lib.js 477:43           handlePointerEvent
package:flutter/src/gestures/binding.dart.lib.js 466:14           [_flushPointerEventQueue]
package:flutter/src/gestures/binding.dart.lib.js 441:40           [_handlePointerDataPacket]
dart:sdk_internal 3792:46                                         tear
dart:sdk_internal 274049:7                                        invoke1
dart:sdk_internal 239290:15                                       invokeOnPointerDataPacket
dart:sdk_internal 242103:49                                       [_sendToFramework]
dart:sdk_internal 242012:31                                       onPointerData
dart:sdk_internal 3792:46                                         tear
dart:sdk_internal 242887:28                                       <fn>
dart:sdk_internal 242815:9                                        <fn>
dart:sdk_internal 242354:11                                       loggedHandler
dart:sdk_internal 43193:59                                        runUnary
dart:sdk_internal 43163:34                                        <fn>
dart:sdk_internal 79701:14                                        _callDartFunctionFast1
dart:sdk_internal 79619:22                                        ret

Handler: "onTap"
Recognizer:
  TapGestureRecognizer#69adc
════════════════════════════════════════════════════════════════════════════════════════════════════