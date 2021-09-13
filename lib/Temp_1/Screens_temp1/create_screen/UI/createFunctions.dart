import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Grid/GridCols.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/SubPanelUda.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:math_expressions/math_expressions.dart';

List<UDAsWithValues> udasWithValues = [];
GenericObject mainGenericObject;

List<SubPanelUda> renderPanelsToUDAs(
    List<SubPanelUda> panels, List<UDAsWithValues> listOfUDAs) {
  if (panels != null) {
    panels.forEach((panel) => {
          panel.udas = [],
          if (listOfUDAs != null && listOfUDAs.length > 0)
            {
              listOfUDAs.forEach((uda) => {
                    if (uda.udaPanelID == panel.recId) {panel.udas.add(uda)}
                  })
            }
        });
    panels = sortPanelsAndSubPanels(panels);
  } else {
    panels = [];
  }
  return removeEmptyPanels(panels);
}

sortPanelsAndSubPanels(List<SubPanelUda> panels) {
  List<SubPanelUda> toRemovePanels = [];
  panels.forEach((panel) {
    if (isSubPanel(panel)) {
      panels
          .firstWhere((parentPanel) => panel.parentPanelId == parentPanel.recId)
          .subPanels
          .add(panel);
      toRemovePanels.add(panel);
    }
  });
  panels.removeWhere((panel) => toRemovePanels.contains(panel));
  return panels;
}

bool isSubPanel(SubPanelUda panel) {
  return panel.isParent == false && (panel.parentPanelId != null)
      ? panel.parentPanelId > -1
      : false;
}

List<SubPanelUda> removeEmptyPanels(List<SubPanelUda> panels) {
  // List<SubPanelUda> filledPanels = [];
  // panels.forEach((panel) => {
  //       if ((arePanelUDAsVisible(panel.udas) &&
  //               containsNonPlanUDA(panel.udas)) ||
  //           isNotEmptyList(panel.subPanels))
  //         {
  //           filledPanels.add(panel),
  //         }
  //     });
  // return filledPanels;
  panels.removeWhere((panel) {
    return !(arePanelUDAsVisible(
            panel.udas) //&& containsNonPlanUDA(panel.udas))
        ||
        isNotEmptyList(panel.subPanels));
  });
  return panels;
}

bool arePanelUDAsVisible(List<UDAsWithValues> udas) {
  bool areUDAsVisible = false;
  if (isNotEmptyList(udas))
    udas.forEach((uda) {
      if (uda.hasNoPrevilage == false) areUDAsVisible = true;
    });
  return areUDAsVisible;
}

bool containsNonPlanUDA(List<UDAsWithValues> udas) {
  bool includesUDAsExceptPlan = false;
  if (isNotEmptyList(udas))
    udas.forEach((uda) {
      if (uda.udaType != 18) includesUDAsExceptPlan = true;
    });
  return includesUDAsExceptPlan;
}

UDAsValidation checkIsFormValid(List<UDAsWithValues> udasValues) {
  UDAsValidation isValidUDA = UDAsValidation();
  isValidUDA.isValid = true;
  if (udasValues != null) {
    for (var i = 0; i < udasValues.length; i++) {
      //Check validation
      if (udasValues[i].isVisible == true) {
        if (udasValues[i].isUdaValid == false &&
            udasValues[i].isValidationCondMsgWarn != true) {
          if (isEmptyText(isValidUDA.notValidMessage))
            isValidUDA.notValidMessage =
                "Please check validation on these fields";
          isValidUDA.notValidMessage += "\n" +
              udasValues[i].udaCaption +
              ": [${udasValues[i].validationMessage}]";
          isValidUDA.isValid = false;
        }
        //Check mandatory
        else if ((udasValues[i].isMandatory == true &&
            ((udasValues[i].udaValue == null || udasValues[i].udaValue == '') &&
                (udasValues[i].rowData == null ||
                    udasValues[i].rowData == []) &&
                (udasValues[i].notesList == null ||
                    udasValues[i].notesList == []) &&
                (udasValues[i].attachments == null ||
                    udasValues[i].attachments == []) &&
                (udasValues[i].memberValue == null ||
                    udasValues[i].memberValue == '')))) {
          log(LogType.DEBUG,
              "Form is not valid with fields ===== ${udasValues[i].udaCaption}");
          isValidUDA.isValid = false;
          return isValidUDA;
        }
      }
    }
  } else
    isValidUDA.isValid = false;
  return isValidUDA;
}

resolveUDAConditionalValidation(UDAsWithValues uda, udas) {
  udasWithValues = udas;
  uda.isNormal = false;
  uda.isMandatory = false;
  uda.isVisible = true;
  uda.isReadOnly = false;
  uda.isUdaValid = true;
  if (!isEmptyText(uda.readOnlyCondition)) {
    bool resolvedCondition = resolveCondition(uda.readOnlyCondition);
    uda.isReadOnly = (resolvedCondition != null)
        ? (resolvedCondition || uda.visableType == 2)
        : false;
  } else
    uda.isReadOnly = uda.visableType == 2;

  if (!isEmptyText(uda.visibleCondition)) {
    bool resolvedCondition = resolveCondition(uda.visibleCondition);
    uda.isVisible = (resolvedCondition != null)
        ? (resolvedCondition && uda.hasNoPrevilage != true)
        : false;
  } else
    uda.isVisible = uda.hasNoPrevilage != true;

  if (!isEmptyText(uda.isMandatoryCondition)) {
    bool resolvedCondition = resolveCondition(uda.isMandatoryCondition);
    uda.isMandatory = (resolvedCondition != null)
        ? (resolvedCondition || uda.visableType == 3)
        : false;
  } else
    uda.isMandatory = uda.visableType == 3;

  if (!isEmptyText(uda.normalCondition)) {
    bool resolvedCondition = resolveCondition(uda.normalCondition);
    uda.isNormal = (resolvedCondition != null) ? resolvedCondition : false;
  }
  if (!isEmptyText(uda.validCondition)) {
    bool resolvedCondition = resolveCondition(uda.validCondition);
    uda.isUdaValid = (resolvedCondition != null) ? !resolvedCondition : false;
  } else {
//    uda.isUdaValid = true;
  }
}

resolveColumnConditionalValidation(
    GridCols column, udas, List<GridCols> columns) {
  udasWithValues = udas;
  column.isMandatory = false;
  column.isReadOnly = false;
  if (!isEmptyText(column.readonlyCondition)) {
    column.isReadOnly =
        (resolveCondition(column.readonlyCondition, columns: columns) != null)
            ? resolveCondition(column.readonlyCondition, columns: columns)
            : false;
  }
  if (!isEmptyText(column.isMandatoryCondition)) {
    column.isMandatory =
        (resolveCondition(column.isMandatoryCondition, columns: columns) !=
                null)
            ? resolveCondition(column.isMandatoryCondition, columns: columns)
            : false;
  }
  if (!isEmptyText(column.hideCondition)) {
    column.hidden =
        (resolveCondition(column.hideCondition, columns: columns) != null)
            ? resolveCondition(column.hideCondition, columns: columns)
            : false;
  }
}

resolveCondition(String query, {List<GridCols> columns}) {
  bool result;
  if (query.contains("OR")) {
    result = false;
    List queries = query.split("OR");
    if (queries.length > 0) {
      queries.forEach((query) {
        result = result || determineQuery(query, columns: columns);
      });
    }
  } else if (query.contains("AND")) {
    result = true;
    List queries = query.split("AND");
    if (queries.length > 0) {
      queries.forEach((query) {
        result = result && determineQuery(query, columns: columns);
      });
    }
  } else {
    result = determineQuery(query, columns: columns);
  }
  return result;
}

determineQuery(String query, {List<GridCols> columns}) {
  if (query.contains("uda")) {
    return determineUDAQuery2(query, columns: columns);
    //return determineUDAQuery(query, columns: columns);
  } else if (query.contains("Object"))
    return determineGenericObjectQuery(query);
  else if (query.contains("LogineUserInfoData.MainLoginInfo"))
    return; //determineMainLoginInfoQuery(query);
}

determineUDAQuery2(String query, {List<GridCols> columns}) {
  List<String> queryOperands = [];
  var operand1;
  var operand2;
  if (query.contains("<")) {
    queryOperands = query.split("<");
    operand1 = queryOperands[0].replaceAll("'", "").trim();
    operand2 = queryOperands[1].replaceAll("'", "").trim();
    operand1 = getOperandValue(operand1, true, columns: columns);
    operand2 = getOperandValue(operand2, true, columns: columns);
    log(LogType.INFO, "Operand 1 ======= $operand1");
    log(LogType.INFO, "Operand 2 ======= $operand2");
    if (operand1 != null && operand2 != null) {
      if (operand1 is DateTime && operand2 is DateTime) {
        return operand1.isBefore(operand2);
      } else if (operand1 is num && operand2 is num) {
        return operand1 < operand2;
      } else if (operand1 is String || operand2 is String) {
        if (operand1 is String) operand1 = double.tryParse(operand1) ?? 0.0;
        if (operand2 is String) operand2 = double.tryParse(operand2) ?? 0.0;
        if (operand1 is num && operand2 is num) return operand1 < operand2;
      }
    } else
      return false;
  } else if (query.contains(">")) {
    queryOperands = query.split(">");
    operand1 = queryOperands[0].replaceAll("'", "").trim();
    operand2 = queryOperands[1].replaceAll("'", "").trim();
    operand1 = getOperandValue(operand1, true, columns: columns);
    operand2 = getOperandValue(operand2, true, columns: columns);
    log(LogType.INFO, "Operand 1 ======= $operand1");
    log(LogType.INFO, "Operand 2 ======= $operand2");
    if (operand1 != null && operand2 != null) {
      if (operand1 is DateTime && operand2 is DateTime) {
        return operand1.isAfter(operand2);
      } else if (operand1 is num && operand2 is num) {
        return operand1 > operand2;
      } else if (operand1 is String || operand2 is String) {
        if (operand1 is String) operand1 = double.tryParse(operand1) ?? 0.0;
        if (operand2 is String) operand2 = double.tryParse(operand2) ?? 0.0;
        if (operand1 is num && operand2 is num) return operand1 > operand2;
      }
    } else
      return false;
  } else if (query.contains("==")) {
    queryOperands = query.split("==");
    operand1 = queryOperands[0].replaceAll("'", "").trim();
    operand2 = queryOperands[1].replaceAll("'", "").trim();
    operand1 = getOperandValue(operand1, false, columns: columns);
    operand2 = getOperandValue(operand2, false, columns: columns);
    log(LogType.INFO, "Operand 1 ======= $operand1");
    log(LogType.INFO, "Operand 2 ======= $operand2");
    if (operand1 != null && operand2 != null) {
      if (operand1 is String) {
        if (!(operand2 is String)) operand2 = operand2.toString();
        return operand1.trim() == operand2.trim();
      } else if (operand1 is double) {
        operand2 = (operand2 is String) ? double.tryParse(operand2) : operand2;
        return operand1 == operand2;
      } else {
        if (operand2 is String) operand1 = operand1.toString().trim();
        return operand1 == operand2;
      }
    } else if (operand2 == null) {
      if (operand1 == "") operand1 = null;
      return operand1 == operand2;
    } else
      return false;
  } else if (query.contains("!=")) {
    queryOperands = query.split("!=");
    operand1 = queryOperands[0].replaceAll("'", "").trim();
    operand2 = queryOperands[1].replaceAll("'", "").trim();
    operand1 = getOperandValue(operand1, false, columns: columns);
    operand2 = getOperandValue(operand2, false, columns: columns);
    if (operand1 != null && operand2 != null) {
      if (operand1 is String) {
        if (!(operand2 is String)) operand2 = operand2.toString();
        return operand1.trim() != operand2.trim();
      } else if (operand1 is double) {
        operand2 = (operand2 is String) ? double.tryParse(operand2) : operand2;
        return operand1 != operand2;
      } else {
        if (operand2 is String) operand1 = operand1.toString().trim();
        return operand1 != operand2;
      }
    } else if (operand2 == null) {
      if (operand1 == "") operand1 = null;
      return operand1 != operand2;
    } else
      return false;
  } else if (query.contains(".includes")) {
    queryOperands = query.split(".includes");
    operand1 = queryOperands[0].replaceAll("'", "").trim();
    operand2 = queryOperands[1].replaceAll("'", "").trim();
    operand2 = operand2.replaceAll("\"", "").trim();
    operand2 = operand2.replaceAll("(", "").trim();
    operand2 = operand2.replaceAll(")", "").trim();
    operand1 = getOperandValue(operand1, false, columns: columns);
    operand2 = getOperandValue(operand2, false, columns: columns);
    log(LogType.INFO, "Operand 1 ======= $operand1");
    log(LogType.INFO, "Operand 2 ======= $operand2");
    if (operand1 != null && operand2 != null) {
      return operand1.toString().contains(operand2.toString());
    } else
      return false;
  }
}

getOperandValue(operand, bool isArithmeticEquation, {List<GridCols> columns}) {
  //Dynamic UDA Value
  if (operand.contains("{{uda.")) {
    bool isOperandValueCalculated = false;
    //Replace all UDAs query expressions with their values
    udasWithValues.forEach((uda) {
      if (isOperandValueCalculated) return;
      //--------Text UDAs queries--------
      if (operand.contains(uda.udaName) &&
          uda.udaType != 6 &&
          uda.udaType != 9) {
        if (uda.udaType == 1) isArithmeticEquation = true;
        operand =
            operand.replaceAll("{{uda.${uda.udaName}}}", uda.udaValue ?? "");
        //All UDAs names are replaced with values
        if (!operand.contains("{{uda.")) {
          //Resolve if equation
          if (operand.contains(RegExp(r'[+-/*]')) &&
              !operand.contains(RegExp(r'[a-zA-Z]'))) {
            if (operand.trim() == "-") operand = "0";
            var p = Parser();
            var exp = p.parse(operand);
            ContextModel cm = ContextModel();
            var eval = exp.evaluate(EvaluationType.REAL, cm);
            operand = eval;
          }
          isOperandValueCalculated = true;
        }
      }
      //--------Date UDAs queries--------
      else if (operand.contains(uda.udaName) && uda.udaType == 6) {
        isOperandValueCalculated = determineDateUDAQuery(
            operand, isOperandValueCalculated,
            columns: columns)[1];
        operand = determineDateUDAQuery(operand, isOperandValueCalculated,
            columns: columns)[0];
      }
      //--------Grid UDA Columns queries--------
      else if (operand.contains(uda.udaName) && uda.udaType == 9) {
        //Prepare list of grid columns to check validations on
        List<List<GridCols>> gridRowData = [];
        if (columns == null) {
          if (uda.rowData != null) {
            uda.rowData.forEach((row) => gridRowData.add(row.columnsList));
          }
        } else
          gridRowData.add(columns);

        bool isColumnFound = false;
        // if (isNotEmptyList(gridRowData)) {
        //   gridRowData[0].forEach((rowData) {
        //     if (isColumnFound) return;
        //     if (operand.contains(rowData.name)) {
        //       isColumnFound = true;
        //       List selectedColumnValues = [];
        //       gridRowData.forEach((row) {
        //         selectedColumnValues.add(row
        //             .firstWhere(
        //                 (currentRowData) => currentRowData.name == rowData.name)
        //             .value);
        //       });
        //       operand = operand.replaceAll(
        //           "{{uda.${uda.udaName}.${rowData.name}}}",
        //           selectedColumnValues ?? "");
        //     }
        //   });
        // }
        gridRowData.forEach((row) {
          if (isColumnFound) return;
          row.forEach((rowData) {
            if (isOperandValueCalculated) return;
            if (operand.contains(rowData.name)) {
              if (rowData.type == 4 || rowData.type == 5 || rowData.type == 8) {
                isOperandValueCalculated = determineDateUDAQuery(
                    operand, isOperandValueCalculated,
                    columns: columns)[1];
                operand = determineDateUDAQuery(
                    operand, isOperandValueCalculated,
                    columns: columns)[0];
              } else if (rowData.type == 1) {
                //Numeric columns values are saved as int not string
                isArithmeticEquation = true;
                if (rowData.value != null)
                  operand = operand.replaceAll(
                      "{{uda.${uda.udaName}.${rowData.name}}}",
                      rowData.value.toString() ?? "");
                else
                  operand.replaceAll(
                      "{{uda.${uda.udaName}.${rowData.name}}}", "0");
              } else
                operand = operand.replaceAll(
                    "{{uda.${uda.udaName}.${rowData.name}}}",
                    rowData.value ?? "");
              isColumnFound = true;
              if (operand != null) {
                if (!operand.contains("{{uda.")) {
                  //Resolve if equation
                  if (operand.contains(RegExp(r'[+-/*]'))) {
                    if (operand.trim() == "-") operand = "0";
                    var p = Parser();
                    var exp = p.parse(operand);
                    ContextModel cm = ContextModel();
                    var eval = exp.evaluate(EvaluationType.REAL, cm);
                    operand = eval;
                  }
                  isOperandValueCalculated = true;
                }
              }
            }
          });
        });
      }
    });
  }
  //Static Value
  else if (operand == 'null')
    operand = null;
  else
    operand = operand;

  //Parse string numbers to nums
  if (isArithmeticEquation &&
      isValidNumber(isEmptyText(operand.toString())
          ? "text"
          : operand.toString().trim())) {
    operand = double.tryParse(operand.toString().trim());
  }
  return operand;
}

determineDateUDAQuery(operand, isOperandValueCalculated,
    {List<GridCols> columns}) {
  List<String> splittedDateUDAsNames = operand.split(RegExp(r'[+-]'));
  List<DateTime> splittedDateUDAsValues = [];
  List<num> staticEquationDaysValue = [];
  List<String> splittedOperators = [];

  //Prepare list of operators
  operand.runes.forEach((element) {
    String char = String.fromCharCode(element);
    if (char == "+")
      splittedOperators.add("+");
    else if (char == "-") splittedOperators.add("-");
  });

  //Prepare list of dates values and static values
  List<int> toBeRemovedOpIndeces = [];
  for (var i = 0; i < splittedDateUDAsNames.length; i++) {
    bool isUDAFound = false;
    //Dynamic date value retrieved from UDA
    if (splittedDateUDAsNames[i].contains("{{uda.")) {
      //Is UDA
      if (".".allMatches(splittedDateUDAsNames[i]).length == 1)
        udasWithValues.forEach((uda) {
          if (isUDAFound == true) return;
          if (splittedDateUDAsNames[i].contains(uda.udaName)) {
            splittedDateUDAsValues.add(DateTime.tryParse(uda.udaValue ?? "0"));
            isUDAFound = true;
          }
        });

      //Is column inside a grid
      else if (isNotEmptyList(columns) &&
          (".".allMatches(splittedDateUDAsNames[i]).length == 2))
        columns.forEach((column) {
          if (isUDAFound == true) return;
          if (splittedDateUDAsNames[i].contains(column.name)) {
            splittedDateUDAsValues.add(DateTime.tryParse(column.value ?? "0"));
            isUDAFound = true;
          }
        });
    }

    //Static value, considered as days
    else {
      var staticValue;
      if ((i > 0)) {
        staticValue = (splittedOperators[i - 1] == "-")
            ? double.tryParse(splittedDateUDAsNames[i]) * -1
            : double.tryParse(splittedDateUDAsNames[i]);
      } else
        staticValue = double.tryParse(splittedDateUDAsNames[i]);
      staticEquationDaysValue.add(staticValue);
      toBeRemovedOpIndeces.add(i - 1);
    }
  }
  //Remove operators preceding the static values
  toBeRemovedOpIndeces.reversed.forEach((index) {
    splittedOperators.removeAt(index);
  });

  if (splittedDateUDAsValues.length > 1) {
    for (var i = 0; i < splittedDateUDAsValues.length - 1; i++) {
      switch (splittedOperators[i]) {
        case "+":
          if (splittedDateUDAsValues[i] != null &&
              splittedDateUDAsValues[i + 1] != null)
            operand = splittedDateUDAsValues[i]
                .add(
                  Duration(
                    days: (splittedDateUDAsValues[i + 1].day +
                        (splittedDateUDAsValues[i + 1].month * 30) +
                        (splittedDateUDAsValues[i + 1].year * 366)),
                    hours: splittedDateUDAsValues[i + 1].hour,
                    minutes: splittedDateUDAsValues[i + 1].minute,
                  ),
                )
                .day;
          else
            operand = null;
          break;
        case "-":
          if (splittedDateUDAsValues[i] != null &&
              splittedDateUDAsValues[i + 1] != null)
            operand = splittedDateUDAsValues[i]
                .difference(splittedDateUDAsValues[i + 1])
                .inDays;
          else
            operand = null;
          break;
        default:
      }
    }
    if (isNotEmptyList(staticEquationDaysValue)) {
      staticEquationDaysValue.forEach((value) {
        if (operand != null) operand += value;
      });
    }
    isOperandValueCalculated = true;
  } else if (splittedDateUDAsValues.length == 1) {
    operand = splittedDateUDAsValues[0];
    if (isNotEmptyList(staticEquationDaysValue) && operand != null) {
      staticEquationDaysValue.forEach((value) {
        operand = operand.add(Duration(days: value.toInt()));
      });
    }
    isOperandValueCalculated = true;
  }
  return [operand, isOperandValueCalculated];
}

determineUDAQuery(String query, {List<GridCols> columns}) {
//  var x = query.split("uda.")[1];
  var x = query.split("uda.");
  List y = x[1].split("}}");
  var operand1;
  var operand2;
  String udaName = y[0];
  if (udaName.contains(".")) {
    bool determinedQuery =
        determineGridColumnQuery(operand1, operand2, x, y, columns: columns);
    log(LogType.INFO, "Query result ===== $determinedQuery");
    return determinedQuery;
  } else {
    UDAsWithValues selectedUDA = getUDAValue(udaName);
    UDAsWithValues selectedSecondUDA;
    if (selectedUDA != null) {
      if (operand1 = selectedUDA.udaType == 1) {
        if (selectedUDA.udaValue != null && selectedUDA.udaValue != '') {
          operand1 = int.parse(selectedUDA.udaValue);
        } else {
          return false;
        }
      } else {
        operand1 = selectedUDA.udaValue != null ? selectedUDA.udaValue : '';
      }
      if ("{{uda.".allMatches(query).length == 2) {
        log(LogType.INFO, "DDDDDDD");
      }
      String subEquation = y[1];
      if (subEquation.contains("{{")) {
        String operand2UdaName = x[2].replaceAll("}}", "");
        selectedSecondUDA = getUDAValue(operand2UdaName);
//      operand2 = getQueryOperandValue(operand2, selectedSecondUDA);
        if (selectedSecondUDA != null) {
          if (operand2 = selectedSecondUDA.udaType == 1) {
            if (selectedSecondUDA.udaValue != null &&
                selectedSecondUDA.udaValue != '') {
              operand2 = int.parse(selectedSecondUDA.udaValue);
            } else {
              return false;
            }
          } else {
            operand2 = selectedSecondUDA.udaValue ?? '';
            if (isValidNumber(isEmptyText(operand1) ? "text" : operand1)) {
              operand1 = int.parse(operand1);
              operand2 = (isEmptyText(operand2) || operand2 == "-")
                  ? 0
                  : int.tryParse(operand2) ?? double.tryParse(operand2);
            } else if (operand1 == "-") {
              operand1 = 0;
              operand2 = (isEmptyText(operand2) || operand2 == "-")
                  ? 0
                  : int.tryParse(operand2) ?? double.tryParse(operand2);
            }
          }
        }
      }
      if (subEquation.contains('<')) {
        if (operand1 is String) operand1 = int.tryParse(operand1) ?? 0;
        operand2 ??= int.parse(subEquation.split('<')[1]);
        return (!isEmptyText(operand1.toString()) &&
                operand1 is num &&
                operand2 is num)
            ? operand1 < operand2
            : false;
      } else if (subEquation.contains('>')) {
        if (operand1 is String) operand1 = int.tryParse(operand1) ?? 0;
        operand2 ??=
            int.tryParse(subEquation.trim().replaceAll("'", '').split('>')[1]);
        return (!isEmptyText(operand1.toString()))
            ? operand1 ?? 0 > operand2 ?? 0
            : false;
      } else if (subEquation.contains('==')) {
        if (selectedUDA.udaType != 1)
          operand1 = operand1.toString().replaceAll(" ", "");
        operand2 ??= selectedUDA.udaType == 1
            ? int.parse(subEquation.split('==')[1])
            : subEquation
                .split('==')[1]
                .replaceAll("'", '')
                .replaceAll(" ", '');
        if (operand2 == 'null') {
          operand2 = null;
          operand1 = isEmptyText(operand1.toString()) ? null : operand1;
        }
        return (!isEmptyText(operand1.toString()))
            ? operand1 == operand2
            : false;
      } else if (subEquation.contains('!=')) {
        operand1 = operand1.toString().replaceAll(" ", "");
        operand2 = selectedUDA.udaType == 1
            ? int.tryParse(subEquation.trim().split('!=')[1])
            : subEquation
                .split('!=')[1]
                .replaceAll("'", '')
                .replaceAll(" ", '');
        if (operand2 == 'null') {
          operand2 = null;
          operand1 = isEmptyText(operand1.toString()) ? null : operand1;
        }
        return (operand1 != null) ? operand1 != operand2 : false;
      } else if (subEquation.contains('.includes')) {
        operand2 = subEquation.split('.includes')[1].split('"')[1];
        return (operand1 != null)
            ? operand1.toString().contains(operand2)
            : false;
      }
    } else {
      return false;
    }
  }
}

determineGridColumnQuery(operand1, operand2, List x, List<String> y,
    {List<GridCols> columns}) {
  String udaName = y[0].split(".")[0];
  String columnName = y[0].split(".")[1];
  List<List<GridCols>> gridRowData = [];
  if (columns == null) {
    UDAsWithValues gridUDA = getUDAValue(udaName);
    if (gridUDA.rowData != null) {
      gridUDA.rowData.forEach((row) => gridRowData.add(row.columnsList));
    }
  } else
    gridRowData.add(columns);
  GridCols selectedColumn = GridCols();
  int currentRowIndex = 0;
  bool isConditionTrue = false;
  gridRowData.forEach((row) {
    selectedColumn = getColumnValue(columnName, row);
    var selectedSecondUDA;
    if (selectedColumn != null) {
      if (operand1 = selectedColumn.type == 1) {
        if (!isEmptyText(selectedColumn.value)) {
          operand1 = int.parse(selectedColumn.value);
        }
        // else {
        //   if (currentRowIndex == gridRowData.length-1) return false;
        // }
      } else {
        operand1 = selectedColumn.value != null ? selectedColumn.value : '';
      }
      String subEquation = y[1];
      if (subEquation.contains("{{")) {
        String operand2UdaName = x[2].replaceAll("}}'", "");
        if (operand2UdaName.contains("."))
          selectedSecondUDA = GridCols();
        else
          selectedSecondUDA = getUDAValue(operand2UdaName);
//      operand2 = getQueryOperandValue(operand2, selectedSecondUDA);
        if (selectedSecondUDA != null) {
          if (operand2 = selectedSecondUDA.udaType == 1) {
            if (!isEmptyText(selectedSecondUDA.value)) {
              operand2 = int.parse(selectedSecondUDA.udaValue);
            }
            // else {
            //   if (currentRowIndex == gridRowData.length-1) return false;
            // }
          } else {
            operand2 = selectedSecondUDA.udaValue != null
                ? selectedSecondUDA.udaValue
                : '';
            if (isValidNumber(isEmptyText(operand1) ? "text" : operand1)) {
              operand1 = int.parse(operand1);
              operand2 = (isEmptyText(operand2) || operand2 == "-")
                  ? 0
                  : int.tryParse(operand2) ?? double.tryParse(operand2);
            } else if (operand1 == "-") {
              operand1 = 0;
              operand2 = (isEmptyText(operand2) || operand2 == "-")
                  ? 0
                  : int.tryParse(operand2) ?? double.tryParse(operand2);
            }
          }
        }
      }
      if (subEquation.contains('<')) {
        operand2 ??= int.parse(subEquation.split('<')[1]);
        if (!isEmptyText(operand1.toString())) {
          if (operand1 < operand2) {
            isConditionTrue = true;
            return isConditionTrue;
          }
        }
      } else if (subEquation.contains('>')) {
//
        operand2 ??= int.parse(subEquation.split('>')[1]);
        if (!isEmptyText(operand1.toString())) {
          if (operand1 > operand2) {
            isConditionTrue = true;
            return isConditionTrue;
          }
        }
      } else if (subEquation.contains('==')) {
        if (selectedColumn.type != 1)
          operand1 = operand1.toString().replaceAll(" ", "");
        operand2 ??= selectedColumn.type == 1
            ? int.parse(subEquation.split('==')[1])
            : subEquation
                .split('==')[1]
                .replaceAll("'", '')
                .replaceAll(" ", '');
        if (operand2 == 'null') {
          operand2 = null;
          operand1 = isEmptyText(operand1.toString()) ? null : operand1;
        }
        if (!isEmptyText(operand1.toString())) {
          if (operand1 == operand2) {
            isConditionTrue = true;
            return isConditionTrue;
          }
        }
      } else if (subEquation.contains('!=')) {
        operand1 = operand1.toString().replaceAll(" ", "");
        operand2 = selectedColumn.type == 1
            ? int.tryParse(subEquation.trim().split('!=')[1])
            : subEquation
                .split('!=')[1]
                .replaceAll("'", '')
                .replaceAll(" ", '');
        if (operand2 == 'null') {
          operand2 = null;
          operand1 = isEmptyText(operand1.toString()) ? null : operand1;
        }
        if (!isEmptyText(operand1.toString())) {
          if (operand1 != operand2) {
            isConditionTrue = true;
            return isConditionTrue;
          }
        }
      } else if (subEquation.contains('.includes')) {
        operand2 = subEquation.split('.includes')[1].split('"')[1];
        if (!isEmptyText(operand1.toString())) {
          if (operand1.toString().contains(operand2)) {
            isConditionTrue = true;
            return isConditionTrue;
          }
        }
      }
    } else {
      isConditionTrue = false;
    }
    currentRowIndex += 1;
  });
  return isConditionTrue;
}

dynamic getQueryOperandValue(var operand, UDAsWithValues selectedSecondUDA) {
  if (selectedSecondUDA != null) {
    if (operand = selectedSecondUDA.udaType == 1) {
      if (selectedSecondUDA.udaValue != null &&
          selectedSecondUDA.udaValue != '') {
        operand = int.parse(selectedSecondUDA.udaValue);
      } else {
        return false;
      }
    } else {
      operand =
          selectedSecondUDA.udaValue != null ? selectedSecondUDA.udaValue : '';
    }
  }
}

determineGenericObjectQuery(String query) {
  var x = query.split("Object.")[1];
  List y = x.split("}}");
  String subEquation = y[1];
  var operand1 = y[0];
  var operand2;
  if (mainGenericObject != null) {
    switch (operand1) {
      case "recId":
        operand1 = mainGenericObject.recId;
        break;
      case "createdById":
        operand1 = mainGenericObject.createdById;
        break;
      case "createdDate":
        operand1 = mainGenericObject.createdDate;
        break;
      case "updatedDate":
        operand1 = mainGenericObject.updatedDate;
        break;
      case "createdBy":
        operand1 = mainGenericObject.createdBy;
        break;
      case "name":
        operand1 = mainGenericObject.name;
        break;
      case "statusId":
        operand1 = mainGenericObject.statusId;
        break;
      case "GenericObjectId":
        operand1 = mainGenericObject.GenericObjectId;
        break;
      case "typeId":
        operand1 = mainGenericObject.typeId;
        break;
      case "parentTypeId":
        operand1 = mainGenericObject.parentTypeId;
        break;
      case "templateId":
        operand1 = mainGenericObject.templateId;
        break;
      case "table_Name":
        operand1 = mainGenericObject.table_Name;
        break;
      case "typeName":
        operand1 = mainGenericObject.typeName;
        break;
      case "updatedBy":
        operand1 = mainGenericObject.updatedBy;
        break;
      case "updatedbyById":
        operand1 = mainGenericObject.updatedbyById;
        break;
      case "statusLastChangeDate":
        operand1 = mainGenericObject.statusLastChangeDate;
        break;
      case "groups":
        operand1 = mainGenericObject.groups;
        break;
      case "groupId":
        operand1 = mainGenericObject.groupId;
        break;
      case "slaObjects":
        operand1 = mainGenericObject.slaObjects;
        break;
      case "ruleMessage":
        operand1 = mainGenericObject.ruleMessage;
        break;
      case "ruleFaild":
        operand1 = mainGenericObject.ruleFaild;
        break;
      case "preventSave":
        operand1 = mainGenericObject.preventSave;
        break;
      case "rowIndex":
        operand1 = mainGenericObject.rowIndex;
        break;
      case "addingError":
        operand1 = mainGenericObject.addingError;
        break;
      case "type":
        operand1 = mainGenericObject.type;
        break;
      case "needToBeModified":
        operand1 = mainGenericObject.needToBeModified;
        break;
      case "customError":
        operand1 = mainGenericObject.customError;
        break;
      default:
        operand1 = null;
    }
    if (subEquation.contains('<')) {
      operand2 = int.parse(subEquation.split('<')[1]);
      return (operand1 != null) ? operand1 < operand2 : false;
    } else if (subEquation.contains('>')) {
      operand2 = int.parse(subEquation.split('>')[1]);
      return (operand1 != null) ? operand1 > operand2 : false;
    } else if (subEquation.contains('==')) {
      if (subEquation.split('==')[1] == 'null')
        operand2 = null;
      else
        operand2 = int.tryParse(subEquation.split('==')[1]) ??
            subEquation.split('==')[1].replaceAll("'", '').trim();
      return (operand1 != null) ? operand1 == operand2 : false;
    } else if (subEquation.contains('!=')) {
      if (subEquation.split('!=')[1].trim().replaceAll("'", "") == 'null')
        operand2 = null;
      else
        operand2 = int.tryParse(subEquation.split('!=')[1]) ??
            subEquation.split('!=')[1].replaceAll("'", '').trim();
      return (operand1 != null) ? operand1 != operand2 : false;
    } else if (subEquation.contains('.includes')) {
      operand2 = subEquation.split('.includes')[1].split('"')[1];
      return (operand1 != null)
          ? operand1.toString().contains(operand2)
          : false;
    }
  } else {
    if (subEquation.contains('==')) {
      if (subEquation.split('==')[1].trim().replaceAll("'", "") == 'null')
        return true;
      else
        return false;
    } else if (subEquation.contains('!=')) {
      if (subEquation.split('!=')[1].trim().replaceAll("'", "") == 'null')
        return false;
      else
        return true;
    } else
      return false;
  }
}

// determineMainLoginInfoQuery(String query) async {
//   var x = query.split("LogineUserInfoData.MainLoginInfo.")[1];
//   List y = x.split("}}");
//   String subEquation = y[1];
//   var operand1 = y[0];
//   var operand2;
//   LoginUser loginUserInfoData = await GetUserDataFromSecure.getUserData();
//   if (loginUserInfoData != null) {
//     switch (operand1) {
//       case "fullName":
//         operand1 = loginUserInfoData.MainLoginInfo.fullName;
//         break;
//       case "Mail":
//         operand1 = loginUserInfoData.MainLoginInfo.Mail;
//         break;
//       case "password":
//         operand1 = loginUserInfoData.MainLoginInfo.password;
//         break;
//       case "expiredate":
//         operand1 = loginUserInfoData.MainLoginInfo.expiredate;
//         break;
//       case "isExcludeFilterRegion":
//         operand1 = loginUserInfoData.MainLoginInfo.isExcludeFilterRegion;
//         break;
//       case "WorkingDays":
//         operand1 = loginUserInfoData.MainLoginInfo.WorkingDays;
//         break;
//       case "hourcost":
//         operand1 = loginUserInfoData.MainLoginInfo.hourcost;
//         break;
//       case "WorkingHours":
//         operand1 = loginUserInfoData.MainLoginInfo.WorkingHours;
//         break;
//       case "StartWorkingHour":
//         operand1 = loginUserInfoData.MainLoginInfo.StartWorkingHour;
//         break;
//       case "ResourceBundle":
//         operand1 = loginUserInfoData.MainLoginInfo.ResourceBundle;
//         break;
//       case "NumberAvilableReports":
//         operand1 = loginUserInfoData.MainLoginInfo.NumberAvilableReports;
//         break;
//       case "Image":
//         operand1 = loginUserInfoData.MainLoginInfo.Image;
//         break;
//       case "EmpStatus":
//         operand1 = loginUserInfoData.MainLoginInfo.EmpStatus;
//         break;
//       case "authUserBy":
//         operand1 = loginUserInfoData.MainLoginInfo.authUserBy;
//         break;
//       case "BranchName":
//         operand1 = loginUserInfoData.MainLoginInfo.BranchName;
//         break;
//       case "userType":
//         operand1 = loginUserInfoData.MainLoginInfo.userType;
//         break;
//       default:
//         operand1 = null;
//     }
//     if (subEquation.contains('<')) {
//       operand2 = int.parse(subEquation.split('<')[1]);
//       return (operand1 != null) ? operand1 < operand2 : false;
//     } else if (subEquation.contains('>')) {
//       operand2 = int.parse(subEquation.split('>')[1]);
//       return (operand1 != null) ? operand1 > operand2 : false;
//     } else if (subEquation.contains('==')) {
//       if (subEquation.split('==')[1] == 'null')
//         operand2 = null;
//       else
//         operand2 = int.tryParse(subEquation.split('==')[1]) ??
//             subEquation.split('==')[1].replaceAll("'", '').trim();
//       return (operand1 != null) ? operand1 == operand2 : false;
//     } else if (subEquation.contains('!=')) {
//       if (subEquation.split('!=')[1].trim().replaceAll("'", "") == 'null')
//         operand2 = null;
//       else
//         operand2 = int.tryParse(subEquation.split('!=')[1]) ??
//             subEquation.split('!=')[1].replaceAll("'", '').trim();
//       return (operand1 != null) ? operand1 != operand2 : false;
//     } else if (subEquation.contains('.includes')) {
//       operand2 = subEquation.split('.includes')[1].split('"')[1];
//       return (operand1 != null)
//           ? operand1.toString().contains(operand2)
//           : false;
//     }
//   } else {
//     if (subEquation.contains('==')) {
//       if (subEquation.split('==')[1].trim().replaceAll("'", "") == 'null')
//         return true;
//       else
//         return false;
//     } else if (subEquation.contains('!=')) {
//       if (subEquation.split('!=')[1].trim().replaceAll("'", "") == 'null')
//         return false;
//       else
//         return true;
//     } else
//       return false;
//   }
// }

getUDAValue(String udaName) {
  int index = -1;
  if (udasWithValues.length > 0) {
    index = udasWithValues.indexWhere((uda) {
      return uda.udaName == udaName.replaceAll(" ", "");
    });
  }
  if (index >= 0) {
    return udasWithValues[index];
  } else {
    return null;
  }
}

getColumnValue(String columnName, List<GridCols> columns) {
  columnName = columnName.trim();
  int index = -1;
  if (columns.length > 0) {
    index = columns.indexWhere((column) => column.name == columnName);
  }
  return (index >= 0) ? columns[index] : null;
}

replaceConditionUDAValue(String query) {
  String finalCondition = query;
  if (query.contains("OR")) {
    List queries = query.split("OR");
    if (queries.length > 0) {
      queries.forEach((subQuery) {
        finalCondition = finalCondition.replaceAll(
            subQuery, replaceQueryWithValue(subQuery));
      });
    }
  } else if (query.contains("AND")) {
    List queries = query.split("AND");
    if (queries.length > 0) {
      queries.forEach((subQuery) {
        finalCondition = finalCondition.replaceAll(
            subQuery, replaceQueryWithValue(subQuery));
      });
    }
  } else {
    finalCondition = replaceQueryWithValue(query);
  }
  finalCondition = finalCondition.replaceAll("AND", "&&");
  finalCondition = finalCondition.replaceAll("OR", "||");
  return finalCondition;
}

replaceQueryWithValue(String query) {
  if (query.contains("uda")) {
    var x = query.split("uda.")[1];
    List y = x.split("}}");
    String udaName = y.first.contains(".") ? y.first.split(".").first : y[0];
    UDAsWithValues selectedUDA = getUDAValue(udaName);
    String resultQuery = "";
    if (selectedUDA != null) {
      String toBeReplacedString = query.split("{{")[1].split("}}").first;
      toBeReplacedString = "{{$toBeReplacedString}}";
      resultQuery = query.replaceAll(
          toBeReplacedString, "'${selectedUDA.udaValue}'" ?? "");
    }
    return resultQuery;
  } else
    return query;
}

determineQueryOfCalculatedFieldUDA(uda, udas) {
//   List udasValues = [];
//   List udasNames = [];
//   String calculatedUdaQuery;
//   var splittedByOp;
//   var calculatedUdaEquation;
//   if (uda.calulatedUda != null) {
//     calculatedUdaQuery = uda.calulatedUda
//         .replaceAll("\"", "")
//         .replaceAll("\"", "")
//         .replaceAll('{{uda.', '{')
//         .replaceAll('}}', '}');
//     splittedByOp = calculatedUdaQuery.split(new RegExp(r'[+-/*]'));
//     udasNames.clear();
//     for (int i = 0; i < splittedByOp.length; i++) {
//       if (splittedByOp[i].startsWith('{')) {
//         udasNames.add(splittedByOp[i]);
//       }
//     }
//     if (calculatedUdaQuery != null) {
//       for (int i = 0; i < udasNames.length; i++) {
//         for (int j = 0; j < udas.length; j++) {
//           if (udasNames[i].replaceAll(new RegExp(r'[{}]'), '') ==
//               udas[j].udaName) {
//             if (udas[j].udaType == 9) {
//               calculatedUdaQuery =
//                   calculatedUdaQuery.replaceAll("." + splittedByOp[i + 1], "");
// //              calculatedUdaQuery =
// //                  calculatedUdaQuery.replaceAll("." + splittedByOp[1], "");
//               List<List<GridCols>> gridRowData = [];
//               if (uda.rowData != null) {
//                 uda.rowData.forEach((row) => gridRowData.add(row.columnsList));
//                 gridRowData.forEach((rowColumns) {
//                   if (isNotEmptyList(rowColumns)) {
//                     rowColumns.forEach((row) {
//                       if (splittedByOp[1] ==
//                           row.name.replaceAll(new RegExp(r'[{}]'), '')) {
//                         row.udaValue = (row.udaValue == null ||
//                                 row.udaValue.toString() == '')
//                             ? '0'
//                             : row.udaValue.toString();
//                         udasValues.add(row.udaValue);
//                       }
//                     });
//                   }
//                 });
//               } else
//                 udasValues.add("0");
//             } else {
//               udas[j].udaValue =
//                   (udas[j].udaValue == null || udas[j].udaValue == '')
//                       ? '0'
//                       : udas[j].udaValue;
//               udasValues.add(udas[j].udaValue);
//             }
//           }
//         }
// //        calculatedUdaQuery.substring(0, calculatedUdaQuery.indexOf("."));
//         calculatedUdaEquation = calculatedUdaQuery.replaceAll(
//             '${udasNames[i]}',
//             (udasValues[i] == null || udas[i].udaValue == '')
//                 ? '0'
//                 : udasValues[i]);
//         calculatedUdaQuery = calculatedUdaEquation;
//       }
//     }
//     if (calculatedUdaEquation != null) {
//       var p = Parser();
//       var exp = p.parse(calculatedUdaEquation);
//       ContextModel cm = ContextModel();
//       var eval = exp.evaluate(EvaluationType.REAL, cm);
//       uda.udaValue = eval.toString();
//     }
//   }
}

class UDAsValidation {
  bool isValid;
  String notValidMessage;
}
