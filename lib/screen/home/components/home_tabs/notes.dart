import 'package:final_project/configs/palette.dart';
import 'package:final_project/configs/strings.dart';
import 'package:final_project/controller/notes_controller.dart';
import 'package:final_project/screen/add_note.dart';
import 'package:final_project/utils/page_transition.dart';
import 'package:final_project/utils/sqflite_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotesTab extends ConsumerStatefulWidget {
  const NotesTab({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _NotesTabState();
}

class _NotesTabState extends ConsumerState<NotesTab>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    /// query for notes from database.
    ref.read(notesProvider).query();
  }

  /// keep this tab in memory even when not being displayed.
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: backgroundColor,

      /// floating action button to add new notes.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, createRoute(const AddNote()));
        },
        backgroundColor: primaryColor,
        child: const Icon(
          Icons.add_rounded,
        ),
      ),

      /// body of add note screen.
      body: ref.watch(notesProvider).notes.isEmpty
      /// if there not any saved note then
      /// show text "Sorry!!! no notes saved currently."
          ? const Center(
              child: Text(
                noNotesSaved,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            )
      /// otherwise show saved notes.
          : ListView.builder(
              itemCount: ref.watch(notesProvider).notes.length,
              padding: EdgeInsets.only(top: 20.h),
              itemBuilder: (BuildContext context, int index) {
                /// each note can be tapped to edit.
                return GestureDetector(
                  child: UnconstrainedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: EdgeInsets.only(bottom: 20.h),
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                          color: primaryLight,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: const [
                            BoxShadow(blurRadius: 10.0, color: Colors.brown),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Title: ${ref.watch(notesProvider).notes[index][DatabaseHelper.columnTitle]}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                          const Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                          ),
                          Text(
                            "${ref.watch(notesProvider).notes[index][DatabaseHelper.columnContent]}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    /// on tapping on any note show edit page
                    /// editing the note.
                    Navigator.push(
                      context,
                      createRoute(
                        AddNote(
                          noteAction: AddNotes.edit,
                          noteId: ref.watch(notesProvider).notes[index][DatabaseHelper.columnId],
                          noteTitle: ref.watch(notesProvider).notes[index]
                              [DatabaseHelper.columnTitle],
                          noteBody: ref.watch(notesProvider).notes[index]
                              [DatabaseHelper.columnContent],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
