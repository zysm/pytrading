# pytrading


# Run pytrading using play-with-docker
Open up https://labs.play-with-docker.com and type in 
```
docker run -d --name pandas-trading -p 8888:8888 -v YOU_VOL_FOLDER:/opt zysm/pandas-trading:v2
```
Wait till the container get loaded and  run Jupyter by click on 8888 hyperlink on top of play-with-docker site.



# Sample :


```
import numpy
import talib

close = numpy.random.random(100)
output = talib.SMA(close)
print(output)
```


```
%matplotlib inline
import matplotlib.pyplot as plt
plt.plot(output)
```



# List Func

```
import talib

# list of functions
print (talib.get_functions())

# dict of functions by group
print( talib.get_function_groups())
```

 [talib-sample1.ipynb](talib-sample1.ipynb)
 
 
 
 
 

# Build Docker image from begining (Optional)

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

