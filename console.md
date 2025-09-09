cd : Cannot find path 'D:\Flutter Apps\City Helper System\app\app' because it does not exist.
At line:1 char:1
+ cd app;firebase deploy --only functions
+ ~~~~~~
    + CategoryInfo          : ObjectNotFound: (D:\Flutter Apps... System\app\app:String) [Set-Location], Item  
   NotFoundException
    + FullyQualifiedErrorId : PathNotFound,Microsoft.PowerShell.Commands.SetLocationCommand
 

=== Deploying to 'city-helper-system-8de0d'...

i  deploying functions
Running command: npm --prefix "$RESOURCE_DIR" run build

> build
> tsc

src/index.ts:19:97 - error TS2694: Namespace '"D:/Flutter Apps/City Helper System/app/functions/node_modules/firebase-functions/lib/v2/providers/https"' has no exported member 'CallableContext'.

19 export const getCarouselAds = functions.https.onCall(async (data: any, context: functions.https.CallableContext) => {
                                                                                                   ~~~~~~~~~~~~~~~

src/index.ts:36:102 - error TS2694: Namespace '"D:/Flutter Apps/City Helper System/app/functions/node_modules/firebase-functions/lib/v2/providers/https"' has no exported member 'CallableContext'.

36 export const recordAdImpressions = functions.https.onCall(async (data: any, context: functions.https.CallableContext) => {
                                                                                                        ~~~~~~~~~~~~~~~

src/index.ts:49:4 - error TS2304: Cannot find name 'n'.

49   }n});
      ~

src/index.ts:52:96 - error TS2694: Namespace '"D:/Flutter Apps/City Helper System/app/functions/node_modules/firebase-functions/lib/v2/providers/https"' has no exported member 'CallableContext'.

52 export const recordAdClick = functions.https.onCall(async (data: any, context: functions.https.CallableContext) => {
                                                                                                  ~~~~~~~~~~~~~~~


Found 4 errors in the same file, starting at: src/index.ts:19


Error: functions predeploy error: Command terminated with non-zero exit code 2