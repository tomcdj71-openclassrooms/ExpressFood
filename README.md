Projet 4 UML Express Food
> Chaque jour, ExpressFood élabore 2 plats et 2 desserts à son QG avec l'aide de chefs expérimentés. Ces plats sont conditionnés à froid puis transmis à des livreurs à domicile qui "maraudent" ensuite dans les rues en attendant une livraison. Dès qu'un client a commandé, l'un des livreurs (qui possède déjà les plats dans un sac) est missionné pour livrer en moins de 20 minutes.

> Sur son application, ExpressFood propose à ses clients de commander un ou plusieurs plats et desserts. Les frais de livraison sont gratuits. Les plats changent chaque jour.

> Une fois la commande passée, le client a accès à une page lui indiquant si un livreur a pris sa commande et le temps estimé avant livraison.

> ExpressFood a besoin que vous conceviez sa base de données. Il s'agit de stocker notamment :

- La liste des clients
- La liste des différents plats du jour
- La liste des livreurs, avec leur statut (libre, en cours de livraison) et leur position
- La liste des commandes passées
- ...

> Pour structurer votre réflexion vous utiliserez UML et construirez une suite de diagrammes afin de modéliser les besoins de l’application et le diagramme de classe pour modéliser les entités de l'application. Une fois que les diagrammes vous satisferont, vous réaliserez le schéma de base de données MySQL correspondant puis vous remplirez la base avec des premières valeurs fictives.

> Vous veillerez à produire des schémas UML cohérents par rapport au cahier des charges et respectant les standards UML. Vous concevrez ensuite un schéma de base de données SQL adéquat.

`Schémas demandés :`
 -  Diagrammes de cas d’utilisations (création d’une commande, ajout d’un plat du jour, livraison d’une commande)
 - Modèle de données
 - Diagramme de classes
 - Diagrammes de séquences (création d’une commande, ajout d’un plat du jour, livraison d’une commande).


# Diagrams
## Use Case Diagrams
---
> ### Use Case 1 - Order Creation
---
![use_case_1_order_creation](./png/usecases/Use_Case_1_Order_Creation.png)
---
> ### Use Case 2 - Dish Management
---
![use_case_2_dish_management](./png/usecases/Use_Case_2_Dish_Management.png)
---
> ### Use Case 3 - Order Delivery
---
![use_case_3_order_delivery_diagram](./png/usecases/Use_Case_3_Order_Delivery.png)
---
> ### Class Diagram
---
![diagram](./svg/classes.svg)
---
## Sequences Diagrams
---
> ### placeOrder Sequence Diagram
---
![diagram](./svg/sequences/orderCreation.svg)

---
> ### processOrder Sequence Diagram
---
![diagram]()
---
> ## updateStock Sequence Diagram
---
![diagram]()
---
> ### Full Sequence Diagram
---
To see the all the sequences in the same diagram, please click [here]()



