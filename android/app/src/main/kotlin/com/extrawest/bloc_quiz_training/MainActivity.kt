package com.extrawest.bloc_quiz_training

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import androidx.annotation.NonNull

class MainActivity: FlutterActivity() {
  private val CHANNEL = "flavor_channel"

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
      call, result ->
            when (call.method) {
                "getFlavor" -> {
                    result.success(BuildConfig.FLAVOR)
                }
            }
    }
  }
}
