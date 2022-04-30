import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class DynamicMultiChoiceChip extends StatefulWidget {
  final IconData prefixIcon;
  final Color prefixIconColor;
  final String textFormFieldLabelText;
  final Color textFormFieldBorderColor;
  final Color renderedWidgetBorderColor;
  final Color renderedTextColor;
  final double renderedTextSize;
  final List dataSource;
  final Color okButtonBgColor;
  final Color cancelButtonBgColor;
  final Color activeWidgetColor;
  final Color unactiveWidgetColor;
  final Function(Map<int, String>) onTap;

  const DynamicMultiChoiceChip(
      {Key? key,
      required this.prefixIcon,
      required this.prefixIconColor,
      required this.textFormFieldLabelText,
      required this.textFormFieldBorderColor,
      required this.renderedWidgetBorderColor,
      required this.dataSource,
      required this.renderedTextColor,
      required this.renderedTextSize,
      required this.okButtonBgColor,
      required this.cancelButtonBgColor,
      required this.activeWidgetColor,
      required this.unactiveWidgetColor,
      required this.onTap})
      : super(key: key);

  @override
  DynamicMultiChoiceChipState createState() => DynamicMultiChoiceChipState();
}

class DynamicMultiChoiceChipState extends State<DynamicMultiChoiceChip> {
  List<int> selectedItems = [];
  List<Map<int, String>> selectedItemsMap = [];
  Map<int, String> items = {};
  List filteredDataList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              onChanged: (text) {
                List filteredList = [];
                for (int i = 0; i < widget.dataSource.length; i++) {
                  if ((widget.dataSource[i].toLowerCase())
                      .toString()
                      .contains(text)) {
                    setState(() {
                      filteredList.add(widget.dataSource[i]);
                      filteredDataList = filteredList.toSet().toList();
                    });
                  }
                }
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    widget.prefixIcon,
                    color: widget.prefixIconColor,
                  ),
                  // fillColor: Colors.green,
                  labelStyle: const TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  labelText: widget.textFormFieldLabelText,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(
                        width: 3, color: widget.textFormFieldBorderColor),
                    // borderRadius: BorderRadius.circular(15),
                  )),
            ),
          ),
        ),
        filteredDataList.isNotEmpty
            ? Expanded(
                child: SingleChildScrollView(
                  child: WrapSuper(
                      wrapFit: WrapFit.larger,
                      alignment: WrapSuperAlignment.left,
                      wrapType: WrapType.fit,
                      spacing: 5.0,
                      lineSpacing: 2.0,
                      children: List.generate(filteredDataList.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedItems.contains(index)) {
                                selectedItems.remove(index);
                              } else {
                                selectedItems.add(index);
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: selectedItems.contains(index)
                                    ? widget.activeWidgetColor
                                    : widget.unactiveWidgetColor,
                                border: Border.all(
                                    color: widget.renderedWidgetBorderColor),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    filteredDataList[index],
                                    // maxLines: 1,
                                    style: TextStyle(
                                        color: widget.renderedTextColor,
                                        fontSize: widget.renderedTextSize),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      })),
                ),
              )
            : Expanded(
                child: SingleChildScrollView(
                  child: WrapSuper(
                      wrapFit: WrapFit.larger,
                      alignment: WrapSuperAlignment.left,
                      wrapType: WrapType.fit,
                      spacing: 5.0,
                      lineSpacing: 2.0,
                      children:
                          List.generate(widget.dataSource.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedItems.contains(index)) {
                                selectedItems.remove(index);
                              } else {
                                selectedItems.add(index);
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: selectedItems.contains(index)
                                    ? widget.activeWidgetColor
                                    : widget.unactiveWidgetColor,
                                border: Border.all(
                                    color: widget.renderedWidgetBorderColor),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    widget.dataSource[index],
                                    // maxLines: 1,
                                    style: TextStyle(
                                        color: widget.renderedTextColor,
                                        fontSize: widget.renderedTextSize),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      })),
                ),
              ),
        filteredDataList.isNotEmpty
            ? ButtonBarSuper(
                wrapType: WrapType.fit,
                wrapFit: WrapFit.larger,
                spacing: 2.0,
                // Horizontal spacing between buttons.
                lineSpacing: 10.0,
                // Vertical spacing between button lines.
                buttonHeight: 48,
                buttonMinWidth: 40,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            widget.cancelButtonBgColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel")),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            widget.okButtonBgColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        for (int i = 0; i < selectedItems.length; i++) {
                          items.putIfAbsent(i,
                              () => filteredDataList[selectedItems[i]]);
                          // selectedItemsMap.add(items);
                        }
                        widget.onTap(items);
                        Navigator.pop(context);
                      },
                      child: const Text("Ok"))
                ],
              )
            : ButtonBarSuper(
                wrapType: WrapType.fit,
                wrapFit: WrapFit.larger,
                spacing: 2.0,
                // Horizontal spacing between buttons.
                lineSpacing: 10.0,
                // Vertical spacing between button lines.
                buttonHeight: 48,
                buttonMinWidth: 40,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            widget.cancelButtonBgColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel")),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            widget.okButtonBgColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        for (int i = 0; i < selectedItems.length; i++) {
                          items.putIfAbsent(i,
                              () => widget.dataSource[selectedItems[i]]);
                        }
                        widget.onTap(items);
                        Navigator.pop(context);
                      },
                      child: const Text("Ok"))
                ],
              )
      ],
    );
  }
}
