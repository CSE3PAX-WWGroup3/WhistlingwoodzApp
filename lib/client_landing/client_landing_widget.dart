import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'client_landing_model.dart';
export 'client_landing_model.dart';

class ClientLandingWidget extends StatefulWidget {
  const ClientLandingWidget({super.key});

  @override
  State<ClientLandingWidget> createState() => _ClientLandingWidgetState();
}

class _ClientLandingWidgetState extends State<ClientLandingWidget> {
  late ClientLandingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientLandingModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ClientLanding'});
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
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('CLIENT_LANDING_arrow_back_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Client Page',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: FFAppState().fontSize18,
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
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/MicrosoftTeams-image_(11).png',
                    width: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currentUserEmail,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                            fontSize: FFAppState().fontSize18,
                          ),
                    ),
                  ],
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('CLIENT_LANDING_PAGE_MyEvents_ON_TAP');
                  logFirebaseEvent('MyEvents_navigate_to');

                  context.pushNamed('Client');
                },
                text: 'My Event Requests',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: const Color(0xFF0E0E0E),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: FFAppState().fontSize16,
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
                  logFirebaseEvent('CLIENT_LANDING_PAGE_Help_ON_TAP');
                  logFirebaseEvent('Help_navigate_to');

                  context.pushNamed('ClientHelp');
                },
                text: 'Admin Help Request',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: const Color(0xFF0E0E0E),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: FFAppState().fontSize16,
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
                  logFirebaseEvent('CLIENT_LANDING_PAGE_userProfile_ON_TAP');
                  logFirebaseEvent('userProfile_navigate_to');

                  context.pushNamed(
                    'updateUserProfile',
                    queryParameters: {
                      'userInformation': serializeParam(
                        currentUserReference,
                        ParamType.DocumentReference,
                      ),
                    }.withoutNulls,
                  );
                },
                text: 'Update User Profile',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: const Color(0xFF0E0E0E),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: FFAppState().fontSize16,
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
                  logFirebaseEvent('CLIENT_LANDING_PAGE_LogOut_ON_TAP');
                  logFirebaseEvent('LogOut_backend_call');

                  await currentUserReference!.update({
                    ...createUsersRecordData(
                      lastPage: 'Logged Out',
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
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: const Color(0xFF0E0E0E),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: FFAppState().fontSize16,
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
                .divide(const SizedBox(height: 20.0))
                .addToStart(const SizedBox(height: 10.0))
                .addToEnd(const SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
