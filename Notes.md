## Run docker

```bash

# local
docker run --gpus all -it --rm --ipc=host -v /media/hansel/SSD/Code/WeaklySupervidedCapsideDetection/OD-WSCL-Virus/:/OD-WSCL-Virus/ -v /media/hansel/SSD/Data/VirusDetection/VOC2007_Adeno_Small/:/OD-WSCL-Virus/datasets/voc/VOC2007/ -v /media/hansel/SSD/Data/VirusDetection/VOC2007_Adeno_Small/Proposals/:/OD-WSCL-Virus/proposal/SS/voc/ -w /OD-WSCL-Virus/ --name od-wscl-virus xetaiz/hana-odwscl bash


# cluster
docker run --gpus all -it -p 8888:8888 --rm --ipc=host -v /media/hansel/SSD/Code/WeaklySupervidedCapsideDetection/OD-WSCL-Virus/:/OD-WSCL-Virus/ -v /media/hansel/SSD/Data/VirusDetection/VOC2007/:/OD-WSCL-Virus/datasets/voc/VOC2007/ -v /media/hansel/SSD/Data/VirusDetection/VOC2007/Proposals/:/OD-WSCL-Virus/proposal/SS/voc/ -w /OD-WSCL-Virus/ --name od-wscl-virus xetaiz/hana-odwscl80 bash


export WANDB_API_KEY="f9ac711f43521f970835a198be72917607413691"

python -u -m torch.distributed.launch --nproc_per_node=1 tools/train_net.py --config-file "configs/voc/test_vgg.yaml" OUTPUT_DIR OD-WSCL/output/test/ nms 0.1 lmda 0.03 iou 0.5 temp 0.2 SEED 42 SOLVER.BASE_LR 0.02

```