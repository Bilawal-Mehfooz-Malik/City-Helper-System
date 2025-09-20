√ Built build\app\outputs\flutter-apk\app-debug.apk
E/AndroidRuntime(10979): FATAL EXCEPTION: main
E/AndroidRuntime(10979): Process: com.bmenterprises.findout, PID: 10979
E/AndroidRuntime(10979): java.lang.RuntimeException: Unable to instantiate activity ComponentInfo{com.bmenterprises.findout/com.bmenterprises.findout.MainActivity}: java.lang.ClassNotFoundException: Didn't find class "com.bmenterprises.findout.MainActivity" on path: DexPathList[[zip file "/data/app/~~m8WqccYCvCFUedu9_tsYxA==/com.bmenterprises.findout-pmYqerN6F8K3iiJ4gD7fHg==/base.apk"],nativeLibraryDirectories=[/data/app/~~m8WqccYCvCFUedu9_tsYxA==/com.bmenterprises.findout-pmYqerN6F8K3iiJ4gD7fHg==/lib/x86_64, /data/app/~~m8WqccYCvCFUedu9_tsYxA==/com.bmenterprises.findout-pmYqerN6F8K3iiJ4gD7fHg==/base.apk!/lib/x86_64, /system/lib64, /system_ext/lib64]]
E/AndroidRuntime(10979): 	at android.app.ActivityThread.performLaunchActivity(ActivityThread.java:3954)
E/AndroidRuntime(10979): 	at android.app.ActivityThread.handleLaunchActivity(ActivityThread.java:4235)
E/AndroidRuntime(10979): 	at android.app.servertransaction.LaunchActivityItem.execute(LaunchActivityItem.java:112)
E/AndroidRuntime(10979): 	at android.app.servertransaction.TransactionExecutor.executeNonLifecycleItem(TransactionExecutor.java:174)
E/AndroidRuntime(10979): 	at android.app.servertransaction.TransactionExecutor.executeTransactionItems(TransactionExecutor.java:109)
E/AndroidRuntime(10979): 	at android.app.servertransaction.TransactionExecutor.execute(TransactionExecutor.java:81)
E/AndroidRuntime(10979): 	at android.app.ActivityThread$H.handleMessage(ActivityThread.java:2636)
E/AndroidRuntime(10979): 	at android.os.Handler.dispatchMessage(Handler.java:107)
E/AndroidRuntime(10979): 	at android.os.Looper.loopOnce(Looper.java:232)
E/AndroidRuntime(10979): 	at android.os.Looper.loop(Looper.java:317)
E/AndroidRuntime(10979): 	at android.app.ActivityThread.main(ActivityThread.java:8705)
E/AndroidRuntime(10979): 	at java.lang.reflect.Method.invoke(Native Method)
E/AndroidRuntime(10979): 	at com.android.internal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:580)
E/AndroidRuntime(10979): 	at com.android.internal.os.ZygoteInit.main(ZygoteInit.java:886)
E/AndroidRuntime(10979): Caused by: java.lang.ClassNotFoundException: Didn't find class "com.bmenterprises.findout.MainActivity" on path: DexPathList[[zip file "/data/app/~~m8WqccYCvCFUedu9_tsYxA==/com.bmenterprises.findout-pmYqerN6F8K3iiJ4gD7fHg==/base.apk"],nativeLibraryDirectories=[/data/app/~~m8WqccYCvCFUedu9_tsYxA==/com.bmenterprises.findout-pmYqerN6F8K3iiJ4gD7fHg==/lib/x86_64, /data/app/~~m8WqccYCvCFUedu9_tsYxA==/com.bmenterprises.findout-pmYqerN6F8K3iiJ4gD7fHg==/base.apk!/lib/x86_64, /system/lib64, /system_ext/lib64]]
E/AndroidRuntime(10979): 	at dalvik.system.BaseDexClassLoader.findClass(BaseDexClassLoader.java:259)
E/AndroidRuntime(10979): 	at java.lang.ClassLoader.loadClass(ClassLoader.java:637)
E/AndroidRuntime(10979): 	at java.lang.ClassLoader.loadClass(ClassLoader.java:573)
E/AndroidRuntime(10979): 	at android.app.AppComponentFactory.instantiateActivity(AppComponentFactory.java:95)
E/AndroidRuntime(10979): 	at androidx.core.app.CoreComponentFactory.instantiateActivity(CoreComponentFactory.java:44)
E/AndroidRuntime(10979): 	at android.app.Instrumentation.newActivity(Instrumentation.java:1448)
E/AndroidRuntime(10979): 	at android.app.ActivityThread.performLaunchActivity(ActivityThread.java:3941)
E/AndroidRuntime(10979): 	... 13 more