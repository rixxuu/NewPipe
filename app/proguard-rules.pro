# https://developer.android.com/build/shrink-code


## Rules for NewPipeExtractor
-keep class org.schabi.newpipe.extractor.timeago.patterns.** { *; }

## Rules for OkHttp. Copy pasted from https://github.com/square/okhttp
-dontwarn okhttp3.**
-dontwarn okio.**
-dontwarn org.mozilla.javascript.**
-dontwarn org.mozilla.classfile.**
-dontwarn javax.script.**
-dontwarn jdk.dynalink.**
-dontwarn java.beans.**

## See https://github.com/TeamNewPipe/NewPipe/pull/1441
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    !static !transient <fields>;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
}

## For some reason NotificationModeConfigFragment wasn't kept (only referenced in a preference xml)
-keep class org.schabi.newpipe.settings.notifications.** { *; }

# Prevent R8 from stripping or renaming Protobuf internal fields
-keepclassmembers class * extends com.google.protobuf.GeneratedMessageLite {
    <fields>;
}

## Keep Kotlinx Serialization classes
-keepclassmembers class kotlinx.serialization.json.** {
    *** Companion;
}
-keepclasseswithmembers class kotlinx.serialization.json.** {
    kotlinx.serialization.KSerializer serializer(...);
}
-keep,includedescriptorclasses class org.schabi.newpipe.**$$serializer { *; }
-keepclassmembers class org.schabi.newpipe.** {
    *** Companion;
}
-keepclasseswithmembers class org.schabi.newpipe.** {
    kotlinx.serialization.KSerializer serializer(...);
}
