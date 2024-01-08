import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'parties_model.dart';
export 'parties_model.dart';

class PartiesWidget extends StatefulWidget {
  const PartiesWidget({super.key});

  @override
  _PartiesWidgetState createState() => _PartiesWidgetState();
}

class _PartiesWidgetState extends State<PartiesWidget>
    with TickerProviderStateMixin {
  late PartiesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PartiesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Parties'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 1,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.themeOtherController ??= TextEditingController();
    _model.themeOtherFocusNode ??= FocusNode();

    _model.functionOtherController ??= TextEditingController();
    _model.functionOtherFocusNode ??= FocusNode();

    _model.venueOtherController ??= TextEditingController();
    _model.venueOtherFocusNode ??= FocusNode();

    _model.numberGuestsController ??= TextEditingController();
    _model.numberGuestsFocusNode ??= FocusNode();

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
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [],
                          ),
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
                          text: 'Parties',
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
              SizedBox(
                width: double.infinity,
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          currentUserEmail,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Select your preferences from the available options',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    fontSize: 14.0,
                                  ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 0.0, 10.0),
                                  child: Text(
                                    'Theme',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            if (_model.themePickValue != 'Custom')
                              Expanded(
                                flex: 3,
                                child: StreamBuilder<List<PartyThemeRecord>>(
                                  stream: queryPartyThemeRecord(),
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
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<PartyThemeRecord>
                                        themePickPartyThemeRecordList =
                                        snapshot.data!;
                                    return FlutterFlowDropDown<String>(
                                      controller:
                                          _model.themePickValueController ??=
                                              FormFieldController<String>(null),
                                      options: themePickPartyThemeRecordList
                                          .map((e) => e.theme)
                                          .toList(),
                                      onChanged: (val) async {
                                        setState(
                                            () => _model.themePickValue = val);
                                        logFirebaseEvent(
                                            'PARTIES_themePick_ON_FORM_WIDGET_SELECTE');
                                        logFirebaseEvent(
                                            'themePick_update_app_state');
                                        setState(() {
                                          FFAppState().partyTheme =
                                              _model.themePickValue == 'Custom'
                                                  ? _model
                                                      .themeOtherController.text
                                                  : _model.themePickValue!;
                                        });
                                      },
                                      width: 300.0,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      hintText: 'Please select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isOverButton: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    );
                                  },
                                ),
                              ),
                            if (_model.themePickValue == 'Custom')
                              Expanded(
                                flex: 3,
                                child: TextFormField(
                                  controller: _model.themeOtherController,
                                  focusNode: _model.themeOtherFocusNode,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Other',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: const Color(0xFF0E0E0E),
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  maxLength: 50,
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.enforced,
                                  buildCounter: (context,
                                          {required currentLength,
                                          required isFocused,
                                          maxLength}) =>
                                      null,
                                  validator: _model
                                      .themeOtherControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                          ]
                              .divide(const SizedBox(width: 2.0))
                              .addToEnd(const SizedBox(width: 9.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 0.0, 10.0),
                                  child: Text(
                                    'Function',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            if (_model.functionPickValue != 'Personal')
                              Expanded(
                                flex: 3,
                                child: StreamBuilder<List<PartyFunctionRecord>>(
                                  stream: queryPartyFunctionRecord(),
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
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<PartyFunctionRecord>
                                        functionPickPartyFunctionRecordList =
                                        snapshot.data!;
                                    return FlutterFlowDropDown<String>(
                                      controller:
                                          _model.functionPickValueController ??=
                                              FormFieldController<String>(null),
                                      options:
                                          functionPickPartyFunctionRecordList
                                              .map((e) => e.function)
                                              .toList(),
                                      onChanged: (val) async {
                                        setState(() =>
                                            _model.functionPickValue = val);
                                        logFirebaseEvent(
                                            'PARTIES_functionPick_ON_FORM_WIDGET_SELE');
                                        logFirebaseEvent(
                                            'functionPick_update_app_state');
                                        setState(() {
                                          FFAppState().partyFunction = _model
                                                      .functionPickValue !=
                                                  'Personal'
                                              ? _model
                                                  .functionOtherController.text
                                              : _model.functionPickValue!;
                                        });
                                      },
                                      width: 300.0,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      hintText: 'Please select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isOverButton: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    );
                                  },
                                ),
                              ),
                            if (_model.functionPickValue == 'Personal')
                              Expanded(
                                flex: 3,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.functionOtherController,
                                    focusNode: _model.functionOtherFocusNode,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Other',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    maxLength: 50,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    buildCounter: (context,
                                            {required currentLength,
                                            required isFocused,
                                            maxLength}) =>
                                        null,
                                    validator: _model
                                        .functionOtherControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                          ]
                              .divide(const SizedBox(width: 2.0))
                              .addToEnd(const SizedBox(width: 9.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 0.0, 10.0),
                                  child: Text(
                                    'Venue',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            if (_model.venuePickValue != 'Other')
                              Expanded(
                                flex: 3,
                                child: StreamBuilder<List<VenuesRecord>>(
                                  stream: queryVenuesRecord(),
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
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<VenuesRecord>
                                        venuePickVenuesRecordList =
                                        snapshot.data!;
                                    return FlutterFlowDropDown<String>(
                                      controller:
                                          _model.venuePickValueController ??=
                                              FormFieldController<String>(null),
                                      options: venuePickVenuesRecordList
                                          .map((e) => e.venue)
                                          .toList(),
                                      onChanged: (val) async {
                                        setState(
                                            () => _model.venuePickValue = val);
                                        logFirebaseEvent(
                                            'PARTIES_venuePick_ON_FORM_WIDGET_SELECTE');
                                        logFirebaseEvent(
                                            'venuePick_update_app_state');
                                        setState(() {
                                          FFAppState().partyVenue =
                                              FFAppState().partyVenue;
                                        });
                                      },
                                      width: 300.0,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      hintText: 'Please select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isOverButton: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    );
                                  },
                                ),
                              ),
                            if (_model.venuePickValue == 'Other')
                              Expanded(
                                flex: 3,
                                child: TextFormField(
                                  controller: _model.venueOtherController,
                                  focusNode: _model.venueOtherFocusNode,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Other',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: const Color(0xFF0E0E0E),
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model
                                      .venueOtherControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                          ]
                              .divide(const SizedBox(width: 2.0))
                              .addToStart(const SizedBox(width: 0.0))
                              .addToEnd(const SizedBox(width: 9.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 0.0, 10.0),
                                  child: Text(
                                    'Number of\nguests',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: TextFormField(
                                controller: _model.numberGuestsController,
                                focusNode: _model.numberGuestsFocusNode,
                                onFieldSubmitted: (_) async {
                                  logFirebaseEvent(
                                      'PARTIES_numberGuests_ON_TEXTFIELD_SUBMIT');
                                  logFirebaseEvent(
                                      'numberGuests_update_app_state');
                                  setState(() {
                                    FFAppState().corporateNumberGuests =
                                        _model.numberGuestsController.text;
                                  });
                                },
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Number Of Guests',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model
                                    .numberGuestsControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ]
                              .divide(const SizedBox(width: 5.0))
                              .addToStart(const SizedBox(width: 0.0))
                              .addToEnd(const SizedBox(width: 10.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Estimated \nbudget',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: StreamBuilder<List<BudgetRecord>>(
                                stream: queryBudgetRecord(),
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
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<BudgetRecord> budgetBudgetRecordList =
                                      snapshot.data!;
                                  return FlutterFlowDropDown<String>(
                                    controller: _model.budgetValueController ??=
                                        FormFieldController<String>(null),
                                    options: budgetBudgetRecordList
                                        .map((e) => e.budget)
                                        .toList(),
                                    onChanged: (val) async {
                                      setState(() => _model.budgetValue = val);
                                      logFirebaseEvent(
                                          'PARTIES_budget_ON_FORM_WIDGET_SELECTED');
                                      logFirebaseEvent(
                                          'budget_update_app_state');
                                      setState(() {
                                        FFAppState().partyBudget =
                                            _model.budgetValue!;
                                      });
                                    },
                                    width: 300.0,
                                    height: 50.0,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    hintText: 'Please select...',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  );
                                },
                              ),
                            ),
                          ]
                              .divide(const SizedBox(width: 5.0))
                              .addToStart(const SizedBox(width: 0.0))
                              .addToEnd(const SizedBox(width: 10.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'PARTIES_PAGE_SUBMIT_BTN_ON_TAP');
                                    logFirebaseEvent('Button_custom_action');
                                    _model.eventID = await actions.nextDocID(
                                      'Party',
                                    );
                                    logFirebaseEvent('Button_custom_action');
                                    _model.submissionResult =
                                        actions.submitEvent(
                                      _model.eventID!,
                                      currentUserEmail,
                                      'Party',
                                      _model.functionPickValue == 'Custom'
                                          ? _model.themeOtherController.text
                                          : _model.themePickValue!,
                                      _model.functionPickValue == 'Personal'
                                          ? _model.functionOtherController.text
                                          : _model.functionPickValue!,
                                      _model.venuePickValue == 'Other'
                                          ? _model.venueOtherController.text
                                          : _model.venuePickValue!,
                                      _model.numberGuestsController.text,
                                      _model.budgetValue!,
                                    );
                                    logFirebaseEvent('Button_backend_call');

                                    await currentUserReference!.update({
                                      ...createUsersRecordData(
                                        lastPage: 'Party Submit',
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'last_active':
                                              FieldValue.serverTimestamp(),
                                        },
                                      ),
                                    });
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      'EventSubmission',
                                      queryParameters: {
                                        'eventType': serializeParam(
                                          'Party',
                                          ParamType.String,
                                        ),
                                        'email': serializeParam(
                                          currentUserEmail,
                                          ParamType.String,
                                        ),
                                        'theme': serializeParam(
                                          _model.themePickValue == 'Custom'
                                              ? _model.themeOtherController.text
                                              : _model.themePickValue,
                                          ParamType.String,
                                        ),
                                        'venue': serializeParam(
                                          _model.venuePickValue == 'Other'
                                              ? _model.venueOtherController.text
                                              : _model.venuePickValue,
                                          ParamType.String,
                                        ),
                                        'numberGuests': serializeParam(
                                          _model.numberGuestsController.text,
                                          ParamType.String,
                                        ),
                                        'budget': serializeParam(
                                          FFAppState().partyBudget,
                                          ParamType.String,
                                        ),
                                        'eventID': serializeParam(
                                          _model.eventID,
                                          ParamType.String,
                                        ),
                                        'functions': serializeParam(
                                          _model.functionPickValue == 'Personal'
                                              ? _model
                                                  .functionOtherController.text
                                              : _model.functionPickValue,
                                          ParamType.String,
                                        ),
                                        'submissionResult': serializeParam(
                                          _model.submissionResult,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );

                                    setState(() {});
                                  },
                                  text: 'Submit',
                                  options: FFButtonOptions(
                                    width: 100.0,
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF010000),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: const Color(0xFFE6DDDD),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Color(0xFF0E0E0E),
                                      width: 3.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'PARTIES_PAGE_CANCEL_BTN_ON_TAP');
                                  logFirebaseEvent('Button_navigate_to');

                                  context.pushNamed('LandingPage');
                                },
                                text: 'Cancel ',
                                icon: const Icon(
                                  Icons.cancel_outlined,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: const Color(0xFF010000),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Color(0xFF0E0E0E),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ]
                              .addToStart(const SizedBox(width: 10.0))
                              .addToEnd(const SizedBox(width: 10.0)),
                        ),
                      ]
                          .divide(const SizedBox(height: 10.0))
                          .addToStart(const SizedBox(height: 10.0))
                          .addToEnd(const SizedBox(height: 10.0)),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, -1.0),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primary,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: Colors.white,
                  icon: Icon(
                    Icons.chevron_left,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('PARTIES_PAGE_chevron_left_ICN_ON_TAP');
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