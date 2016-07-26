# Practica-TDD-iOS
Practica TDD para el Master KeepCoding

**Michel Barbou Salvador**

'Práctica Realizada en Swift'

- Realizado todo el seguimiento de la clse TDD Online pero adaptandola a Swift.

- Implementado todos los tests de la clase Wallet que contienen las funciones que se usan para el Data source y el delegate de la tabla.

- Implementado en la tabla la división por secciones segun sus divisas y una última para el total, en cada sección la ultima celda indica el subtotal para esa currency ya reducida a la taza indicada.

- Implementado el borrar los moneys de la tabla, através del botón para editar.

- Implementado el poder añadir un nuevo money desde la tabla, en este caso cada vez que pulsamos el botón para añadir, agregamos al modelo 10 Euros. Como mejora tendríamos que mostrarle una alerta al usuario en el que pueda intorducir la divisa y la cantidad, para añadirla al modelo.


#Mejoras 

- Como posibles mejoras para más adelante podríamos hacer que las divisas fueran un enum, y las podríamos cargar de un archivo Json con todos sus ISO codes.

- Implementar una forma para obtener las tazas de conversión y que las mismas sean lo más actuales posibles.

- Implementar que el usuario pueda cambiar el tipo de divisa al cual quiere obtener el Total de la tabla.