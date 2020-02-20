#!/bin/bash
echo "Creating 'Folder 1' and 'Folder 2'"
mkdir 'Folder 1' 'Folder 2' #Create folders called 'Folder 1' and 'Folder 2'
echo "Creating script1.sh into 'Folder 1'"
touch 'Folder 1'/script1.sh #Create script1.sh into Folder 1
echo "Moving script1.sh from 'Folder 1' to 'Folder 2'"
mv 'Folder 1'/script1.sh 'Folder 2'
