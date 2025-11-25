# Proyecto Megatronix — Simulador de Caché Directa
### Sistemas Operativos — Ingeniería de Software (1º)

---

## 📌 Descripción general

Este proyecto implementa un **simulador de memoria caché mapeada de forma directa**, con:

- **8 líneas de caché**
- **16 bytes por bloque**
- **4096 bytes de memoria RAM simulada**

El programa lee direcciones desde un fichero (`accesos_memoria.txt`), determina si cada acceso produce un **HIT** o **MISS**, carga los bloques necesarios desde la RAM y actualiza los contadores de tiempo y fallos.

Además, el simulador reconstruye el texto almacenado en la RAM **leyendo cada carácter desde la caché**, tal y como se pide en el enunciado.

---

## 🧠 Cómo funciona

### 1. Inicialización
- La RAM se carga desde `CONTENTS_RAM.bin`.
- La caché se inicializa con etiquetas inválidas (`0xFF`) y valores de relleno (`0x23`).

### 2. Procesamiento de accesos
Para cada dirección del fichero:
- Se divide en: **Etiqueta**, **Línea**, **Palabra**, **Bloque**.
- Se comprueba si hay **HIT** (misma etiqueta).
- Si hay **MISS**, se copia el bloque completo (16 bytes) desde la RAM a la línea de caché.
- Se lee el byte de la caché correspondiente.
- Si el byte es imprimible, se añade al texto reconstruido; si no, se usa un `.`.

### 3. Contadores
- HIT → tiempo += 1  
- MISS → tiempo += 20  
- Se incrementan los accesos y fallos.

### 4. Salida final
El programa muestra:
- El contenido final de la caché.
- Accesos totales y fallos totales.
- Tiempo total y tiempo medio.
- Texto completo reconstruido.
- Genera `CONTENTS_CACHE.bin`.

---

## 🛠 Cómo compilar

```bash
gcc -o simulador Memsyc.c

