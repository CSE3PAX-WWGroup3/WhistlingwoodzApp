import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'manager_dashboards_model.dart';
export 'manager_dashboards_model.dart';

class ManagerDashboardsWidget extends StatefulWidget {
  const ManagerDashboardsWidget({super.key});

  @override
  State<ManagerDashboardsWidget> createState() =>
      _ManagerDashboardsWidgetState();
}

class _ManagerDashboardsWidgetState extends State<ManagerDashboardsWidget> {
  late ManagerDashboardsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManagerDashboardsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ManagerDashboards'});
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
              logFirebaseEvent('MANAGER_DASHBOARDS_arrow_back_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Manager Dashboard',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: FFAppState().fontSize22,
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
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF800306),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: const Color(0xFF0E0E0E),
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
                                'MANAGER_DASHBOARDS_PAGE_Home_ON_TAP');
                            logFirebaseEvent('Home_navigate_to');

                            context.pushNamed('LandingPage');
                          },
                        ),
                      ]
                          .divide(const SizedBox(width: 10.0))
                          .addToStart(const SizedBox(width: 10.0)),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/MicrosoftTeams-image_(11).png',
                        width: 150.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(19.0, 20.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Raw Event Data',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: FFAppState().fontSize16,
                                  ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: StreamBuilder<List<EventsRecord>>(
                              stream: queryEventsRecord(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<EventsRecord> buttonEventsRecordList =
                                    snapshot.data!;
                                return FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'MANAGER_DASHBOARDS_DOWNLOAD_C_S_V_BTN_ON');
                                    logFirebaseEvent('Button_custom_action');
                                    await actions.rawEventCSV(
                                      buttonEventsRecordList.toList(),
                                    );
                                  },
                                  text: 'Download CSV',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF0E0E0E),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
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
                                );
                              },
                            ),
                          ),
                        ]
                            .divide(const SizedBox(width: 20.0))
                            .addToStart(const SizedBox(width: 5.0))
                            .addToEnd(const SizedBox(width: 5.0)),
                      ),
                    ),
                  ]
                      .divide(const SizedBox(height: 10.0))
                      .addToEnd(const SizedBox(height: 10.0)),
                ),
              ),
            ].divide(const SizedBox(height: 10.0)).addToEnd(const SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
