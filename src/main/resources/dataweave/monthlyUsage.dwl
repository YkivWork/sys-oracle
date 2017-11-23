%dw 1.0
%output application/json
---
{
  LOAD_PA_TXN_INTERFACE_Input: {

    InputParameters: {

      P_EXP_ITEMS: {

        P_EXP_ITEMS_ITEMS: payload.usages map {
          SOURCE_SYSTEM: "XXDS1",
          PROJECT_SOURCE_SYSTEM: "XXSF",
          SOURCE_PROJECT_NUMBER: $.sfdcProjectId,

          SOURCE_LINE_ID: $.lineId,
          SOURCE_ITEM: $.usageBillingType,

          EXPENDITURE_ORG_ID: $.expenditureId,
          TRANSACTION_DATE: $.transactionDate,

          //I thought about only accepting a number for this field, but decided that the caller might know more about
          //how they want it formatted.
          QUANTITY: $.quantity
        }
      }
    }
  }
}

