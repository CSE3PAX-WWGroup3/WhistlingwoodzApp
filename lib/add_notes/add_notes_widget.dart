import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'add_notes_model.dart';
export 'add_notes_model.dart';

class AddNotesWidget extends StatefulWidget {
  const AddNotesWidget({
    super.key,
    required this.eventID,
    required this.isManager,
  });

  final DocumentReference? eventID;
  final bool? isManager;

  @override
  _AddNotesWidgetState createState() => _AddNotesWidgetState();
}

class _AddNotesWidgetState extends State<AddNotesWidget> {
  late AddNotesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddNotesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'addNotes'});
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

    return StreamBuilder<EventsRecord>(
      stream: EventsRecord.getDocument(widget.eventID!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: const Color(0xFF800306),
            body: Center(
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
          );
        }
        final addNotesEventsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFF800306),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF800306),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor: const Color(0xFF0E0E0E),
                                  icon: Icon(
                                    Icons.home,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ADD_NOTES_PAGE_home_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_navigate_to');

                                    context.pushNamed('LandingPage');
                                  },
                                ),
                                FlutterFlowIconButton(
                                  borderColor: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor: const Color(0xFF0E0E0E),
                                  icon: const Icon(
                                    Icons.chevron_left,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ADD_NOTES_PAGE_chevron_left_ICN_ON_TAP');
                                    logFirebaseEvent(
                                        'IconButton_navigate_back');
                                    context.safePop();
                                  },
                                ),
                              ].divide(const SizedBox(width: 10.0)),
                            ),
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.eventID?.id,
                                'event ID',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: FFAppState().fontSize14,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (widget.isManager ?? true)
                                  Expanded(
                                    flex: 1,
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'ADD_NOTES_PAGE_createPDF_ON_TAP');
                                        logFirebaseEvent(
                                            'createPDF_custom_action');
                                        await actions.newEventPDF(
                                          widget.eventID!,
                                          addNotesEventsRecord.email,
                                          addNotesEventsRecord.budget,
                                          addNotesEventsRecord.eventType,
                                          addNotesEventsRecord.functions,
                                          addNotesEventsRecord.numberGuests,
                                          addNotesEventsRecord.requestTime,
                                          addNotesEventsRecord.theme,
                                          addNotesEventsRecord.venue,
                                        );
                                      },
                                      text: 'Create PDF ',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
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
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                              ]
                                  .addToStart(const SizedBox(width: 10.0))
                                  .addToEnd(const SizedBox(width: 10.0)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: TextFormField(
                              controller: _model.messageController,
                              focusNode: _model.messageFocusNode,
                              textInputAction: TextInputAction.done,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText:
                                    'Please input your message here ,,,,',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: FFAppState().fontSize14,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: FFAppState().fontSize14,
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: FFAppState().fontSize14,
                                  ),
                              maxLines: 4,
                              minLines: 1,
                              validator: _model.messageControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: FFButtonWidget(
                                    onPressed: (/* NOT RECOMMENDED */ _model
                                                .messageController.text ==
                                            'true')
                                        ? null
                                        : () async {
                                            logFirebaseEvent(
                                                'ADD_NOTES_PAGE_submitMessage_ON_TAP');
                                            logFirebaseEvent(
                                                'submitMessage_backend_call');

                                            await NotesRecord.collection
                                                .doc()
                                                .set({
                                              ...createNotesRecordData(
                                                docID: widget.eventID,
                                                isManager: widget.isManager,
                                                message: _model
                                                    .messageController.text,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'dateNote': FieldValue
                                                      .serverTimestamp(),
                                                },
                                              ),
                                            });
                                            logFirebaseEvent(
                                                'submitMessage_navigate_to');

                                            context.pushNamed(
                                              'addNotes',
                                              queryParameters: {
                                                'eventID': serializeParam(
                                                  widget.eventID,
                                                  ParamType.DocumentReference,
                                                ),
                                                'isManager': serializeParam(
                                                  widget.isManager,
                                                  ParamType.bool,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                    text: 'Submit  Message',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: const Color(0xFF0E0E0E),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
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
                                      disabledColor:
                                          FlutterFlowTheme.of(context)
                                              .backgroundComponents,
                                    ),
                                  ),
                                ),
                              ]
                                  .divide(const SizedBox(width: 20.0))
                                  .addToStart(const SizedBox(width: 10.0))
                                  .addToEnd(const SizedBox(width: 10.0)),
                            ),
                          ),
                        ]
                            .divide(const SizedBox(height: 10.0))
                            .addToEnd(const SizedBox(height: 10.0)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: PagedListView<DocumentSnapshot<Object?>?,
                          NotesRecord>.separated(
                        pagingController: _model.setListViewController(
                          NotesRecord.collection
                              .where(
                                'docID',
                                isEqualTo: widget.eventID,
                              )
                              .orderBy('dateNote', descending: true),
                        ),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        reverse: false,
                        scrollDirection: Axis.vertical,
                        separatorBuilder: (_, __) => const SizedBox(height: 5.0),
                        builderDelegate: PagedChildBuilderDelegate<NotesRecord>(
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
                            final listViewNotesRecord = _model
                                .listViewPagingController!
                                .itemList![listViewIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'ADD_NOTES_PAGE_ListTile_wjl3aqg7_ON_TAP');
                                logFirebaseEvent('ListTile_backend_call');

                                await NotesRecord.collection.doc().set({
                                  ...createNotesRecordData(
                                    docID: widget.eventID,
                                    isManager: widget.isManager,
                                    message: _model.messageController.text,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'dateNote': FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                              },
                              child: ListTile(
                                title: Text(
                                  listViewNotesRecord.dateNote!.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: FFAppState().fontSize14,
                                      ),
                                ),
                                subtitle: Text(
                                  listViewNotesRecord.message,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: FFAppState().fontSize14,
                                      ),
                                ),
                                tileColor: listViewNotesRecord.isManager
                                    ? FlutterFlowTheme.of(context).warning
                                    : FlutterFlowTheme.of(context).tertiary,
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
      },
    );
  }
}
