# Whistling Woodz Event App

Whistling Woodz is a mobile event application to support Whistling Woodz Events and Ceremonies website.

The mobile application allows users to view and submit Wedding 

What the project does
Why the project is useful
How users can get started with the project
Where users can get help with your project
Who maintains and contributes to the project

## Getting Started

FlutterFlow projects are built to run on the Flutter _stable_ release.


# FRONT END 
The User Interface was created using FlutterFlow, a web application that employs a user-friendly "no code" approach to creating an application. FlutterFlow allows for live testing and instant reload while developing the application, and once ready for deployment, converts the design into a Flutter application using the dart programming language. 
The code then deployable on multiple device types and platforms for maximum accessibility for clients. 
FlutterFlow provides a variety of widgets, buttons, and actions to ensure client interactions within the application are seamless and intuitive based on the design ideas provided by the Project Stakeholder. 
To address the Project requirements, we used assets such as forms, login and authentication fields, galleries, web links and were able through actions to program these to direct information to the Back End and the Whistlingwoodz Events website.

# BACK END 
The Back End of the application uses Firebase Firestore and Google Analytics to meet the requirements and functionality required of the application. These include database storage and retrieval of information for user profiles, client details and the event enquiries. Access to dashboards within the firebase console and the application to track live user traffic and performance monitoring through real time analytics.
The Trigger Email from Firestore extension is used to provide clients and managers with a response email on event enquiry submission and allow for queries and help requests to be sent to the administration team. and the use of 
Google Analytics is used to export reports to both CSV and PDF formats for ease of reporting to Whistlingwoodz Executives, which are accessible through the application.  
We have used Firebase Authentication to control access to Administrator and Manager Interfaces in order to meet their various requirements.
 
# CODE STRUCTURE:
Code structure for Whistlingwoodz mobile application project is a structure which is applied in a Flutter project and when we use Android Studio as IDE will be as follow: 
  .dart_tool folder:
    - dartpad folder: includes dart file for all web plugins.
    - Flutter_build folder: includes dart plugins file and all stamp files.
    - Package config file and version information
  .idea folder:
  - libraries folder: packages, SDK and plugins xml files
  - modules and workspaces information xml files
  - -assets folder: includes any media, imported images, fonts or color scheme and pdf files
  - lib: includes folders for each page in the App, containing dart files for both widgets and functions for each page. It also holds the main.dart file.
  android folder:
   - .gradle containing metadata.
   - app
       - src folder
           - debug folder
           - main folder
               - java folder
               - kotlin folder
               - res folder: containing styles and values
           - profile folder: contains Android manifest xml file
       - gradle
       - files 
  ios folder:
    - Flutter folder
    - Runner folder
    - Other folders containing information for xcode and workspaces.
  web folder: contains index.html files and png files for icons etc.
  test folder: contains widget_test dart file.
  Other plugins and dependencies files


