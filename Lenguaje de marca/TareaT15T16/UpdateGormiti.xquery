(
  
(: Insertar un nuevo Gormiti :)
insert node 
  <gormiti>
    <nombre>Noctis</nombre>
    <tribu>Aire</tribu>
    <estadisticas_ataque>
      <mimetismo>7</mimetismo>
      <magia>9</magia>
      <potencia>5</potencia>
      <velocidad>8</velocidad>
      <psicopoder>6</psicopoder>
    </estadisticas_ataque>
    <estadisticas_defensa>
      <mimetismo>10</mimetismo>
      <magia>14</magia>
      <potencia>4</potencia>
      <velocidad>12</velocidad>
      <psicopoder>5</psicopoder>
    </estadisticas_defensa>
    <poderes>
      <poder>Sombras Cortantes</poder>
    </poderes>
    <batallas>
      <batalla>Ninguna</batalla>
    </batallas>
  </gormiti>
as last into /gormitis,

(: Reemplazar el nombre del último Gormiti :)
replace node //gormiti[last()]/nombre 
with <nombre>Hydros Reforzado</nombre>,

(: Renombrar el campo 'potencia' por 'fuerza_bruta' en las estadísticas de ataque :)
for $x in //gormiti/estadisticas_ataque
return rename node $x/potencia as "fuerza_bruta",

(: Para revertir los cambios :)
for $x in //gormiti/estadisticas_ataque
return rename node $x/fuerza_bruta as "potencia",

(: Eliminar el último Gormiti :)
delete node //gormiti[last()]


)