# Whistling Woodz Event App

Whistling Woodz is a mobile event application that compliments the Whistling Woodz Events and Ceremonies website.
https://whistlingwoodz.com.au/

The application allows users to perform the following functions:
    - create a profile
    - submit a wedding request
    - submit a party request
    - submit a coprorate request
    - view a gallery of photos
    - leave feedback
The application allows the manager to perform the following functions:
    - send a message to a client
    - download a csv file
    - list feedback
    - view pdf event request

The following documents have been bundled with the submission are and available to support the application.
1. Whistling Woodz Final Project Report
   - covers the technologies and development in detail including, technologies used, local setup, 
   database configuration, deployment and github usage
2. Whistling Woodz Event Application End User Documentation
   - end user help guide
3. Whistling Woodz Event Application Admin and Manager User Documentation
    - admin and manager end user help guide
4. Whistling Woodz Testing Document
   - test results

# Permissions and Restrictions Modifying the Code
Code changes and modifications are restricted to authorised contributors only. No changes should be made 
to the code without prior authorisation. 

# Requests and Issues
Requests and issues can be lodged through the issues page. Contributors monitor the page on a regular basis.
https://github.com/CSE3PAX-WWGroup3/WhistlingwoodzApp/issues

Further details regarding the design of the application can be found below.

# FRONT END 
The User Interface was created using FlutterFlow, a web application that employs a user-friendly 
"no code" approach to creating an application. FlutterFlow allows for live testing and instant reload 
while developing the application, and once ready for deployment, converts the design into a Flutter 
application using the dart programming language. 
The code then deployable on multiple device types and platforms for maximum accessibility for clients. 
FlutterFlow provides a variety of widgets, buttons, and actions to ensure client interactions within 
the application are seamless and intuitive based on the design ideas provided by the Project Stakeholder. 
To address the Project requirements, we used assets such as forms, login and authentication fields, 
galleries, web links and were able through actions to program these to direct information to the 
Back End and the Whistlingwoodz Events website.

# BACK END 
The Back End of the application uses Firebase Firestore and Google Analytics to meet the requirements 
and functionality required of the application. These include database storage and retrieval of 
information for user profiles, client details and the event enquiries. Access to dashboards within 
the firebase console and the application to track live user traffic and performance monitoring 
through real time analytics.
The Trigger Email from Firestore extension is used to provide clients and managers with a response 
email on event enquiry submission and allow for queries and help requests to be sent to the 
administration team. and the use of Google Analytics is used to export reports to both CSV and PDF 
formats for ease of reporting to Whistlingwoodz Executives, which are accessible through the application.  
We have used Firebase Authentication to control access to Administrator and Manager Interfaces in 
order to meet their various requirements.
 
# CODE STRUCTURE:
Code structure for Whistlingwoodz mobile application project is a structure which is applied in a 
Flutter project and when we use Android Studio as IDE will be as follow: 
  .dart_tool folder:
    - dartpad folder: includes dart file for all web plugins.
    - Flutter_build folder: includes dart plugins file and all stamp files.
    - Package config file and version information
  .idea folder:
  - libraries folder: packages, SDK and plugins xml files
  - modules and workspaces information xml files
  - -assets folder: includes any media, imported images, fonts or color scheme and pdf files
  - lib: includes folders for each page in the App, containing dart files for both widgets and 
  - functions for each page. It also holds the main.dart file.
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
         DATABASE CONFIGURATION:

#Database
The database used by the Application is the Firebase Cloud Firestore NoSQL database.
The database has collections to store information for the Application.

CLOUD FIRESTORE COLLECTIONS
DOCID
The docID collection is used to help generate the unique 6-character event identifier. It contains 
a single document (docID) with a single numeric field (nextID) which is incremented when an event submission occurs.
A screenshot of a computer
Description automatically generated
The docID collection.

EVENTS
The events collection contains all the submitted event requests. The documents in this collection 
are identified by the unique 6-character identifier outlined above. The fields for this collection 
are as follows: -
budget		the estimated budget range.
email			the event requester's email address.
eventType		event type (Wedding, Party or Corporate)
functions		event specific requirements.
numberGuests	number of expected guests for the event.
requestTime		time the event request was submitted.
theme			event specific theme for the event.
venue			requested location of the event.

MAIL
The mail collection is used to send emails for event submission notification and sending 
informational messages from Whistlingwoodz to their Client base.

FEEDBACK
The feedback collection is a simple counter of positive and negative feedback received from the 
client after the event has been submitted.

USER_FEEDBACK
The user_feedback collection is an improved feedback option that allows the client to supply written
information as well as the Positive/Negative feedback. The fields for this collection are: -
email			contact email to allow response to the feedback.
feedback		either Positive or Negative.
message		the text message supplied by the client.
timestamp		time the feedback was submitted.

Description automatically generated
Example of user feedback submission.

# USERS
The users collection contains the firebase user authentication information. The fields for the collection are: -
created_time	time user account was created.
display_name	user selected display name.
email			contact email address, used in event submission.
firstname
surname
last_active		time user was last active on the App.
last_page		location in App for the last_active entry.
isManager		if true allows manager permissions on the App.
isAdmin		if true allows admin permissions on the App.
uid			unique identifier for user account.

Description automatically generated
NOTES
The notes collection allows communication through the Application between the Manager and Client. 
The collection contains the following fields: -

dateNote	time the notes message was sent.
docID		document ID of the event that the note is related to.
isManager	is present if the sender of the note is a manager user.
Message	contents of the message being sent.

DROP-DOWN MENU COLLECTIONS
The following collections supply the information for the drop-down menus, this ensures the clients 
submitting requests have access to the latest options. 
There is one option per document in the collection. Budget and venues are common across all event types. 
    budget - this collection contains the options for the estimated budget for the event request.
    venues - this collection contains the options for the venues for the event, there is an "other" 
option to allow the Client to specify their own venue if they so desire.
    corporateFunction - event specific requirements options for corporate events.
    corporateTheme - event specific theme options for corporate events.
    partyFunction - event specific requirements options for party events.
    partyTheme - event specific theme options for party events.
    weddingFunction - event specific requirements options for wedding events. 
    weddingTheme - event specific theme options for wedding events. 

