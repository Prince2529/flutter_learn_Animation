// import 'package:flutter/material.dart';

// void main() {
//   runApp(SpinnerWheel());
// }

// class SpinnerWheel extends StatelessWidget {
//   const SpinnerWheel({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: SpinnerWheelAnimation());
//   }
// }

// class SpinnerWheelAnimation extends StatefulWidget {
//   const SpinnerWheelAnimation({Key? key}) : super(key: key);

//   @override
//   _SpinnerWheelAnimationState createState() => _SpinnerWheelAnimationState();
// }

// class _SpinnerWheelAnimationState extends State<SpinnerWheelAnimation> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(width: 400, child: Text("test")),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(
    // MaterialApp(
    //   home: Animation1(),
    MaterialApp(
      home: SimpleStateMachine(),
    ),
  );
}

// class SimpleAnimation extends StatelessWidget {
//   const SimpleAnimation({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Container(
//             width: 60,
//             child: RiveAnimation.asset(
//               'assets/animation/new_file.riv',
//             ),
//           ),
//           Container(
//             width: 60,
//             child: RiveAnimation.asset(
//               'assets/animation/new_file.riv',
//             ),
//           ),
//           Container(
//             width: 60,
//             child: RiveAnimation.asset(
//               'assets/animation/new_file.riv',
//             ),
//           ),
//           Container(
//             width: 60,
//             child: RiveAnimation.asset(
//               'assets/animation/new_file.riv',
//             ),
//           ),
//           Container(
//             width: 60,
//             child: RiveAnimation.asset(
//               'assets/animation/new_file.riv',
//             ),
//           ),
//           Container(
//             width: 60,
//             child: RiveAnimation.asset(
//               'assets/animation/new_file.riv',
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class Animation1 extends StatefulWidget {
  const Animation1({Key? key}) : super(key: key);

  @override
  _Animation1State createState() => _Animation1State();
}

class _Animation1State extends State<Animation1> {
  late num lotteryNumber = 0;

  SMIInput<double>? _endSpiningAtNumber;
  SMITrigger? _trigger;
  Artboard? _stateMachine1;
  late RiveAnimationController _riveController;

  @override
  initState() {
    super.initState();

    rootBundle.load("assets/animation/new_file.riv").then(
      (data) {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        var controller =
            StateMachineController.fromArtboard(artboard, "State Machine 1");
        if (controller != null) {
          artboard.addController(controller);
          _endSpiningAtNumber = controller.findInput("Number 1");
          _trigger = controller.findInput("tap") as SMITrigger;
          print("=======> _endSpiningAtNumber ${_endSpiningAtNumber?.value}");
          print("=======> __trigger ${_trigger?.value}");
        }
        setState(() {
          _stateMachine1 = artboard;
        });
      },
    );
  }

  void numberEndSpinnerWheel(num number) {
    setState(() {
      switch (number) {
        case 1:
          _endSpiningAtNumber!.value = 1.0;
          break;
        case 2:
          _endSpiningAtNumber!.value = 2.0;
          break;
        case 3:
          _endSpiningAtNumber!.value = 3.0;
          break;
        case 4:
          _endSpiningAtNumber!.value = 4.0;
          break;
        case 5:
          _endSpiningAtNumber!.value = 5.0;
          break;
        case 6:
          _endSpiningAtNumber!.value = 6.0;
          break;
        case 7:
          _endSpiningAtNumber!.value = 7.0;
          break;
        case 8:
          _endSpiningAtNumber!.value = 8.0;
          break;
        case 9:
          _endSpiningAtNumber!.value = 9.0;
          break;
        case 0:
          _endSpiningAtNumber!.value = 0.0;
          break;
        default:
          _endSpiningAtNumber!.value = 0.0;
          return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  numberEndSpinnerWheel(4);
                  setState(() {
                    _trigger!.fire();
                  });
                  print(" >>>>>>>>${_endSpiningAtNumber!.value}");
                  print(" >>>>>>>>${_trigger!.value}");
                },
                child: Text("play")),
            _stateMachine1 == null
                ? SizedBox()
                : Container(
                    height: 90,
                    color: Colors.yellow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 60,
                          child: RiveAnimation.asset(
                            'assets/animation/new_file.riv',
                          ),
                        ),
                        GestureDetector(
                            onTapDown: (_) {
                              numberEndSpinnerWheel(4);
                              setState(() {
                                _trigger!.value = true;
                              });
                              print(" >>>>>>>>${_endSpiningAtNumber!.value}");
                              print(" >>>>>>>>${_trigger!.value}");
                            },
                            child: SizedBox(
                              width: 60,
                              child: RiveAnimation.asset(
                                'assets/animation/new_file.riv',
                                controllers: [_riveController],
                              ),
                            ))
                        // Container(
                        //   width: 60,
                        //   child: RiveAnimation.asset(
                        //     'assets/animation/new_file.riv',
                        //   ),
                        // ),
                        // Container(
                        //   width: 60,
                        //   child: RiveAnimation.asset(
                        //     'assets/animation/new_file.riv',
                        //   ),
                        // ),
                        // Container(
                        //   width: 60,
                        //   child: RiveAnimation.asset(
                        //     'assets/animation/new_file.riv',
                        //   ),
                        // ),
                        // Container(
                        //   width: 60,
                        //   child: RiveAnimation.asset(
                        //     'assets/animation/new_file.riv',
                        //   ),
                        // ),
                        // Container(
                        //   width: 60,
                        //   child: RiveAnimation.asset(
                        //     'assets/animation/new_file.riv',
                        //   ),
                        // ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class SimpleStateMachine extends StatefulWidget {
  const SimpleStateMachine({Key? key}) : super(key: key);

  @override
  _SimpleStateMachineState createState() => _SimpleStateMachineState();
}

class _SimpleStateMachineState extends State<SimpleStateMachine> {
  SMITrigger? _tap;
  SMINumber? _smiNumber;
  SMIBool? _smiBool;
  StateMachineController? _controller;
  String message = "";

  void _onRiveInit(Artboard artboard) {
    _controller = StateMachineController.fromArtboard(
      artboard,
      'State Machine 1',
      onStateChange: _onStateChange,
    );
    artboard.addController(_controller!);
    _tap = _controller?.findInput<bool>('tap') as SMITrigger;
    _smiNumber = _controller?.findInput<double>('Number 1') as SMINumber;
    _smiBool = _controller?.findInput<bool>('play') as SMIBool;
  }

  void _hitBump() => _tap!.value = true;
  void _onStateChange(
    String stateMachineName,
    String stateName,
  ) =>
      setState(
        () => print('========> State Changed in $stateMachineName to $stateName'),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Animation'),
      ),
      body: Center(
        child: GestureDetector(
          child: RiveAnimation.asset(
            'assets/animation/spinnerwheel.riv',
            fit: BoxFit.contain,
            onInit: _onRiveInit,
          ),
          onTap: () {
            _hitBump();
         
          },
        ),
      ),
    );
  }
}
