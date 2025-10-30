#!/usr/bin/bash
output=$(./loganalyzer access.log)
echo "---Testing valid file---"
echo "$output" | grep "Total number of IP addresses: 3" || { echo -e "\e[31mTest failed\e[0m"; exit 1; }
echo "---Testing without a file---"
output=$(./loganalyzer)
echo "$output" | grep "Usage: ./loganalyzer + log file" || { echo -e "\e[31mTest failed\e[0m"; exit 1; }
echo "---Testing non existing file---"
output=$(./loganalyzer non)
echo "$output" | grep "Error: The File non not found" || { echo -e "\e[31mTest failed\e[0m"; exit 1; }
echo "---Testing invalid file---"
output=$(./loganalyzer loganalyzer)
echo "$output" | grep "Error :/ can't find any ips or methods in the file" || { echo -e "\e[31mTest failed\e[0m"; exit 1; }

echo -e "\e[32mAll tests passed!"

