# FROM tensorflow/tensorflow:2.4.1-gpu-jupyter
FROM tensorflow/tensorflow:2.16.2-gpu-jupyter

RUN pip install --upgrade pip setuptools wheel
RUN pip install albumentations --verbose
RUN pip install -U typing_extensions