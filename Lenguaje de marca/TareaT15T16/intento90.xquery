<html>
  <head>
    <title>Gormitis Legendarios</title>
    <style>
      body&#123;
        font-family: Verdana;
        margin-top: 80px;
        position: relative;&#125;

      table&#123;
        width: 850px;
        margin: 15px auto;
        border-collapse: collapse;
        box-shadow: 10px 10px 10px gray;
        position: relative;
        z-index: 2;
        background-color: rgba(255, 255, 255, 0.9);&#125;

      td&#123;
        border: solid 1px black;
        text-align: center;
        padding: 5px;&#125;

      th&#123;
        border: solid 1px black;
        background-color: #404040;
        color: white;
        text-align: center;
        font-size: 20px;&#125;

      tr&#123;
        height: 50px;&#125;

      tr:nth-child(odd)&#123;
        background-color: #d2e87e;&#125;

      #gormiti&#123;
        width: 150px;
        position: fixed;
        bottom: 20px;
        right: 40px;
        z-index: 3;&#125;

      #mapa&#123;
        position: fixed;
        top: 0;
        left: 0;
        z-index: 0;
        width: 100%;
        height: 100%;
        opacity: 0.2;&#125;
    </style>
  </head>

  <body>
    <img id="mapa" src="mapa_gormiti.jpg" alt="Mapa Gormiti"/>

    <table class="tg">
      <thead>
        <tr>
          <th colspan="8">
            <span style="font-weight: bold;"> Tabla de Gormitis </span>
          </th>
        </tr>
        <tr>
          <th>#</th>
          <th>Nombre</th>
          <th>Tribu</th>
          <th>Poder</th>
          <th>Batalla</th>
          <th>Ataque: Magia</th>
          <th>Defensa: Magia</th>
          <th>Estadisticas Prom</th>
        </tr>
      </thead>
      <tbody>
        {
          for $g at $i in doc("gotmitis3.xml")//gormiti
          let $vel_prom := (xs:integer($g/estadisticas_ataque/velocidad) + xs:integer($g/estadisticas_defensa/velocidad)) div 2
          return
            <tr>
              <td>{$i}</td>
              <td>{$g/nombre/text()}</td>
              <td>{$g/tribu/text()}</td>
              <td>{$g/poderes/poder/text()}</td>
              <td>{$g/batallas/batalla/text()}</td>
              <td>{$g/estadisticas_ataque/magia/text()}</td>
              <td>{$g/estadisticas_defensa/magia/text()}</td>
              <td>{format-number($vel_prom, "#.00")}</td>
            </tr>
        }
      </tbody>
    </table>
  </body>
</html>
