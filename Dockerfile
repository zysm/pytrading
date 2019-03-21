FROM playniuniu/jupyter-pandas

RUN apk update
RUN apk add musl-dev wget git build-base python3-dev curl openssl python3 py3-lxml openblas libstdc++ libpng freetype make gcc g++ python3-dev openblas-dev libpng-dev freetype-dev musl-dev build-base

# Numpy
RUN pip install cython
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h

# TA-Lib
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
  tar -xvzf ta-lib-0.4.0-src.tar.gz && \
  cd ta-lib/ && \
  ./configure --prefix=/usr && \
  make && \
  make install
RUN git clone https://github.com/mrjbq7/ta-lib.git /ta-lib-py && cd ta-lib-py && python3 setup.py install

VOLUME /opt/
EXPOSE 8888

CMD ["jupyter", "lab", "--allow-root"]
