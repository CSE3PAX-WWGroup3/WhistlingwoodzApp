import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'LandingPage': ParameterData.none(),
  'weddings': ParameterData.none(),
  'Parties': ParameterData.none(),
  'Gallery': ParameterData.none(),
  'Services': ParameterData.none(),
  'Login': ParameterData.none(),
  'CreateAccount': ParameterData.none(),
  'PasswordReset': ParameterData.none(),
  'Corporate': ParameterData.none(),
  'EventSubmission': (data) async => ParameterData(
        allParams: {
          'eventType': getParameter<String>(data, 'eventType'),
          'email': getParameter<String>(data, 'email'),
          'theme': getParameter<String>(data, 'theme'),
          'venue': getParameter<String>(data, 'venue'),
          'numberGuests': getParameter<String>(data, 'numberGuests'),
          'budget': getParameter<String>(data, 'budget'),
          'eventID': getParameter<String>(data, 'eventID'),
          'functions': getParameter<String>(data, 'functions'),
          'submissionResult': getParameter<String>(data, 'submissionResult'),
        },
      ),
  'Admin': ParameterData.none(),
  'Manager': ParameterData.none(),
  'OnboardUser': ParameterData.none(),
  'addNotes': (data) async => ParameterData(
        allParams: {
          'eventID': getParameter<DocumentReference>(data, 'eventID'),
          'isManager': getParameter<bool>(data, 'isManager'),
        },
      ),
  'Client': ParameterData.none(),
  'ManagerLanding': ParameterData.none(),
  'ClientMessage': ParameterData.none(),
  'sentMessage': (data) async => ParameterData(
        allParams: {
          'title': getParameter<String>(data, 'title'),
          'message': getParameter<String>(data, 'message'),
        },
      ),
  'ClientLanding': ParameterData.none(),
  'ClientHelp': ParameterData.none(),
  'AdminLanding': ParameterData.none(),
  'ActiveUsers': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
