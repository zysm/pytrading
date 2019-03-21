# pytrading


```
#Build
docker build -t zysm/pandas-trading:v2 .

#Run
#docker run -it -p 8888:8888 zysm/pandas-trading:v2 /bin/sh
docker run -d --name pandas-trading -p 8888:8888 -v YOU_VOL_FOLDER:/opt zysm/pandas-trading:v2

#Login
git config --global user.email ""
git config --global user.name "zysm"

docker login --username=zysm

#Push

docker push zysm/pandas-trading:v2
```



# Sample :


```
import numpy
import talib

close = numpy.random.random(100)
output = talib.SMA(close)
print(output)
```
