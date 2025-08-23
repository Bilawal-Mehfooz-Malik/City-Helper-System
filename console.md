
Filter or search logs...
12:21:26
I
functions
Watching "D:\Flutter Apps\City Helper System\app\functions" for Cloud Functions...
12:21:27
I
+  functions: Using node@22 from host.
12:21:28
I
Serving at port 8649
12:21:34
I
functions
Loaded functions definitions from source: setOpenStatus, migrateResidenceData, onWrite_food_listings.
12:21:34
I
functions
http function initialized (http://127.0.0.1:5001/city-helper-system-8de0d/us-central1/setOpenStatus).
12:21:34
I
functions
http function initialized (http://127.0.0.1:5001/city-helper-system-8de0d/us-central1/migrateResidenceData).
12:21:35
I
functions
firestore function initialized.
12:21:35
I

┌─────────────────────────────────────────────────────────────┐
│ ✔  All emulators ready! It is now safe to connect your app. │
│ i  View Emulator UI at http://127.0.0.1:4000/               │
└─────────────────────────────────────────────────────────────┘

┌────────────────┬────────────────┬──────────────────────────────────┐
│ Emulator       │ Host:Port      │ View in Emulator UI              │
├────────────────┼────────────────┼──────────────────────────────────┤
│ Authentication │ 127.0.0.1:9099 │ http://127.0.0.1:4000/auth       │
├────────────────┼────────────────┼──────────────────────────────────┤
│ Functions      │ 127.0.0.1:5001 │ http://127.0.0.1:4000/functions  │
├────────────────┼────────────────┼──────────────────────────────────┤
│ Firestore      │ 127.0.0.1:8080 │ http://127.0.0.1:4000/firestore  │
├────────────────┼────────────────┼──────────────────────────────────┤
│ Hosting        │ 127.0.0.1:5000 │ n/a                              │
├────────────────┼────────────────┼──────────────────────────────────┤
│ Storage        │ 127.0.0.1:9199 │ http://127.0.0.1:4000/storage    │
├────────────────┼────────────────┼──────────────────────────────────┤
│ Cloud Tasks    │ 127.0.0.1:9499 │ n/a                              │
├────────────────┼────────────────┼──────────────────────────────────┤
│ Extensions     │ 127.0.0.1:5001 │ http://127.0.0.1:4000/extensions │
└────────────────┴────────────────┴──────────────────────────────────┘
  Emulator Hub host: 127.0.0.1 port: 4400
  Other reserved ports: 4500, 9150
┌─────────────────────────┬───────────────┬─────────────────────┐
│ Extension Instance Name │ Extension Ref │ View in Emulator UI │
└─────────────────────────┴───────────────┴─────────────────────┘
Issues? Report them at https://github.com/firebase/firebase-tools/issues and attach the *-debug.log files.
 
12:22:10
I
function[us-central1-onWrite_food_listings]
Beginning execution of "us-central1-onWrite_food_listings"
12:22:10
I
function[us-central1-onWrite_food_listings]
{
  "severity": "INFO",
  "message": "Processing place: INVwPJfdXk0DTcSvROsc (Karahi Kingdom)"
}
12:22:10
I
function[us-central1-onWrite_food_listings]
{
  "severity": "INFO",
  "message": "Status for INVwPJfdXk0DTcSvROsc has not changed."
}
12:22:11
W
function[us-central1-onWrite_food_listings]
Google API requested!
   - URL: "https://oauth2.googleapis.com/token"
   - Be careful, this may be a production service.
12:22:14
W
function[us-central1-onWrite_food_listings]
Error: 5 NOT_FOUND: Queue does not exist. If you just created the queue, wait at least a minute for the queue to initialize.
    at callErrorFromStatus (D:\Flutter Apps\City Helper System\app\functions\node_modules\@grpc\grpc-js\build\src\call.js:32:19)
    at Object.onReceiveStatus (D:\Flutter Apps\City Helper System\app\functions\node_modules\@grpc\grpc-js\build\src\client.js:193:76)
    at Object.onReceiveStatus (D:\Flutter Apps\City Helper System\app\functions\node_modules\@grpc\grpc-js\build\src\client-interceptors.js:361:141)
    at Object.onReceiveStatus (D:\Flutter Apps\City Helper System\app\functions\node_modules\@grpc\grpc-js\build\src\client-interceptors.js:324:181)
    at D:\Flutter Apps\City Helper System\app\functions\node_modules\@grpc\grpc-js\build\src\resolving-call.js:135:78
    at process.processTicksAndRejections (node:internal/process/task_queues:85:11)
for call at
    at ServiceClientImpl.makeUnaryRequest (D:\Flutter Apps\City Helper System\app\functions\node_modules\@grpc\grpc-js\build\src\client.js:161:32)
    at ServiceClientImpl.<anonymous> (D:\Flutter Apps\City Helper System\app\functions\node_modules\@grpc\grpc-js\build\src\make-client.js:105:19)
    at D:\Flutter Apps\City Helper System\app\functions\node_modules\@google-cloud\tasks\build\cjs\src\v2\cloud_tasks_client.cjs:279:25
    at D:\Flutter Apps\City Helper System\app\functions\node_modules\@google-cloud\tasks\node_modules\google-gax\build\src\normalCalls\timeout.js:44:16
    at OngoingCallPromise.call (D:\Flutter Apps\City Helper System\app\functions\node_modules\@google-cloud\tasks\node_modules\google-gax\build\src\call.js:70:27)
    at NormalApiCaller.call (D:\Flutter Apps\City Helper System\app\functions\node_modules\@google-cloud\tasks\node_modules\google-gax\build\src\normalCalls\normalApiCaller.js:34:19)
    at D:\Flutter Apps\City Helper System\app\functions\node_modules\@google-cloud\tasks\node_modules\google-gax\build\src\createApiCall.js:110:30
    at process.processTicksAndRejections (node:internal/process/task_queues:105:5)
12:22:14
W
function[us-central1-onWrite_food_listings]
Your function was killed because it raised an unhandled error.
12:22:14
I
function[us-central1-onWrite_food_listings]
Finished "us-central1-onWrite_food_listings" in 4652.6138ms


---------------------------------------------------------------------------
PS D:\Flutter Apps\City Helper System> cd app
PS D:\Flutter Apps\City Helper System\app> firebase emulators:start --import ./seed --export-on-exit ./seed       
i  emulators: Starting emulators: auth, functions, firestore, hosting, storage, tasks, extensions
!  functions: The following emulators are not running, calls to these services from the Functions emulator will affect production: apphosting, database, pubsub, dataconnect
i  firestore: Importing data from D:\Flutter Apps\City Helper System\app\seed\firestore_export\firestore_export.overall_export_metadata
!  firestore: Cloud Firestore Emulator does not support multiple databases yet.
!  firestore: Did not find a Cloud Firestore rules file specified in a firebase.json config file.
!  firestore: The emulator will default to allowing all reads and writes. Learn more about this option: https://firebase.google.com/docs/emulator-suite/install_and_configure#security_rules_configuration.
i  firestore: Firestore Emulator logging to firestore-debug.log
+  firestore: Firestore Emulator UI websocket is running on 9150.
i  auth: Importing config from D:\Flutter Apps\City Helper System\app\seed\auth_export\config.json
i  auth: Importing accounts from D:\Flutter Apps\City Helper System\app\seed\auth_export\accounts.json
i  hosting[city-helper-system-8de0d]: Serving hosting files from: build/web
+  hosting[city-helper-system-8de0d]: Local server: http://127.0.0.1:5000
i  functions: Watching "D:\Flutter Apps\City Helper System\app\functions" for Cloud Functions...
+  functions: Using node@22 from host.
Serving at port 8955

+  functions: Loaded functions definitions from source: setOpenStatus, migrateResidenceData, onWrite_food_listings.
+  functions[us-central1-setOpenStatus]: http function initialized (http://127.0.0.1:5001/city-helper-system-8de0d/us-central1/setOpenStatus).
+  functions[us-central1-migrateResidenceData]: http function initialized (http://127.0.0.1:5001/city-helper-system-8de0d/us-central1/migrateResidenceData).
+  functions[us-central1-onWrite_food_listings]: firestore function initialized.

┌─────────────────────────────────────────────────────────────┐
│ ✔  All emulators ready! It is now safe to connect your app. │
│ i  View Emulator UI at http://127.0.0.1:4000/               │
└─────────────────────────────────────────────────────────────┘

┌────────────────┬────────────────┬──────────────────────────────────┐
│ Emulator       │ Host:Port      │ View in Emulator UI              │
├────────────────┼────────────────┼──────────────────────────────────┤
│ Authentication │ 127.0.0.1:9099 │ http://127.0.0.1:4000/auth       │
├────────────────┼────────────────┼──────────────────────────────────┤
│ Functions      │ 127.0.0.1:5001 │ http://127.0.0.1:4000/functions  │
├────────────────┼────────────────┼──────────────────────────────────┤
│ Firestore      │ 127.0.0.1:8080 │ http://127.0.0.1:4000/firestore  │
├────────────────┼────────────────┼──────────────────────────────────┤
│ Hosting        │ 127.0.0.1:5000 │ n/a                              │
├────────────────┼────────────────┼──────────────────────────────────┤
│ Storage        │ 127.0.0.1:9199 │ http://127.0.0.1:4000/storage    │
├────────────────┼────────────────┼──────────────────────────────────┤
│ Cloud Tasks    │ 127.0.0.1:9499 │ n/a                              │
├────────────────┼────────────────┼──────────────────────────────────┤
│ Extensions     │ 127.0.0.1:5001 │ http://127.0.0.1:4000/extensions │
└────────────────┴────────────────┴──────────────────────────────────┘
  Emulator Hub host: 127.0.0.1 port: 4400
  Other reserved ports: 4500, 9150
┌─────────────────────────┬───────────────┬─────────────────────┐
│ Extension Instance Name │ Extension Ref │ View in Emulator UI │
└─────────────────────────┴───────────────┴─────────────────────┘
Issues? Report them at https://github.com/firebase/firebase-tools/issues and attach the *-debug.log files.        

i  functions: Beginning execution of "us-central1-onWrite_food_listings"
>  {"severity":"INFO","message":"Processing place: INVwPJfdXk0DTcSvROsc (Karahi Kingdom)"}
>  {"severity":"INFO","message":"Status for INVwPJfdXk0DTcSvROsc has not changed."}
!  Google API requested!
   - URL: "https://oauth2.googleapis.com/token"
   - Be careful, this may be a production service.
!  functions: Error: 5 NOT_FOUND: Queue does not exist. If you just created the queue, wait at least a minute for 
the queue to initialize.
    at callErrorFromStatus (D:\Flutter Apps\City Helper System\app\functions\node_modules\@grpc\grpc-js\build\src\call.js:32:19)
    at Object.onReceiveStatus (D:\Flutter Apps\City Helper System\app\functions\node_modules\@grpc\grpc-js\build\src\client.js:193:76)
    at Object.onReceiveStatus (D:\Flutter Apps\City Helper System\app\functions\node_modules\@grpc\grpc-js\build\src\client-interceptors.js:361:141)
    at Object.onReceiveStatus (D:\Flutter Apps\City Helper System\app\functions\node_modules\@grpc\grpc-js\build\src\client-interceptors.js:324:181)
    at D:\Flutter Apps\City Helper System\app\functions\node_modules\@grpc\grpc-js\build\src\resolving-call.js:135:78
    at process.processTicksAndRejections (node:internal/process/task_queues:85:11)
for call at
    at ServiceClientImpl.makeUnaryRequest (D:\Flutter Apps\City Helper System\app\functions\node_modules\@grpc\grpc-js\build\src\client.js:161:32)
    at ServiceClientImpl.<anonymous> (D:\Flutter Apps\City Helper System\app\functions\node_modules\@grpc\grpc-js\build\src\make-client.js:105:19)
    at D:\Flutter Apps\City Helper System\app\functions\node_modules\@google-cloud\tasks\build\cjs\src\v2\cloud_tasks_client.cjs:279:25
    at D:\Flutter Apps\City Helper System\app\functions\node_modules\@google-cloud\tasks\node_modules\google-gax\b    at OngoingCallPromise.call (D:\Flutter Apps\City Helper System\app\functions\node_modules\@google-cloud\tasks\node_modules\google-gax\build\src\call.js:70:27)
    at NormalApiCaller.call (D:\Flutter Apps\City Helper System\app\functions\node_modules\@google-cloud\tasks\node_modules\google-gax\build\src\normalCalls\normalApiCaller.js:34:19)
    at D:\Flutter Apps\City Helper System\app\functions\node_modules\@google-cloud\tasks\node_modules\google-gax\build\src\createApiCall.js:110:30
    at process.processTicksAndRejections (node:internal/process/task_queues:105:5)
!  Your function was killed because it raised an unhandled error.
i  functions: Finished "us-central1-onWrite_food_listings" in 4102.1415ms

i  emulators: Received SIGINT (Ctrl-C) for the first time. Starting a clean shutdown.
i  emulators: Please wait for a clean shutdown or send the SIGINT (Ctrl-C) signal again to stop right now.        
i  Automatically exporting data using --export-on-exit "./seed" please wait for the export to finish...
i  Found running emulator hub for project city-helper-system-8de0d at http://127.0.0.1:4400
i  Exporting data to: D:\Flutter Apps\City Helper System\app\seed
i  emulators: Received export request. Exporting data to D:\Flutter Apps\City Helper System\app\seed.
+  emulators: Export complete.
+  Export complete
i  emulators: Shutting down emulators.
i  ui: Stopping Emulator UI
i  extensions: Stopping Extensions Emulator
i  functions: Stopping Functions Emulator
i  hosting: Stopping Hosting Emulator
i  firestore: Stopping Firestore Emulator
!  Firestore Emulator has exited upon receiving signal: SIGINT
i  auth: Stopping Authentication Emulator
i  storage: Stopping Storage Emulator
i  eventarc: Stopping Eventarc Emulator
i  tasks: Stopping Cloud Tasks Emulator
i  hub: Stopping emulator hub
i  logging: Stopping Logging Emulator
PS D:\Flutter Apps\City Helper System\app> firebase emulators:start --import ./seed --export-on-exit ./seed       
i  emulators: Starting emulators: auth, functions, firestore, hosting, storage, tasks, extensions
!  functions: The following emulators are not running, calls to these services from the Functions emulator will affect production: apphosting, database, pubsub, dataconnect
i  firestore: Importing data from D:\Flutter Apps\City Helper System\app\seed\firestore_export\firestore_export.overall_export_metadata
!  firestore: Cloud Firestore Emulator does not support multiple databases yet.
!  firestore: Did not find a Cloud Firestore rules file specified in a firebase.json config file.
!  firestore: The emulator will default to allowing all reads and writes. Learn more about this option: https://firebase.google.com/docs/emulator-suite/install_and_configure#security_rules_configuration.
i  firestore: Firestore Emulator logging to firestore-debug.log
+  firestore: Firestore Emulator UI websocket is running on 9150.
i  auth: Importing config from D:\Flutter Apps\City Helper System\app\seed\auth_export\config.json
i  auth: Importing accounts from D:\Flutter Apps\City Helper System\app\seed\auth_export\accounts.json
i  hosting[city-helper-system-8de0d]: Serving hosting files from: build/web
+  hosting[city-helper-system-8de0d]: Local server: http://127.0.0.1:5000
i  functions: Watching "D:\Flutter Apps\City Helper System\app\functions" for Cloud Functions...
+  functions: Using node@22 from host.
Serving at port 8649

+  functions: Loaded functions definitions from source: setOpenStatus, migrateResidenceData, onWrite_food_listings.
+  functions[us-central1-setOpenStatus]: http function initialized (http://127.0.0.1:5001/city-helper-system-8de0d/us-central1/setOpenStatus).
+  functions[us-central1-migrateResidenceData]: http function initialized (http://127.0.0.1:5001/city-helper-system-8de0d/us-central1/migrateResidenceData).
+  functions[us-central1-onWrite_food_listings]: firestore function initialized.

┌─────────────────────────────────────────────────────────────┐
│ ✔  All emulators ready! It is now safe to connect your app. │
│ i  View Emulator UI at http://127.0.0.1:4000/               │
└─────────────────────────────────────────────────────────────┘

┌────────────────┬────────────────┬──────────────────────────────────┐
│ Emulator       │ Host:Port      │ View in Emulator UI              │
├────────────────┼────────────────┼──────────────────────────────────┤
│ Authentication │ 127.0.0.1:9099 │ http://127.0.0.1:4000/auth       │
├────────────────┼────────────────┼──────────────────────────────────┤
│ Functions      │ 127.0.0.1:5001 │ http://127.0.0.1:4000/functions  │
├────────────────┼────────────────┼──────────────────────────────────┤
│ Firestore      │ 127.0.0.1:8080 │ http://127.0.0.1:4000/firestore  │
├────────────────┼────────────────┼──────────────────────────────────┤
│ Hosting        │ 127.0.0.1:5000 │ n/a                              │
├────────────────┼────────────────┼──────────────────────────────────┤
│ Storage        │ 127.0.0.1:9199 │ http://127.0.0.1:4000/storage    │
├────────────────┼────────────────┼──────────────────────────────────┤
│ Cloud Tasks    │ 127.0.0.1:9499 │ n/a                              │
├────────────────┼────────────────┼──────────────────────────────────┤
│ Extensions     │ 127.0.0.1:5001 │ http://127.0.0.1:4000/extensions │
└────────────────┴────────────────┴──────────────────────────────────┘
  Emulator Hub host: 127.0.0.1 port: 4400
  Other reserved ports: 4500, 9150
┌─────────────────────────┬───────────────┬─────────────────────┐
│ Extension Instance Name │ Extension Ref │ View in Emulator UI │
└─────────────────────────┴───────────────┴─────────────────────┘
Issues? Report them at https://github.com/firebase/firebase-tools/issues and attach the *-debug.log files.        

i  functions: Beginning execution of "us-central1-onWrite_food_listings"
>  {"severity":"INFO","message":"Processing place: INVwPJfdXk0DTcSvROsc (Karahi Kingdom)"}
>  {"severity":"INFO","message":"Status for INVwPJfdXk0DTcSvROsc has not changed."}
!  Google API requested!
   - URL: "https://oauth2.googleapis.com/token"
   - Be careful, this may be a production service.
!  functions: Error: 5 NOT_FOUND: Queue does not exist. If you just created the queue, wait at least a minute for 
the queue to initialize.
    at callErrorFromStatus (D:\Flutter Apps\City Helper System\app\functions\node_modules\@grpc\grpc-js\build\src\call.js:32:19)
    at Object.onReceiveStatus (D:\Flutter Apps\City Helper System\app\functions\node_modules\@grpc\grpc-js\build\src\client.js:193:76)
    at Object.onReceiveStatus (D:\Flutter Apps\City Helper System\app\functions\node_modules\@grpc\grpc-js\build\src\client-interceptors.js:361:141)
    at Object.onReceiveStatus (D:\Flutter Apps\City Helper System\app\functions\node_modules\@grpc\grpc-js\build\src\client-interceptors.js:324:181)
    at D:\Flutter Apps\City Helper System\app\functions\node_modules\@grpc\grpc-js\build\src\resolving-call.js:135:78
    at process.processTicksAndRejections (node:internal/process/task_queues:85:11)
for call at
    at ServiceClientImpl.makeUnaryRequest (D:\Flutter Apps\City Helper System\app\functions\node_modules\@grpc\grpc-js\build\src\client.js:161:32)
    at ServiceClientImpl.<anonymous> (D:\Flutter Apps\City Helper System\app\functions\node_modules\@grpc\grpc-js\build\src\make-client.js:105:19)
    at D:\Flutter Apps\City Helper System\app\functions\node_modules\@google-cloud\tasks\build\cjs\src\v2\cloud_tasks_client.cjs:279:25
    at D:\Flutter Apps\City Helper System\app\functions\node_modules\@google-cloud\tasks\node_modules\google-gax\build\src\normalCalls\timeout.js:44:16
    at OngoingCallPromise.call (D:\Flutter Apps\City Helper System\app\functions\node_modules\@google-cloud\tasks\node_modules\google-gax\build\src\call.js:70:27)
    at NormalApiCaller.call (D:\Flutter Apps\City Helper System\app\functions\node_modules\@google-cloud\tasks\node_modules\google-gax\build\src\normalCalls\normalApiCaller.js:34:19)
    at D:\Flutter Apps\City Helper System\app\functions\node_modules\@google-cloud\tasks\node_modules\google-gax\build\src\createApiCall.js:110:30
    at process.processTicksAndRejections (node:internal/process/task_queues:105:5)
!  Your function was killed because it raised an unhandled error.
i  functions: Finished "us-central1-onWrite_food_listings" in 4652.6138ms