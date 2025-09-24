Advertising ID
Android 13 (API 33) introduces changes to advertising ID
Apps that use advertising ID and target Android 13 or later must declare the com.google.android.gms.permission.AD_ID permission in their app manifest. If you don't include this permission, your advertising identifier will be zeroed out; any attempts to access the identifier will receive a string of zeros instead of the identifier. Learn more

We'll use this declaration to provide safeguards in Play Console
If you say that your app uses advertising ID, we will block releases that don't include the com.google.android.gms.permission.AD_ID permission in the manifest file when targeting Android 13. When we block these releases, we will remind you to add the permission. If your release doesn't need advertising ID, you'll be able to skip the error and release. You can also update the declaration to turn off advertising ID release errors.

Declaration
You can't rollout releases with artifacts targeting Android 13 until you have completed this declaration.

Does your app use an advertising ID?
This includes any SDKs that your app imports that use advertising ID


No

Yes
When you answer this question, make sure to verify if any third-party SDK code in your app uses advertising ID. If so, you must declare that your app uses it. Some SDKs, such as the Google Mobile Ads SDK (Play Services ads) may already declare the com.google.android.gms.permission.AD_ID permission in the SDK's library manifest. If your app uses these SDKs as dependencies, the com.google.android.gms.permission.AD_ID permission from the SDK's library manifest will be merged with your app's main manifest by default, even if you don't explicitly declare the permission in your app's main manifest. Learn more

Why does your app need to use an advertising ID? This includes any SDKs that your app imports that use advertising IDs.
Select all that apply

App functionality
Used for features in your app, for example to enable functionality or authenticate users.

Analytics
Used to collect data about how users use your app, or how your app performs. For example, to see how many users are using a particular feature, to monitor app health, to diagnose and fix bugs or crashes or to make future performance improvements.

Developer communications
Used to send news or notifications about you or your app. For example, sending a push notification to inform users about an important security update or informing users about new features in your app.

Advertising or marketing
Used to display or target ads or marketing communications, or measure ad performance. For example, displaying ads in your app, sending push notifications to promote other products or services, or sharing data with advertising partners.

Fraud prevention, security and compliance
Used for fraud prevention, security or compliance with laws. For example, monitoring failed login attempts to identify possible fraudulent activity.

Personalisation
Used to customise your app, such as showing recommended content or suggestions. For example, suggesting playlists based on users' listening habits, or delivering local news based on a user's location.

Account management
Used for the setup or management of user accounts. For example, to enable users to create accounts, to add information to accounts that you provide for use across your services, to log in to your app or to verify their credentials.
Turn off release errors


I understand the ramifications of not including the com.google.android.gms.permission.AD_ID permission in the manifest file when targeting Android 13 and would like to turn off release errors