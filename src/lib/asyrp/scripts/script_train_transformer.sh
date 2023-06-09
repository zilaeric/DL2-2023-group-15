#!/bin/bash

sh_file_name="script_train.sh"
gpu="0"

config="celeba.yml" # if you use other dataset, config/path_config.py should be matched
guid="goblin" # guid should be in utils/text_dic.py
CUDA_VISIBLE_DEVICES=$gpu

python main.py  --run_train                     \
                --config $config                \
                --exp ../../runs/$guid          \
                --edit_attr $guid               \
                --do_train 1                    \
                --do_test 0                     \
                --bs_train 9                    \
                --bs_test 9                     \
                --lr_training 1e-04             \
                --n_train_img 1000              \
                --accumulation_steps 1          \
                --n_test_img 50                 \
                --n_inv_step 40                 \
                --n_train_step 40               \
                --n_test_step 40                \
                --get_h_num 1                   \
                --train_delta_block             \
                --sh_file_name $sh_file_name    \
                --n_iter 5                      \
                --save_x0                       \
                --use_x0_tensor                 \
                --save_x_origin                 \
                --clip_loss_w 0.8               \
                --l1_loss_w 3.0                 \
                --use_transformer
                # --load_random_noise             \
                # --user_defined_t_edit 513       \
                # --user_defined_t_addnoise 167   \


