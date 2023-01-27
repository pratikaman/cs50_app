import 'package:final_project/configs/palette.dart';
import 'package:final_project/configs/strings.dart';
import 'package:final_project/controller/notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNote extends ConsumerStatefulWidget {
  final int noteId;
  final String noteTitle;
  final String noteBody;
  final AddNotes noteAction;

  const AddNote({
    Key? key,
    this.noteId = 0,
    this.noteTitle = "",
    this.noteBody = "",
    this.noteAction = AddNotes.add,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AddNoteState();
}

class _AddNoteState extends ConsumerState<AddNote> {
  late TextEditingController noteTitleController;
  late TextEditingController noteBodyController;

  @override
  void initState() {
    noteTitleController = TextEditingController(text: widget.noteTitle);
    noteBodyController = TextEditingController(text: widget.noteBody);
    super.initState();
  }
  @override
  void dispose() {
    noteBodyController.dispose();
    noteTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: widget.noteAction == AddNotes.add
            ? const Text("Add note")
            : const Text("Note"),
        actions: [

          Visibility(
            visible: widget.noteAction == AddNotes.edit,
            child: GestureDetector(
              child: const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.delete),
              ),
              onTap: (){
                ref.read(notesProvider).delete(widget.noteId);
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
      floatingActionButton: SizedBox(
        width: 120.w,
        child: FloatingActionButton(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(18.0))),
          onPressed: () {
            if (widget.noteAction == AddNotes.add &&
                noteBodyController.text.isNotEmpty) {
              ref
                  .read(notesProvider)
                  .insert(noteTitleController.text, noteBodyController.text);
            } else if (widget.noteAction == AddNotes.edit &&
                noteBodyController.text.isNotEmpty) {
              ref.read(notesProvider).update(widget.noteId,
                  noteTitleController.text, noteBodyController.text);
            } else if (widget.noteAction == AddNotes.edit &&
                noteBodyController.text.isEmpty) {
              ref.read(notesProvider).delete(widget.noteId);
            }

            Navigator.pop(context);
          },
          backgroundColor: primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                noteBodyController.text.isEmpty ? notesDeleteBtn : notesSaveBtn,
                style: const TextStyle(fontSize: 16),
              ),
              SizedBox(width: 8.w),
              const Icon(
                Icons.save,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 22.w,
                  right: 22.w,
                  top: 24.h,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(blurRadius: 10.0, color: Colors.brown),
                    ]),
                child: Scrollbar(
                  thumbVisibility: true,
                  radius: const Radius.circular(4),
                  child: TextField(
                    controller: noteTitleController,
                    keyboardType: TextInputType.multiline,
                    cursorColor: Colors.black12,
                    cursorRadius: const Radius.circular(4),
                    minLines: 1,
                    maxLines: 2,
                    maxLength: 50,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: primaryLight,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide.none),
                        hintText: notesTitleHintText,
                        hintStyle: TextStyle(color: Colors.black),
                        counterText: ""),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 24.h, horizontal: 22.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10.0,
                        color: Colors.brown,
                      ),
                    ]),
                child: Scrollbar(
                  thumbVisibility: true,
                  radius: const Radius.circular(4),
                  child: TextField(
                    controller: noteBodyController,
                    keyboardType: TextInputType.multiline,
                    cursorColor: Colors.black12,
                    cursorRadius: const Radius.circular(4),
                    minLines: 8,
                    maxLines: 20,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: primaryLight,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
                          borderSide: BorderSide.none),
                      hintText: notesBodyHintText,
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    onChanged: (_) {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
