import 'package:flutter/material.dart';
import 'package:think_hat_test/core/assets.dart';
import 'package:provider/provider.dart';
import 'package:think_hat_test/core/data/model/vehicle_response.dart';
import 'package:think_hat_test/core/data/repository/product_repository.dart';

class HomePageViewModel extends ChangeNotifier {
  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  set selectedTab(int value) {
    _selectedTab = value;
    notifyListeners();
  }
  List<Vehicle> vehicles =[];
  AppState currentAppState = AppState.nothing;
  ProgressState currentProgress = ProgressState.idle;

  final FocusNode _searchFocusNode = FocusNode();

  FocusNode get searchFocusNode => _searchFocusNode;
  final ProductRepository productRepository;

  HomePageViewModel({required this.productRepository});


  emitState(AppState appState,ProgressState progressState){
    currentAppState = appState;
    currentProgress = progressState;
    notifyListeners();
  }
  void fetchVehicles(){
    emitState(AppState.vehicles, ProgressState.loading);
    productRepository.getVehicles().then((value) {
      vehicles = value?.vehicles??[];
      emitState(AppState.vehicles, ProgressState.success);
    }).catchError((e){
      emitState(AppState.vehicles, ProgressState.error);
    });
  }
}

enum AppState{
  nothing,
  vehicles,
  trackHistory;

  get isVehicles=> this == vehicles;
}
enum ProgressState{
  idle,
  loading,
  error,
  success;

  get isLoading=> this == loading;
  get isError=> this == error;
  get isSuccess=> this == success;
  get isIdle=> this == idle;
}

