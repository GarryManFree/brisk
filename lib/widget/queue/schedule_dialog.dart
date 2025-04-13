import 'package:brisk/db/hive_util.dart';
import 'package:brisk/provider/queue_provider.dart';
import 'package:brisk/provider/theme_provider.dart';
import 'package:brisk/widget/base/outlined_text_field.dart';
import 'package:brisk/widget/base/rounded_outlined_button.dart';
import 'package:brisk/widget/base/scrollable_dialog.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ScheduleDialog extends StatefulWidget {
  ScheduleDialog({super.key});

  @override
  State<ScheduleDialog> createState() => _ScheduleDialogState();
}

class _ScheduleDialogState extends State<ScheduleDialog> {
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final simultaneousDownloadController = TextEditingController();
  late int selectedQueueId;
  bool startDateEnabled = false;
  bool endDateEnabled = false;
  bool shutdownEnabled = false;
  DateTime? startDate;
  DateTime? endDate;

  final FocusNode _startDateFocusNode = FocusNode();
  final FocusNode _endDateFocusNode = FocusNode();
  final DateFormat _formatter = DateFormat('yyyy-MM-dd HH:mm');

  @override
  void initState() {
    super.initState();
    _startDateFocusNode.addListener(
      () => _showDateTimePicker(
        _startDateFocusNode,
        startDateController,
        startDateEnabled,
      ),
    );
    _endDateFocusNode.addListener(
      () => _showDateTimePicker(
        _endDateFocusNode,
        endDateController,
        endDateEnabled,
      ),
    );
  }

  Future<void> _showDateTimePicker(
    FocusNode focusNode,
    TextEditingController controller,
    bool isStartDate,
  ) async {
    if (focusNode.hasFocus) {
      final dateTime = await showOmniDateTimePicker(
        context: context,
        is24HourMode: true,
        constraints: BoxConstraints(maxWidth: 400, maxHeight: 580),
        type: OmniDateTimePickerType.dateAndTime,
      );
      if (dateTime != null) {
        setState(() => controller.text = _formatter.format(dateTime));
      }
      if (isStartDate) {
        startDate = dateTime;
      } else {
        endDate = dateTime;
      }
      focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme =
        Provider.of<ThemeProvider>(context, listen: false).activeTheme;
    selectedQueueId =
        Provider.of<QueueProvider>(context, listen: false).selectedQueueId!;
    final size = MediaQuery.of(context).size;

    return ScrollableDialog(
      height: resolveDialogHeight(size),
      scrollviewHeight: resolveScrollviewHeight(size),
      backgroundColor: theme.queuePageTheme.backgroundColor,
      borderRadius: 10,
      width: 400,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDateRow(
            label: "Start download at",
            enabled: startDateEnabled,
            controller: startDateController,
            focusNode: _startDateFocusNode,
            onChanged: (value) => setState(() => startDateEnabled = value!),
          ),
          SizedBox(height: 20),
          _buildDateRow(
            label: "Stop download at",
            enabled: endDateEnabled,
            controller: endDateController,
            focusNode: _endDateFocusNode,
            onChanged: (value) => setState(() => endDateEnabled = value!),
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Simultaneous downloads",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 100,
                child: NumberInputWithIncrementDecrement(
                  initialValue: 1,
                  style: TextStyle(color: Colors.white),
                  decIconColor: Colors.white,
                  incDecBgColor: Colors.white,
                  incIconColor: Colors.white,
                  widgetContainerDecoration: BoxDecoration(),
                  controller: simultaneousDownloadController,
                  min: 1,
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
                side: WidgetStateBorderSide.resolveWith(
                  (states) => BorderSide(width: 1.0, color: Colors.grey),
                ),
                activeColor: Colors.blueGrey,
                value: shutdownEnabled,
                onChanged: (value) => setState(() => shutdownEnabled = value!),
              ),
              Text(
                "Shutdown after completion",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ],
      ),
      buttons: [
        RoundedOutlinedButton.fromButtonColor(
          theme.alertDialogTheme.cancelButtonColor,
          text: "Cancel",
          width: 80,
          onPressed: () => Navigator.of(context).pop(),
        ),
        const SizedBox(width: 10),
        RoundedOutlinedButton.fromButtonColor(
          theme.alertDialogTheme.addButtonColor,
          text: startDateEnabled ? "Schedule" : "Start Now",
          width: 120,
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
      scrollButtonVisible: size.height < 550,
    );
  }

  void onAcceptClicked() async {
    final queue = await HiveUtil.instance.downloadQueueBox.get(selectedQueueId);
    if (queue == null) return;
    queue
      ..shutdownAfterCompletion = shutdownEnabled
      ..simultaneousDownloads = simultaneousDownloadController.text.toInt()
      ..scheduledStart = startDate
      ..scheduledEnd = endDate;
    await queue.save();
  }

  double resolveScrollviewHeight(Size size) {
    double height = 350;
    if (size.height < 550) {
      height = 300;
    }
    if (size.height < 500) {
      height = 190;
    }
    if (size.height < 390) {
      height = 100;
    }
    return height;
  }

  double resolveDialogHeight(Size size) {
    double height = 510;
    if (size.height < 550) {
      height = 460;
    }
    if (size.height < 500) {
      height = 350;
    }
    if (size.height < 390) {
      height = 260;
    }
    return height;
  }

  double resolveItemsMargin(Size size) {
    double margin = 20;
    if (size.height < 545) {
      margin = 10;
    }
    if (size.height < 515) {
      margin = 5;
    }
    return margin;
  }

  double resolveButtonMargin(Size size) {
    double margin = 40;
    if (size.height < 500) {
      margin = 30;
    }
    if (size.height < 490) {
      margin = 20;
    }
    if (size.height < 480) {
      margin = 10;
    }
    return margin;
  }

  Widget _buildDateRow({
    required String label,
    required bool enabled,
    required TextEditingController controller,
    required FocusNode focusNode,
    required ValueChanged<bool?> onChanged,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
                side: WidgetStateBorderSide.resolveWith(
                  (states) => BorderSide(width: 1.0, color: Colors.grey),
                ),
                activeColor: Colors.blueGrey,
                value: enabled,
                onChanged: onChanged),
            Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        SizedBox(height: 5),
        SizedBox(
          width: 450,
          height: 50,
          child: OutLinedTextField(
            hintText: "YYYY-MM-DD --:--",
            enabled: enabled,
            controller: controller,
            focusNode: focusNode,
          ),
        ),
      ],
    );
  }
}
