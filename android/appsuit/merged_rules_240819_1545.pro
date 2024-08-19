# auto-generated file by appsuit plugin.
# modifying this file has no effect.

# proguard rule start: E:\Android\flutter\packages\flutter_tools\gradle\flutter_proguard_rules.pro
# Build the ephemeral app in a module project.
# Prevents: Warning: library class <plugin-package> depends on program class io.flutter.plugin.**
# This is due to plugins (libraries) depending on the embedding (the program jar)
-dontwarn io.flutter.plugin.**

# The android.** package is provided by the OS at runtime.
-dontwarn android.**

# proguard rule end: E:\Android\flutter\packages\flutter_tools\gradle\flutter_proguard_rules.pro

# proguard rule start: E:\Android\.gradle\caches\transforms-3\5b0908bba6cebcbba6d8ab8fda7aa55b\transformed\jetified-window-1.0.0-beta04\proguard.txt
# Copyright (C) 2020 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Some methods in androidx.window.extensions are accessed through reflection and need to be kept.
# Failure to do so can cause bugs such as b/157286362. This could be overly broad too and should
# ideally be trimmed down to only the classes/methods that actually need to be kept. This should
# be tracked in b/165268619.
-keep class androidx.window.extensions.** { *; }
-dontwarn androidx.window.extensions.**
-keep class androidx.window.extensions.embedding.** { *; }
-dontwarn androidx.window.extensions.embedding.**

# Keep the whole library for now since there is a crash with a missing method.
# TODO(b/165268619) Make a narrow rule
-keep class androidx.window.** { *; }

# We also neep to keep sidecar.** for the same reason.
-keep class androidx.window.sidecar.** { *; }
-dontwarn androidx.window.sidecar.**


# proguard rule end: E:\Android\.gradle\caches\transforms-3\5b0908bba6cebcbba6d8ab8fda7aa55b\transformed\jetified-window-1.0.0-beta04\proguard.txt

# proguard rule start: E:\Android\.gradle\caches\transforms-3\a2ca5758de78ae14a9ad8630ed04c1f8\transformed\rules\lib\META-INF\com.android.tools\r8-from-1.6.0\coroutines.pro
# Allow R8 to optimize away the FastServiceLoader.
# Together with ServiceLoader optimization in R8
# this results in direct instantiation when loading Dispatchers.Main
-assumenosideeffects class kotlinx.coroutines.internal.MainDispatcherLoader {
    boolean FAST_SERVICE_LOADER_ENABLED return false;
}

-assumenosideeffects class kotlinx.coroutines.internal.FastServiceLoaderKt {
    boolean ANDROID_DETECTED return true;
}

-keep class kotlinx.coroutines.android.AndroidDispatcherFactory {*;}

# Disable support for "Missing Main Dispatcher", since we always have Android main dispatcher
-assumenosideeffects class kotlinx.coroutines.internal.MainDispatchersKt {
    boolean SUPPORT_MISSING return false;
}

# Statically turn off all debugging facilities and assertions
-assumenosideeffects class kotlinx.coroutines.DebugKt {
    boolean getASSERTIONS_ENABLED() return false;
    boolean getDEBUG() return false;
    boolean getRECOVER_STACK_TRACES() return false;
}
# proguard rule end: E:\Android\.gradle\caches\transforms-3\a2ca5758de78ae14a9ad8630ed04c1f8\transformed\rules\lib\META-INF\com.android.tools\r8-from-1.6.0\coroutines.pro

# proguard rule start: E:\Android\.gradle\caches\transforms-3\f1f9769773854ce4b86e5fdc5def1e9f\transformed\rules\lib\META-INF\proguard\coroutines.pro
# ServiceLoader support
-keepnames class kotlinx.coroutines.internal.MainDispatcherFactory {}
-keepnames class kotlinx.coroutines.CoroutineExceptionHandler {}

# Most of volatile fields are updated with AFU and should not be mangled
-keepclassmembers class kotlinx.coroutines.** {
    volatile <fields>;
}

# Same story for the standard library's SafeContinuation that also uses AtomicReferenceFieldUpdater
-keepclassmembers class kotlin.coroutines.SafeContinuation {
    volatile <fields>;
}

# These classes are only required by kotlinx.coroutines.debug.AgentPremain, which is only loaded when
# kotlinx-coroutines-core is used as a Java agent, so these are not needed in contexts where ProGuard is used.
-dontwarn java.lang.instrument.ClassFileTransformer
-dontwarn sun.misc.SignalHandler
-dontwarn java.lang.instrument.Instrumentation
-dontwarn sun.misc.Signal

# proguard rule end: E:\Android\.gradle\caches\transforms-3\f1f9769773854ce4b86e5fdc5def1e9f\transformed\rules\lib\META-INF\proguard\coroutines.pro

# proguard rule start: E:\Android\.gradle\caches\transforms-3\b8e7701480ff85560f7d5f700ceefc7f\transformed\core-1.6.0\proguard.txt
# Never inline methods, but allow shrinking and obfuscation.
-keepclassmembernames,allowobfuscation,allowshrinking class androidx.core.view.ViewCompat$Api* {
  <methods>;
}
-keepclassmembernames,allowobfuscation,allowshrinking class androidx.core.view.WindowInsetsCompat$*Impl* {
  <methods>;
}
-keepclassmembernames,allowobfuscation,allowshrinking class androidx.core.app.NotificationCompat$*$Api*Impl {
  <methods>;
}
-keepclassmembernames,allowobfuscation,allowshrinking class androidx.core.os.UserHandleCompat$Api*Impl {
  <methods>;
}

# proguard rule end: E:\Android\.gradle\caches\transforms-3\b8e7701480ff85560f7d5f700ceefc7f\transformed\core-1.6.0\proguard.txt

# proguard rule start: E:\Android\.gradle\caches\transforms-3\388b82e105a0906ca595e563169bfa63\transformed\lifecycle-runtime-2.2.0\proguard.txt
-keepattributes *Annotation*

-keepclassmembers enum androidx.lifecycle.Lifecycle$Event {
    <fields>;
}

-keep !interface * implements androidx.lifecycle.LifecycleObserver {
}

-keep class * implements androidx.lifecycle.GeneratedAdapter {
    <init>(...);
}

-keepclassmembers class ** {
    @androidx.lifecycle.OnLifecycleEvent *;
}

# this rule is need to work properly when app is compiled with api 28, see b/142778206
-keepclassmembers class androidx.lifecycle.ReportFragment$LifecycleCallbacks { *; }
# proguard rule end: E:\Android\.gradle\caches\transforms-3\388b82e105a0906ca595e563169bfa63\transformed\lifecycle-runtime-2.2.0\proguard.txt

# proguard rule start: E:\Android\.gradle\caches\transforms-3\8cab672510c4e74d73ab05a1f522df26\transformed\jetified-savedstate-1.0.0\proguard.txt
# Copyright (C) 2019 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

-keepclassmembers,allowobfuscation class * implements androidx.savedstate.SavedStateRegistry$AutoRecreated {
    <init>();
}

# proguard rule end: E:\Android\.gradle\caches\transforms-3\8cab672510c4e74d73ab05a1f522df26\transformed\jetified-savedstate-1.0.0\proguard.txt

# proguard rule start: E:\Android\.gradle\caches\transforms-3\fb893d4419dcfa212d1f559f98a8a747\transformed\versionedparcelable-1.1.1\proguard.txt
-keep class * implements androidx.versionedparcelable.VersionedParcelable
-keep public class android.support.**Parcelizer { *; }
-keep public class androidx.**Parcelizer { *; }
-keep public class androidx.versionedparcelable.ParcelImpl

# proguard rule end: E:\Android\.gradle\caches\transforms-3\fb893d4419dcfa212d1f559f98a8a747\transformed\versionedparcelable-1.1.1\proguard.txt

# proguard rule start: E:\Android\.gradle\caches\transforms-3\60be9ea7556ee17029138677ae37b977\transformed\lifecycle-viewmodel-2.1.0\proguard.txt
-keepclassmembers,allowobfuscation class * extends androidx.lifecycle.ViewModel {
    <init>();
}

-keepclassmembers,allowobfuscation class * extends androidx.lifecycle.AndroidViewModel {
    <init>(android.app.Application);
}

# proguard rule end: E:\Android\.gradle\caches\transforms-3\60be9ea7556ee17029138677ae37b977\transformed\lifecycle-viewmodel-2.1.0\proguard.txt

# proguard rule start: E:\Android\.gradle\caches\transforms-3\547bee1da275b1fcd941e9fd96ab6f62\transformed\rules\lib\META-INF\proguard\androidx-annotations.pro
-keep,allowobfuscation @interface androidx.annotation.Keep
-keep @androidx.annotation.Keep class * {*;}

-keepclasseswithmembers class * {
    @androidx.annotation.Keep <methods>;
}

-keepclasseswithmembers class * {
    @androidx.annotation.Keep <fields>;
}

-keepclasseswithmembers class * {
    @androidx.annotation.Keep <init>(...);
}

-keepclassmembers,allowobfuscation class * {
  @androidx.annotation.DoNotInline <methods>;
}

# proguard rule end: E:\Android\.gradle\caches\transforms-3\547bee1da275b1fcd941e9fd96ab6f62\transformed\rules\lib\META-INF\proguard\androidx-annotations.pro

# proguard rule start: E:\Android\.gradle\caches\transforms-3\a674c8ddc45ed973a20987ce17134b02\transformed\jetified-annotation-experimental-1.1.0\proguard.txt
# Copyright (C) 2020 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Ignore missing Kotlin meta-annotations so that this library can be used
# without adding a compileOnly dependency on the Kotlin standard library.
-dontwarn kotlin.Deprecated
-dontwarn kotlin.Metadata
-dontwarn kotlin.ReplaceWith
-dontwarn kotlin.annotation.AnnotationRetention
-dontwarn kotlin.annotation.AnnotationTarget
-dontwarn kotlin.annotation.Retention
-dontwarn kotlin.annotation.Target

# proguard rule end: E:\Android\.gradle\caches\transforms-3\a674c8ddc45ed973a20987ce17134b02\transformed\jetified-annotation-experimental-1.1.0\proguard.txt

# proguard rule start: D:\androidtest\Proyek\240719\flutter_secure_handler_kotlin\build\app\intermediates\default_proguard_files\global\proguard-android.txt-7.3.1
# This is a configuration file for ProGuard.
# http://proguard.sourceforge.net/index.html#manual/usage.html
#
# Starting with version 2.2 of the Android plugin for Gradle, this file is distributed together with
# the plugin and unpacked at build-time. The files in $ANDROID_HOME are no longer maintained and
# will be ignored by new version of the Android plugin for Gradle.

# Optimization is turned off by default. Dex does not like code run
# through the ProGuard optimize steps (and performs some
# of these optimizations on its own).
# Note that if you want to enable optimization, you cannot just
# include optimization flags in your own project configuration file;
# instead you will need to point to the
# "proguard-android-optimize.txt" file instead of this one from your
# project.properties file.
-dontoptimize

-dontusemixedcaseclassnames
-dontskipnonpubliclibraryclasses
-verbose

# Preserve some attributes that may be required for reflection.
-keepattributes AnnotationDefault,
                EnclosingMethod,
                InnerClasses,
                RuntimeVisibleAnnotations,
                RuntimeVisibleParameterAnnotations,
                RuntimeVisibleTypeAnnotations,
                Signature

-keep public class com.google.vending.licensing.ILicensingService
-keep public class com.android.vending.licensing.ILicensingService
-keep public class com.google.android.vending.licensing.ILicensingService
-dontnote com.android.vending.licensing.ILicensingService
-dontnote com.google.vending.licensing.ILicensingService
-dontnote com.google.android.vending.licensing.ILicensingService

# For native methods, see http://proguard.sourceforge.net/manual/examples.html#native
-keepclasseswithmembernames,includedescriptorclasses class * {
    native <methods>;
}

# Keep setters in Views so that animations can still work.
-keepclassmembers public class * extends android.view.View {
    void set*(***);
    *** get*();
}

# We want to keep methods in Activity that could be used in the XML attribute onClick.
-keepclassmembers class * extends android.app.Activity {
    public void *(android.view.View);
}

# For enumeration classes, see http://proguard.sourceforge.net/manual/examples.html#enumerations
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

-keepclassmembers class * implements android.os.Parcelable {
    public static final ** CREATOR;
}

# Preserve annotated Javascript interface methods.
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

# The support libraries contains references to newer platform versions.
# Don't warn about those in case this app is linking against an older
# platform version. We know about them, and they are safe.
-dontnote android.support.**
-dontnote androidx.**
-dontwarn android.support.**
-dontwarn androidx.**

# This class is deprecated, but remains for backward compatibility.
-dontwarn android.util.FloatMath

# Understand the @Keep support annotation.
-keep class android.support.annotation.Keep
-keep class androidx.annotation.Keep

-keep @android.support.annotation.Keep class * {*;}
-keep @androidx.annotation.Keep class * {*;}

-keepclasseswithmembers class * {
    @android.support.annotation.Keep <methods>;
}

-keepclasseswithmembers class * {
    @androidx.annotation.Keep <methods>;
}

-keepclasseswithmembers class * {
    @android.support.annotation.Keep <fields>;
}

-keepclasseswithmembers class * {
    @androidx.annotation.Keep <fields>;
}

-keepclasseswithmembers class * {
    @android.support.annotation.Keep <init>(...);
}

-keepclasseswithmembers class * {
    @androidx.annotation.Keep <init>(...);
}

# These classes are duplicated between android.jar and org.apache.http.legacy.jar.
-dontnote org.apache.http.**
-dontnote android.net.http.**

# These classes are duplicated between android.jar and core-lambda-stubs.jar.
-dontnote java.lang.invoke.**

# proguard rule end: D:\androidtest\Proyek\240719\flutter_secure_handler_kotlin\build\app\intermediates\default_proguard_files\global\proguard-android.txt-7.3.1

# proguard rule start: E:\Android\.gradle\caches\transforms-3\773e6000c9a5f2dd54d691f388dcb6e0\transformed\jetified-kotlinx-coroutines-android-1.5.2.jar\META-INF/proguard/coroutines.pro
# Files in this directory will be ignored starting with Android Gradle Plugin 3.6.0+

# When editing this file, update the following files as well for AGP 3.6.0+:
# - META-INF/com.android.tools/proguard/coroutines.pro
# - META-INF/com.android.tools/r8-upto-1.6.0/coroutines.pro

-keep class kotlinx.coroutines.android.AndroidDispatcherFactory {*;}

# proguard rule end: E:\Android\.gradle\caches\transforms-3\773e6000c9a5f2dd54d691f388dcb6e0\transformed\jetified-kotlinx-coroutines-android-1.5.2.jar\META-INF/proguard/coroutines.pro

# proguard rule start: E:\Android\.gradle\caches\transforms-3\773e6000c9a5f2dd54d691f388dcb6e0\transformed\jetified-kotlinx-coroutines-android-1.5.2.jar\META-INF/com.android.tools/r8-from-1.6.0/coroutines.pro
# Allow R8 to optimize away the FastServiceLoader.
# Together with ServiceLoader optimization in R8
# this results in direct instantiation when loading Dispatchers.Main
-assumenosideeffects class kotlinx.coroutines.internal.MainDispatcherLoader {
    boolean FAST_SERVICE_LOADER_ENABLED return false;
}

-assumenosideeffects class kotlinx.coroutines.internal.FastServiceLoaderKt {
    boolean ANDROID_DETECTED return true;
}

-keep class kotlinx.coroutines.android.AndroidDispatcherFactory {*;}

# Disable support for "Missing Main Dispatcher", since we always have Android main dispatcher
-assumenosideeffects class kotlinx.coroutines.internal.MainDispatchersKt {
    boolean SUPPORT_MISSING return false;
}

# Statically turn off all debugging facilities and assertions
-assumenosideeffects class kotlinx.coroutines.DebugKt {
    boolean getASSERTIONS_ENABLED() return false;
    boolean getDEBUG() return false;
    boolean getRECOVER_STACK_TRACES() return false;
}
# proguard rule end: E:\Android\.gradle\caches\transforms-3\773e6000c9a5f2dd54d691f388dcb6e0\transformed\jetified-kotlinx-coroutines-android-1.5.2.jar\META-INF/com.android.tools/r8-from-1.6.0/coroutines.pro

# proguard rule start: E:\Android\.gradle\caches\transforms-3\773e6000c9a5f2dd54d691f388dcb6e0\transformed\jetified-kotlinx-coroutines-android-1.5.2.jar\META-INF/com.android.tools/proguard/coroutines.pro
# When editing this file, update the following files as well:
# - META-INF/com.android.tools/r8-upto-1.6.0/coroutines.pro
# - META-INF/proguard/coroutines.pro

-keep class kotlinx.coroutines.android.AndroidDispatcherFactory {*;}

# proguard rule end: E:\Android\.gradle\caches\transforms-3\773e6000c9a5f2dd54d691f388dcb6e0\transformed\jetified-kotlinx-coroutines-android-1.5.2.jar\META-INF/com.android.tools/proguard/coroutines.pro

# proguard rule start: E:\Android\.gradle\caches\transforms-3\773e6000c9a5f2dd54d691f388dcb6e0\transformed\jetified-kotlinx-coroutines-android-1.5.2.jar\META-INF/com.android.tools/r8-upto-1.6.0/coroutines.pro
# When editing this file, update the following files as well:
# - META-INF/com.android.tools/proguard/coroutines.pro
# - META-INF/proguard/coroutines.pro

-keep class kotlinx.coroutines.android.AndroidDispatcherFactory {*;}

-assumenosideeffects class kotlinx.coroutines.internal.FastServiceLoader {
    boolean ANDROID_DETECTED return true;
}
# proguard rule end: E:\Android\.gradle\caches\transforms-3\773e6000c9a5f2dd54d691f388dcb6e0\transformed\jetified-kotlinx-coroutines-android-1.5.2.jar\META-INF/com.android.tools/r8-upto-1.6.0/coroutines.pro

# proguard rule start: E:\Android\.gradle\caches\transforms-3\7600eb617ddb364c4a1a82a7375694c8\transformed\jetified-kotlinx-coroutines-core-jvm-1.5.2.jar\META-INF/proguard/coroutines.pro
# ServiceLoader support
-keepnames class kotlinx.coroutines.internal.MainDispatcherFactory {}
-keepnames class kotlinx.coroutines.CoroutineExceptionHandler {}

# Most of volatile fields are updated with AFU and should not be mangled
-keepclassmembers class kotlinx.coroutines.** {
    volatile <fields>;
}

# Same story for the standard library's SafeContinuation that also uses AtomicReferenceFieldUpdater
-keepclassmembers class kotlin.coroutines.SafeContinuation {
    volatile <fields>;
}

# These classes are only required by kotlinx.coroutines.debug.AgentPremain, which is only loaded when
# kotlinx-coroutines-core is used as a Java agent, so these are not needed in contexts where ProGuard is used.
-dontwarn java.lang.instrument.ClassFileTransformer
-dontwarn sun.misc.SignalHandler
-dontwarn java.lang.instrument.Instrumentation
-dontwarn sun.misc.Signal

# proguard rule end: E:\Android\.gradle\caches\transforms-3\7600eb617ddb364c4a1a82a7375694c8\transformed\jetified-kotlinx-coroutines-core-jvm-1.5.2.jar\META-INF/proguard/coroutines.pro

# proguard rule start: E:\Android\.gradle\caches\modules-2\files-2.1\androidx.annotation\annotation\1.2.0\57136ff68ee784c6e19db34ed4a175338fadfde1\annotation-1.2.0.jar\META-INF/proguard/androidx-annotations.pro
-keep,allowobfuscation @interface androidx.annotation.Keep
-keep @androidx.annotation.Keep class * {*;}

-keepclasseswithmembers class * {
    @androidx.annotation.Keep <methods>;
}

-keepclasseswithmembers class * {
    @androidx.annotation.Keep <fields>;
}

-keepclasseswithmembers class * {
    @androidx.annotation.Keep <init>(...);
}

-keepclassmembers,allowobfuscation class * {
  @androidx.annotation.DoNotInline <methods>;
}

# proguard rule end: E:\Android\.gradle\caches\modules-2\files-2.1\androidx.annotation\annotation\1.2.0\57136ff68ee784c6e19db34ed4a175338fadfde1\annotation-1.2.0.jar\META-INF/proguard/androidx-annotations.pro


# appsuit rule start: D:\androidtest\Proyek\240719\flutter_secure_handler_kotlin\android\appsuit\rule.pro
-logout_std
-no_remove_logging #배포 시 제외

# android standard
-keep class android.** { *; }
-keep class androidx.** { *; }

-keepbare class android.** { *; }
-keepbare class androidx.** { *; }

-keep class org.apache.** { *; }
-keepstrings class org.apache.** { *; }

# kotlin library
-keep class kotlin.** { *; }
-keep class kotlinx.** { *; }

# firebase rule 
-keep class com.google.** { *; }
-keepreflect class com.google.** { *; }
-keepstrings class com.google.** { *; }
-keepflow class com.google.** { *; }

# third-party
-keep class javax.** { *; }
-keep class okhttp3.** { *; }
-keepreflect class okhttp3.** { *; }

-keep class okio.** { *; }
-keep class retrofit2.** { *; }
-keep class io.reactivex.** { *; }
-keep class dagger.** { *; }
-keep class org.xmlpull.** { *; }
-keep class butterknife.** { *; }

-keep class com.facebook.** { *; }
-keepreflect class com.facebook.** { *; }
-keep class android.support.v4.app.** { *; }
-keepbare class android.support.v4.app.** { *; }

# except layout, component
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference
-keep public class * extends android.widget.TextView

-keepclassmembers class * { @android.webkit.JavascriptInterface <methods>; }

-keepclasseswithmembernames class * {
native <methods>;
}

-keepclassmembers class * extends android.support.v7.app.AppCompatActivity {
public void *(android.view.View);
}

-keepclassmembers class * extends android.app.Activity {
public void *(android.view.View);
}

-keepclassmembers enum * {
    values(...);
    valueOf(...);
}

-keepreflect class a.AppSuitDexLoader { *; }
-keepreflect class a.AppSuitDexLoader$* { *; }
-keepstrings class a.AppSuitDexLoader { *; }
-keepstrings class a.AppSuitDexLoader$* { *; }

-reflect_flow_target_all

-keepreflect class **.Dagger* { *; }

-keepreflect class **$** { public final invoke(...); }
-keepreflect class **$** { @androidx.compose.runtime.Composable <methods>; }
-keepreflect class **.** { @androidx.compose.runtime.Composable <methods>; }

-use_api_desugar
-use_d8
-sync_lib_proguard_rules

### ### ###

-dumpprofile proguard

-keep class io.flutter.** { *; }
-keepbare class io.flutter.** { *; }
-keepstrings class io.flutter.** { *; }
-keepreflect class io.flutter.** { *; }
-keepflow class io.flutter.** { *; }

-secure_handler_timeout 5000
#-secure_handler com.example.flutter_3_22.MainActivity.showAppSuitDialog
#-secure_handler com.example.flutter_3_22.MainActivity.showHandlerDialog
-secure_handler com.example.flutter_3_22.AppSuitDialog.showHandlerDialog
-secure_handler_detail

# appsuit rule end: D:\androidtest\Proyek\240719\flutter_secure_handler_kotlin\android\appsuit\rule.pro
# Mon Aug 19 15:45:52 ICT 2024
