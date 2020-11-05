echo "Enter the file name"
read file
echo -e "File content:\n"
cat $file 
echo -e "Frecuency of each word\n"
cat $file |tr -s ' ' '\n' |sort |uniq -c


