FROM ubuntu

RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install git -y

# install python 2
RUN apt-get install python2.7 python-pip -y

# install zlib dev, wget, unzip
RUN apt-get install libz-dev wget unzip

# install all UMI, BWA and Bedtools
RUN pip2 install umi 
# RUN apt-get install bwa bedtools -y

# Install bwa
RUN git clone https://github.com/lh3/bwa.git
RUN cd bwa && \
    git checkout tags/0.7.9a && \
    make
RUN PATH=`pwd`/bwa:$PATH

# Install bedtools
RUN git clone https://github.com/arq5x/bedtools2.git
RUN cd bedtools2 && \
    git checkout tags/v2.25.0 && \
    make
RUN PATH=`pwd`/bedtools2/bin:$PATH

# Copy helper scripts
COPY download_reference_genome.sh /download_reference_genome.sh
COPY download_test_data.sh /download_test_data.sh

# Assign execute rights to the helper scripts
RUN chmod +x download_reference_genome.sh
RUN chmod +x download_test_data.sh

# install guide-seq dependencies
RUN git clone --recursive https://github.com/aryeelab/guideseq.git
RUN cd guideseq && pip2 install -r requirements.txt

# run basic tests
RUN cd guideseq && python2 guideseq/guideseq.py all -m test/test_manifest.yaml

