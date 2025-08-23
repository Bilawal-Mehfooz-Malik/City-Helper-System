{
  "textPayload": "Error: 5 NOT_FOUND: Queue does not exist. If you just created the queue, wait at least a minute for the queue to initialize.\n    at callErrorFromStatus (/workspace/node_modules/@grpc/grpc-js/build/src/call.js:32:19)\n    at Object.onReceiveStatus (/workspace/node_modules/@grpc/grpc-js/build/src/client.js:193:76)\n    at Object.onReceiveStatus (/workspace/node_modules/@grpc/grpc-js/build/src/client-interceptors.js:361:141)\n    at Object.onReceiveStatus (/workspace/node_modules/@grpc/grpc-js/build/src/client-interceptors.js:324:181)\n    at /workspace/node_modules/@grpc/grpc-js/build/src/resolving-call.js:135:78\n    at process.processTicksAndRejections (node:internal/process/task_queues:85:11)\nfor call at\n    at ServiceClientImpl.makeUnaryRequest (/workspace/node_modules/@grpc/grpc-js/build/src/client.js:161:32)\n    at ServiceClientImpl.<anonymous> (/workspace/node_modules/@grpc/grpc-js/build/src/make-client.js:105:19)\n    at /workspace/node_modules/@google-cloud/tasks/build/cjs/src/v2/cloud_tasks_client.cjs:279:25\n    at /workspace/node_modules/@google-cloud/tasks/node_modules/google-gax/build/src/normalCalls/timeout.js:44:16\n    at OngoingCallPromise.call (/workspace/node_modules/@google-cloud/tasks/node_modules/google-gax/build/src/call.js:70:27)\n    at NormalApiCaller.call (/workspace/node_modules/@google-cloud/tasks/node_modules/google-gax/build/src/normalCalls/normalApiCaller.js:34:19)\n    at /workspace/node_modules/@google-cloud/tasks/node_modules/google-gax/build/src/createApiCall.js:110:30\n",
  "insertId": "68a9a6fd000941019e283a37",
  "resource": {
    "type": "cloud_run_revision",
    "labels": {
      "configuration_name": "onwrite-food-listings",
      "location": "us-central1",
      "project_id": "city-helper-system-8de0d",
      "revision_name": "onwrite-food-listings-00002-xej",
      "service_name": "onwrite-food-listings"
    }
  },
  "timestamp": "2025-08-23T11:33:17.606465Z",
  "labels": {
    "goog-drz-cloudfunctions-id": "onwrite_food_listings",
    "execution_id": "o6kosn5d046v",
    "goog-managed-by": "cloudfunctions",
    "instanceId": "0069c7a988d92b0e630670c02b95b394bbe589c61c85ac5fa193d37f2a3438512297386e16a277e31f05527dc54f160e40d8d1f93e1c23f16be67dc0d6e9aacbb99747d9d411f9d178bc86418b3375",
    "firebase-functions-hash": "e4ac52ade20abcf310d094b9d06d12137d875b0b",
    "run.googleapis.com/base_image_versions": "us-docker.pkg.dev/serverless-runtimes/google-22-full/runtimes/nodejs22:nodejs22_20250810_22_17_1_RC00",
    "goog-drz-cloudfunctions-location": "us-central1"
  },
  "logName": "projects/city-helper-system-8de0d/logs/run.googleapis.com%2Fstderr",
  "receiveTimestamp": "2025-08-23T11:33:17.612759831Z",
  "spanId": "7594522753356806489",
  "errorGroups": [
    {
      "id": "CPTJ2fj3s5D8zwE"
    }
  ]
}