import 'menu.dart';

int _lastAssignMenuItemId = 0;

_generateMenuItemId() {
  _lastAssignMenuItemId++;
  return _lastAssignMenuItemId;
}

class MenuItem {
  int id = -1;
  String? key;
  String type;
  String? label;
  String? sublabel;
  String? toolTip;
  String? icon;
  bool? checked;
  bool disabled;
  Menu? submenu;

  void Function(MenuItem menuItem)? onClick;
  void Function(MenuItem menuItem)? onHighlight;
  void Function(MenuItem menuItem)? onLoseHighlight;

  MenuItem.separator()
      : id = _generateMenuItemId(),
        type = 'separator',
        disabled = true;

  MenuItem.submenu({
    this.key,
    this.label,
    this.sublabel,
    this.toolTip,
    this.icon,
    this.disabled = false,
    this.submenu,
    this.onClick,
    this.onHighlight,
    this.onLoseHighlight,
  })  : id = _generateMenuItemId(),
        type = 'submenu';

  MenuItem.checkbox({
    this.key,
    this.label,
    this.sublabel,
    this.toolTip,
    this.icon,
    required this.checked,
    this.disabled = false,
    this.onClick,
    this.onHighlight,
    this.onLoseHighlight,
  })  : id = _generateMenuItemId(),
        type = 'checkbox';

  MenuItem({
    this.key,
    this.type = 'normal',
    this.label,
    this.sublabel,
    this.toolTip,
    this.icon,
    this.checked,
    this.disabled = false,
    this.submenu,
    this.onClick,
    this.onHighlight,
    this.onLoseHighlight,
  }) : id = _generateMenuItemId();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'key': key,
      'type': type,
      'label': label ?? '',
      'toolTip': toolTip,
      'icon': icon,
      'checked': checked,
      'disabled': disabled,
      'submenu': submenu?.toJson(),
    }..removeWhere((key, value) => value == null);
  }
}
