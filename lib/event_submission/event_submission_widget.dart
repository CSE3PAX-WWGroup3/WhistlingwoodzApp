import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'event_submission_model.dart';
export 'event_submission_model.dart';

class EventSubmissionWidget extends StatefulWidget {
  const EventSubmissionWidget({
    super.key,
    required this.eventType,
    required this.email,
    required this.theme,
    required this.venue,
    required this.numberGuests,
    required this.budget,
    required this.eventID,
    required this.functions,
    required this.submissionResult,
  });

  final String? eventType;
  final String? email;
  final String? theme;
  final String? venue;
  final String? numberGuests;
  final String? budget;
  final String? eventID;
  final String? functions;
  final String? submissionResult;

  @override
  State<EventSubmissionWidget> createState() => _EventSubmissionWidgetState();
}

class _EventSubmissionWidgetState extends State<EventSubmissionWidget> {
  late EventSubmissionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventSubmissionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EventSubmission'});
    _model.messageController ??= TextEditingController();
    _model.messageFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF800306),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).primaryBtnText,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: const Color(0xFF0E0E0E),
                      icon: const Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'EVENT_SUBMISSION_PAGE_home_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_to');

                        context.pushNamed('LandingPage');
                      },
                    ),
                    Expanded(
                      flex: 10,
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 30.0, 0.0),
                          child: Text(
                            'Event Submission ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  fontSize: FFAppState().fontSize22,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ].addToStart(const SizedBox(width: 10.0)),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/MicrosoftTeams-image_(11).png',
                    width: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Submission parameters',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: FFAppState().fontSize18,
                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Event Type',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: FFAppState().fontSize14,
                            ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        valueOrDefault<String>(
                          widget.eventType,
                          'eventType',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: FFAppState().fontSize14,
                            ),
                      ),
                    ),
                  ]
                      .addToStart(const SizedBox(width: 10.0))
                      .addToEnd(const SizedBox(width: 10.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'email address',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: FFAppState().fontSize14,
                            ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        valueOrDefault<String>(
                          widget.email,
                          'email',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: FFAppState().fontSize14,
                            ),
                      ),
                    ),
                  ]
                      .addToStart(const SizedBox(width: 10.0))
                      .addToEnd(const SizedBox(width: 10.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Event Theme',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: FFAppState().fontSize14,
                            ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        valueOrDefault<String>(
                          widget.theme,
                          'theme',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: FFAppState().fontSize14,
                            ),
                      ),
                    ),
                  ]
                      .addToStart(const SizedBox(width: 10.0))
                      .addToEnd(const SizedBox(width: 10.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Requirements',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: FFAppState().fontSize14,
                            ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        valueOrDefault<String>(
                          widget.functions,
                          'functions',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Colors.white,
                              fontSize: FFAppState().fontSize14,
                            ),
                      ),
                    ),
                  ]
                      .addToStart(const SizedBox(width: 10.0))
                      .addToEnd(const SizedBox(width: 10.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Venue',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: FFAppState().fontSize14,
                            ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        valueOrDefault<String>(
                          widget.venue,
                          'venue',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: FFAppState().fontSize14,
                            ),
                      ),
                    ),
                  ]
                      .addToStart(const SizedBox(width: 10.0))
                      .addToEnd(const SizedBox(width: 10.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        '# guests',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: FFAppState().fontSize14,
                            ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        valueOrDefault<String>(
                          widget.numberGuests,
                          '# guests',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: FFAppState().fontSize14,
                            ),
                      ),
                    ),
                  ]
                      .addToStart(const SizedBox(width: 10.0))
                      .addToEnd(const SizedBox(width: 10.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Budget',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: FFAppState().fontSize14,
                            ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        valueOrDefault<String>(
                          widget.budget,
                          'budget',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: FFAppState().fontSize14,
                            ),
                      ),
                    ),
                  ]
                      .addToStart(const SizedBox(width: 10.0))
                      .addToEnd(const SizedBox(width: 10.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Event ID',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: FFAppState().fontSize14,
                            ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        valueOrDefault<String>(
                          widget.eventID,
                          'eventID',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: FFAppState().fontSize14,
                            ),
                      ),
                    ),
                  ]
                      .addToStart(const SizedBox(width: 10.0))
                      .addToEnd(const SizedBox(width: 10.0)),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.submissionResult,
                              'submission result',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  fontSize: FFAppState().fontSize14,
                                ),
                          ),
                        ),
                      ),
                    ]
                        .addToStart(const SizedBox(width: 10.0))
                        .addToEnd(const SizedBox(width: 10.0)),
                  ),
                ),
                Text(
                  'Please provide feedback',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        fontSize: FFAppState().fontSize16,
                      ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: TextFormField(
                    controller: _model.messageController,
                    focusNode: _model.messageFocusNode,
                    textInputAction: TextInputAction.done,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Please enter your feebback here ...',
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Readex Pro',
                                color: const Color(0xFF0E0E0E),
                                fontSize: FFAppState().fontSize14,
                              ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Readex Pro',
                                fontSize: FFAppState().fontSize14,
                              ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: const Color(0xFF0E0E0E),
                          fontSize: FFAppState().fontSize14,
                        ),
                    maxLines: 5,
                    minLines: 1,
                    validator:
                        _model.messageControllerValidator.asValidator(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).primaryBtnText,
                        icon: Icon(
                          Icons.thumb_up,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'EVENT_SUBMISSION_PAGE_Positive_ON_TAP');
                          logFirebaseEvent('Positive_custom_action');
                          await actions.setFeedback(
                            'positive',
                          );
                          logFirebaseEvent('Positive_backend_call');

                          await UserFeedbackRecord.collection.doc().set({
                            ...createUserFeedbackRecordData(
                              feedback: 'Positive',
                              email: widget.email,
                              message: _model.messageController.text,
                            ),
                            ...mapToFirestore(
                              {
                                'timestamp': FieldValue.serverTimestamp(),
                              },
                            ),
                          });
                          logFirebaseEvent('Positive_navigate_to');

                          context.pushNamed('LandingPage');
                        },
                      ),
                      FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).primaryBtnText,
                        icon: Icon(
                          Icons.thumb_down,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'EVENT_SUBMISSION_PAGE_Negative_ON_TAP');
                          logFirebaseEvent('Negative_navigate_to');

                          context.pushNamed('LandingPage');

                          logFirebaseEvent('Negative_backend_call');

                          await UserFeedbackRecord.collection.doc().set({
                            ...createUserFeedbackRecordData(
                              feedback: 'Negative',
                              email: widget.email,
                              message: _model.messageController.text,
                            ),
                            ...mapToFirestore(
                              {
                                'timestamp': FieldValue.serverTimestamp(),
                              },
                            ),
                          });
                          logFirebaseEvent('Negative_custom_action');
                          await actions.setFeedback(
                            'negative',
                          );
                        },
                      ),
                    ]
                        .divide(const SizedBox(width: 30.0))
                        .addToStart(const SizedBox(width: 10.0))
                        .addToEnd(const SizedBox(width: 10.0)),
                  ),
                ),
              ]
                  .divide(const SizedBox(height: 5.0))
                  .addToStart(const SizedBox(height: 5.0))
                  .addToEnd(const SizedBox(height: 5.0)),
            ),
          ),
        ),
      ),
    );
  }
}
