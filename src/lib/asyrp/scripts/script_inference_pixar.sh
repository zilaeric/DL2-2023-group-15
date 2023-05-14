#!/bin/bash

sh_file_name="script_inference.sh"
gpu="0"
config="celeba.yml"
guid="pixar"
test_step=50    # if large, it takes long time.
dt_lambda=1.0   # hyperparameter for dt_lambda. This is the method that will appear in the next paper.
CUDA_VISIBLE_DEVICES=$gpu

python main.py  --run_test                                                     \
                --config $config                                               \
                --exp ../../runs/${guid}                                       \
                --edit_attr $guid                                              \
                --do_train 1                                                   \
                --do_test 1                                                    \
                --n_train_img 5                                                \
                --n_test_img 5                                                 \
                --n_iter 5                                                     \
                --bs_train 5                                                   \
                --n_inv_step 50                                                \
                --n_train_step 50                                              \
                --n_test_step $test_step                                       \
                --get_h_num 1                                                  \
                --train_delta_block                                            \
                --sh_file_name $sh_file_name                                   \
                --save_x0                                                      \
                --use_x0_tensor                                                \
                --hs_coeff_delta_h 0.5                                         \
                --dt_lambda $dt_lambda                                         \
                --manual_checkpoint_name "pixar_LC_CelebA_HQ_t999_ninv40_ngen40_0.pth"    \
                --add_noise_from_xt                                            \
                --lpips_addnoise_th 1.2                                        \
                --lpips_edit_th 0.33                                           \
                --save_process_origin                                          \
                --save_x_origin 

                # if you did not compute lpips, use it.
                # --user_defined_t_edit 500                                    \
                # --user_defined_t_addnoise 200                                \

