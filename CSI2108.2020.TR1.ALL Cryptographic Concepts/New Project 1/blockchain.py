from hashlib import sha256
import time
import json

PATH = "/Users/justinmahendra/PsbAcademy/ECU University/CSI2108.2020.TR1.ALL Cryptographic Concepts/Assignments/Assignment 3/New Project 1/"
FILE_NAME = 'data.json'
finalPath = PATH + FILE_NAME

def read_file():
    with open(finalPath,'r') as f:
        data = f.readlines()
    return data

initial = read_file()
while True:
    current = read_file()
    if initial != current:
        for line in current:
            if line not in initial:
                print(line)
        initial = current

