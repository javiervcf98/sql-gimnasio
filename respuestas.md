//EJERCICIO A-1//
1.¿Qué columnas no se pueden repetir nunca?
Tanto la clave primaria como la clave alternativa

2.¿Cuál es la clave primaria? ¿Cuáles son claves alternativas?
Es la que identifica cada fila, solo puede haber una por tabla. Mientras que, las claves alternativas son tanto el DNI, email...Se diferencian porque aunque tambien identifican a la fila, pero no es la principal.

3.¿Qué columna apunta a otra tabla? ¿A cuál?
La de la clave ajena, apunta a todas las tablas relacionadas.

4.El DNI ya identifica a cada socio. ¿Por qué crees que usamos un id numérico como clave primaria en vez del DNI? Da al menos una razón.
Porque el id nos sirve para relacionar la clave primaria con la clave alternativa, es decir, si por ejemplo tenemos un id=1 el numero de su DNI empezara por el mismo numero de su id.

//EJERCICIO A-2//

planes – socios--<Muchos/Uno 1:N
socios – tarjetas--<Muchas/Una 1:N
monitores – clases--<Muchas/Una 1:N
socios – clases--<Muchas/Muchos N:M
Monitores – especialidades--<Muchas/Muchos N:M

//EJERCICIO A-3//

1.Un monitor, ¿con cuántas clases se relaciona? → Muchas, porque un monitor puede impartir varias clases.

Una clase, ¿con cuántos monitores se relaciona? → Uno, porque suponemos que cada clase tiene un único monitor asignado.

Por tanto, tenemos una relación 1:N (uno a muchos).

2.¿En qué tabla va la clave ajena? ¿Cómo la llamarías?
La clave ajena va en la tabla de clases, se llamaría "id monitor"

3.¿Qué pasaría si ponemos la clave ajena en el lado equivocado?

| Situación | Tabla | Campos | Explicación |
|---|---|---|---|
| Correcto | CLASES | id_clase (PK), nombre_clase, id_monitor (FK) | Un monitor puede impartir muchas clases, por eso la clave ajena va en CLASES. |
| Incorrecto | MONITORES | id_monitor (PK), nombre, id_clase (FK) | Falla porque un monitor puede impartir varias clases y solo podríamos guardar una clase por monitor. |

4.¿Debe ser NOT NULL? ¿Por qué?
Porque NOT NULL significa que ese campo no puede quedarse vacío.

Si una clase tiene que tener siempre un monitor, no podemos permitir que su identificador esté vacío.

5.¿Qué tabla hay que crear primero?
Primero debemos crear la tabla MONITORES.
Porque la tabla CLASES va a utilizar id_monitor como clave ajena, y ese identificador debe existir previamente en la tabla MONITORES.

//EJERCICIO A-4//

1.¿Qué pasaría si quitásemos UNIQUE de socio_id? Explícalo con un ejemplo de datos.

Si quitamos UNIQUE, un mismo socio podría tener varias tarjetas, porque la base de datos permitiría repetir su identificador.

Ejemplo:

id_tarjeta (PK)

socio_id (FK)

1

10

2

10

3

12

2.Hay dos columnas UNIQUE en tarjetas. ¿Qué evita cada una?

Columnas: //2// id_tarjeta (PK y UNIQUE) y socio_id (FK y UNIQUE)
¿Qué evita?: //2// Evita que dos tarjetas tengan el mismo identificador/Evita que un mismo socio tenga varias tarjetas.

3.Inventa otra relación 1:1 de la vida real (fuera del gimnasio) y di en qué tabla pondrías la clave ajena.

Un ejemplo sería personas y pasaportes.

Una persona tiene un único pasaporte.

Un pasaporte pertenece a una única persona.

Pondría la clave ajena persona_id en la tabla PASAPORTES, porque cada pasaporte pertenece a una persona.

| Tabla PASAPORTES | Campo | Tipo |
|---|---|---|
| PASAPORTES | id_pasaporte | PK |
| PASAPORTES | numero_pasaporte | UNIQUE |
| PASAPORTES | persona_id | FK + UNIQUE |

Así conseguimos que una persona no tenga varios pasaportes registrados en esta relación 1:1.

//EJERCICIO A-5//
1.Un monitor, ¿con cuántas especialidades se relaciona? → Muchas, porque puede tener varias especialidades.
Una especialidad, ¿con cuántos monitores se relaciona? → Muchos, porque varios monitores pueden compartir la misma especialidad.

2.¿Qué tablas necesitas? Ponles nombre.
Tendremos 3 tablas: 1.Monitores 2.Especialidades 3.Monitor_Especialidad (tabla intermedia)

3.Escribe las columnas de cada tabla y marca cuál es PK, cuál UNIQUE y cuál FK.
### Tabla MONITORES

| Campo | Tipo |
|---|---|
| id_monitor | PK |
| nombre | — |

### Tabla ESPECIALIDADES

| Campo | Tipo |
|---|---|
| id_especialidad | PK |
| nombre | — |

### Tabla MONITOR_ESPECIALIDAD

| Campo | Tipo |
|---|---|
| id_monitor | PK + FK |
| id_especialidad | PK + FK |

Las dos claves ajenas forman una clave primaria compuesta.

### Ejemplo de datos

| id_monitor | id_especialidad |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 1 |

4.¿Qué evita el UNIQUE de la tabla intermedia?
El UNIQUE evita que se repita la misma combinación de monitor y especialidad.

5.¿Qué tienen en común reservas y tu tabla intermedia? ¿En qué se diferencian?

Tienen en común:

Ambas relacionan dos tablas mediante claves ajenas.

Ambas permiten conectar información de diferentes tablas.

Se diferencian en:

RESERVAS representa una acción o un registro real (por ejemplo, un socio que reserva una clase).

MONITOR_ESPECIALIDAD sirve para relacionar monitores con sus especialidades.

//EJERCICIO A-6//
1.País – ciudad Muchas/Uno 1:N
La clave ajena va en CIUDAD.
La llamaríamos id_pais.

2.Persona – pasaporte Una/Uno 1:1
La clave ajena va en PASAPORTE.
La llamaríamos id_persona.
Debe llevar UNIQUE para evitar que una persona tenga varios pasaportes registrados.

3.Alumno – asignatura Muchas/muchos N:M
Necesitamos una tabla intermedia llamada ALUMNO_ASIGNATURA.
Tendrá dos claves ajenas: id_alumno e id_asignatura.
Ambas pueden formar una clave primaria compuesta.

4.Cliente – pedido Muchos/Uno 1:N
La clave ajena va en PEDIDO.
La llamaríamos id_cliente.

5.Película – actor Muchos/Muchas N:M
Necesitamos una tabla intermedia llamada PELICULA_ACTOR.
Tendrá id_pelicula e id_actor como claves ajenas.
También añadiremos nombre_personaje, porque un actor puede interpretar personajes diferentes en distintas películas.

6.Autor – libro Muchos/Depende del enunciado N:M o 1:N

7.Furniro: usuario – pedido (User – Order) Muchos/Uno 1:N
La clave ajena va en ORDER.
La llamaríamos user_id

8.Furniro: pedido – producto (Order – Product) Muchos/Muchos N:M
Necesitamos una tabla intermedia llamada ORDER_PRODUCT o ORDER_ITEM.




//EJERCICIO B3//
B3.1 Un socio con un plan que no existe
Prediccion: dara error al poner codigo erroneo
Error: hay 14 numeros de plan_id (del 1 al 14) y se pone el 99
Clave que lo impide: La clave ajena (FOREIGN KEY) de socios.plan_id, que apunta a planes(id). Como no existe ningún plan con id 99, no deja crear un socio apuntando a él.

B3.2 Prediccion: dara error porque el nombre no corresponde con el email o, en este caso, puede duplicarse
Clave que lo impide: la restricción UNIQUE de socios.email. Dos socios no pueden tener el mismo email.

B3.3 Prediccion: fallara porque no pueden tener dos claves iguales, dado a que hay una clave existente
Clave que lo impide: la restricción UNIQUE de tarjetas.socio_id. Cada socio solo puede aparecer una vez en la tabla tarjetas, es decir, solo puede tener una tarjeta.

B3.4 Prediccion: dara error porque la clase UNIQUE establece un unico valor para las reservas tanto para socio_id como para clase_id
Clave que lo impide: la restricción UNIQUE compuesta (socio_id, clase_id) de la tabla reservas. Un mismo socio no puede reservar dos veces la misma clase.

B3.5 Prediccion: dara error porque no se puede reservar en una clase que no existe
Clave que lo impide: la clave ajena de reservas.clase_id, que apunta a clases(id). No se puede reservar una clase que no existe.

B3.6 Prediccion: No existe un plan_id1 en la clave socios, por tanto, dara error por clave ajena que no coincide
Clave que lo impide: la clave ajena socios.plan_id. Luis, Pablo y Diego tienen el plan Básico (plan_id 1). Si se borrara el plan, esos socios quedarían apuntando a un plan que no existe, asi que PostgreSQL no lo permite.

B3.7 Prediccion: Existe esa fila, entonces ahi si que podra eliminar.

B4.11: No es un error. Cada fila es una reserva, y Ana tiene tres reservas, asi que sale una vez por cada clase que ha reservado.

//EJERCICIO B6//
1.¿Qué diferencia hay entre una clave primaria y una clave UNIQUE?
Las dos impiden valores repetidos, pero la clave primaria es el identificador principal de cada fila: solo hay una por tabla y no puede estar vacía. En cambio, puede haber varias UNIQUE en una tabla, como el dni y el email de socios.

2.¿Por qué una clave ajena sí puede repetirse?
Porque varias filas pueden apuntar a la misma fila de otra tabla. Por ejemplo, varios socios tienen el mismo plan_id, porque muchos socios pueden tener el mismo plan.

3.En una relación 1:N, ¿en qué lado va la clave ajena? ¿Por qué no en el otro?
Va en el lado N (el de “muchos”). Por ejemplo, plan_id está en socios. Si la pusiéramos en planes, un plan tendría que guardar varios socios en una sola casilla, y eso no se puede.

4.¿Qué convierte una relación 1:N en una 1:1?
Ponerle UNIQUE a la clave ajena. Así cada valor solo puede aparecer una vez, como socio_id en tarjetas: cada socio solo puede tener una tarjeta.

5.¿Por qué una relación N:M necesita una tabla intermedia?
Porque los dos lados pueden tener muchos del otro, y no cabe en una sola columna de ninguna de las dos tablas. La tabla intermedia guarda una fila por cada pareja.

6.¿Por qué fecha_reserva está en reservas y no en socios ni en clases?
Porque es un dato de la reserva, no del socio ni de la clase. Un socio tiene una fecha distinta para cada clase que reserva, y una clase tiene una fecha distinta para cada socio, así que solo tiene sentido guardarla en la tabla que une a los dos. Basicamente es una relacion logica entre objeto y la circunstancia de ese objeto.