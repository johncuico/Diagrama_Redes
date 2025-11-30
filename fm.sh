# ================================
#   DEFINICIÓN DE VARIABLES
# ================================

# Rango de direcciones de la LAN
LAN=10.0.0.0/8

# Rango de direcciones de la DMZ
DMZ=20.0.0.0/8


# ================================
#   LIMPIEZA DE REGLAS PREVIAS
# ================================
# Eliminamos todas las reglas y cadenas personalizadas
iptables -F           # Flush de reglas de las cadenas por defecto
iptables -X           # Elimina cadenas definidas por el usuario
iptables -Z           # Pone a cero los contadores
iptables -t nat -F    # Flush en la tabla NAT


# ================================
#   POLÍTICAS POR DEFECTO
# ================================
# Implementamos política de seguridad restrictiva
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP


# ================================
#   PERMITIR TRÁFICO YA ESTABLECIDO
# ================================
# Permite respuestas a conexiones ya iniciadas (importante para NAT)
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT


# ================================
#   LAN → DMZ: SERVICIOS AUTORIZADOS
# ================================

# Permitir HTTP desde LAN hacia el servidor web en la DMZ
iptables -A FORWARD -s $LAN -d $DMZ -p tcp --dport=80 -j ACCEPT

# Permitir consultas DNS desde LAN hacia el servidor DNS de la DMZ
iptables -A FORWARD -s $LAN -d $DMZ -p udp --dport=53 -j ACCEPT

# Permitir SSH desde LAN hacia servidores de la DMZ
iptables -A FORWARD -s $LAN -d $DMZ -p tcp --dport=22 -j ACCEPT


# ================================
#   NAT: MASCARADA PARA SALIDA A INTERNET
# ================================
# Todo el tráfico que salga por eth0 se "enmascara"
# Imprescindible para que LAN y DMZ tengan acceso a Internet
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE


# ================================
#   LAN → INTERNET: TRÁFICO WEB
# ================================

# Permitir HTTP desde LAN hacia Internet
iptables -A FORWARD -s $LAN -p tcp --dport=80 -j ACCEPT

# Permitir HTTPS desde LAN hacia Internet
iptables -A FORWARD -s $LAN -p tcp --dport=443 -j ACCEPT

# Permitir DNS desde la DMZ hacia Internet (para recursión DNS)
iptables -A FORWARD -s $DMZ -p udp --dport=53 -j ACCEPT


# ================================
#   REDIRECCIÓN DE PUERTO (DNAT)
# ================================
# Redirigir peticiones desde Internet (eth0) puerto 80
# hacia el servidor web de la DMZ en 20.0.0.22:80
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT --to-destination 20.0.0.22:80

# Aceptar tráfico redirigido hacia el servidor web
iptables -A FORWARD -d $DMZ -p tcp --dport 80 -j ACCEPT


# ================================
#   PERMITIR TRAFICO ESTABLECIDO (REDUNDANCIA)
# ================================
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

echo "Firewall COMPLETAMENTE CARGADO"
