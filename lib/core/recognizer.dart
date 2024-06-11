import 'dart:math';

import 'package:image/image.dart';
import 'package:test2/utils/local_db.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

import '../models/employee.dart';
import 'recognition.dart';

class Recognizer {
  late Interpreter interpreter;
  late InterpreterOptions _interpreterOptions;

  late List<int> _inputShape;
  late List<int> _outputShape;

  late TensorImage _inputImage;
  late TensorBuffer _outputBuffer;

  late int _inputType;
  late int _outputType;

  late var _probabilityProcessor;

  @override
  String get modelName => 'assets/facenet.tflite';
  // String get modelName => 'assets/mobile_face_net.tflite';

  @override
  NormalizeOp get preProcessNormalizeOp => NormalizeOp(127.5, 127.5);

  @override
  NormalizeOp get postProcessNormalizeOp => NormalizeOp(0, 1);

  Recognizer({int? numThreads}) {
    _interpreterOptions = InterpreterOptions();

    if (numThreads != null) {
      _interpreterOptions.threads = numThreads;
    }
    loadModel();
  }

  Future<void> loadModel() async {
    try {
      interpreter = await Interpreter.fromAsset(modelName, options: _interpreterOptions);
      print('Interpreter Created Successfully');

      _inputShape = interpreter.getInputTensor(0).shape;
      _outputShape = interpreter.getOutputTensor(0).shape;
      _inputType = interpreter.getInputTensor(0).type.value;
      _outputType = interpreter.getOutputTensor(0).type.value;

      _outputBuffer = TensorBuffer.createFixedSize(_outputShape, _outputType);
      _probabilityProcessor = TensorProcessorBuilder().add(postProcessNormalizeOp).build();
    } catch (e) {
      print('Unable to create interpreter, Caught Exception: ${e.toString()}');
    }
  }

  TensorImage _preProcess() {
    int cropSize = min(_inputImage.height, _inputImage.width);
    return ImageProcessorBuilder()
        .add(ResizeWithCropOrPadOp(cropSize, cropSize))
        .add(ResizeOp(_inputShape[1], _inputShape[2], ResizeMethod.NEAREST_NEIGHBOUR))
        .add(preProcessNormalizeOp)
        .build()
        .process(_inputImage);
  }

  Recognition recognize(Image image) {
    final pres = DateTime.now().millisecondsSinceEpoch;
    _inputImage = TensorImage(_inputType);
    _inputImage.loadImage(image);
    _inputImage = _preProcess();
    final pre = DateTime.now().millisecondsSinceEpoch - pres;
    print('Time to load image: $pre ms');
    final runs = DateTime.now().millisecondsSinceEpoch;
    interpreter.run(_inputImage.buffer, _outputBuffer.getBuffer());
    final run = DateTime.now().millisecondsSinceEpoch - runs;
    print('Time to run inference: $run ms');
    //
    _probabilityProcessor.process(_outputBuffer);
    //     .getMapWithFloatValue();
    // final pred = getTopProbability(labeledProb);
    print(_outputBuffer.getDoubleList());
    Pair pair = findNearest(_outputBuffer.getDoubleList());
    return Recognition(pair.id, pair.name, _outputBuffer.getDoubleList(), pair.distance);
  }

  //TODO  looks for the nearest embeeding in the dataset
  // and retrurns the pair <id, distance>
  findNearest(List<double> emb) {
    Pair pair = Pair(-1, "Unknown", 5);
    for (Map employeeMap in LocalDB.getEmployees()) {
      Employee employee = Employee.fromJson(employeeMap);
      final int id = employee.id;
      final String name = employee.name;
      List<double> knownEmb = employee.array;
      double distance = 0;
      for (int i = 0; i < emb.length; i++) {
        double diff = emb[i] - knownEmb[i];
        distance += diff * diff;
      }
      distance = sqrt(distance);
      if (pair.distance == 5 || distance < pair.distance) {
        pair.distance = distance;
        pair.id = id;
        pair.name = name;
      }
    }
    return pair;
  }

  void close() {
    interpreter.close();
  }
}

class Pair {
  int id;
  String name;
  double distance;
  Pair(this.id, this.name, this.distance);
}
