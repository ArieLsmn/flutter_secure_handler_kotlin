package com.example.flutter_3_22

import android.app.AlertDialog
import android.content.Context
import android.content.DialogInterface
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        AppSuitDialog.init(this)
        init(this@MainActivity)
    }

    companion object {
        var ctx: Context? = null

        fun init(ctx: Context) {
            this.ctx = ctx
        }

        // @JvmStatic
        // fun callDialog(message: String) {
        //     val handler = Handler(Looper.getMainLooper())
        //     handler.postDelayed({
        //         AlertDialog.Builder(ctx)
        //             .setTitle("AppSuit Detection Result")
        //             .setMessage(message)
        //             .setPositiveButton("OK") { dialog, _ ->
        //                 dialog.dismiss()
        //             }
        //             .show()
        //     }, 0)
        // }

        // @JvmStatic
        // fun showHandlerDialog(type: Int) {
        //     val message = when (type) {
        //         1 -> "Rooting detected"
        //         2 -> "App tampering detected"
        //         3 -> "Debugging attempt detected"
        //         4 -> "App running on emulator"
        //         else -> "Unknown detection"
        //     }
        //     callDialog(message)
        // }

        // @JvmStatic
        // fun showAppSuitDialog(err: Int) {
        //     val handler = Handler(Looper.getMainLooper())

        //     handler.postDelayed({
        //         val builder = AlertDialog.Builder(ctx)

        //         builder.setTitle("AppSuit")
        //             .setMessage("" + err)
        //             .setPositiveButton("OK") { dialogInterface, i ->
        //                 dialogInterface.dismiss()
        //             }

        //         builder.show()
        //     }, 0)
        // }
    }
}
