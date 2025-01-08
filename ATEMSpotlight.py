import customtkinter
import runpy
from threading import Thread
import subprocess
import os

customtkinter.set_appearance_mode("light")

##Fire off commands with keystrokes##


ip = ""
port = ""
def button_callback():
    print("button pressed")
    ip = ipe.get()
    port = porte.get()
    os.environ['ATEMIP'] = ip
    os.environ['ATEMPORT'] = port
    print(os.environ['ATEMIP'])
    print("got the ip", ip)

def darkmodecheck():

    checky = checkbox.get()
    if checky == 1:
        customtkinter.set_appearance_mode("dark")
    else:
        customtkinter.set_appearance_mode("light")

def start_keylogging():
    print("Key logging started...")

    subprocess.run(['./OSCcontroledit.sh'], shell=True)


app = customtkinter.CTk()
app.title("ATEM Remote")
app.geometry("600x350")

ipe = customtkinter.CTkEntry(app, placeholder_text="IP Address")
ipe.grid(pady=20)

porte = customtkinter.CTkEntry(app, placeholder_text="port")
porte.grid(pady=10)

button = customtkinter.CTkButton(app, text="Connect to ATEM", command=button_callback)
button.grid(pady=10)

checkbox = customtkinter.CTkCheckBox(app, command=darkmodecheck, text="Dark Mode")
checkbox.grid()

button = customtkinter.CTkButton(app, text="Start listening", command=lambda: start_keylogging())
button.grid(pady=10)

app.mainloop()
