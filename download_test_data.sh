FILE=guideseq_test_fastq.zip 
if [ -f $FILE ]; then
   echo "File $FILE exists."
else
   echo "File $FILE does not exist."
   echo "downloading..."
   wget http://aryee.mgh.harvard.edu/guideseq/data/guideseq_test_fastq.zip
unzip guideseq_test_fastq.zip
fi

