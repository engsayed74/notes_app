import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/views/widgets/add_note_form.dart';
import 'package:notes_app/views/widgets/cusom_text_field.dart';
import 'package:notes_app/views/widgets/custom_button.dart';

class AddNoteBottomSheet extends StatelessWidget {
  AddNoteBottomSheet({super.key});
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            print('failed ${state.errMessage}');
          }

          if (state is AddNoteSuccess) {
            Navigator.pop(context);
          }

          // TODO: implement listener

          // TODO: implement listener
        },
        builder: (context, State) {
          return AbsorbPointer(
              absorbing: State is AddNoteLoading ? true : false,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: SingleChildScrollView(
                  child: AddNoteForm(),
                ),
              ));
        },
      ),
    );
  }
}
