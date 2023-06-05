import 'package:flutter/material.dart';
import 'package:my_flutter/src/models/request_model.dart';

import '../company/company_details.dart';

class CompanyCardWidget extends StatefulWidget {
  final RequestModel company;

  const CompanyCardWidget({super.key, required this.company});

  @override
  _CompanyCardWidgetState createState() => _CompanyCardWidgetState();
}

class _CompanyCardWidgetState extends State<CompanyCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
      child: GestureDetector(
        onTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CompanyDetailsPage(company: widget.company),
            ),
          );
        },
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Theme.of(context).primaryColorDark.withOpacity(0.35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 8, 8),
                child: Container(
                  width: 75,
                  height: 75,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.people_alt_rounded,
                    size: 50,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 16, 0),
                    child: Text(
                      'Компания # ${widget.company.userId}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 16, 8),
                    child: Text(
                      '${widget.company.description!.substring(0, widget.company.description!.length > 30 ? 30 : widget.company.description!.length)}...',
                      style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
