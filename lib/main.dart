import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart'; // Import Hive

// Import your theme files

import 'package:gesturetalk1/views/screen/home/dashboardscreen.dart';
import 'package:gesturetalk1/config/theme/light_theme.dart';
import 'package:gesturetalk1/config/theme/dark_theme.dart';

// Import your controller for theme management
import 'package:gesturetalk1/controller/theme_controller.dart';

// Import the routes file and your splash screen
import 'package:gesturetalk1/config/routes/app_routes.dart';
import 'package:gesturetalk1/config/routes/app_pages.dart'; // Make sure this is correct
//import 'package:gesturetalk1/views/screen/launch/splashscreen.dart';

void main() async {
  await Hive.initFlutter(); // Initialize Hive
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZmaG9yem9yY3RzamdycWVleGt0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU2OTE4NDcsImV4cCI6MjA2MTI2Nzg0N30.8Z2yiVATZQG4lfLJW17VhUZXepGSvmJD3f4VpVeg0hM",
    url: "https://ffhorzorctsjgrqeexkt.supabase.co",
  );

  // Initialize GetStorage
  await GetStorage.init();
  // Initialize ThemeController globally
  Get.put(ThemeController()); // This initializes the ThemeController globally

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing the ThemeController
    final ThemeController _themeController = Get.find<ThemeController>();

    return GetMaterialApp(
      title: 'GestureTalk',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeController.theme, // This controls the global theme
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      initialRoute: AppRoutes.dashboard, // Define initial route here
      getPages: AppPages.pages, // Use the routes from AppPages
    );
  }
}
