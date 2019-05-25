FROM ubuntu

RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install vim -y
RUN apt-get install git -y

# install python 2
RUN apt-get install python2.7 python-pip -y

# install zlib dev, wget, unzip
RUN apt-get install libz-dev wget unzip
#RUN apt-get install -y liblzma-dev
#RUN apt-get install -y libbz2-dev
#RUN apt-get install -y libncurses5-dev libncursesw5-dev

# RUN apt-get install bwa bedtools -y
RUN pip2 install nose
RUN pip2 install numpy==1.14.1

# Install bwa
RUN git clone https://github.com/lh3/bwa.git
RUN cd bwa && \
    make
ENV PATH /bwa:$PATH      

# Install bedtools
RUN git clone https://github.com/arq5x/bedtools2.git
RUN cd bedtools2 && \
    git checkout tags/v2.25.0 && \
    make
ENV PATH /bedtools2/bin:$PATH

# Copy helper scripts
COPY download_reference_genome.sh /download_reference_genome.sh
COPY download_test_data.sh /download_test_data.sh

# Assign execute rights to the helper scripts
RUN chmod +x download_reference_genome.sh
RUN chmod +x download_test_data.sh

# install guide-seq with dependencies
RUN git clone --recursive -b master https://github.com/aryeelab/guideseq
RUN cd guideseq && pip2 install -r requirements.txt && pip freeze


