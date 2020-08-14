#! /bin/bash

options=$(getopt -o "ho:p" -l "help output: pagesize:" -- "$@") 
[ $? -eq 0 ] || {
     echo "Your Parameter is invalid" #Error for wrong parameter used
     exit 1
}

eval set -- "$options"

while true #If chosen Parameter is true.......
do
    case $1 in

       -h|--help) #Help Page with Instructions and Timer Delays in between
    echo "Welcome to Alexander's RFC2PDF Help Page"
         sleep 0.5
    echo "This Program helps reads RFC as plain text and generates a PDF from it"
         sleep 1
    echo "How To Use?"
         sleep 1
    echo "1. Find the RFC Page Number you would like to ouput as PDF"
         sleep 0.5
    echo "2. Type ./rfc2pdf.sh --output=rfcXX.pdf --pagesize=XX"
         sleep 0.5
    echo "3. Your RFC will be converted to a text file then to a pdf file"
        exit 0
         ;;

        -o|--output) #Parameter for Outputting the file
           shift
            output_file=$1
		echo "Output file: $1"
		;;
   
        -p|--pagesize) #Parameter for Getting HTML and converting it to txt and then pdf
           shift
           urlnumber=$1 #RFC Page Number saved as the variable '$1'
           wget https://www.rfc-editor.org/rfc/rfc$1.txt #Recreates the online HTML site to a txt local file
           ~/text2pdf/text2pdf -A4 rfc$1.txt>rfc$1.pdf #MakeUtility to convert txt file to pdf
           ;;
--)
     shift
     esac
     shift
         
done
