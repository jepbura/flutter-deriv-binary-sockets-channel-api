import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/utils.dart';
import '../../../data/models/models.dart';
import '../../manager/manager.dart';

class DropdownMenu extends StatefulWidget {
  const DropdownMenu({Key? key}) : super(key: key);

  @override
  State<DropdownMenu> createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> {
  Map<String, dynamic>? selectedValue;
  List<SymbolsActiveSymbols>? marketDisplayNameList;
  SymbolsActiveSymbols? selectedValue2;
  String symbolId = "";
  String symbolName = "";
  double ticksQuote = 0;
  double firstTicksQuote = 0;

  List<Map<String, dynamic>> symbolsConvert(SymbolsEntity data) {
    if (data.activeSymbols != null && data.activeSymbols!.isNotEmpty) {
      // var symbols = SymbolsEntity.fromJson(message);
      final Map<String, dynamic> newMsg = {};

      data.activeSymbols?.map((SymbolsActiveSymbols element) {
        if (element.marketDisplayName!.isNotEmpty) {
          List<SymbolsActiveSymbols> newArray =
              newMsg[element.marketDisplayName] ?? [];
          newArray.add(element);
          newMsg[element.marketDisplayName.toString()] = newArray;
        }
      }).toList();
      List<Map<String, dynamic>> newList = [];
      newMsg.forEach((key, value) {
        newList.add({"marketDisplayName": key, "data": value});
      });
      return newList;
    } else {
      return [];
    }
  }

  forgetTick() {
    context
        .read<SocketCubit>()
        .send(params: ForgetSendApi(forget: symbolId), msgType: "ticks");
  }

  forgetAllTick() {
    context
        .read<SocketCubit>()
        .send(params: ForgetAllSendApi(forget_all: "ticks"), msgType: "ticks");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SymbolsCubit, SymbolsState>(
      // buildWhen: (previous, current) {
      //   // print("previous: $previous");
      //   // print("current: $current");
      //   if (previous is SymbolsInitial) {
      //     return true;
      //   } else {
      //     return false;
      //   }
      // },
      builder: (context, state) {
        // print("aaaaaaaaaaaaaa $state");

        if (state is SymbolsInitial) {
          return const CircularProgressIndicator();
        } else if (state is SymbolsData &&
            state.status == SocketStatus.success) {
          // print("aaaaaaaaaaaaaa ${state.data.runtimeType}");
          List<Map<String, dynamic>> data =
              symbolsConvert(state.data as SymbolsEntity);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: const Text("Market")),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 0.80),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        // alignedDropdown: true,
                        child: DropdownButton(
                          value: selectedValue?['marketDisplayName'],
                          hint: const Text('Choose'),
                          // icon: const Icon(
                          //   Icons.shopify,
                          // ),
                          items: data.map((value) {
                            return DropdownMenuItem<String>(
                              value: value['marketDisplayName'],
                              // alignment: Alignment.center,
                              child: Text(value["marketDisplayName"].toString(),
                                  style: Theme.of(context).textTheme.bodyText2),
                            );
                          }).toList(),
                          onChanged: (value) {
                            data.map((e) {
                              if (e["marketDisplayName"] == value) {
                                if (symbolId.isNotEmpty) {
                                  forgetTick();
                                }
                                setState(() {
                                  selectedValue = e;
                                  selectedValue2 = null;
                                  marketDisplayNameList = e["data"];
                                  symbolName = "";
                                  symbolId = "";
                                  ticksQuote = 0;
                                  firstTicksQuote = 0;
                                });
                              }
                            }).toList();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: const Text("Symbol")),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 0.80),
                    ),
                    child: marketDisplayNameList != null &&
                            marketDisplayNameList!.isNotEmpty
                        ? DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              // alignedDropdown: true,
                              child: DropdownButton<SymbolsActiveSymbols>(
                                hint: const Text('Choose'),
                                // icon: const Icon(
                                //   Icons.monetization_on,
                                // ),
                                value: selectedValue2,
                                items: marketDisplayNameList?.map<
                                        DropdownMenuItem<SymbolsActiveSymbols>>(
                                    (value) {
                                  return DropdownMenuItem<SymbolsActiveSymbols>(
                                    value: value,
                                    // alignment: Alignment.center,
                                    child: Text(value.displayName.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  forgetTick();
                                  context
                                      .read<TicksCubit>()
                                      .ticksStateInitial();
                                  context.read<SocketCubit>().send(
                                      params: TicksSendApi(
                                          subscribe: 1,
                                          ticks: value!.symbol.toString()),
                                      msgType: "ticks");
                                  setState(() {
                                    selectedValue2 = value;
                                    symbolName = value.displayName.toString();
                                    symbolId = "";
                                    ticksQuote = 0;
                                    firstTicksQuote = 0;
                                  });
                                  // }
                                },
                              ),
                            ),
                          )
                        : DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              // alignedDropdown: true,
                              child: DropdownButton<String>(
                                hint: const Text('Choose'),
                                value: null,
                                items: const [],
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: BlocListener<TicksCubit, TicksState>(
                  listener: (context, state2) {
                    if (state2 is TicksInitial) {
                      setState(() {
                        symbolId = "";
                        ticksQuote = 0;
                        firstTicksQuote = 0;
                      });
                    } else if (state2 is TicksData &&
                        state2.status == SocketStatus.success) {
                      setState(() {
                        symbolId = state2.symbolId;
                        ticksQuote = state2.data!.tick!.quote!;
                        firstTicksQuote = state2.firstTicksQuote;
                      });
                      // context.read<TicksCubit>().ticksStateRefreshing();
                    }
                  },
                  child: symbolName.isNotEmpty && symbolId.isNotEmpty
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ticksQuote.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 42),
                            ),
                            const SizedBox(
                              width: 42,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ticksQuote >= firstTicksQuote
                                    ? const Icon(
                                        Icons.show_chart_outlined,
                                        color: Colors.green,
                                        size: 42,
                                      )
                                    : Transform(
                                        alignment: Alignment.center,
                                        transform: Matrix4.rotationY(pi),
                                        child: const Icon(
                                          Icons.show_chart_outlined,
                                          color: Colors.red,
                                          size: 42,
                                        ),
                                      ),
                                Text(
                                  firstTicksQuote.toString(),
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                Text(
                                  symbolName.toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 12),
                                )
                              ],
                            ),
                          ],
                        )
                      : symbolName.isNotEmpty && firstTicksQuote == 0
                          ? const CircularProgressIndicator()
                          : Container(),
                ),
              ),
            ],
          );
        } else {
          return SizedBox(
            width: double.infinity,
            child: IconButton(
              icon: const Icon(
                Icons.replay_circle_filled,
                color: Colors.red,
              ),
              iconSize: 50,
              onPressed: () {},
            ),
          );
        }
      },
    );
  }
}
