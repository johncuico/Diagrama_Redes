# Diagrama_Redes
<mxfile host="app.diagrams.net">
  <diagram id="red" name="Network">
    <mxGraphModel dx="1100" dy="1100" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1">
      <root>
        <mxCell id="0"/>
        <mxCell id="1" parent="0"/>

        <!-- LAN -->
        <mxCell id="LAN" value="LAN (Kali)" style="ellipse;whiteSpace=wrap;html=1;strokeColor=#0000FF;" vertex="1" parent="1">
          <mxGeometry x="40" y="200" width="160" height="90" as="geometry"/>
        </mxCell>
        <mxCell id="hostLAN" value="10.20.0.10/8" style="shape=rectangle;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="70" y="225" width="100" height="40" as="geometry"/>
        </mxCell>

        <!-- Router + Firewall -->
        <mxCell id="routerFW" value="Router + Firewall (Kali)&#10;eth1: 10.0.0.1&#10;eth0: dhcp&#10;eth2: 20.0.0.1" style="shape=rectangle;rounded=1;whiteSpace=wrap;html=1;strokeColor=#FF0000;" vertex="1" parent="1">
          <mxGeometry x="260" y="190" width="170" height="120" as="geometry"/>
        </mxCell>

        <!-- Conexión LAN -> Router eth1 -->
        <mxCell id="edge_lan_router" edge="1" parent="1" source="LAN" target="routerFW"
          style="endArrow=classic;html=1;strokeColor=#000000;">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <!-- Router WiFi -->
        <mxCell id="routerWifi" value="Router WiFi" style="shape=rectangle;rounded=1;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="500" y="190" width="140" height="80" as="geometry"/>
        </mxCell>

        <!-- Conexión eth0 -> router WiFi -->
        <mxCell id="edge_eth0_wifi" edge="1" parent="1" source="routerFW" target="routerWifi"
          style="endArrow=classic;strokeColor=#00AAFF;">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <!-- Internet -->
        <mxCell id="internet" value="Internet" style="ellipse;whiteSpace=wrap;html=1;strokeColor=#0000FF;" vertex="1" parent="1">
          <mxGeometry x="700" y="180" width="150" height="90" as="geometry"/>
        </mxCell>

        <!-- Conexión WiFi -> Internet -->
        <mxCell id="edge_wifi_internet" edge="1" parent="1" source="routerWifi" target="internet"
          style="endArrow=classic;strokeColor=#0000FF;">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

        <!-- DMZ -->
        <mxCell id="dmz" value="DMZ (Ubuntu)" style="ellipse;whiteSpace=wrap;html=1;strokeColor=#00AA00;" vertex="1" parent="1">
          <mxGeometry x="260" y="360" width="160" height="90" as="geometry"/>
        </mxCell>

        <!-- Servidor -->
        <mxCell id="server" value="Servidores:&#10;DNS&#10;Web&#10;SSH&#10;20.0.0.0/8&#10;20.0.0.20/8"
          style="shape=rectangle;whiteSpace=wrap;html=1;" vertex="1" parent="1">
          <mxGeometry x="300" y="390" width="120" height="120" as="geometry"/>
        </mxCell>

        <!-- Conexión Router eth2 -> DMZ -->
        <mxCell id="edge_router_dmz" edge="1" parent="1" source="routerFW" target="dmz"
          style="endArrow=classic;strokeColor=#00AA00;">
          <mxGeometry relative="1" as="geometry"/>
        </mxCell>

      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
