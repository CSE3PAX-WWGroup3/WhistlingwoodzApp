import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'manager_dashboards_model.dart';
export 'manager_dashboards_model.dart';

class ManagerDashboardsWidget extends StatefulWidget {
  const ManagerDashboardsWidget({super.key});

  @override
  _ManagerDashboardsWidgetState createState() =>
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: AppBar(
            backgroundColor: const Color(0xFF800306),
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: const Color(0xFF0E0E0E),
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              fillColor: const Color(0xFF0E0E0E),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 24.0,
              ),
              onPressed: () async {
                logFirebaseEvent('MANAGER_DASHBOARDS_PAGE_Back_ON_TAP');
                logFirebaseEvent('Back_navigate_back');
                context.safePop();
              },
            ),
            title: FlutterFlowIconButton(
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
                logFirebaseEvent('MANAGER_DASHBOARDS_PAGE_Home_ON_TAP');
                logFirebaseEvent('Home_navigate_to');

                context.pushNamed('LandingPage');
              },
            ),
            actions: const [],
            centerTitle: true,
            elevation: 2.0,
          ),
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
                      children: <Widget>[]
                          .divide(const SizedBox(width: 10.0))
                          .addToStart(const SizedBox(width: 10.0)),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/MicrosoftTeams-image_(11).png',
                        width: 300.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      'All Events',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                    ),
                  ]
                      .divide(const SizedBox(height: 10.0))
                      .addToEnd(const SizedBox(height: 10.0)),
                ),
              ),
            ].divide(const SizedBox(height: 10.0)).around(const SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
