# plotUlog

plotUlog is  matlab.m script package for plotting ULog files parsed and converted by pyulog. ULog is a self-describing logging format which is documented  [here](http://dev.px4.io/advanced-ulog-file-format.html).


Please note **plotUlog** is tested under MATLAB version R2017b on macos mojave.

## Installation




- Install **pyulog** which will parse ULog file and convert to .csv files.

**pyulog** can be downloaded from [here](https://github.com/PX4/pyulog)
or visit https://github.com/PX4/pyulog

- clone plotulog git or download and unzip package in any folder.

## File name


Depending on the version of px4 firmware, ULog file can have different names. 

In 1.8.0, ULog files are created as

**/log/yyyy-mm-dd/hh_mm_ss.ulg**

For convenience, change the .ulg file as 

**log###.ulg**

## Run plotUlog

Launch matlab and go to the folder you just cloned or unzipped.

Copy a ULog file into the folder.

In matlab terminal, enter

```bash
plotUlog("log###.ulg","Description")
```
Description can be any of your choice for identifying the foldr.

**plotUlog** will call **pyulog** to create .csv files under **###_Description/** folder and start generating plots. 

Once .csv files are created you can re-plot by entering the folder created from above.

```bash
plotUlog("###_Description/")
```

## Run compareSensorLogs

Once Ulog files successfully converted to csv file, you can compare two different sensor data each other by calling compareSensorLogs as below
If you have csv files under "001_log" and "002_log", enter 
```bash
compareSensorLogs("001_log/","002_log/")
```

and you will get these plots which makes easier for comparing two different sensor data at the same time.

![plotted sensor comparison](https://image.ibb.co/fkHWoe/sensor_Compare.png)

## Development


See what's inside the script file and manipulate any of data you want. 


