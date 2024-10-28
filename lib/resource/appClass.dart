import 'package:flutter/material.dart';
import 'package:portfolio/model/experienceModel.dart';
import 'package:portfolio/resource/styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

enum ScreenType { mobile, tab, web }

class AppClass {
  static final AppClass _mAppClass = AppClass._internal();
  static BuildContext? lastContext;
  ScrollController controller = ScrollController();

  /* URL */
  static final resumeDownloadURL =
      '''https://drive.google.com/file/d/1DniYQyDACUA2Sk-VxsAwzhIFm_yDiDm9/view?usp=sharing''';

  static final gitEZ = '''https://github.com/haadiyaa/eventeaze''';

  static final gitWeather = '''https://github.com/haadiyaa/weather_app''';
  static final gitTodo = '''https://github.com/haadiyaa/todo_app''';
  static final gitGemini = '''https://github.com/haadiyaa/geminibot''';
  static final gitStudent = '''https://github.com/haadiyaa/student-details''';
  static final gitHidhaya = '''https://github.com/haadiyaa/hidhayah_app''';
  static final gitMainford = '''https://github.com/haadiyaa/mainford''';

  List<WorkModel> projectList = [
    WorkModel(
        projectTitle: "EventEaze",
        projectContent:
            '''A Flutter Event Management App built using Firebase and Bloc state management. With a user-friendly interface, EventEaze allows event organizers to create and manage events effortlessly while providing attendees with easy access to events.

Features
- Users can discover events by categories .
- Create paid and free events with detailed description and image. They can also edit and delete their events.
- Search functionality for discovering events.
- Users can share the event details with friends and on social media platforms directly for the app.
- The event organizers get notifications when the attendees join the event.''',
        tech1: "Flutter",
        tech2: "Firebase",
        tech3: "BLoC"),
    WorkModel(
        projectTitle: "Hidhayah",
        projectContent:
            '''A comprehensive Islamic app developed using Flutter and Bloc state management. Leverages APIs for data-driven content and features. Offers a user-friendly interface for practicing Muslims.

Features
- Arabic text, translations, and audio recitations for in-depth Quranic study and arabic text and English translations of daily supplications.
- Accurate prayer time calculations based on user location and real-time Qibla direction finder using the device's compass.
- Provides both Gregorian and Hijri calendars for date tracking.
- Delivers Islamic lectures, sermons, and other educational videos and interactive quizzes to test Islamic knowledge.
- Digital tasbih for tracking dhikr.''',
        tech1: "Flutter",
        tech2: "API",
        tech3: "BLoC"),
    WorkModel(
      projectTitle: "Weather App",
      projectContent:
          '''A Flutter application built with flutter and provider state management, which utilize http for API integration. It provides the current weather data.

Features
- Fetch curent location: Provides weather data according to the user’s current location
- Search other city’s weather: user can search any other city to get the weather of that city.''',
      tech1: "Flutter",
      tech2: "API",
      tech3: "Provider",
    ),
    WorkModel(
      projectTitle: "To-do App",
      projectContent:
          '''A Flutter Todo app which is designed to manage your tasks efficiently and effectively, utilizing bloc statemanagement and local storage.

Features
- Light and Dark Themes: Customise the look to suit your preference.
- Comprehensive Task Management: Add, edit, delete, and update your tasks with ease.
- Organized Task View: Separate views for pending and completed tasks to keep you organized.
          ''',
      tech1: "Flutter",
      tech2: "BLoC",
    ),
    WorkModel(
      projectTitle: "Gemini Chatbot",
      projectContent:
          '''A Chatbot application using Gemini API made with flutter. Uses Provider State management. User can ask any doubts only text-input is supported''',
      tech1: "Flutter",
      tech2: "Gemini API",
      tech3: "Provider",
    ),
    WorkModel(
        projectTitle: "Student Management App",
        projectContent:
            '''A Flutter application for storing and displaying student details using SQFlite as database and implementing the MVC architecture.

Features
- Image picker : Image picking functionality for student profile picture.
- Management details: Add, edit and delete the students details.''',
        tech1: "Flutter",
        tech2: "SQFlite",
        tech3: "MVC"),
    WorkModel(
        projectTitle: "Main Ford",
        projectContent:
            '''A Flutter Learning App built using API Integration and Provider state management. With a user-friendly interface, Main Ford allows users to watch videos effortlessly while refering other firends to app.

Features
- Integrated user registration, admin approval, email-based login.
- Implemented features like referral tracking, withdrawal requests, and seamless video learning on the dashboard.''',
        tech1: "Flutter",
        tech2: "Api Integration",
        tech3: "Provider"),
  ];

  factory AppClass() {
    return _mAppClass;
  }

  AppClass._internal();

  getMqWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  getMqHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  showSnackBar(String msg, {BuildContext? context}) {
    ScaffoldMessenger.of(context ?? lastContext!)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  ScreenType getScreenType(BuildContext context) {
    double scrWidth = getMqWidth(context);
    if (scrWidth > 915) {
      return ScreenType.web;
    } else if (scrWidth < 650) {
      return ScreenType.mobile;
    }
    return ScreenType.tab;
  }

  downloadResume(context) async {
    await launchUrl(Uri.parse(AppClass.resumeDownloadURL));
  }

  alertDialog(context, title, msg) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
                title: Text(title, style: TxtStyle().boldWhite(context)),
                content: Text(msg),
                actions: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () => Navigator.pop(context),
                      child: Text('Okay'))
                ]));
  }

  Future<bool> sendEmail() async {
    String mailUrl = 'mailto:haadiyact@gmail.com';
    try {
      await launchUrlString(mailUrl);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Future<bool> sendEmail(name, contact, msg) async {
  //   var url = Uri.https('hbk-portfolio-mailer.web.app', '/sendMail');
  //   var response = await post(url,
  //           body: {"name": name, "contactInfo": contact, "message": msg})
  //       .timeout(Duration(seconds: 10));
  //   print(response.body);
  //   return response.statusCode == 200;
  // }
}
