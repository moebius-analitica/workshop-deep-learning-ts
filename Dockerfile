FROM continuumio/miniconda3

RUN apt-get update && apt-get install -y unzip zip python-dev python3-pip

RUN conda install -y \
        numpy \
        scipy \
        pandas \
        scikit-learn \
        matplotlib \
        Cython \
        Tensorflow \
        statsmodels

RUN conda install -y -c conda-forge \
        jupyterlab \
        keras 

RUN pip install pyramid-arima

WORKDIR /home

RUN git clone https://github.com/moebius-analitica/workshop-deep-learning-ts.git

RUN wget https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip && \
unzip -x household_power_consumption.zip -d workshop && \
rm household_power_consumption.zip

EXPOSE 8888

CMD jupyter lab --no-browser --ip=0.0.0.0 --NotebookApp.token='demo' --allow-root --port=8888
