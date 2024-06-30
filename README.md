Для запуска ноутбука необходимо:
1. Скачать датасет и распаковать его в корень репозитория:
    - [скачать](https://drive.google.com/file/d/1hUEME2OEjQKiA2xdpztwYFS3A_TtD_6M/view)
2. собрать докер: 
    - `docker build -t seg .`
3. запустить контейнер: 
    - `docker run --gpus=all -u $(id -u):$(id -g) -it -p 8888:8888 -p 6006:6006 -v "$PWD":/tf seg`
4. перейти по url, который напечатается в терминале 