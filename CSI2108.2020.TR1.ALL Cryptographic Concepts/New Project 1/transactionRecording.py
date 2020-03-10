import json
import random
import string
#Path to file
PATH = "/Users/justinmahendra/PsbAcademy/ECU University/CSI2108.2020.TR1.ALL Cryptographic Concepts/Assignments/Assignment 3/New Project 1/"
FILE_NAME = 'data.json'
finalPath = PATH + FILE_NAME

#Random string generator.
def randomGenerator():
    #string.ascii_lowercase only allows lowercase to be generated.
    letters = string.ascii_lowercase
    #generate random characters with length of 8 characters.
    return ''.join(random.choice(letters) for i in range(8))
#Adding transaction into JSON file
def addTransaction():
    data = []
    #Reading .json file and saving it into a list called data.
    with open(finalPath, 'r') as f:
        data = json.load(f)
    #Checking if data has any objects inside. If not, set index to 1.
    if not bool(data):
        print("There is no previous transaction in the file. Starting index : 1")
        index = 1
    else:
    #else index would continue from last transaction
        index = getLastIndex() + 1
    #getting user input and saving it into newTransaction
    newTransaction = getTransaction(index)
    #appending newTransaction into data to be written back to .json file
    data.append(newTransaction)
    #dumping / writing into .json file
    with open(finalPath,'w+') as f:
        json.dump(data, f , indent=4)
#Getting user input
def getTransaction(index):
    print("Index \t:" , index)
    sender = getNonBlankInputs("FROM\t: ")
    recipient = getNonBlankInputs("TO\t: ")
    amount = getValidInteger("AMOUNT\t: ", "Input is not integer")
    #This is .json format for transaction. This format would then be returned into a string and returned to where the function is called.
    transaction = {
        "Index" : index,
        "Sender" : sender,
        "Recipient" : recipient,
        "Amount" : amount
    }
    return transaction
#Getting last index from file.
def getLastIndex():
    #Opens .json file to find the last index of transaction and returns it.
    with open(finalPath,'r') as f:
        finalIndex = json.load(f)
        return finalIndex[len(finalIndex) - 1]["Index"]
#Check if file is in correct JSON List.
def checkFile():
    #Try opening .json file as read mode. If any error occurs, print error.
    try:
        with open(finalPath,'r') as f:
            testData = json.load(f)
    except (json.decoder.JSONDecodeError,FileNotFoundError) as error:
        print("ERROR: " , error)
        quit()
    #If .json file is readable. Check if .json file is in JSON List. Else print error. List = [] & Dictionary = {}
    if(isinstance(testData,list) == True):
        pass
    else:
        print("ERROR: This program only allows JSON List.. File must contain '[' in the begining and ']' at the end")
        quit()
#Yes or No choices       
def choices(message):
    answer = None
    #While user answer is not either (yes or no). Print error message and repromts user to input a valid response.
    while answer not in ("yes", "no"):
        answer = input(message + " Enter yes or no: ")
        if answer == "yes":
            return True
        elif answer == "no":
            return False
        else:
            print("Please enter yes or no.")
#Check if blank inputs were given. If yes, generate a string of characters to fill in
def getNonBlankInputs(message):
    text = input(message)
    #If input that was given contains spaces before and afte text, remove those spaces. If resulting text length = 0. Generate string.
    if len(text.strip()) == 0:
        print("No input was given. Program will generate random string")
        text = randomGenerator()
        print(message + text)
    return text
#Getting valid integer inputs from user. Any string or number below 0 is rejected and prompt to input a valid integer.
def getValidInteger(message,error_message):
    while True:
        try:
            text = int(input(message))
            #If input that was given is a valid integer and above 0, break the loop
            if text > 0:
                break
            else:
                print("Input cannot be 0 or negative numbers")
        except ValueError:
            #If input that was given is not an integer, print error.
            print(error_message)
    return text
#Main Program
def main():   
    checkFile()
    try:
        while True:
            addTransaction()
            if (choices("Do you want to continue adding new transaction?") == False):
                quit()
    except KeyboardInterrupt:
        print("\nInterupt detected. Exiting program")
        quit()

if __name__ == "__main__":
    main()