# tfm-azure-functions-node

This is a custom terraform module defining the configuration for an Azure function app running nodejs functions.

## resources

The module creates the following resources in Azure:
- [application insights](https://docs.microsoft.com/en-us/azure/azure-monitor/app/app-insights-overview)
  - allows logging from function app/resources
- [app service plan](https://docs.microsoft.com/en-us/azure/app-service/overview-hosting-plans)
  - scale and size of compute for the function app
- [function app (windows)](https://docs.microsoft.com/en-us/azure/azure-functions/functions-overview)
  - function app config
- [storage account](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-overview)
  - storage account used to host the function app's code
