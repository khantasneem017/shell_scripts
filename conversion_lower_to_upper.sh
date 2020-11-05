echo "Enter a file name: "
read f1
echo -e "Initally file content \n"
cat $f1
echo -e "\nChanged file content\n"
cat $f1 | tr "[a-z]" "[A-Z]" 
