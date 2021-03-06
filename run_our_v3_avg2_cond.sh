#!/bin/bash
#
#SBATCH --job-name=our_v3_avg2_cifar100
#SBATCH --output=our_v3_avg2_cifar100-%j.txt
#SBATCH --time=2-00:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --gres gpu:1

ml torch/20160805-4bfc2da protobuf/2.6.1
ml CUDA/7.5.18 cuDNN/5.0-CUDA-7.5.18

th main.lua -seqLength 8 -depth 20 -batchSize 128 -dataset cifar100 -nEpochs 120 -netType 'our_v3_avg2' -save 'checkpoints_our_v3_avg2_cond' -resume 'checkpoints_our_v3_avg2' -sequenceOut 'true' -LR 0.05 2>&1 | tee log_our_v3_avg2_cond.txt
