import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'manager_landing_model.dart';
export 'manager_landing_model.dart';

class ManagerLandingWidget extends StatefulWidget {
  const ManagerLandingWidget({super.key});

  @override
  _ManagerLandingWidgetState createState() => _ManagerLandingWidgetState();
}

class _ManagerLandingWidgetState extends State<ManagerLandingWidget> {
  late ManagerLandingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManagerLandingModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ManagerLanding'});
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
        appBar: AppBar(
          backgroundColor: const Color(0xFF800306),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('MANAGER_LANDING_arrow_back_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Manager',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 32.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF800306),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/MicrosoftTeams-image_(11).png',
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                            alignment: const Alignment(0.0, 0.0),
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'MANAGER_LANDING_MANAGER_DASHBOARD_BTN_ON');
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed('ManagerDashboards');
                        },
                        text: 'Manager Dashboard',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFF0E0E0E),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'MANAGER_LANDING_SUBMIT_NOTIFICATION_BTN_');
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed('ClientMessage');
                        },
                        text: 'Submit Notification',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFF0E0E0E),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'MANAGER_LANDING_MANAGER_CLIENT_REQUEST_B');
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed('Manager');
                        },
                        text: 'Manager Client Request',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFF0E0E0E),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'MANAGER_LANDING_PAGE_LogOut_ON_TAP');
                          logFirebaseEvent('LogOut_backend_call');

                          await currentUserReference!.update({
                            ...createUsersRecordData(
                              lastPage: 'Log Out',
                            ),
                            ...mapToFirestore(
                              {
                                'last_active': FieldValue.serverTimestamp(),
                              },
                            ),
                          });
                          logFirebaseEvent('LogOut_auth');
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          context.goNamedAuth('Login', context.mounted);
                        },
                        text: 'Log Out',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFF0E0E0E),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 10.0))
                        .addToStart(const SizedBox(height: 30.0))
                        .addToEnd(const SizedBox(height: 30.0)),
                  ),
                ),
              ),
              Text(
                'Latest Events Requests',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: StreamBuilder<List<EventsRecord>>(
                    stream: queryEventsRecord(
                      queryBuilder: (eventsRecord) =>
                          eventsRecord.orderBy('requestTime', descending: true),
                      limit: 5,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<EventsRecord> listViewEventsRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewEventsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewEventsRecord =
                              listViewEventsRecordList[listViewIndex];
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  listViewEventsRecord.reference.id,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  listViewEventsRecord.eventType,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  listViewEventsRecord.requestTime,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor: const Color(0xFF0E0E0E),
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                fillColor: Colors.white,
                                icon: Icon(
                                  Icons.chevron_right,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'MANAGER_LANDING_chevron_right_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_navigate_to');

                                  context.pushNamed(
                                    'addNotes',
                                    queryParameters: {
                                      'eventID': serializeParam(
                                        listViewEventsRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                      'isManager': serializeParam(
                                        true,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                              ),
                            ]
                                .addToStart(const SizedBox(width: 5.0))
                                .addToEnd(const SizedBox(width: 5.0)),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
