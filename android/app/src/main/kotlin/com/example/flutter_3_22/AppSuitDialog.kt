package com.example.flutter_3_22

import android.app.AlertDialog
import android.content.Context
import android.os.Handler
import android.os.Looper
import android.util.Log

class AppSuitDialog {
    companion object {
        private var ctx: Context? = null

        fun init(context: Context) {
            ctx = context
        }

        @JvmStatic
        fun callDialog(message: String) {
            val handler = Handler(Looper.getMainLooper())
            handler.postDelayed({
                AlertDialog.Builder(ctx!!)
                    .setTitle("AppSuit Detection Result")
                    .setMessage(message)
                    .setPositiveButton("OK") { dialog, _ ->
                        dialog.dismiss()
                    }
                    .show()
            }, 0)
        }

        @JvmStatic
        fun showHandlerDialog(type: Int) {
            val mainCategory = type shr 16
            val subCategory = (type shr 12) and 0xF

            when (mainCategory) {
                1 -> {
                    Log.e("AppSuitSecureHandler", " / Rooting with $subCategory")
                    when (subCategory) {
                        1 -> {
                            Log.e("AppSuitSecureHandler", " / Rooting detected with root paths")
                            callDialog("Rooting with root paths")
                        }
                        2 -> {
                            Log.e("AppSuitSecureHandler", " / Rooting detected with root files")
                            callDialog("Rooting with root files")
                        }
                        3 -> {
                            Log.e("AppSuitSecureHandler", " / Rooting with Magisk")
                            callDialog("Rooting with Magisk $subCategory")
                        }
                        else -> {
                            Log.e("AppSuitSecureHandler", " / Rooting with $subCategory")
                            callDialog("Not Specified Category $subCategory")
                        }
                    }
                }
                2 -> {
                    Log.e("AppSuitSecureHandler", " / integrity $subCategory")
                    when (subCategory) {
                        1 -> {
                            Log.e("AppSuitSecureHandler", " /  detected as resource tampering")
                            callDialog("Resource Tampering Detection")
                        }
                        2 -> {  
                            Log.e("AppSuitSecureHandler", " / detected as so tampering")
                            callDialog("SO Tampering Detection")
                        }
                        else -> {
                            Log.e("AppSuitSecureHandler", " / Integrity with $subCategory")
                            callDialog("Not Specified category $subCategory")
                        }
                    }
                }
                3 -> {
                    Log.e("AppSuitSecureHandler", " / debugging $subCategory")
                    when (subCategory) {
                        1 -> {
                            Log.e("AppSuitSecureHandler", " /  Debugging as Signal-based")
                            callDialog("Signal-based Detection")
                        }
                        2 -> {  
                            Log.e("AppSuitSecureHandler", " / Debugging as Signal-based")
                            callDialog("Signal-based Detection")
                        }
                        3 -> {  
                            Log.e("AppSuitSecureHandler", " / Debugging as Signal-based")
                            callDialog("Signal-based Detection")
                        }
                        4 -> {  
                            Log.e("AppSuitSecureHandler", " / Debugging as Signal-based")
                            callDialog("Signal-based Detection")
                        }
                            5 -> {
                                Log.e("AppSuitSecureHandler", " / Debugging as JDWP // Deprecated")
                                callDialog("JDWP Detection // Deprecated")
                            }
                            6 -> {
                                Log.e("AppSuitSecureHandler", " / Debugging with Frida")
                                callDialog("Frida Detection")
                            }
                            7 -> {
                                Log.e("AppSuitSecureHandler", " / Debugging with USB")
                                callDialog("USB Detection")
                            }
                            8 -> {
                                    Log.e("AppSuitSecureHandler", " / Debugging with ADB")
                                callDialog("ADB Detection")
                            }
                            9 -> {
                                Log.e("AppSuitSecureHandler", " / Debugging with memory tampering")
                                callDialog("Memory Tampering Detection")
                            }
                            10 -> {
                                Log.e("AppSuitSecureHandler", " / Debugging with Hook")
                                callDialog("Hook Detection")
                            }
                            else -> {
                                Log.e("AppSuitSecureHandler", " / Integrity with $subCategory")
                                callDialog("Not Specified Category $subCategory")
                            }
                    }
                }   
                4 -> {
                    Log.e("AppSuitSecureHandler", " / emul $subCategory")
                    when (subCategory) {
                        1 -> {
                            Log.e("AppSuitSecureHandler", " /  App running on emulator with emul")
                            callDialog("Emul Detected")
                        }
                        2 -> {  
                            Log.e("AppSuitSecureHandler", " / App running on emulator with Nox")
                            callDialog("Nox Detected")
                        }
                        3 -> {  
                            Log.e("AppSuitSecureHandler", " / App running on emulator with Memu")
                            callDialog("Memu Detected")
                        }
                        4 -> {  
                            Log.e("AppSuitSecureHandler", " / App running on emulator with BlueStack")
                            callDialog("BlueStack Detected")
                        }
                        5 -> {  
                            Log.e("AppSuitSecureHandler", " / App running on emulator with LdPlayer")
                            callDialog("LdPlayer Detected")
                        }
                        6 -> {  
                            Log.e("AppSuitSecureHandler", " / App running on emulator with Mumu")
                            callDialog("Mumu Detected")
                        }
                        else -> {
                            Log.e("AppSuitSecureHandler", " / Integrity with $subCategory")
                            callDialog("Not Specified category $subCategory")
                        }
                    }
                }
                else -> {
                    Log.e("AppSuitSecureHandler", " / unknown detection")
                    callDialog("Unknown detection")
                }
            }
            Log.e("AppSuitSecureHandler", " / " + Integer.toHexString(type))
        }
    }
}
