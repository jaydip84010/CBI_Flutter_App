import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TccController extends GetxController {
  TextEditingController tccAmount = TextEditingController();

  RxDouble transferAttorneyFees = 0.0.obs;
  RxDouble dEEDSOFFICE = 0.0.obs;

  RxDouble postagesAndPetties = 0.0.obs;
  RxDouble deedsOfficeFees = 0.0.obs;
  RxDouble ratesClearanceFees = 0.00.obs;
  RxDouble electronicGenerationFee = 0.0.obs;
  RxDouble fica = 0.0.obs;
  RxDouble deedsOfficeSearches = 0.0.obs;
  RxDouble transferDuty = 0.0.obs;
  RxDouble totalTransferCosts = 0.0.obs;

  RxString approximate = '0'.obs;

  void totalTransferCostsTable() {
    double sum = transferAttorneyFees.value +
        postagesAndPetties.value +
        deedsOfficeFees.value +
        ratesClearanceFees.value +
        electronicGenerationFee.value +
        fica.value +
        deedsOfficeSearches.value;

    double vat = sum * 0.15;
    totalTransferCosts.value =
        vat + sum + dEEDSOFFICE.value + transferDuty.value;
  }

  ///fix Amount all con
  void fixAmount() {
    postagesAndPetties.value = 980.00;
    deedsOfficeFees.value = 250.00;
    ratesClearanceFees.value = 250.00;
    electronicGenerationFee.value = 450.0;
    fica.value = 700.00;
    deedsOfficeSearches.value = 300.00;
  }

  void calculateValues() {
    int price = int.tryParse(tccAmount.text) ?? 0;
    approximate.value = tccAmount.text;
    if (price > 0 && price <= 100000) {
      transferAttorneyFees.value = 7110.00;
      dEEDSOFFICE.value = 45.00;
      fixAmount();
    } else if (price > 100000 && price <= 150000) {
      transferAttorneyFees.value = 8085.00;
      dEEDSOFFICE.value = 101.00;
      fixAmount();
    } else if (price > 150000 && price <= 200000) {
      transferAttorneyFees.value = 9060.00;
      dEEDSOFFICE.value = 101.00;
      fixAmount();
    } else if (price > 200000 && price <= 250000) {
      transferAttorneyFees.value = 10035.00;
      dEEDSOFFICE.value = 642.00;
      fixAmount();
    } else if (price > 250000 && price <= 300000) {
      transferAttorneyFees.value = 11010.00;
      dEEDSOFFICE.value = 642.00;
      fixAmount();
    } else if (price > 300000 && price <= 350000) {
      transferAttorneyFees.value = 11985.00;
      dEEDSOFFICE.value = 800.00;
      fixAmount();
    } else if (price > 350000 && price <= 400000) {
      transferAttorneyFees.value = 12960.00;
      dEEDSOFFICE.value = 800.00;
      fixAmount();
    } else if (price > 400000 && price <= 450000) {
      transferAttorneyFees.value = 13935.00;
      dEEDSOFFICE.value = 800.00;
      fixAmount();
    } else if (price > 450000 && price <= 500000) {
      transferAttorneyFees.value = 14910.00;
      dEEDSOFFICE.value = 800.00;
      fixAmount();
    } else if (price > 500000 && price <= 600000) {
      transferAttorneyFees.value = 16795.00;
      dEEDSOFFICE.value = 800.00;
      fixAmount();
    } else if (price > 600000 && price <= 700000) {
      transferAttorneyFees.value = 18680.00;
      dEEDSOFFICE.value = 1126.00;
      fixAmount();
    } else if (price > 700000 && price <= 800000) {
      transferAttorneyFees.value = 20565.00;
      dEEDSOFFICE.value = 1126.00;
      fixAmount();
    } else if (price > 800000 && price <= 900000) {
      transferAttorneyFees.value = 22450.00;
      dEEDSOFFICE.value = 1293.00;
      fixAmount();
    } else if (price > 900000 && price <= 1000000) {
      transferAttorneyFees.value = 24335.00;

      dEEDSOFFICE.value = 1293.00;
      fixAmount();
    } else if (price > 1000000 && price <= 1200000) {
      transferAttorneyFees.value = 26220.00;
      dEEDSOFFICE.value = 1453.00;
      fixAmount();
      if (price > 1100000 && price <= 1150000) {
        transferDuty.value = 1500.00;
        // fixAmount();
      } else if (price > 1150000 && price <= 1200000) {
        transferDuty.value = 3000.00;
        // fixAmount();
      }
    } else if (price > 1200000 && price <= 1400000) {
      transferAttorneyFees.value = 28105.00;
      dEEDSOFFICE.value = 1453.00;
       fixAmount();
      if (price > 1200000 && price <= 1250000) {
        transferDuty.value = 4500.00;
        // fixAmount();
      } else if (price > 1250000 && price <= 1300000) {
        transferDuty.value = 6000.00;
        // fixAmount();
      } else if (price > 1300000 && price <= 1350000) {
        transferDuty.value = 7500.00;
        // fixAmount();
      }
    } else if (price > 1400000 && price <= 1600000) {
      transferAttorneyFees.value = 29990.00;
      dEEDSOFFICE.value = 1453.00;
      fixAmount();
      if (price > 1350000 && price <= 1400000) {
        transferDuty.value = 9000.00;
      } else if (price > 1400000 && price <= 1450000) {
        transferDuty.value = 10500.00;
        // fixAmount();
      } else if (price > 1450000 && price <= 1500000) {
        transferDuty.value = 12000.00;
        // fixAmount();
      } else if (price > 1500000 && price <= 1550000) {
        transferDuty.value = 14625.00;
        // fixAmount();
      } else if (price > 1550000 && price <= 1600000) {
        transferDuty.value = 17625.00;
        // fixAmount();
      }
    } else if (price > 1600000 && price <= 1800000) {
      transferAttorneyFees.value = 31875.00;
      dEEDSOFFICE.value = 1453.00;
      fixAmount();
      if (price > 1600000 && price <= 1650000) {
        transferDuty.value = 20625.00;
        // fixAmount();
      } else if (price > 1650000 && price <= 1700000) {
        transferDuty.value = 23625.00;
        // fixAmount();
      } else if (price > 1700000 && price <= 1750000) {
        transferDuty.value = 26625.00;
        // fixAmount();
      } else if (price > 1700000 && price <= 1800000) {
        transferDuty.value = 29625.00;
        // fixAmount();
      }
    } else if (price > 1800000 && price <= 2000000) {
      transferAttorneyFees.value = 33760.00;
      dEEDSOFFICE.value = 1453.00;
      fixAmount();
      if (price > 1800000 && price <= 1850000) {
        transferDuty.value = 32625.00;
        // fixAmount();
      } else if (price > 1850000 && price <= 1900000) {
        transferDuty.value = 35625.00;
        // fixAmount();
      } else if (price > 1900000 && price <= 1950000) {
        transferDuty.value = 38625.00;

        // fixAmount();
      } else if (price > 1950000 && price <= 2000000) {
        transferDuty.value = 41625.00;

        // fixAmount();
      }
    } else if (price > 2000000 && price <= 2200000) {
      transferAttorneyFees.value = 35645.00;
      dEEDSOFFICE.value = 2014.00;
      fixAmount();
      if (price > 1900000 && price <= 1950000) {
        transferDuty.value = 41625.00;
        // fixAmount();
      } else if (price > 1950000 && price <= 2050000) {
        transferDuty.value = 44625.00;
        // fixAmount();
      } else if (price > 2050000 && price <= 2100000) {
        transferDuty.value = 47625.00;
        // fixAmount();
      } else if (price > 2100000 && price <= 2150000) {
        transferDuty.value = 51275.00;
        // fixAmount();
      } else if (price > 2150000 && price <= 2200000) {
        transferDuty.value = 55275.00;
        // fixAmount();
      }
    } else if (price > 2200000 && price <= 2400000) {
      transferAttorneyFees.value = 37530.00;
      dEEDSOFFICE.value = 2014.00;
      fixAmount();

      if (price > 2250000 && price <= 2300000) {
        transferDuty.value = 63275.00;
        // fixAmount();
      }
      if (price > 2300000 && price <= 2350000) {
        transferDuty.value = 67275.00;
        // fixAmount();
      }
      if (price > 2350000 && price <= 2400000) {
        transferDuty.value = 71275.00;
        // fixAmount();
      }
    } else if (price > 2400000 && price <= 2600000) {
      transferAttorneyFees.value = 39415.00;
      dEEDSOFFICE.value = 2014.00;
      fixAmount();
      if (price > 2350000 && price <= 2500000) {
        transferDuty.value = 79275.00;

        // fixAmount();
      } else if (price > 2500000 && price <= 2550000) {
        transferDuty.value = 83275.00;
        // fixAmount();
      } else if (price > 2550000 && price <= 2600000) {
        transferDuty.value = 87275.00;

        // fixAmount();
      }
    } else if (price > 2600000 && price <= 2800000) {
      transferAttorneyFees.value = 41300.00;
      dEEDSOFFICE.value = 2014.00;
      fixAmount();
      if (price > 2600000 && price <= 2650000) {
        transferDuty.value = 91275.00;
        // fixAmount();
      } else if (price > 2650000 && price <= 2700000) {
        transferDuty.value = 95275.00;
        // fixAmount();
      } else if (price > 2700000 && price <= 2750000) {
        transferDuty.value = 100100.00;
        // fixAmount();
      } else if (price > 2750000 && price <= 2800000) {
        transferDuty.value = 105600.00;
        // fixAmount();
      }
    } else if (price > 2800000 && price <= 3000000) {
      transferAttorneyFees.value = 43185.00;
      dEEDSOFFICE.value = 2014.00;
      fixAmount();
      if (price > 2800000 && price <= 2850000) {
        transferDuty.value = 111100.00;
        // fixAmount();
      } else if (price > 2850000 && price <= 2900000) {
        transferDuty.value = 116600.00;
        // fixAmount();
      } else if (price > 2900000 && price <= 2950000) {
        transferDuty.value = 122100.00;
        // fixAmount();
      } else if (price > 2950000 && price <= 3000000) {
        transferDuty.value = 127600.00;
        // fixAmount();
      }
    } else if (price > 3000000 && price <= 3200000) {
      transferAttorneyFees.value = 45070.00;
      dEEDSOFFICE.value = 2014.00;
      fixAmount();
      if (price > 3000000 && price <= 3100000) {
        transferDuty.value = 138600.00;
        // fixAmount();
      } else if (price > 3100000 && price <= 3200000) {
        transferDuty.value = 149600.00;
        // fixAmount();
      }
    } else if (price > 3200000 && price <= 3400000) {
      transferAttorneyFees.value = 46955.00;
      dEEDSOFFICE.value = 2014.00;
      fixAmount();
      if (price > 3200000 && price <= 3300000) {
        transferDuty.value = 160600.00;
        // fixAmount();
      } else if (price > 3300000 && price <= 3400000) {
        transferDuty.value = 171600.00;
        // fixAmount();
      }
    } else if (price > 3400000 && price <= 3600000) {
      transferAttorneyFees.value = 48840.00;
      dEEDSOFFICE.value = 2014.00;
      fixAmount();

      if (price > 3400000 && price <= 3500000) {
        transferDuty.value = 182600.00;
        fixAmount();
      }else if(price > 3500000 && price <= 3600000){
        transferDuty.value = 193600.00;
        // fixAmount();
      }

    } else if (price > 3600000 && price <= 3800000) {
      transferAttorneyFees.value = 50725.00;
      dEEDSOFFICE.value = 2014.00;
      fixAmount();
      if (price > 3500000 && price <= 3600000) {
        transferDuty.value = 193600.00;
        // fixAmount();
      } else if (price > 3600000 && price <= 3700000) {
        transferDuty.value = 204600.00;
        // fixAmount();
      }
    } else if (price > 3800000 && price <= 4000000) {
      transferAttorneyFees.value = 52610.00;
      dEEDSOFFICE.value = 2014.00;
      fixAmount();
      if (price > 3700000 && price <= 3800000) {
        transferDuty.value = 215600.00;
        // fixAmount();
      } else if (price > 3800000 && price <= 3900000) {
        transferDuty.value = 226600.00;
        // fixAmount();

      }else if(price > 3900000 && price <= 4000000){
        transferDuty.value = 237600.00;
        // fixAmount();
      }

    } else if (price > 4000000 && price <= 4200000) {
      transferAttorneyFees.value = 54495.00;
      dEEDSOFFICE.value = 2443.00;
      fixAmount();
      if (price > 3900000 && price <= 4000000) {
        transferDuty.value = 237600.00;
        // fixAmount();
      } else if (price > 4000000 && price <= 4100000) {
        transferDuty.value = 248600.00;
        // fixAmount();
      } else if (price > 4100000 && price <= 4200000) {
        transferDuty.value = 259600.00;
        // fixAmount();
      }
    } else if (price > 4200000 && price <= 4400000) {
      transferAttorneyFees.value = 56380.00;
      dEEDSOFFICE.value = 2443.00;
      fixAmount();
      if (price > 4200000 && price <= 4300000) {
        transferDuty.value = 270600.00;
        // fixAmount();
      } else if (price > 4300000 && price <= 4400000) {
        transferDuty.value = 281600.00;
        // fixAmount();
      }
    } else if (price > 4400000 && price <= 4600000) {
      transferAttorneyFees.value = 58265.00;
      dEEDSOFFICE.value = 2443.00;
      fixAmount();
      if (price > 4400000 && price <= 4500000) {
        transferDuty.value = 292600.00;
        // fixAmount();
      } else if (price > 4500000 && price <= 4600000) {
        transferDuty.value = 303600.00;
        // fixAmount();
      }
    } else if (price > 4600000 && price <= 4800000) {
      transferAttorneyFees.value = 60150.00;
      dEEDSOFFICE.value = 2443.00;
      fixAmount();
      if (price > 4600000 && price <= 4700000) {
        transferDuty.value = 314600.00;
        // fixAmount();
      } else if (price > 4700000 && price <= 4800000) {
        transferDuty.value = 325600.00;
        // fixAmount();
      }
    } else if (price > 4800000 && price <= 5000000) {
      transferAttorneyFees.value = 62035.00;
      dEEDSOFFICE.value = 2443.00;
      fixAmount();

      if (price > 4800000 && price <= 5000000) {
        transferDuty.value = 347600.00;
        // fixAmount();
      }
    } else if (price > 5000000 && price <= 6000000) {
      transferAttorneyFees.value = 66785.00;
      dEEDSOFFICE.value = 2443.00;
      fixAmount();
      if (price > 5000000 && price <= 5200000) {
        transferDuty.value = 369600.00;
        // fixAmount();
      } else if (price > 5200000 && price <= 5400000) {
        transferDuty.value = 391600.00;
        // fixAmount();
      } else if (price > 5400000 && price <= 5600000) {
        transferDuty.value = 413600.00;
        // fixAmount();
      } else if (price > 5600000 && price <= 5800000) {
        transferDuty.value = 435600.00;
        // fixAmount();
      } else if (price > 5800000 && price <= 6000000) {
        transferDuty.value = 457600.00;
        // fixAmount();
      }
    } else if (price > 6000000 && price <= 7000000) {
      transferAttorneyFees.value = 71535.00;
      dEEDSOFFICE.value = 2909.00;
      fixAmount();
      if (price > 6000000 && price <= 6200000) {
        transferDuty.value = 479600.00;
        // fixAmount();
      } else if (price > 6200000 && price <= 6400000) {
        transferDuty.value = 501600.00;
        // fixAmount();
      } else if (price > 6400000 && price <= 6600000) {
        transferDuty.value = 523600.00;
        // fixAmount();
      } else if (price > 6600000 && price <= 6800000) {
        transferDuty.value = 545600.00;
        // fixAmount();
      } else if (price > 6800000 && price <= 7000000) {
        transferDuty.value = 567600.00;
        // fixAmount();
      }
    } else if (price > 7000000 && price <= 8000000) {
      transferAttorneyFees.value = 76285.00;
      dEEDSOFFICE.value = 2909.00;
      fixAmount();
      if (price > 7000000 && price <= 7200000) {
        transferDuty.value = 589600.00;
        // fixAmount();
      }
      if (price > 7200000 && price <= 7400000) {
        transferDuty.value = 611600.00;
        // fixAmount();
      }
      if (price > 7400000 && price <= 7600000) {
        transferDuty.value = 633600.00;
        // fixAmount();
      }
      if (price > 7600000 && price <= 7800000) {
        transferDuty.value = 655600.00;
        // fixAmount();
      }
      if (price > 7800000 && price <= 8000000) {
        transferDuty.value = 677600.00;
        // fixAmount();
      }
    } else if (price > 8000000 && price <= 9000000) {
      transferAttorneyFees.value = 81035.00;
      dEEDSOFFICE.value = 3401.00;
      fixAmount();
      if (price > 8000000 && price <= 8200000) {
        transferDuty.value = 699600.00;
        // fixAmount();
      }
      if (price > 8200000 && price <= 8400000) {
        transferDuty.value = 721600.00;
        // fixAmount();
      }
      if (price > 8400000 && price <= 8600000) {
        transferDuty.value = 743600.00;
        // fixAmount();
      }
      if (price > 8600000 && price <= 8800000) {
        transferDuty.value = 765600.00;
        // fixAmount();
      }
      if (price > 8800000 && price <= 9000000) {
        transferDuty.value = 787600.00;
        // fixAmount();
      }
    } else if (price > 9000000 && price <= 10000000) {
      transferAttorneyFees.value = 85785.00;
      dEEDSOFFICE.value = 3401.00;
      fixAmount();

      if (price > 9000000 && price <= 9200000) {
        transferDuty.value = 809600.00;
        // fixAmount();
      }
      if (price > 9200000 && price <= 9400000) {
        transferDuty.value = 831600.00;
      }
      if (price > 9400000 && price <= 9600000) {
        transferDuty.value = 853600.00;
        // fixAmount();
      }
      if (price > 9600000 && price <= 9800000) {
        transferDuty.value = 875600.00;
        // fixAmount();
      }
      if (price > 9800000 && price <= 10000000) {
        transferDuty.value = 897600.00;
        // fixAmount();
      }
    }
  }
}
