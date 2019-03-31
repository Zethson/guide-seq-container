FROM ubuntu

RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install git -y

# install python 2
RUN apt-get install python2.7 python-pip -y

# install zlib dev, wget, unzip
RUN apt-get install libz-dev wget unzip

# install all UMI, BWA and Bedtools
RUN pip2 install umi 
RUN apt-get install bwa bedtools -y

# install guide-seq dependencies
RUN mkdir guide_seq
RUN cd guide_seq && git clone --recursive https://github.com/aryeelab/guideseq.git
RUN cd guide_seq/guideseq && pip2 install -r requirements.txt

# run basic tests
RUN cd guide_seq && cd guideseq && python2 guideseq/guideseq.py all -m test/test_manifest.yaml

