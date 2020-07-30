package reynando.zeffry.peduli_utang
import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback
import io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin
import io.flutter.view.FlutterMain
import io.flutter.plugins.firebasemessaging.FlutterFirebaseMessagingService
import com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin

class Application : FlutterApplication(), PluginRegistrantCallback {

	override fun onCreate() {
		super.onCreate()
		FlutterFirebaseMessagingService.setPluginRegistrant(this);
		FlutterMain.startInitialization(this)
	}

	override fun registerWith(registry: PluginRegistry?) {
		FirebaseMessagingPlugin.registerWith(registry!!.registrarFor("io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin"));
		FlutterLocalNotificationsPlugin.registerWith(registry!!.registrarFor("com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin"));		
	}
}