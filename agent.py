import serial, os, google.generativeai as genai

# Leer la clave de forma segura desde el archivo local
try:
    with open(os.path.expandvars("%APPDATA%\\KoganeIA\\api.key"), "r") as f:
        genai.configure(api_key=f.read().strip())
except:
    pass # Manejo de error básico

# Puerto serie (lo ajustaremos cuando lo pruebes)
ser = serial.Serial('COM3', 115200)

while True:
    if ser.in_waiting > 0:
        data = ser.readline().decode().strip()
        if data == "TRIGGER_IA":
            # Aquí irá la lógica de Gemini más adelante
            print("IA Activada")

