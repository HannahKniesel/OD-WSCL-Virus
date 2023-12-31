FROM pytorch/pytorch:1.7.1-cuda11.0-cudnn8-devel
RUN rm /etc/apt/sources.list.d/cuda.list
RUN rm /etc/apt/sources.list.d/nvidia-ml.list
RUN apt-key del 7fa2af80
RUN apt-get update && apt-get install -y --no-install-recommends wget
# ENV TORCH_CUDA_ARCH_LIST="8.0"
ADD installer.sh /reproducability/installer.sh
ADD Dockerfile /reproducability/Dockerfile
WORKDIR /workspace/
RUN  /reproducability/installer.sh
