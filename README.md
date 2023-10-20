
# Prueba técnica Mobile (Flutter)
Repositorio original: https://github.com/BsolTechnicalTest/Mobile


#### Se tiene un problema con el Histórico de registros, en el cual al ingresar a la pantalla esta se queda cargando y no se visualizan los datos. Identificar y resolver el problema para que se visualice el histórico de registro. 

Análisis y solución: 
- Identifique que el método encargado de obtener la información del registro histórico no era llamado.
- Mi primera solución fue llamar este método ni bien se creaba el Bloc el problema que encontre era que con esta solución el método era llamado en cada reconstrucción, asi que decidi darle un estado al widget con el fin de llamar el método solo la primera vez que se entra a la página. 

#### Refactorizar el fujo de egresos (expenses) utilizando Clean Architecture.

Análisis y solución: 
- Identifique que este flujo no tenia separada la capa de domain (business logic) y la capa de data (datasource access).
- Separe la lógica en las capas ya mencionadas evitando que la creación de gastos se haga directamente hacia el datasource, sino que se haga a través de una implementación, para que el funcionamiento no dependa del directamente del datasource.
- Realice unas mejoras para que el teclado no haga overflow y mejore el funcionamiento del dialogo de respuesta para que sea capaz de redirigir al home o de limpiar el formulario. 

#### Añadir un nuevo feature en el cual se debe crear un flujo completo que permita registrar ingresos utilizando Clean Architecture con los siguientes datos: 

Análisis y solución: 
- Siguiendo el flujo de expenses se realizo el flujo de incomes aplicando Clean Architecture y tomando en cuenta las mejoras realizadas en el punto anterior.

