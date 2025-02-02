# Segmentation + classification
Здесь можно найти два варианта решения задачи:
1. __main.ipynb__:
- В качестве декодера Unet использовалась связка Conv+Upscale
- Ресайз изображений делался просто как cv2.resize(img, target_size)
- Валидационная выборка - 30% от датасета + аугментация валидационной выборки
- Ранняя остановка

2. __main_transpose.ipynb__
- Декодер Unet состоит из Conv2DTranspose
- "Умный ресайз" - картинки вертикальной / горизонтальной ориентации дополняются черными полосами по сторонам, что препятствует черезмерному сжиманию / растягиванию изображений
- Валидационная выборка отсутствует
- Использовался косинусный шедулер для скорости обучения 
- Высокий порог для ранней остановки - крайне переобученная модель 

# результаты
|                  | train_acc | test_acc | train_precision | test_precision | train_recall | test_recall | train_dice_coef | test_dice_coeff |
|------------------|-----------|----------|-----------------|----------------|--------------|-------------|-----------------|-----------------|
| Con2D+Upsampling | 0.89      | 0.73     | __1.0__             | 0.71           | 0.74         | 0.83        | 0.71            | 0.58            |
| Conv2DTranspose  | __0.91__      | __0.84__     | 0.97            | __0.88__           | __0.85__         | 0.83        | __0.78__            | __0.66__            |


# Воспроизведение
Для запуска ноутбука необходимо:
1. Скачать датасет и распаковать его в корень репозитория:
    - [скачать](https://drive.google.com/file/d/1hUEME2OEjQKiA2xdpztwYFS3A_TtD_6M/view)
2. собрать докер: 
    - `docker build -t seg .`
3. запустить контейнер: 
    - `docker run --gpus=all -u $(id -u):$(id -g) -it -p 8888:8888 -p 6006:6006 -v "$PWD":/tf seg`
4. перейти по url, который напечатается в терминале 


