# Deploying Flutter App to Google Play Store

This document provides a step-by-step guide to building and publishing your Flutter application to the Google Play Store.

## 1. Review and Update App Information

Before building the release version of your app, ensure all necessary identifiers and metadata are correctly set.

### a. Set the Application ID

Your app's unique Application ID is set in the `build.gradle` file. This ID cannot be changed after you publish your app.

1.  Open `app/android/app/build.gradle`.
2.  Find the `applicationId` field within the `defaultConfig` block.
3.  Set it to your desired ID, typically in reverse domain name format (e.g., `com.yourcompany.cityhelpersystem`).

    ```groovy
    // In app/android/app/build.gradle
    android {
        defaultConfig {
            applicationId "com.example.city_helper_system" // <-- CHANGE THIS
            // ...
        }
    }
    ```

### b. Update the Version Number

The app's version is defined in `pubspec.yaml`. Flutter uses this to generate the `versionName` and `versionCode` for Android.

1.  Open `app/pubspec.yaml`.
2.  Locate the `version` line. The format is `major.minor.patch+buildNumber`.
    *   `major.minor.patch` becomes the `versionName`.
    *   `buildNumber` becomes the `versionCode`.
3.  Increment the version for this release. For the first release, `1.0.0+1` is appropriate.

    ```yaml
    # In app/pubspec.yaml
    version: 1.0.0+1
    ```

### c. Generate the App Icon

Your project is configured to use the `flutter_launcher_icons` package.

1.  Ensure your final app icon is located at `app/assets/app_icon.png`.
2.  Run the following command from the `app` directory to generate the necessary platform-specific icons:

    ```shell
    flutter pub run flutter_launcher_icons:main
    ```

## 2. Create a Signing Key

You must digitally sign your app to publish it. This involves creating a private signing key.

### a. Generate a Keystore

1.  Open a terminal or command prompt.
2.  Run the `keytool` command to generate a Java Keystore (`.jks`) file. You will be prompted to create and enter passwords. **Remember these passwords and back up the generated file securely.**

    ```shell
    keytool -genkey -v -keystore my-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias my-key-alias
    ```

3.  After the command completes, you will have a file named `my-release-key.jks`.
4.  Move this `my-release-key.jks` file into the `app/android/app` directory.

### b. Store Key Credentials

1.  Create a new file named `key.properties` inside the `app/android/` directory.
2.  Add the following content to it, replacing the placeholder values with the passwords you created in the previous step.

    ```properties
    # In app/android/key.properties
    storePassword=<your_store_password>
    keyPassword=<your_key_password>
    keyAlias=my-key-alias
    storeFile=../app/my-release-key.jks
    ```

3.  **IMPORTANT:** Add `key.properties` to your gitignore file to prevent it from being checked into version control. Open `app/android/.gitignore` and add the following line:

    ```
    key.properties
    ```

### c. Configure Gradle for Signing

1.  Open `app/android/app/build.gradle`.
2.  Add the following code to the top of the file to load the `key.properties` file.

    ```groovy
    def keystoreProperties = new Properties()
    def keystorePropertiesFile = rootProject.file('../key.properties')
    if (keystorePropertiesFile.exists()) {
        keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
    }
    ```

3.  Inside the `android` block, add the `signingConfigs` block and update the `buildTypes` block to use it.

    ```groovy
    // In app/android/app/build.gradle
    android {
        // ...
        signingConfigs {
            release {
                keyAlias keystoreProperties['keyAlias']
                keyPassword keystoreProperties['keyPassword']
                storeFile file(keystoreProperties['storeFile'])
                storePassword keystoreProperties['storePassword']
            }
        }

        buildTypes {
            release {
                // ...
                signingConfig signingConfigs.release
            }
        }
    }
    ```

## 3. Build the App Bundle (.aab)

The Google Play Store requires you to upload your app as an Android App Bundle (`.aab`).

1.  Navigate to the root of your project directory (`D:\Flutter Apps\City Helper System`).
2.  Run the following command:

    ```shell
    flutter build appbundle
    ```

3.  The output file will be located at `app/build/app/outputs/bundle/release/app-release.aab`.

## 4. Publish on Google Play Console

1.  **Create a Developer Account:** If you don't have one, create a Google Play Developer account at [play.google.com/apps/publish/](https://play.google.com/apps/publish/). There is a one-time registration fee.
2.  **Create App:** In the Play Console, click "Create app" and follow the on-screen instructions.
3.  **Complete Store Listing:** Fill out all the required information for your app's store page, including title, descriptions, screenshots, and contact details.
4.  **Content Rating:** Complete the content rating questionnaire.
5.  **Upload App Bundle:**
    *   Navigate to the "Production" section in the left-hand menu.
    *   Create a new release.
    *   Upload the `app-release.aab` file you generated in the previous step.
6.  **Review and Rollout:** After uploading, review the release details, add any release notes, and then roll out the release to production. It will take some time for Google to review and approve your app.
