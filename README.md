
## ESPAÑOL


## 📝 ÍNDICE
- [RETO](#reto)
- [SOLUCIÓN](#solucion)
- [USO](#uso)
- [EXPANSIÓN](#expansion)
- [ALTERNATIVA](#alternativa)
- [CONCLUSIÓN](#conclusion)
- [AUTOR](#autor)

## 🧐 RETO <a name = "reto"></a>

Para éste reto deberás realizar las siguientes actividades:

- Crea un Repositorio en el presente proyecto.

- Elije al menos un recurso de Azure entre Key Vault, Storage Account, Service Bus y crea el respectivo ARM template para desplegar el recurso en nuestra 
suscripción de Azure en un RG que contenga tu nombre.

- Crea un Script (en el lenguaje de tu preferencia Powershell/Bash/Phyton) para obtener el connection String al recurso(s) elegido(s).

- Crea un pipeline para desplegar el recurso y ejecutar el Script.

## ⛏️ SOLUCIÓN <a name = "solucion"></a>

En este reto decidí usar Microsoft Bicep para crear nuestras ARM templates ya que este nos ofrece código más legible, modularidad y facilidad al trabajar con outputs. En nuestro repositorio encontrara un directorio llamado `resources`, dentro de este hay 3 sub-directorios (`keyVault`, `seviceBus`, `storageAccount`) que contienen los recursos exigidos por el reto. En cada archivo de Bicep se define el recurso y el `Connection String` se expone como output. Los archivos mencionados anteriormente son luego invocados por `main.bicep` ubicado en nuestro directorio `root`. Finalmente `main.bicep` es desplegado por nuestro Azure Pipeline y los `Connection String` son expuestos en nuestro Pipeline con un script de PowerShell (inline).

- NOTA: `main.bicep` creara su propio Resource Group de Azure con `<MI NOMBRE>`.

- NOTA: Puede crear un ARM template con el comando `az bicep build '--file ./main.bicep'`.

## 🚀 USO <a name = "uso"></a>

Para usar este Pipeline de Azure solo debe crear un `Service Connection` con `<SU  SUSCRIPCION DE AZURE>`.

`Project Settings` > `Service connection` > `New service connection`

Use los siguientes valores:

```
Connection Type: "Azure Resource Manager"
Authentication Method: "Service principal"
Scope Level: "Subscription"
Subscription: "<SU  SUSCRIPCION DE AZURE>"
Resource group: "Ninguno" (vacio)
Service connection name: "MassimilianoDH-ARMServiceConnection"  <---- IMPORTANTE: DEBE SER IGUAL, DE LO CONTRARIO NUESTRO PIPELINE NO FUNCIONARA
Security: "Grant access permission to all pipelines"
```

Luego de de crear nuestro `Service Connection` solo hace falta agregar nuestro Azure Pipeline (`pipeline.yaml`) a nuestro projecto.

## 🎈 EXPANSIÓN <a name = "expansion"></a>

Este repositorio es expandible y los modulos (resources) son reusables. Para agregar más recursos solo agregelos dentro del directorio `resources` e invóquelos en `main.bicep`, los outputs deden ser mapeados. Para reusar los modulos solo invóquelos nuevamente dentro de `main.bicep`, recuerde cambiar el nombre del recurso.

## 🎉 ALTERNATIVA <a name = "alternativa"></a>

También me tome la libertad de agregar un equivalente en Hashicorp Terraform de los recursos exigidos en el reto y una CI de Terraform (pipeline) hecha con Github Actions. Los archivos de Terraform los puede encontrar en el directorio llamado `terraform` y la CI de Terraform en mi perfil del Github.

- [CI de Terraform](https://github.com/MassimilianoDH/terraform-push)

## 🏁 CONCLUSIÓN <a name = "conclusion"></a>

Espero que les guste mi solución a este reto.

## ✍️ AUTOR <a name = "autor"></a>

- [@MassimilianoDH](https://github.com/MassimilianoDH) - Idea & Trabajo Inicial


## ENGLISH


## 📝 INDEX
- [CHALLENGE](#challenge)
- [SOLUTION](#solution)
- [USAGE](#usage)
- [EXPANSION](#expansion)
- [ALTERNATIVE](#alternative)
- [CONCLUSION](#conclusion)
- [AUTHOR](#author)

## 🧐 CHALLENGE <a name = "challenge"></a>

For this challenge you must perform the following activities:

- Create a Repository in this project.

- Choose at least one Azure resource between Key Vault, Storage Account, Service Bus and create the respective ARM template to deploy the resource in our Azure subscription in an RG that contains your name.

- Create a Script (in the language of your preference Powershell/Bash/Phyton) to obtain the connection String to the chosen resource(s).

- Create a pipeline to deploy the resource and execute the Script.

## ⛏️ SOLUTION <a name = "solution"></a>

In this challenge I decided to use Microsoft Bicep to create our ARM templates since it offers us more readable code, modularity and ease when working with outputs. In our repository you will find a directory called `resources`, within this there are 3 sub-directories (`keyVault`, `seviceBus`, `storageAccount`) that contain the resources required by the challenge. In each Bicep file the resource is defined and the `Connection String` is exposed as output. The files mentioned above are then called by `main.bicep` located in our `root` directory. Finally `main.bicep` is deployed by our Azure Pipeline and the `Connection String` are exposed in our Pipeline with a PowerShell script (inline).

- NOTE: `main.bicep` will create its own Azure Resource Group with `<MY NAME>`.

- NOTE: You can create an ARM template with the command `az bicep build '--file ./main.bicep'`.

## 🚀 USAGE <a name = "usage"></a>

To use this Azure Pipeline you just need to create a `Service Connection` with `<YOUR AZURE SUBSCRIPTION>`.

`Project Settings` > `Service connection` > `New service connection`

Use the following values:

```
Connection Type: "Azure Resource Manager"
Authentication Method: "Service principal"
Scope Level: "Subscription"
Subscription: "<YOUR AZURE SUBSCRIPTION>"
Resource group: "None" (empty)
Service connection name: "MassimilianoDH-ARMServiceConnection"  <---- IMPORTANT: MUST BE THE SAME, OTHERWISE OUR PIPELINE WILL NOT WORK
Security: "Grant access permission to all pipelines"
```

After creating our `Service Connection` we just need to add our Azure Pipeline (`pipeline.yaml`) to our project.

## 🎈 EXPANSION <a name = "expansion"></a>

This repository is expandable and the modules (resources) are reusable. To add more resources just add them inside the `resources` directory and call them in `main.bicep`, the outputs should be mapped. To reuse the modules just call them again inside `main.bicep`, remember to change the resource name.

## 🎉 ALTERNATIVE <a name = "alternative"></a>

I also took the liberty of adding a Hashicorp Terraform equivalent of the resources required in the challenge and a Terraform CI (pipeline) made with Github Actions. The Terraform files can be found in the directory called `terraform` and the Terraform CI in my Github profile.

- [CI de Terraform](https://github.com/MassimilianoDH/terraform-push)

## 🏁 CONCLUSION <a name = "conclusion"></a>

I hope you like my solution to this challenge.

## ✍️ AUTHOR <a name = "author"></a>

- [@MassimilianoDH](https://github.com/MassimilianoDH) - Idea & Initial Work
