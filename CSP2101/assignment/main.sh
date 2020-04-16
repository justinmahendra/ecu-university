#!/bin/bash
LINK_TO_WEBSITE="https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152"
LINK_TO_GALLERY="https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/"
#Indexing Function
function indexing_website(){
    echo -n "Indexing Website into an Array..."
    #Download .html and save it into temp/index.html
    wget -O temp/index.html -o temp/logfile $LINK_TO_WEBSITE
    #cleaning .html into filenames, example DSC01533 DSC01... 
    temp=$(cat temp/index.html | grep "<img src=" | sed 's/.*\t//' | sed 's/<.*152\///' | sed 's/.jpg.*>//')
    #Change every space into commas, to be processed using IFS later
    temp=$(echo $temp | sed 's/ /,/g')
    #append filenames into indexed array
    IFS=',' read -r -a indexed <<< "$temp"
    echo " Indexing Completed."
    equalSeparator
}
#Downloading Functions
function downloader(){
    #Check if file that is going to be download exists in the folder, if so skip this download
    if [[ $(checkFileExists $1) == "Exists" ]]; then
        echo "Skipping $1... File exists in Downloads folder" >&2
    else
        #Else if file does not exists yet, proceed to download
        echo -n "Downloading $1, with the file name $1.jpg, with a file size of "
        # -o is used to output wget log into temp/logfile and -P is used to specify where the Downloads folder is
        wget -o temp/logfile -P Downloads $LINK_TO_GALLERY$1.jpg
        #Calls logFormatting function
        logFormatting
    fi
}
#Downloader() logFormatting, to get filesize
function logFormatting(){
    #Log formatting takes that wget logfile and cleans it output to desired filesize
    cat temp/logfile | grep "Length:" | sed 's/L.*: //; s/ .*]//' | awk '{ $1/=1000;printf "%.2fkB" ,$1}'
    echo "... File Download Complete"
}
#Tasks Functions
function specificDownload(){
    #Read user input, example DSC01533
    read -p "Enter a specific image name: " value
    #If filename exist in the indexed array, then download
    if [[ $(checkFileName $value) == "1" ]]; then
        equalSeparator
        downloader $value
    else
        #If not, output message
        echo "Filename does not exists in indexed array"
    fi
}
function allDownload(){
    #Download all files inside indexed array, this will loop every index in that array
    for filename in "${indexed[@]}"
    do
        #Sends filename into downloader function
        downloader $filename
    done
}
function rangeDownload(){
    #rangeDownloadModule is used to process user input and returns the desired index depending on users input.
    #temp is used to store temporary index variable, for further use
    tempFirstIndex=$(rangeDownloadModule 1st)
    tempSecondIndex=$(rangeDownloadModule 2nd)
    equalSeparator
    #If second index that was given was greater than first index, swap these numbers and save it into their corresponding placeholders
    if [[ tempSecondIndex -lt tempFirstIndex ]]; then
        echo "Swapping position of Second Filename to First Filename, and First Filename into Second Filename"
        firstIndex=$tempSecondIndex
        secondIndex=$tempFirstIndex
    else
    #If not, keep index in the same placeholders
        firstIndex=$tempFirstIndex
        secondIndex=$tempSecondIndex
    fi
    echo "Program will now download from ${indexed[$firstIndex]} until ${indexed[$secondIndex]}"
    while [ $firstIndex -le $secondIndex ];
    do
        downloader ${indexed[$firstIndex]}
        #Increment firstIndex until it meets secondIndex
        firstIndex=$((firstIndex+1))
    done    
}
function rangeDownloadModule(){
    #While true, until user has inputted the correct file number
    while true
    do
        #Read user input
        #moduleChoice is a placeholder to store users inputted 4 digits
        read -p "Input $1 4 digits of the file name: " moduleChoice
        #Append DSC0 infront of user input
        moduleChoice="DSC0${moduleChoice}"
        #Check if DSC0... is indeed inside the indexed array, if so set moduleIndex as the index where that value is stored, break the loop
        if [[ $(checkFileName $moduleChoice)  == "1" ]]; then
            #Returns function for $moduleChoice
            echo $(getIndex $moduleChoice)
            break
        else
            #echo to stdrr since if we echo this out without going to the screen. it is going to be saved into the variable that called it and cause errors
            echo "Filename does not exists, please try again." >&2
        fi
    done
}
function randomDownload(){
    #Declare chosenNumbers array, this array is used to save index numbers that has been generated, therefore no duplicates would ever be generated
    chosenNumbers=()
    #Start index with 0
    index=0
    while true
    do
        #Ask user for an integer
        read -p "Input an integer between 1 - 75 | Choice: " choice
        #If user input is not integer output message
        if ! [[ "$choice" =~ ^[0-9]+$ ]]
        then
            echo "Sorry integers only"
        #If user input is out of the range, output message
        elif [ $choice -gt 75 ] && [ $choice -lt 0 ]; then
            echo "Input an integer between 1 - 75"
        else
        #Else if users number is in range, break the loop
            break
        fi
    done
    #While index not equals to choice, do this
    equalSeparator
    while [[ $index != $choice ]]
    do
    #Generate random number
    randNumber=$(randomGenerator)
    #if generated number is not inside chosenNumber array, append randomNumber and send that index into downloader function
    if [[ ! " ${chosenNumbers[@]} " =~ " ${randNumber} " ]]; then
        chosenNumbers+=($randNumber)
        downloader ${indexed[randNumber]}
        #Increment index by 1
        index=$((index+1))
    fi
    done
}
#Function to check if Filename exists in indexed array, 1 = Exists and 0 = "Does not exists"
function checkFileName(){
    #When this function is called, it checks if the filename that was supplied exists in the indexed array
    value=$1
    if [[ " ${indexed[@]} " =~ " ${value} " ]]; then
        #If it exists output 1
        echo "1"
    else
        #If it does not exists output 0
        echo "0"
    fi
}
#Function to check if file exists already, if so skip the download
function checkFileExists(){
    if [ -f "Downloads/$1.jpg" ]; then
        echo "Exists"
    fi
}
#Function to get index from indexed array
function getIndex(){
    #Assign local variable to stop clashing from other value, since we used the same variable placeholders
    local value=$1
    local result=''
    #Loop the entire array
    for i in "${!indexed[@]}"; 
    do
        #If filename that was given matches the one inside the indexed array, output the index where that filename exists on
        if [[ "${indexed[$i]}" = "${value}" ]]; then
            result=${i}
        fi
    done
    #Return function
    echo "$result"
}
#Function to generate random number
function randomGenerator() {
    #Calculating difference between maximum and minimum and adding + 1
    min=0
    max=74
    ((diff=max-min+1))
    #Generating a randomNumber between the parameters
    local generatedNumber="$((min + $RANDOM%diff))"
    #Return function
    echo "$generatedNumber"
}
#prints out to the screen ====== to separate text for easy reading
function equalSeparator(){
    printf '=%.0s' {1..35} >&2 && echo '' >&2
}
#Program Description, containing student name and student id
function program_description(){
    #Output Student Name and Student ID to Terminal
    printf '=%.0s' {1..35}
    echo -e '\nStudent Name \t: Justin Mahendra'
    echo -e 'Student ID \t: 10526418'
    printf '=%.0s' {1..35} && echo ''
}
#Menu
function mainmenu(){
    question='Please enter your choice: '
    options=("Specific Thumbnail" "Download All Thumbnails" "Range Download" "Random Download" "Quit")
    select opt in "${options[@]}"
    do
    #Depending on what was the user input either 1 - 4, a program would be launched, if user has inputted 5, program will break the loop
    case $opt in
        "Specific Thumbnail")
            echo "You have chosen Specific Thumbnail" >&2
            equalSeparator
            specificDownload >&2
            equalSeparator
            break
            ;;
        "Download All Thumbnails")
            echo "You have chosen Download All Thumbnails" >&2
            equalSeparator
            allDownload >&2
            equalSeparator
            break
            ;;
        "Range Download")
            echo "You have chosen Range Download" >&2
            equalSeparator
            rangeDownload >&2
            equalSeparator
            break
            ;;
        "Random Download")
            echo "You have chosen Random Download" >&2
            equalSeparator
            randomDownload >&2
            equalSeparator
            break
            ;;
        "Quit")
            echo "Thank You for using this program!" >&2
            equalSeparator
            echo "Exit"
            break
            ;;
        *) echo "invalid option $REPLY" >&2 ;; 
    esac
    done
}
#Main program
function main(){
    #Create temporary folder for saving log file and index.html
    mkdir temp
    #Output program description
    program_description
    #Indexing ECU gallery website, into an array
    indexing_website
    #checkExit is a variable to hold a variable, that may be used if the user entered value 5 in the mainmenu, then it would break the program and exit
    checkExit=''
    while [[ $checkExit != "Exit" ]]
    do
        #Check exit waits for user to input the number 5
        checkExit=$(mainmenu)
    done
    #remove temporary folder
    rm -rf temp
}
main
