import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'services_model.dart';
export 'services_model.dart';

class ServicesWidget extends StatefulWidget {
  const ServicesWidget({super.key});

  @override
  State<ServicesWidget> createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget>
    with TickerProviderStateMixin {
  late ServicesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServicesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Services'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 1,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: const [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0.0, 0),
                    child: FlutterFlowButtonTabBar(
                      useToggleButtonStyle: true,
                      labelStyle: FlutterFlowTheme.of(context).labelSmall,
                      unselectedLabelStyle: const TextStyle(),
                      labelColor: const Color(0xFFF8FBFC),
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      backgroundColor: Colors.black,
                      unselectedBackgroundColor: Colors.black,
                      borderColor: const Color(0xFF010000),
                      unselectedBorderColor:
                          FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      elevation: 0.0,
                      buttonMargin:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      padding: const EdgeInsets.all(4.0),
                      tabs: const [
                        Tab(
                          text: 'Services',
                        ),
                      ],
                      controller: _model.tabBarController,
                      onTap: (i) async {
                        [() async {}][i]();
                      },
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 175.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 500.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/1648e60fad5f3a508963e9496ceb8e77.jpg',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -0.9),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/MicrosoftTeams-image_(11).png',
                    width: 150.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'SERVICES_CLICK_HERE_FOR_MORE_INFORMATION');
                      logFirebaseEvent('Button_launch_u_r_l');
                      await launchURL('https://whistlingwoodz.com.au');
                    },
                    text: 'Click Here for more information about our services',
                    options: FFButtonOptions(
                      width: 400.0,
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFF010000),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                fontSize: FFAppState().fontSize16,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.95, -0.9),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primaryBtnText,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: const Color(0xFF0E0E0E),
                  icon: Icon(
                    Icons.home,
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('SERVICES_PAGE_home_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_navigate_to');

                    context.pushNamed('LandingPage');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
