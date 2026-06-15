FROM runpod/worker-comfyui:5.2.0-base

# Custom nodes (detajleri)
RUN comfy-node-install comfyui-impact-pack comfyui-impact-subpack

# Diffusion model, text encoder, VAE
RUN comfy model download --url "https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/diffusion_models/z_image_turbo_bf16.safetensors" --relative-path models/diffusion_models --filename z_image_turbo_bf16.safetensors
RUN comfy model download --url "https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors" --relative-path models/text_encoders --filename qwen_3_4b.safetensors
RUN comfy model download --url "https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/vae/ae.safetensors" --relative-path models/vae --filename ae.safetensors

# Detectors (Impact Subpack / ultralytics)
RUN comfy model download --url "https://huggingface.co/ashllay/YOLO_Models/resolve/main/bbox/face_yolov8m.pt" --relative-path models/ultralytics/bbox --filename face_yolov8m.pt
RUN comfy model download --url "https://huggingface.co/ashllay/YOLO_Models/resolve/main/bbox/Eyes.pt" --relative-path models/ultralytics/bbox --filename Eyes.pt
RUN comfy model download --url "https://huggingface.co/ashllay/YOLO_Models/resolve/main/bbox/female_breast-v4.2.pt" --relative-path models/ultralytics/bbox --filename female_breast-v4.2.pt
RUN comfy model download --url "https://huggingface.co/ashllay/YOLO_Models/resolve/main/bbox/vagina-v3.2.pt" --relative-path models/ultralytics/bbox --filename vagina-v3.2.pt

# SAM model
RUN comfy model download --url "https://dl.fbaipublicfiles.com/segment_anything/sam_vit_b_01ec64.pth" --relative-path models/sams --filename sam_vit_b_01ec64.pth

# LoRA
RUN comfy model download --url "https://huggingface.co/Jankode/woman123/resolve/main/Woman123_000002900.safetensors" --relative-path models/loras --filename Woman123_000002900.safetensors
