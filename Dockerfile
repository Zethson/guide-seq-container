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

# Add sudo
RUN apt-get -y install sudo

# Add user ubuntu with no password, add to sudo group
RUN adduser --disabled-password --gecos '' ubuntu
RUN adduser ubuntu sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER ubuntu
WORKDIR /home/ubuntu/
RUN chmod a+rwx /home/ubuntu/

# Anaconda installing
RUN wget https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
RUN bash Anaconda3-5.0.1-Linux-x86_64.sh -b
RUN rm Anaconda3-5.0.1-Linux-x86_64.sh

# Set path to conda
#ENV PATH /root/anaconda3/bin:$PATH
ENV PATH /home/ubuntu/anaconda3/bin:$PATH

# Updating Anaconda packages
RUN conda update conda
RUN conda update anaconda
RUN conda update --all 

# RUN apt-get install bwa bedtools -y
RUN pip2 install nose
RUN pip2 install numpy==1.14.1

# Install bwa
RUN git clone https://github.com/lh3/bwa.git
RUN cd bwa && \
    git checkout tags/0.7.9a && \
    make
ENV PATH /bwa:$PATH      

# Install bedtools
RUN git clone https://github.com/arq5x/bedtools2.git
RUN cd bedtools2 && \
    git checkout tags/v2.25.0 && \
    make
ENV PATH /bedtools2/bin:$PATH

# Copy helper scripts
COPY download_reference_genome.sh /home/ubuntu/download_reference_genome.sh
COPY download_test_data.sh /home/ubuntu/download_test_data.sh

# Assign execute rights to the helper scripts
USER root
RUN chmod +x download_reference_genome.sh
RUN chmod +x download_test_data.sh

USER ubuntu

# install guide-seq with dependencies
RUN git clone --recursive https://github.com/Zethson/guide_seq_wf
RUN cd guide_seq_wf && git checkout feature/python3
RUN cd guide_seq_wf && pip2 install -r requirements.txt && pip freeze


