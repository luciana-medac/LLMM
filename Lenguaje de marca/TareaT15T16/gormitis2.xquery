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
        background-color: rgb(114, 183, 46);&#125;

      td&#123;
        border: solid 1px black;
        text-align: center;
        padding: 5px;&#125;

      th&#123;
        border: solid 1px black;
        background-color: #c5c691;
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
        <th colspan="14">
          <span style="font-weight: bold;"> Tabla Completa de Gormitis </span>
        </th>
      </tr>
      <tr>
        <th>#</th>
        <th>Nombre</th>
        <th>Tribu</th>
        <th>Poder</th>
        <th>Batalla</th>
        <th>Atk: Mimetismo</th>
        <th>Atk: Magia</th>
        <th>Atk: Potencia</th>
        <th>Atk: Velocidad</th>
        <th>Atk: Psicopoder</th>
        <th>Def: Mimetismo</th>
        <th>Def: Magia</th>
        <th>Def: Potencia</th>
        <th>Def: Velocidad</th>
        <th>Def: Psicopoder</th>
        <th>Media Total</th>
      </tr>
    </thead>
    <tbody>
      {
        for $g at $i in doc("gotmitis3.xml")//gormiti
        let $atk := $g/estadisticas_ataque
        let $def := $g/estadisticas_defensa
        let $sum := sum(($atk/mimetismo, $atk/magia, $atk/potencia, $atk/velocidad, $atk/psicopoder,
                         $def/mimetismo, $def/magia, $def/potencia, $def/velocidad, $def/psicopoder))
        let $media := $sum div 10
        return
          <tr>
            <td>{$i}</td>
            <td>{$g/nombre/text()}</td>
            <td>{$g/tribu/text()}</td>
            <td>{$g/poderes/poder/text()}</td>
            <td>{$g/batallas/batalla/text()}</td>
            <td>{$atk/mimetismo/text()}</td>
            <td>{$atk/magia/text()}</td>
            <td>{$atk/potencia/text()}</td>
            <td>{$atk/velocidad/text()}</td>
            <td>{$atk/psicopoder/text()}</td>
            <td>{$def/mimetismo/text()}</td>
            <td>{$def/magia/text()}</td>
            <td>{$def/potencia/text()}</td>
            <td>{$def/velocidad/text()}</td>
            <td>{$def/psicopoder/text()}</td>
            <td>{format-number($media, "#.00")}</td>
          </tr>
      }
    </tbody>
  </table>

  <!-- TABLA DE BATALLAS -->
  <table class="tg">
    <thead>
      <tr>
        <th colspan="3">
          <span style="font-weight: bold;"> Participación en Batallas </span>
        </th>
      </tr>
      <tr>
        <th>#</th>
        <th>Gormiti</th>
        <th>Batalla</th>
      </tr>
    </thead>
    <tbody>
      {
        for $g at $i in doc("gotmitis3.xml")//gormiti
        for $bat in $g/batallas/batalla
        return
          <tr>
            <td>{$i}</td>
            <td>{$g/nombre/text()}</td>
            <td>{$bat/text()}</td>
          </tr>
      }
    </tbody>
  </table>
</body>
</html>