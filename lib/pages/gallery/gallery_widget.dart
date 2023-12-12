import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'gallery_model.dart';
export 'gallery_model.dart';

class GalleryWidget extends StatefulWidget {
  const GalleryWidget({super.key});

  @override
  _GalleryWidgetState createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget>
    with TickerProviderStateMixin {
  late GalleryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GalleryModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
                      children: [
                        Container(),
                        Container(),
                        Container(),
                        Text(
                          'Tab View 4',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 32.0,
                                  ),
                        ),
                        Container(),
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                      tabs: const [
                        Tab(
                          text: 'Corporate',
                        ),
                        Tab(
                          text: 'Wedding',
                        ),
                        Tab(
                          text: 'Parties',
                        ),
                        Tab(
                          text: 'Gallery',
                        ),
                        Tab(
                          text: 'Services',
                        ),
                      ],
                      controller: _model.tabBarController,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: const AlignmentDirectional(-1.00, -1.00),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primary,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).accent1,
                  icon: Icon(
                    Icons.chevron_left,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('LandingPageCopy');
                  },
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.10, -1.11),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/MicrosoftTeams-image_(11).png',
                    width: 324.0,
                    height: 200.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.00, -1.00),
                child: Text(
                  'Gallery',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
