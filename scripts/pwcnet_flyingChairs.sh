#!/bin/bash

# experiments and datasets meta
EXPERIMENTS_HOME="experiments"

# datasets
FLYINGCHAIRS_HOME=/home/luoleyouluole/res/public_data/FlyingChairs_release/data

# model and checkpoint
MODEL=PWCNet
EVAL_LOSS=MultiScaleEPE_PWC
CHECKPOINT=None
SIZE_OF_BATCH=8

# save path
TIME=$(date +"%Y%m%d-%H%M%S")
SAVE_PATH="$EXPERIMENTS_HOME/$MODEL-$TIME"

# training configuration
python /home/luoleyouluole/irr/main.py \
--batch_size=$SIZE_OF_BATCH \
--batch_size_val=$SIZE_OF_BATCH \
--checkpoint=$CHECKPOINT \
--lr_scheduler=MultiStepLR \
--lr_scheduler_gamma=0.5 \
--lr_scheduler_milestones="[108, 144, 180]" \
--model=$MODEL \
--num_workers=4 \
--optimizer=Adam \
--optimizer_lr=1e-4 \
--optimizer_weight_decay=4e-4 \
--save=$SAVE_PATH \
--total_epochs=216 \
--training_augmentation=RandomAffineFlow \
--training_dataset=FlyingChairsTrain \
--training_dataset_photometric_augmentations=True \
--training_dataset_root=$FLYINGCHAIRS_HOME \
--training_key=total_loss \
--training_loss=$EVAL_LOSS \
--validation_dataset=FlyingChairsValid  \
--validation_dataset_photometric_augmentations=False \
--validation_dataset_root=$FLYINGCHAIRS_HOME \
--validation_key=epe \
--validation_loss=$EVAL_LOSS
