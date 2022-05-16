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
    List<MenuItem> items = const [],
    Menu? submenu,
    this.onClick,
  })  : id = _generateMenuItemId(),
        type = 'submenu',
        submenu = (submenu?..items.addAll(items)) ?? Menu(items: items);

  MenuItem.checkbox({
    this.key,
    this.label,
    this.sublabel,
    this.toolTip,
    this.icon,
    required this.checked,
    this.disabled = false,
    this.onClick,
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
