import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'client_model.dart';
export 'client_model.dart';

class ClientWidget extends StatefulWidget {
  const ClientWidget({super.key});

  @override
  State<ClientWidget> createState() => _ClientWidgetState();
}

class _ClientWidgetState extends State<ClientWidget> {
  late ClientModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Client'});
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
              logFirebaseEvent('CLIENT_PAGE_Back_ON_TAP');
              logFirebaseEvent('Back_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Your Event Requests',
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FlutterFlowIconButton(
                          borderColor:
                              FlutterFlowTheme.of(context).primaryBtnText,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: const Color(0xFF0E0E0E),
                          icon: const Icon(
                            Icons.home_sharp,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent('CLIENT_PAGE_Home_ON_TAP');
                            logFirebaseEvent('Home_navigate_to');

                            context.pushNamed('LandingPage');
                          },
                        ),
                        Expanded(
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 60.0, 0.0),
                              child: Text(
                                currentUserEmail,
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: FFAppState().fontSize16,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(width: 20.0))
                          .addToStart(const SizedBox(width: 10.0))
                          .addToEnd(const SizedBox(width: 10.0)),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/MicrosoftTeams-image_(11).png',
                        width: 150.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Select document  to  add  additional  information',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Colors.white,
                              fontSize: FFAppState().fontSize14,
                            ),
                      ),
                    ),
                  ]
                      .divide(const SizedBox(height: 10.0))
                      .addToStart(const SizedBox(height: 10.0))
                      .addToEnd(const SizedBox(height: 10.0)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: PagedListView<DocumentSnapshot<Object?>?,
                      EventsRecord>.separated(
                    pagingController: _model.setListViewController(
                      EventsRecord.collection.where(
                        'uid',
                        isEqualTo: currentUserUid,
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    reverse: false,
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (_, __) => const SizedBox(height: 5.0),
                    builderDelegate: PagedChildBuilderDelegate<EventsRecord>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      ),
                      // Customize what your widget looks like when it's loading another page.
                      newPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      ),

                      itemBuilder: (context, _, listViewIndex) {
                        final listViewEventsRecord = _model
                            .listViewPagingController!.itemList![listViewIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CLIENT_PAGE_ListTile_s0pp1s1c_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed(
                              'addNotes',
                              queryParameters: {
                                'eventID': serializeParam(
                                  listViewEventsRecord.reference,
                                  ParamType.DocumentReference,
                                ),
                                'isManager': serializeParam(
                                  false,
                                  ParamType.bool,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: ListTile(
                            title: Text(
                              listViewEventsRecord.reference.id,
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: FFAppState().fontSize22,
                                  ),
                            ),
                            subtitle: Text(
                              listViewEventsRecord.requestTime,
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: FFAppState().fontSize14,
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ].divide(const SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
