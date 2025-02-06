#!/usr/bin/env bash

# Step 2: Advanced Directory and File Management
echo "Step 2: Advanced Directory and File Management"
mkdir workspace workspace/docs workspace/logs workspace/data workspace/scripts # Creating directories
cd workspace || exit                                                           # Navigating to workspace dir with failsafe

# Step 3: File Creation and Manipulation
echo -e "\nStep 3: File Creation and Manipulation"
cd docs || exit             # Navigating to docs dir
touch file1 file2 file3     # Creating files
echo "File1 content" >file1 # Adding content through echo since no nano in script
echo "File2 content" >file2
echo "File3 content" >file3
echo "Hello, this was added by a bash script." >welcome.txt
cat file1 file2 file3 >summary.txt                   # Redirecting into summary.txt
head summary.txt                                     # Displaying first 10 lines
tail summary.txt                                     # Displaying last 10 lines
grep "file2" summary.txt >../logs/search_results.txt # Redirecting search results
cp file1 ..                                          # Copying file1 outside of docs dir
mv ../file1 ./file1.bak                              # Moving file1 back to docs as a backup file

# Step 4: File Permissions and Ownership
echo -e "\nStep 4: File Permissions and Ownership"
cd ..                      # Navigating back
chmod 766 -R scripts/      # Giving execution privileges only to the user, could also use: chmod u+x -R scripts/
chown -R "$(whoami)" data/ # Changing owner to user of script
chgrp -R "$(whoami)" data/ # Changing group to user of script
ls -l                      # Checking rights

# Step 5: System Monitoring and Basic Networking
echo -e "\nStep 5: System Monitoring and Basic Networking"
df -h                                     # Checking disk space
du                                        # Checking directory size
ifconfig || echo "ifconfig not installed" # Display network configurations with failsafe
ping -c 3 google.com                      # Ping google 3 times
