// Setting target scope
targetScope = 'subscription'

@description('Resource Group Location')
param location string = 'centralus'

// Creating resource group
resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'massimilianodh-resourcegroup-test1' // CHANGE
  location: location
}

// Deploying storage account using module
module storageAccount './resources/storageAccount/storageAccount.bicep' = {
  name: 'storageDeployment'
  scope: resourceGroup   // Deployed in the scope of resource group we created above
  params: {
    location: location
  }
}

output storageAccountConnectionString string = storageAccount.outputs.storageAccountConnectionString

// Deploying service bus using module
module seviceBus './resources/seviceBus/seviceBus.bicep' = {
  name: 'busDeployment'
  scope: resourceGroup   // Deployed in the scope of resource group we created above
  params: {
    location: location
  }
}

output serviceBusConnectionString string = seviceBus.outputs.serviceBusConnectionString

// Deploying key vault using module
module keyVault './resources/keyVault/keyVault.bicep' = {
  name: 'vaultDeployment'
  scope: resourceGroup   // Deployed in the scope of resource group we created above
  params: {
    location: location
  }
}

output keyVaultConnectionString string = keyVault.outputs.keyVaultConnectionString
