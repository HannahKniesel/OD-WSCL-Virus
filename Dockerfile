FROM pytorch/pytorch:1.7.1-cuda11.0-cudnn8-devel
ENV TORCH_CUDA_ARCH_LIST="8.0"
RUN rm /etc/apt/sources.list.d/cuda.list
RUN rm /etc/apt/sources.list.d/nvidia-ml.list
RUN apt-key del 7fa2af80
RUN apt-get update && apt-get install -y --no-install-recommends wget
RUN apt-get update && apt-get install -y libgl1
RUN apt-get update && apt-get install -y libglib2.0-0
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.0-1_all.deb
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/HannahKniesel/OD-WSCL-Virus.git 
WORKDIR "/workspace/OD-WSCL-Virus"
RUN pip install ninja yacs cython matplotlib tqdm opencv-python tensorboardX pycocotools
RUN git clone --branch 22.04-dev https://github.com/NVIDIA/apex.git
WORKDIR "/workspace/OD-WSCL-Virus/apex"
RUN pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./
WORKDIR "/workspace/OD-WSCL-Virus"
RUN python setup.py build develop 
RUN pip install wandb
RUN pip install git+https://github.com/facebookresearch/fvcore.git
