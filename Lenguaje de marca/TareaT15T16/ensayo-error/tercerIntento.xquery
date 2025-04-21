xquery version "3.0";

declare function local:add-id-and-color($gormitis as node()) as node()* {
  for $gormiti at $i in $gormitis
  return
    <tr style="background-color:#B7E4B7">  <!-- Color verde clarito -->
      <td>{$i}</td>
      <td><img src="gormiti_image.png"/></td>
      <td>{$gormiti/nombre/text()}</td>
      <td>{$gormiti/tribu/text()}</td>
      <td>{$gormiti/poderes/poder/text()}</td>
      <td>{$gormiti/batallas/batalla/text()}</td>
      <td>{$gormiti/estadisticas_ataque/magia/text()}</td>
      <td>{$gormiti/estadisticas_defensa/magia/text()}</td>
      <td>{format-number(($gormiti/estadisticas_ataque/velocidad + $gormiti/estadisticas_defensa/velocidad) div 2, "#.00")}</td>
    </tr>
};

let $gormitis := doc("gotmitis3.xml")//gormiti
return
  <html>
    <head>
      <title>Gormitis Legendarios</title>
      <style>
        body&#123;
          font-family: Verdana;
          margin-top: 80px;&#125;
        table&#123;
          width: 850px;
          margin: 15px;
          border-collapse: collapse;
          box-shadow: 10px 10px 10px gray;&#125;
        td&#123;
          border: solid 1px black;
          text-align: center;
          padding: 5px;&#125;
        th&#123;
          border: solid 1px black;
          background-color: #404040;
          color: white;
          text-align: center;
          font-size: 1rem;&#125;
        tr&#123;
          height: 50px;&#125;
        tr:nth-child(odd)&#123;
          background-color: #EBF5FF;&#125;
        img&#123;
          width: 50px;
          height: 50px;
          vertical-align: middle;&#125;
      </style>
    </head>
    <body>
      <img id="gormiti" src="gormiti.png"/>
      <table class="tg">
        <thead>
          <tr>
            <th colspan="9">
              <span style="font-weight: bold;">Tabla de Gormitis</span>
            </th>
          </tr>
          <tr>
            <th>#</th>
            <th>Imagen</th>
            <th>Nombre</th>
            <th>Tribu</th>
            <th>Poder</th>
            <th>Batalla</th>
            <th>Ataque: Magia</th>
            <th>Defensa: Magia</th>
            <th>Velocidad</th>
          </tr>
        </thead>
        <tbody>
          { local:add-id-and-color($gormitis) }
        </tbody>
      </table>
    </body>
  </html>
