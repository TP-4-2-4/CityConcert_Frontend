import 'package:flutter/material.dart';

import '../../blocs/user_bloc.dart';
import '../../models/request_model.dart';
import '../../models/user_model.dart';


class CompanyDetailsPage extends StatefulWidget {
  final RequestModel company;

  const CompanyDetailsPage({super.key, required this.company});

  @override
  _CompanyDetailsPageState createState() => _CompanyDetailsPageState();
}

class _CompanyDetailsPageState extends State<CompanyDetailsPage> {
  @override
  void initState() {
    super.initState();
    bloc.fetchUserById(widget.company.userId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Theme.of(context).primaryColor,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: const Align(
          alignment: AlignmentDirectional(-0.6, 0),
          child: Text(
            'Поиск компании',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 50, 16, 25),
            child: StreamBuilder(
              stream: bloc.user,
              builder: (context, AsyncSnapshot<UserModel> snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.username!);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return const Center(
                      child: Text('Пользователь компании не найден'));
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
            child: Text(
              widget.company.description!,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
            child: Text(
              'Место автора: ${widget.company.currentSeat}',
            ),
          ),
        ],
      ),
    );
  }
}
