FROM continuumio/miniconda3:4.9.2

COPY environment.yml .
RUN conda env create -f environment.yml && conda clean -a

# Activate the environment
RUN echo "source activate guide_seq" >> ~/.bashrc
ENV PATH /home/user/miniconda/envs/guide_seq/bin:$PATH

# Dump the details of the installed packages to a file for posterity
RUN conda env export --name guide_seq > guide_seq.yml

