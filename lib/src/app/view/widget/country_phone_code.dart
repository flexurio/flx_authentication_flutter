import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flx_authentication_flutter/src/app/util/country_phone_code.dart';

class CountryCodeDropdown extends StatefulWidget {
  const CountryCodeDropdown({
    required this.selectedCode,
    required this.onChanged,
    super.key,
  });

  final String selectedCode;
  final void Function(String?) onChanged;

  @override
  State<CountryCodeDropdown> createState() => _CountryCodeDropdownState();
}

class _CountryCodeDropdownState extends State<CountryCodeDropdown> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final items = countryPhoneCode.entries.map((entry) {
      final dialCode = '+${entry.key}';
      final countryCode = entry.value;
      return DropdownMenuItem<String>(
        value: dialCode,
        child: Text(
          '$countryCode ($dialCode)',
          style: const TextStyle(fontSize: 14),
        ),
      );
    }).toList();

    final value = items.any((item) => item.value == widget.selectedCode)
        ? widget.selectedCode
        : '+62';

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        dropdownSearchData: DropdownSearchData(
          searchInnerWidgetHeight: 20,
          searchController: _searchController,
          searchMatchFn: (item, searchValue) {
            final label = item.child.toString().toLowerCase();
            final value = item.value?.toString().toLowerCase() ?? '';
            return label.contains(searchValue.toLowerCase()) ||
                value.contains(searchValue.toLowerCase());
          },
          searchInnerWidget: Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Cari Negara',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(8),
              ),
            ),
          ),
        ),
        value: value,
        alignment: AlignmentDirectional.bottomEnd,
        onChanged: widget.onChanged,
        items: items,
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.zero,
          height: 30,
          width: 90,
        ),
        dropdownStyleData: const DropdownStyleData(
          maxHeight: 400,
          width: 280,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.zero,
        ),
        menuItemStyleData: MenuItemStyleData(
          overlayColor: WidgetStatePropertyAll(Theme.of(context).cardColor),
        ),
      ),
    );
  }
}
