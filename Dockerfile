FROM nvidia/cuda:12.6.3-cudnn-devel-ubuntu22.04
ARG PYTHON_VERSION=3.12
ARG USER

RUN apt-get update && apt-get install -y --no-install-recommends \
         curl \
         ca-certificates && \
         rm -rf /var/lib/apt/lists/*

# for misc applications
RUN apt-get update && apt-get install -y \
    sudo less emacs tmux git wget cmake zip unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# for carla
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1-mesa-glx \
    vulkan-tools && \
    rm -rf /var/lib/apt/lists/*

# for python
RUN curl -o ./miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    chmod +x ./miniconda.sh && \
    ./miniconda.sh -b -p /opt/conda && \
    rm ./miniconda.sh && \
    /opt/conda/bin/conda install -y python=$PYTHON_VERSION numpy pyyaml scipy ipython mkl mkl-include ninja cython typing && \
    /opt/conda/bin/conda clean -ya
ENV PATH /opt/conda/bin:$PATH

# for useradd
RUN apt-get update && apt-get install -y \
    libuser \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN useradd -m -s /bin/bash ${USER} && \
    usermod -aG sudo ${USER} && \
    mkdir -p /etc/sudoers.d/ && \
    echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/${USER} && \
    chmod 0440 /etc/sudoers.d/${USER}

USER ${USER}
ENV HOME /home/$USER
WORKDIR $HOME

ENV CPATH=/usr/local/cuda/include:$CPATH
ENV LIBRARY_PATH=/usr/local/cuda/lib64:$LIBRARY_PATH
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
