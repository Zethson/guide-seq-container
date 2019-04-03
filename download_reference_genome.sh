FILE=Homo_sapiens_assembly19.fasta 
if [ -f $FILE ]; then
   echo "File $FILE exists."
else
   echo "File $FILE does not exist."
   echo "Downloading $FILE ..."
   wget http://www.broadinstitute.org/ftp/pub/seq/references/Homo_sapiens_assembly19.fasta
fi

