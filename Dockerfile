# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# The workflow includes only unknown_registry custom nodes without repository (aux_id) information.
# These could not be automatically resolved and therefore are skipped here. Please provide GitHub repos
# (aux_id) for any of these if you want them cloned into /comfyui/custom_nodes/.
# Could not resolve unknown custom node: GetImageSize
# Could not resolve unknown custom node: ModelSamplingSD3
# Could not resolve unknown custom node: ModelSamplingSD3
# Could not resolve unknown custom node: UNETLoader
# Could not resolve unknown custom node: UNETLoader
# Could not resolve unknown custom node: LoadImage
# Could not resolve unknown custom node: SaveVideo
# Could not resolve unknown custom node: CreateVideo
# Could not resolve unknown custom node: ImageResizeKJv2

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors --relative-path models/clip --filename umt5_xxl_fp8_e4m3fn_scaled.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors --relative-path models/vae --filename wan_2.1_vae.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors --relative-path models/diffusion_models --filename wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors --relative-path models/diffusion_models --filename wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
