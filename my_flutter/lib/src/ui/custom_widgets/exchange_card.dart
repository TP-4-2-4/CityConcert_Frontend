import 'package:flutter/material.dart';
import 'package:my_flutter/src/models/request_model.dart';
import 'package:my_flutter/src/ui/exchange/exchange_details.dart';

class ExchangeCardWidget extends StatefulWidget {
  final RequestModel exchange;

  const ExchangeCardWidget({super.key, required this.exchange});

  @override
  _ExchangeCardWidgetState createState() => _ExchangeCardWidgetState();
}

class _ExchangeCardWidgetState extends State<ExchangeCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
      child: GestureDetector(
        onTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ExchangeDetailsPage(exchange: widget.exchange),
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
                    Icons.bookmarks_rounded,
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
                      'Предлагаемый билет: ${widget.exchange.currentSeat!}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 16, 8),
                    child: Text(
                      'Желаемый билет:  ${widget.exchange.wantedSeat!}',
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
