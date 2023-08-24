# IP-Tracker
Retrieves detailed information about an IP address using the ipinfo.io API, displaying data like location, timezone, and ISP. Additionally, it opens the default web browser to visualize the approximate location on Google Maps using the retrieved coordinates.

Created by: Akshath Jayakumar

Installation
Requirements: Ensure that you have the following prerequisites installed on your system:

curl command: Used to make HTTP requests and fetch data from the API.
jq command: Used to parse and manipulate JSON data.
Download the Script: Download the Bash script  provided in this repository.

Make the Script Executable: Open your terminal and navigate to the directory where you downloaded the script. Run the following command to make the script executable:

chmod +x ip-tracker.sh
./bash ip-tracker.sh
Usage

Run the Script: Execute the script by running the following command in your terminal:

Enter IP Address: The script will prompt you to enter an IP address for which you want to retrieve information.

View Information: The script will fetch information about the provided IP address using the ipinfo.io API. It will display details like IP address, location, coordinates, postal code, timezone, and ISP.

Google Maps Location: If coordinates are available, the script will open the default web browser and display the approximate location on Google Maps.
