import "package:expensio_v2/testdata/testdata.dart";
import "package:get/get.dart";

class BalanceController extends GetxController{
  var balanceAmount = 0.obs;
  var incomeAmount = 0.obs;
  var expenseAmount = 0.obs;

  @override
  void onInit(){
    initRefresh();
    super.onInit();
  }

  void initRefresh(){
    for (var i in testData){
      // i[1] == 0 ? balanceAmount-=i[2] : balanceAmount += i[2];
      if (i[1] == 0){
        balanceAmount -= i[2];
        expenseAmount += i[2];
      } else if (i[1] == 1){
        balanceAmount += i[2];
        incomeAmount += i[2];
      }

    }
  }

  // void increase(int val){
  //   balanceAmount += val;
  //   // incomeAmount += val;
  // }

  // void decrease(int val){
  //   balanceAmount -= val;
  //   // expenseAmount -= val;
  // }
  
}