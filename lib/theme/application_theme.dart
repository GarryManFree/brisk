import 'package:flutter/material.dart';

class ApplicationTheme {
  final bool isLight;
  final String themeId;
  final SideMenuTheme sideMenuTheme;
  final TopMenuTheme topMenuTheme;
  final DownloadGridTheme downloadGridTheme;
  final QueuePageTheme queuePageTheme;
  final SettingTheme settingTheme;
  final WidgetTheme widgetTheme;
  final ContextMenuTheme contextMenuTheme;
  final FontWeight fontWeight;
  final Color textColor;
  final Color textHintColor;
  final Color subtleTextColor;
  final AlertDialogTheme alertDialogTheme;
  final DownloadProgressDialogTheme downloadProgressDialogTheme;

  const ApplicationTheme({
    required this.themeId,
    required this.isLight,
    required this.fontWeight,
    this.textColor = Colors.white,
    this.textHintColor = Colors.white70,
    this.subtleTextColor = Colors.white70,
    required this.sideMenuTheme,
    required this.widgetTheme,
    required this.topMenuTheme,
    required this.downloadGridTheme,
    required this.queuePageTheme,
    required this.settingTheme,
    required this.alertDialogTheme,
    required this.downloadProgressDialogTheme,
    this.contextMenuTheme = const ContextMenuTheme(),
  });
}

class ContextMenuTheme {
  final Color backgroundColor;
  final Color itemDisabledTextColor;
  final Color itemTextColor;
  final Color borderColor;

  const ContextMenuTheme({
    this.backgroundColor = const Color.fromRGBO(20, 20, 20, 1),
    this.itemDisabledTextColor = Colors.grey,
    this.borderColor = Colors.transparent,
    this.itemTextColor = Colors.white,
  });
}

class QueuePageTheme {
  final Color backgroundColor;
  final Color queueItemTitleTextColor;
  final Color queueItemTitleDetailsTextColor;
  final Color queueItemHoverColor;

  const QueuePageTheme({
    required this.backgroundColor,
    required this.queueItemTitleTextColor,
    required this.queueItemTitleDetailsTextColor,
    required this.queueItemHoverColor,
  });
}

class SideMenuTheme {
  final Color backgroundColor;
  final Color briskLogoColor;
  final Color activeTabIconColor;
  final Color activeTabBackgroundColor;
  final Color tabIconColor;
  final Color tabBackgroundColor;
  final Color tabHoverColor;
  final Color expansionTileExpandedColor;
  final Color expansionTileItemHoverColor;
  final Color expansionTileItemActiveColor;
  final Color settingIconColor;

  const SideMenuTheme({
    required this.backgroundColor,
    required this.briskLogoColor,
    required this.activeTabIconColor,
    required this.activeTabBackgroundColor,
    required this.tabIconColor,
    required this.tabHoverColor,
    required this.expansionTileExpandedColor,
    required this.expansionTileItemHoverColor,
    required this.expansionTileItemActiveColor,
    required this.settingIconColor,
    this.tabBackgroundColor = Colors.transparent,
  });
}

class TopMenuTheme {
  final Color backgroundColor;
  final disabledButtonIconColor;
  final Color disabledHoverColor;
  final Color buttonTextColor;
  final Color disabledButtonTextColor;
  final ButtonColor addUrlColor;
  final ButtonColor downloadColor;
  final ButtonColor searchColor;
  final ButtonColor stopColor;
  final ButtonColor stopAllColor;
  final ButtonColor removeColor;
  final ButtonColor addToQueueColor;
  final ButtonColor extensionColor;
  final ButtonColor createQueueColor;
  final ButtonColor startQueueColor;
  final ButtonColor scheduleQueueColor;
  final ButtonColor stopQueueColor;
  final ButtonColor checkForUpdateColor;

  const TopMenuTheme({
    required this.backgroundColor,
    required this.addUrlColor,
    required this.downloadColor,
    required this.searchColor,
    required this.stopColor,
    required this.stopAllColor,
    required this.removeColor,
    required this.addToQueueColor,
    required this.extensionColor,
    required this.createQueueColor,
    required this.startQueueColor,
    required this.stopQueueColor,
    required this.checkForUpdateColor,
    this.buttonTextColor = Colors.white,
    this.disabledButtonTextColor = const Color.fromRGBO(79, 79, 79, 1),
    this.disabledButtonIconColor = const Color.fromRGBO(79, 79, 79, 0.5),
    required this.scheduleQueueColor,
    required this.disabledHoverColor,
  });
}

class DownloadGridTheme {
  final Color backgroundColor;
  final Color activeRowColor;
  final Color checkedRowColor;
  final Color borderColor;
  final Color rowColor;
  final Color rowTextColor;
  final Color titleColumnTextColor;

  const DownloadGridTheme({
    required this.backgroundColor,
    required this.activeRowColor,
    required this.checkedRowColor,
    required this.borderColor,
    required this.rowColor,
    required this.rowTextColor,
    required this.titleColumnTextColor,
  });
}

class AlertDialogTheme {
  final Color backgroundColor;
  final Color iconColor;
  final ButtonColor acceptButtonColor;
  final ButtonColor declineButtonColor;
  final ButtonColor deleteConfirmColor;
  final ButtonColor deleteCancelColor;
  final ButtonColor primaryMiscButtonColor;
  final ButtonColor secondaryMiscButtonColor;
  final ButtonColor cancelColor;
  final Color surfaceColor;
  final CheckBoxColor checkBoxColor;
  final Color innerContainerBorderColor;
  final Color borderColor;

  const AlertDialogTheme({
    this.borderColor = Colors.transparent,
    required this.backgroundColor,
    required this.iconColor,
    required this.acceptButtonColor,
    required this.declineButtonColor,
    required this.checkBoxColor,
    required this.innerContainerBorderColor,
    required this.deleteConfirmColor,
    required this.deleteCancelColor,
    required this.cancelColor,
    required this.surfaceColor,
    required this.primaryMiscButtonColor,
    required this.secondaryMiscButtonColor,
  });
}

class CheckBoxColor {
  final Color borderColor;
  final Color activeColor;

  const CheckBoxColor({
    required this.borderColor,
    required this.activeColor,
  });
}

class DownloadProgressDialogTheme {
  final Color assemblingStatusProgressColor;
  final Color validatingFilesStatusProgressColor;
  final ProgressIndicatorColor totalProgressColor;
  final ProgressIndicatorColor connectionProgressColor;
  final ButtonColor pauseColor;
  final ButtonColor resumeColor;

  const DownloadProgressDialogTheme({
    required this.pauseColor,
    required this.resumeColor,
    this.totalProgressColor = const ProgressIndicatorColor(
      color: Colors.green,
      backgroundColor: Color.fromRGBO(47, 44, 44, 0.9),
    ),
    this.connectionProgressColor = const ProgressIndicatorColor(
      color: Colors.indigoAccent,
      backgroundColor: Color.fromRGBO(47, 44, 44, 0.95),
    ),
    this.assemblingStatusProgressColor = Colors.green,
    this.validatingFilesStatusProgressColor = Colors.blueAccent,
  });
}

class ProgressIndicatorColor {
  final Color backgroundColor;
  final Color color;

  const ProgressIndicatorColor({
    required this.backgroundColor,
    required this.color,
  });
}

class SettingTheme {
  final SettingPageTheme pageTheme;
  final SettingSideMenuTheme sideMenuTheme;
  final ButtonColor saveButtonColor;
  final ButtonColor resetDefaultsButtonColor;

  const SettingTheme({
    required this.pageTheme,
    required this.sideMenuTheme,
    required this.saveButtonColor,
    required this.resetDefaultsButtonColor,
  });
}

class SettingPageTheme {
  final Color groupBackgroundColor;
  final Color groupTitleTextColor;
  final Color titleTextColor;

  const SettingPageTheme({
    required this.groupBackgroundColor,
    required this.groupTitleTextColor,
    required this.titleTextColor,
  });
}

class WidgetTheme {
  final SwitchColor switchColor;
  final ToolTipColor toolTipColor;
  final DropDownColor dropDownColor;
  final TextFieldColor textFieldColor;
  final Color iconColor;
  final Color tooltipIconColor;
  final ButtonColor showHideButtonColor;
  final ButtonColor iconButtonColor;

  const WidgetTheme({
    required this.switchColor,
    required this.dropDownColor,
    required this.textFieldColor,
    required this.showHideButtonColor,
    required this.iconButtonColor,
    this.toolTipColor = const ToolTipColor(),
    this.iconColor = Colors.white70,
    this.tooltipIconColor = Colors.white,
  });
}

class ToolTipColor {
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  const ToolTipColor({
    this.backgroundColor = const Color.fromRGBO(33, 33, 33, 1),
    this.textColor = Colors.white,
    this.borderColor = Colors.transparent,
  });
}

class TextFieldColor {
  final Color focusBorderColor;
  final Color borderColor;
  final Color? fillColor;
  final Color textColor;
  final Color iconColor;
  final Color cursorColor;
  final Color hintTextColor;
  final Color? hoverColor;

  const TextFieldColor({
    required this.focusBorderColor,
    required this.borderColor,
    this.hintTextColor = Colors.grey,
    this.fillColor,
    this.iconColor = Colors.white60,
    required this.textColor,
    this.cursorColor = Colors.white,
    this.hoverColor,
  });
}

class DropDownColor {
  final Color dropDownBackgroundColor;
  final Color itemTextColor;
  final Color iconColor;

  const DropDownColor({
    this.iconColor = Colors.white70,
    required this.dropDownBackgroundColor,
    required this.itemTextColor,
  });
}

class SwitchColor {
  final Color? activeColor;
  final Color? hoverColor;
  final Color? focusColor;
  final Color? inactiveTrackColor;

  const SwitchColor({
    this.activeColor,
    this.hoverColor,
    this.focusColor,
    this.inactiveTrackColor,
  });
}

class SettingSideMenuTheme {
  final Color backgroundColor;
  final Color activeTabBackgroundColor;
  final Color activeTabIconColor;
  final Color inactiveTabIconColor;
  final Color tabHoverBackgroundColor;
  final Color tabTextColor;

  const SettingSideMenuTheme({
    required this.backgroundColor,
    required this.activeTabBackgroundColor,
    required this.activeTabIconColor,
    required this.inactiveTabIconColor,
    required this.tabHoverBackgroundColor,
    this.tabTextColor = Colors.white,
  });
}

class ButtonColor {
  final Color iconColor;
  final Color textColor;
  final Color borderColor;
  final Color borderHoverColor;
  final Color backgroundColor;
  final Color hoverIconColor;
  final Color hoverTextColor;
  final Color hoverBackgroundColor;

  const ButtonColor({
    required this.iconColor,
    required this.hoverIconColor,
    required this.hoverBackgroundColor,
    this.hoverTextColor = Colors.white60,
    this.backgroundColor = Colors.transparent,
    this.textColor = Colors.white60,
    this.borderColor = Colors.transparent,
    this.borderHoverColor = Colors.transparent,
  });
}
