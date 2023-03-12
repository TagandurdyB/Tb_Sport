import 'package:flutter/material.dart';
import '/ViewModel/Providers/provider_theme.dart';

import 'ready_input_base.dart';

enum Type { tel, pass, text, num, email }

class ReadyInput extends StatefulWidget {
  final int index, maxline;
  final String hidden, label, tag, startVal;
  final bool shape;
  final bool autoFocus;
  final FocusNode? focus;
  final double borderRad;
  final Type type;
  final Function? onChange, suffixFunc;
  final Widget? reightWidget;
  final Color cursorColor;
  final Color enableBorderColor;
  final Color disableBorderColor;
  const ReadyInput(
      {super.key,
      this.cursorColor=const Color(0xff5308BE),
      this.enableBorderColor=const Color(0xffAD88DF),
      this.disableBorderColor=const Color(0xff5308BE),
      this.startVal = "",
      this.focus,
      this.suffixFunc,
      this.autoFocus = false,
      required this.tag,
      this.index = 0,
      this.hidden = "",
      this.shape = false,
      this.type = Type.text,
      this.onChange,
      this.borderRad = 20,
      this.label = "",
      this.maxline = 1,
      this.reightWidget});
  @override
  // ignore: library_private_types_in_public_api
  _ReadyInputState createState() => _ReadyInputState();
}

class _ReadyInputState extends State<ReadyInput> {
  @override
  void initState() {
    RIBase.changeDate(widget.tag, TextEditingController(text: widget.startVal));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: const TextStyle(color: Color(0xffAD88DF)),
          hintStyle: const TextStyle(color: Color(0xffAD88DF)),
          focusedBorder: widget.shape
              ? OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.borderRad)),
                  borderSide:  BorderSide(color:widget.enableBorderColor))
              : null,
          enabledBorder: widget.shape
              ? OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.borderRad)),
                  borderSide:  BorderSide(color:widget.disableBorderColor))
              : null,
        ),
      ),
      child: TextFormField(
         autofocus: widget.autoFocus,
         focusNode: widget.focus,
        //initialValue: controls[widget.index].text,
        cursorColor: widget.cursorColor,
        maxLines: widget.maxline,
        onChanged: (value) {
          if (widget.onChange != null) {
            widget.onChange!(value, widget.tag /*widget.index*/);
          }
        },
        maxLength: widget.type == Type.tel ? 8 : null,
        obscureText: widget.type == Type.pass ? true : false,
        style: DistributorTheme(context).styles.input,
        keyboardType: widget.type == Type.text
            ? null
            : widget.type == Type.tel
                ? TextInputType.phone
                : widget.type == Type.pass
                    ? TextInputType.visiblePassword
                    : widget.type == Type.email
                        ? TextInputType.emailAddress
                        : const TextInputType.numberWithOptions(),
        controller: RIBase.getControl(widget.tag), //controls[widget.index],
        decoration: InputDecoration(
            prefix: widget.type == Type.tel ? const Text("+993") : null,
            hintText: widget.hidden != "" ? widget.hidden : "",
            labelText: widget.label != "" ? widget.label : "",
            suffix: GestureDetector(
                onTap: () {
                  RIBase.getControl(widget.tag).clear();
                  //  controls[widget.index].clear();
                  if (widget.suffixFunc != null) {
                    widget.suffixFunc!();
                  }
                },
                child: widget.reightWidget ??
                    const Icon(Icons.cancel,
                        color: Colors.black //ThemeProvided().colorText,
                        ))),
      ),
    );
  }
}
