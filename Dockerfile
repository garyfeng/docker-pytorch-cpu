FROM continuumio/miniconda3:4.6.14

RUN mkdir /code

WORKDIR /code

COPY ./conda_environment.yml /code/conda_environment.yml

RUN conda env create -f /code/conda_environment.yml && \
    conda clean --all --yes

RUN echo "conda activate pytorch-cpu" >> ~/.bashrc

# # Install libGL
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y

# # install cv2
RUN pip install --upgrade pip setuptools wheel
SHELL ["/bin/bash", "--login", "-c"]
RUN conda activate pytorch-cpu
RUN pip install opencv-python
# The above lines installs openCV in the Conda env. Note the use
# of SHELL command because `conda activate` requires bash but
# by default it uses sh. We need to change the shell to bash.
# Then we activate the right conda env before pip installing.
# Otherwise pip installs to the default python conda env, and
# you get `module not found cv2` error when you try 
# import cv2

# Prep to run code
# For dev we recommend using docker run -v to map your code
# and model, data folders.
# For prod, use this docker image as the base to copy the code.
