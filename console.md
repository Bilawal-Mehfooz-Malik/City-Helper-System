The logs prompted to me to create index i created and it succeeded then i ran my app it gives this issue again empty list: here is index what i created 
categoryId asc
isActive asc
status asc
startDate dsc
priorityScore dsc
lastShownAt asc
__name__ asc



NOTICE 2025-08-25T13:29:43.916178Z [protoPayload.serviceName: firestore.googleapis.com] [protoPayload.methodName: google.firestore.admin.v1.FirestoreAdmin.CreateIndex] [protoPayload.resourceName: projects/city-helper-system-8de0d/databases/(default)/collectionGroups/carousel_ads] [protoPayload.authenticationInfo.principalEmail: cityhelpersystem@gmail.com] audit_log, method: "google.firestore.admin.v1.FirestoreAdmin.CreateIndex", principal_email: "cityhelpersystem@gmail.com"
  {
    "protoPayload": {
      "@type": "type.googleapis.com/google.cloud.audit.AuditLog",
      "authenticationInfo": {
        "principalEmail": "cityhelpersystem@gmail.com",
        "principalSubject": "user:cityhelpersystem@gmail.com"
      },
      "requestMetadata": {
        "callerIp": "223.123.89.68",
        "callerSuppliedUserAgent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36,gzip(gfe)",
        "requestAttributes": {
          "time": "2025-08-25T13:29:43.982565Z",
          "auth": {}
        },
        "destinationAttributes": {}
      },
      "serviceName": "firestore.googleapis.com",
      "methodName": "google.firestore.admin.v1.FirestoreAdmin.CreateIndex",
      "authorizationInfo": [
        {
          "resource": "projects/city-helper-system-8de0d/databases/(default)/collectionGroups/carousel_ads",
          "permission": "datastore.indexes.create",
          "granted": true,
          "resourceAttributes": {
            "service": "firestore.googleapis.com",
            "name": "projects/city-helper-system-8de0d/databases/(default)",
            "type": "firestore.googleapis.com/Database"
          },
          "permissionType": "ADMIN_WRITE"
        }
      ],
      "resourceName": "projects/city-helper-system-8de0d/databases/(default)/collectionGroups/carousel_ads",
      "request": {
        "parent": "projects/city-helper-system-8de0d/databases/(default)/collectionGroups/carousel_ads",
        "@type": "type.googleapis.com/google.firestore.admin.v1.CreateIndexRequest",
        "index": {
          "queryScope": "COLLECTION",
          "fields": [
            {
              "fieldPath": "categoryId",
              "order": "ASCENDING"
            },
            {
              "order": "ASCENDING",
              "fieldPath": "isActive"
            },
            {
              "order": "ASCENDING",
              "fieldPath": "status"
            },
            {
              "fieldPath": "startDate",
              "order": "DESCENDING"
            },
            {
              "order": "DESCENDING",
              "fieldPath": "priorityScore"
            },
            {
              "order": "ASCENDING",
              "fieldPath": "lastShownAt"
            },
            {
              "order": "ASCENDING",
              "fieldPath": "__name__"
            }
          ],
          "name": "projects/city-helper-system-8de0d/databases/(default)/collectionGroups/carousel_ads/indexes/_"
        }
      },
      "resourceLocation": {
        "currentLocations": [
          "asia-south1"
        ]
      }
    },
    "insertId": "1cl03c13d",
    "resource": {
      "type": "datastore_index",
      "labels": {
        "project_id": "city-helper-system-8de0d",
        "index_id": "CICAgNjamYQJ",
        "database_id": "(default)"
      }
    },
    "timestamp": "2025-08-25T13:29:43.916178Z",
    "severity": "NOTICE",
    "logName": "projects/city-helper-system-8de0d/logs/cloudaudit.googleapis.com%2Factivity",
    "operation": {
      "id": "projects/city-helper-system-8de0d/databases/(default)/operations/AyA2NjM4ZWZkY2YwNzEtY2VhOC0zOGM0LWM4MTAtNTE5ZmUxNWIkGnNlbmlsZXBpcAkKMxI",
      "producer": "firestore.googleapis.com",
      "first": true
    },
    "receiveTimestamp": "2025-08-25T13:29:44.542725925Z"
  }
INFO 2025-08-25T13:32:04.262299Z [httpRequest.requestMethod: OPTIONS] [httpRequest.status: 204] [httpRequest.responseSize: 244 B] [httpRequest.latency: 4 ms] [httpRequest.userAgent: Chrome 139.0.0.0] https://us-central1-city-helper-system-8de0d.cloudfunctions.net/getCarouselAds
  {
    "insertId": "68ac65d40004b768325c4c37",
    "httpRequest": {
      "requestMethod": "OPTIONS",
      "requestUrl": "https://us-central1-city-helper-system-8de0d.cloudfunctions.net/getCarouselAds",
      "requestSize": "738",
      "status": 204,
      "responseSize": "244",
      "userAgent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36",
      "remoteIp": "223.123.89.68",
      "referer": "http://localhost:7735/",
      "serverIp": "216.239.36.54",
      "latency": "0.004300310s",
      "protocol": "HTTP/1.1"
    },
    "resource": {
      "type": "cloud_run_revision",
      "labels": {
        "project_id": "city-helper-system-8de0d",
        "revision_name": "getcarouselads-00001-rob",
        "location": "us-central1",
        "service_name": "getcarouselads",
        "configuration_name": "getcarouselads"
      }
    },
    "timestamp": "2025-08-25T13:32:04.262299Z",
    "severity": "INFO",
    "labels": {
      "goog-managed-by": "cloudfunctions",
      "instanceId": "0069c7a98838bfc447e6a59e53bf7de704519f87b4af57dc8619e2d6e48f7fa7c9aae3e8169736f7ae0ddcb2f16fb7e308c5ae8500674a266745f92613d8e5f83c87d37a8cdd3fa1fb32b662fa72",
      "firebase-functions-hash": "2999ef7e78c436b7f8d24732f1a4057aa0818c29",
      "deployment-callable": "true"
    },
    "logName": "projects/city-helper-system-8de0d/logs/run.googleapis.com%2Frequests",
    "trace": "projects/city-helper-system-8de0d/traces/7f5b83fd8f30f35146e301f34c879a4c",
    "receiveTimestamp": "2025-08-25T13:32:04.315787667Z",
    "spanId": "b5206c7345cb417b",
    "traceSampled": true
  }
INFO 2025-08-25T13:32:04.710153Z [httpRequest.requestMethod: POST] [httpRequest.status: 200] [httpRequest.responseSize: 212 B] [httpRequest.latency: 355 ms] [httpRequest.userAgent: Chrome 139.0.0.0] https://us-central1-city-helper-system-8de0d.cloudfunctions.net/getCarouselAds
  {
    "insertId": "68ac65d5000108bf39726bd9",
    "httpRequest": {
      "requestMethod": "POST",
      "requestUrl": "https://us-central1-city-helper-system-8de0d.cloudfunctions.net/getCarouselAds",
      "requestSize": "827",
      "status": 200,
      "responseSize": "212",
      "userAgent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36",
      "remoteIp": "223.123.89.68",
      "referer": "http://localhost:7735/",
      "serverIp": "216.239.36.54",
      "latency": "0.355516564s",
      "protocol": "HTTP/1.1"
    },
    "resource": {
      "type": "cloud_run_revision",
      "labels": {
        "location": "us-central1",
        "service_name": "getcarouselads",
        "configuration_name": "getcarouselads",
        "project_id": "city-helper-system-8de0d",
        "revision_name": "getcarouselads-00001-rob"
      }
    },
    "timestamp": "2025-08-25T13:32:04.710153Z",
    "severity": "INFO",
    "labels": {
      "instanceId": "0069c7a98838bfc447e6a59e53bf7de704519f87b4af57dc8619e2d6e48f7fa7c9aae3e8169736f7ae0ddcb2f16fb7e308c5ae8500674a266745f92613d8e5f83c87d37a8cdd3fa1fb32b662fa72",
      "deployment-callable": "true",
      "firebase-functions-hash": "2999ef7e78c436b7f8d24732f1a4057aa0818c29",
      "goog-managed-by": "cloudfunctions"
    },
    "logName": "projects/city-helper-system-8de0d/logs/run.googleapis.com%2Frequests",
    "trace": "projects/city-helper-system-8de0d/traces/43ba42ea08e9b0f246e301f34c87922f",
    "receiveTimestamp": "2025-08-25T13:32:05.316391724Z",
    "spanId": "2c6ed7c871074bdc"
  }
> DEBUG 2025-08-25T13:32:04.715384Z Callable request verification passed
DEBUG 2025-08-25T13:32:04.715384Z Callable request verification passed
  {
    "insertId": "68ac65d4000aea7843e7cf31",
    "jsonPayload": {
      "message": "Callable request verification passed",
      "verifications": {
        "app": "MISSING",
        "auth": "MISSING"
      }
    },
    "resource": {
      "type": "cloud_run_revision",
      "labels": {
        "service_name": "getcarouselads",
        "configuration_name": "getcarouselads",
        "project_id": "city-helper-system-8de0d",
        "revision_name": "getcarouselads-00001-rob",
        "location": "us-central1"
      }
    },
    "timestamp": "2025-08-25T13:32:04.715384Z",
    "severity": "DEBUG",
    "labels": {
      "deployment-callable": "true",
      "firebase-functions-hash": "2999ef7e78c436b7f8d24732f1a4057aa0818c29",
      "run.googleapis.com/base_image_versions": "us-docker.pkg.dev/serverless-runtimes/google-22-full/runtimes/nodejs22:nodejs22_20250810_22_17_1_RC00",
      "goog-managed-by": "cloudfunctions",
      "execution_id": "r5p88bw44evb",
      "instanceId": "0069c7a98838bfc447e6a59e53bf7de704519f87b4af57dc8619e2d6e48f7fa7c9aae3e8169736f7ae0ddcb2f16fb7e308c5ae8500674a266745f92613d8e5f83c87d37a8cdd3fa1fb32b662fa72",
      "firebase-log-type": "callable-request-verification"
    },
    "logName": "projects/city-helper-system-8de0d/logs/run.googleapis.com%2Fstdout",
    "trace": "projects/city-helper-system-8de0d/traces/43ba42ea08e9b0f246e301f34c87922f",
    "receiveTimestamp": "2025-08-25T13:32:04.724592299Z",
    "spanId": "3201733640996735964"
  }
