import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'landing_page_model.dart';
export 'landing_page_model.dart';

class LandingPageWidget extends StatefulWidget {
  const LandingPageWidget({super.key});

  @override
  _LandingPageWidgetState createState() => _LandingPageWidgetState();
}

class _LandingPageWidgetState extends State<LandingPageWidget> {
  late LandingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LandingPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LandingPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LANDING_LandingPage_ON_INIT_STATE');
      logFirebaseEvent('LandingPage_backend_call');

      await currentUserReference!.update({
        ...createUsersRecordData(
          lastPage: 'LandingPage',
        ),
        ...mapToFirestore(
          {
            'last_active': FieldValue.serverTimestamp(),
          },
        ),
      });
    });

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
        backgroundColor: const Color(0xFF010000),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Stack(
                children: [
                  Opacity(
                    opacity: 0.8,
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/MicrosoftTeams-image_1.png',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.13, -0.26),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/MicrosoftTeams-image_(11).png',
                        width: 300.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.03, 1.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('LANDING_PAGE_PAGE_weddingBtn_ON_TAP');
                        logFirebaseEvent('weddingBtn_backend_call');

                        await currentUserReference!.update({
                          ...createUsersRecordData(
                            lastPage: 'Wedding Event',
                          ),
                          ...mapToFirestore(
                            {
                              'last_active': FieldValue.serverTimestamp(),
                            },
                          ),
                        });
                        logFirebaseEvent('weddingBtn_navigate_to');

                        context.pushNamed('weddings');

                        logFirebaseEvent('weddingBtn_google_analytics_event');
                        logFirebaseEvent('view_item');
                      },
                      text: 'Wedding',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.black,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                        ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.52, 1.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('LANDING_PAGE_PAGE_partyBtn_ON_TAP');
                        logFirebaseEvent('partyBtn_backend_call');

                        await currentUserReference!.update({
                          ...createUsersRecordData(
                            lastPage: 'Party Event',
                          ),
                          ...mapToFirestore(
                            {
                              'last_active': FieldValue.serverTimestamp(),
                            },
                          ),
                        });
                        logFirebaseEvent('partyBtn_navigate_to');

                        context.pushNamed('Parties');

                        logFirebaseEvent('partyBtn_google_analytics_event');
                        logFirebaseEvent('view_item');
                      },
                      text: 'Party',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.black,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.05, 1.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'LANDING_PAGE_PAGE_corporateBtn_ON_TAP');
                        logFirebaseEvent('corporateBtn_backend_call');

                        await currentUserReference!.update({
                          ...createUsersRecordData(
                            lastPage: 'Corporate Event',
                          ),
                          ...mapToFirestore(
                            {
                              'last_active': FieldValue.serverTimestamp(),
                            },
                          ),
                        });
                        logFirebaseEvent('corporateBtn_navigate_to');

                        context.pushNamed('Corporate');

                        logFirebaseEvent('corporateBtn_google_analytics_event');
                        logFirebaseEvent('view_item');
                      },
                      text: 'Corporate',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.black,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.5, 1.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('LANDING_PAGE_PAGE_serviceBtn_ON_TAP');
                        logFirebaseEvent('serviceBtn_navigate_to');

                        context.pushNamed('Services');
                      },
                      text: 'Service',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFF0E0E0E),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.98, 1.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('LANDING_PAGE_PAGE_galleryBtn_ON_TAP');
                        logFirebaseEvent('galleryBtn_backend_call');

                        await currentUserReference!.update({
                          ...createUsersRecordData(
                            lastPage: 'Gallery',
                          ),
                          ...mapToFirestore(
                            {
                              'last_active': FieldValue.serverTimestamp(),
                            },
                          ),
                        });
                        logFirebaseEvent('galleryBtn_navigate_to');

                        context.pushNamed('Gallery');

                        logFirebaseEvent('galleryBtn_google_analytics_event');
                        logFirebaseEvent('view_item');
                      },
                      text: 'Gallery',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.black,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.5, 1.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('LANDING_PAGE_PAGE_serviceBtn_ON_TAP');
                        logFirebaseEvent('serviceBtn_backend_call');

                        await currentUserReference!.update({
                          ...createUsersRecordData(
                            lastPage: 'Services',
                          ),
                          ...mapToFirestore(
                            {
                              'last_active': FieldValue.serverTimestamp(),
                            },
                          ),
                        });
                        logFirebaseEvent('serviceBtn_navigate_to');

                        context.pushNamed('Services');

                        logFirebaseEvent('serviceBtn_google_analytics_event');
                        logFirebaseEvent('view_item');
                      },
                      text: 'Service',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.black,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  if (valueOrDefault<bool>(currentUserDocument?.isAdmin, false))
                    Align(
                      alignment: const AlignmentDirectional(0.05, -0.95),
                      child: AuthUserStreamWidget(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'LANDING_PAGE_PAGE_adminBtn_ON_TAP');
                            logFirebaseEvent('adminBtn_backend_call');

                            await currentUserReference!.update({
                              ...createUsersRecordData(
                                lastPage: 'Admin Landing',
                              ),
                              ...mapToFirestore(
                                {
                                  'last_active': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                            logFirebaseEvent('adminBtn_navigate_to');

                            context.pushNamed('AdminLanding');
                          },
                          text: 'Admin',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Colors.black,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  if (valueOrDefault<bool>(
                      currentUserDocument?.isManager, false))
                    Align(
                      alignment: const AlignmentDirectional(0.9, -0.95),
                      child: AuthUserStreamWidget(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'LANDING_PAGE_PAGE_managerBtn_ON_TAP');
                            logFirebaseEvent('managerBtn_backend_call');

                            await currentUserReference!.update({
                              ...createUsersRecordData(
                                lastPage: 'Manager Landing',
                              ),
                              ...mapToFirestore(
                                {
                                  'last_active': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                            logFirebaseEvent('managerBtn_navigate_to');

                            context.pushNamed('ManagerLanding');
                          },
                          text: 'Manager',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Colors.black,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 12.0,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  Align(
                    alignment: const AlignmentDirectional(-0.79, -0.95),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('LANDING_PAGE_PAGE_clientBtn_ON_TAP');
                        logFirebaseEvent('clientBtn_backend_call');

                        await currentUserReference!.update({
                          ...createUsersRecordData(
                            lastPage: 'Client Landing',
                          ),
                          ...mapToFirestore(
                            {
                              'last_active': FieldValue.serverTimestamp(),
                            },
                          ),
                        });
                        logFirebaseEvent('clientBtn_navigate_to');

                        context.pushNamed('ClientLanding');
                      },
                      text: 'Client\n',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.black,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
