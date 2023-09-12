#!/bin/sh


wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.0-1_all.deb
dpkg -i cuda-keyring_1.0-1_all.deb
apt-get update && apt-get install -y git
# cd ../workspace/

git clone https://github.com/HannahKniesel/OD-WSCL-Virus.git
cd OD-WSCL-Virus/
pip install ninja yacs cython matplotlib tqdm opencv-python tensorboardX pycocotools
git clone --branch 22.04-dev https://github.com/NVIDIA/apex.git
cd apex/
pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./
cd ..

python setup.py build develop
apt install -y libgl1
apt install -y libglib2.0-0
pip install wandb
pip install git+https://github.com/facebookresearch/fvcore.git
#python -m torch.distributed.launch --nproc_per_node=1 tools/train_net.py --config-file "configs/voc/test.yaml" OUTPUT_DIR OD-WSCL/output/test nms 0.1 lmda 0.03 iou 0.5 temp 0.2