// https://github.com/Azure/azure-quickstart-templates/tree/master/quickstarts/microsoft.keyvault
@description('Specifies the name of the key vault.')
param keyVaultName string = 'keyvault${uniqueString(resourceGroup().id)}'

@description('Specifies the SKU to use for the key vault.')
param keyVaultSku object = {
  name: 'standard'
  family: 'A'
}

@description('Specifies the Azure location where the resources should be created.')
param location string = resourceGroup().location

resource keyVault 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: keyVaultName
  location: location
  properties: {
    enableRbacAuthorization: true
    tenantId: tenant().tenantId
    sku: keyVaultSku
  }
}

// Determine our connection strings

var keyVaultConnectionString = keyVault.properties.vaultUri

// Output our variables

output keyVaultConnectionString string = keyVaultConnectionString
