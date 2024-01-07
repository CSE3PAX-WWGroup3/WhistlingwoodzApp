import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'weddings_widget.dart' show WeddingsWidget;
import 'package:flutter/material.dart';

class WeddingsModel extends FlutterFlowModel<WeddingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for themePick widget.
  String? themePickValue;
  FormFieldController<String>? themePickValueController;
  // State field(s) for functionPick widget.
  List<String>? functionPickValue;
  FormFieldController<String>? functionPickValueController;
  // State field(s) for venuePick widget.
  String? venuePickValue;
  FormFieldController<String>? venuePickValueController;
  // State field(s) for venueOther widget.
  FocusNode? venueOtherFocusNode;
  TextEditingController? venueOtherController;
  String? Function(BuildContext, String?)? venueOtherControllerValidator;
  // State field(s) for numberGuests widget.
  FocusNode? numberGuestsFocusNode;
  TextEditingController? numberGuestsController;
  String? Function(BuildContext, String?)? numberGuestsControllerValidator;
  // State field(s) for budget widget.
  String? budgetValue;
  FormFieldController<String>? budgetValueController;
  // Stores action output result for [Custom Action - nextDocID] action in Button widget.
  String? eventID;
  // Stores action output result for [Custom Action - listToString] action in Button widget.
  String? functions;
  // Stores action output result for [Custom Action - submitEvent] action in Button widget.
  String? submissioResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    venueOtherFocusNode?.dispose();
    venueOtherController?.dispose();

    numberGuestsFocusNode?.dispose();
    numberGuestsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
