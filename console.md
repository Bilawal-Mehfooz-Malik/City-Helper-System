PS D:\Flutter Apps\City Helper System\app> firebase deploy

=== Deploying to 'city-helper-system-8de0d'...     

i  deploying storage, firestore, functions, hosting
Running command: npm --prefix "$RESOURCE_DIR" run build

> build
> tsc  

+  functions: Finished running predeploy script.
i  storage: ensuring required API firebasestorage.googleapis.com is enabled...
i  firebase.storage: checking storage.rules for compilation errors...
+  firebase.storage: rules file storage.rules compiled successfully
i  firestore: reading indexes from firestore.indexes.json...
i  cloud.firestore: checking firestore.rules for compilation errors...
+  cloud.firestore: rules file firestore.rules compiled successfully
i  functions: preparing codebase default for deployment
i  functions: ensuring required API cloudfunctions.googleapis.com is enabled...
i  functions: ensuring required API cloudbuild.googleapis.com is enabled...
i  artifactregistry: ensuring required API artifactregistry.googleapis.com is enabled...
i  functions: Loading and analyzing source code for codebase default to determine what to deploy
Serving at port 8994

[dotenv@17.2.2] injecting env (3) from .env -- tip: ⚙️  load multiple .env files with { path: ['.env.local', '.
env'] }

TypeError: sgMail.setApiKey is not a function
    at Object.<anonymous> (D:\Flutter Apps\City Helper System\app\functions\lib\config.js:44:12)
    at Module._compile (node:internal/modules/cjs/loader:1730:14)
    at Object..js (node:internal/modules/cjs/loader:1895:10)
    at Module.load (node:internal/modules/cjs/loader:1465:32)
    at Function._load (node:internal/modules/cjs/loader:1282:12)
    at TracingChannel.traceSync (node:diagnostics_channel:322:14)
    at wrapModuleLoad (node:internal/modules/cjs/loader:235:24)
    at Module.require (node:internal/modules/cjs/loader:1487:12)
    at require (node:internal/modules/helpers:135:16)
    at Object.<anonymous> (D:\Flutter Apps\City Helper System\app\functions\lib\notification.js:37:18)


Error: Functions codebase could not be analyzed successfully. It may have a syntax or runtime error
PS D:\Flutter Apps\City Helper System\app> 