import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/utils.dart';
import '../../manager/manager.dart';
import '../../widgets/widgets.dart';

class PricePickerScreen extends StatefulWidget {
  const PricePickerScreen({Key? key}) : super(key: key);

  @override
  State<PricePickerScreen> createState() => _PricePickerScreenState();
}

class _PricePickerScreenState extends State<PricePickerScreen> {
  bool checkSend = false;

  @override
  void initState() {
    // TODO: implement initState
    context.read<SocketCubit>().send(
        params: SymbolsSendApi(activeSymbols: "brief", productType: "basic"),
        msgType: "active_symbols");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.imagesLogo,
              matchTextDirection: true,
            ),
            const Padding(padding: EdgeInsets.only(right: 10)),
            const Text("Binary.com Developers"),
          ],
        ),
      ),
      body: Center(
        child: BlocListener<SocketCubit, SocketState>(
          listener: (context, state) {
            if (state is SocketData && state.status == SocketStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Error Socket connection"),
                duration: Duration(seconds: 5),
              ));
            }
          },
          child: const DropdownMenu(),
        ),
      ),
    );
  }
}
