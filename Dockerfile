FROM alpine:latest
LABEL maintainer="test@gmail.com"

ENV PACKAGES curl openssl python3 py3-lxml openblas libstdc++ libpng freetype
ENV BUILD_ESSENTIAL make gcc g++ python3-dev openblas-dev libpng-dev freetype-dev
ENV PIP_PACKAGE scipy matplotlib openpyxl xlrd pandas pandas-datareader scikit-learn seaborn bokeh statsmodels jupyterlab

COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py


RUN apk update
RUN apk add musl-dev wget git build-base
# Numpy
RUN pip install cython
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
RUN pip install numpy 


RUN apk add --no-cache --update ${PACKAGES} ${BUILD_ESSENTIAL} \
    && pip3 --no-cache-dir install -U pip \
        && pip3 --no-cache-dir install numpy \
            && pip3 --no-cache-dir install ${PIP_PACKAGE} 


            # TA-Lib
            RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
              tar -xvzf ta-lib-0.4.0-src.tar.gz && \
                cd ta-lib/ && \
                  ./configure --prefix=/usr && \
                    make && \
                      make install
                      RUN git clone https://github.com/mrjbq7/ta-lib.git /ta-lib-py && cd ta-lib-py && python setup.py install
                       
                        
                        VOLUME /opt/
                        EXPOSE 8888

                        CMD ["jupyter", "lab", "--allow-root"]

