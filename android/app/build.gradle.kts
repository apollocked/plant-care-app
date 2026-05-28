import java.io.FileInputStream
import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

// 1. Explicitly look for key.properties in the android/ directory
val keystoreProperties = Properties()
val keystorePropertiesFile = file("../key.properties")

if (keystorePropertiesFile.exists()) {
    keystorePropertiesFile.inputStream().use { stream ->
        keystoreProperties.load(stream)
    }
}

android {
    namespace = "com.apollo.plant_care"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    signingConfigs {
        create("release") {
            if (keystorePropertiesFile.exists()) {
                val storeFilePath = keystoreProperties.getProperty("storeFile") 
                    ?: error("storeFile property is missing inside your key.properties file!")
                
                // Resolves the keystore path relative to where key.properties itself lives
                storeFile = if (file(storeFilePath).isAbsolute) {
                    file(storeFilePath)
                } else {
                    file("${keystorePropertiesFile.parent}/$storeFilePath")
                }
                
                storePassword = keystoreProperties.getProperty("storePassword")
                keyAlias = keystoreProperties.getProperty("keyAlias")
                keyPassword = keystoreProperties.getProperty("keyPassword")
            } else {
                // Diagnostic fallback: Tells you exactly where Gradle is looking
                error("Could not find key.properties! Make sure it is placed at: ${keystorePropertiesFile.absolutePath}")
            }
        }
    }

    defaultConfig {
        applicationId = "com.apollo.plant_care"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            
            isMinifyEnabled = true 
            
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
}

kotlin {
    jvmToolchain(17)
}

flutter {
    source = "../.."
}