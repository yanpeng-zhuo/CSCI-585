'''
Author: Yanpeng Zhuo
Github: https://github.com/zhuoyanpeng
Date: 2021-10-30 09:43:17
LastEditors: Yanpeng Zhuo
Description: file content
'''
import math

f = open("spiro.kml", "w")
f.write("<kml xmlns='http://earth.google.com/kml/2.0'>\n")
f.write("<Document>\n")

R = 0.0008
r = 0.0001
a = 0.0004
x0 = R+r-a
Y = 0
nRev = 16

centerX = -118.28543187173761
centerY = 34.020636737043894

t = 0.0
while(t<math.pi*nRev):
    x = (R+r)*math.cos((r/R)*t) - a*math.cos((1+r/R)*t)
    y = (R+r)*math.sin((r/R)*t) - a*math.sin((1+r/R)*t)
    t+=0.1

    f.write("<Placemark>")
    f.write("<Point>")
    f.write("<coordinates>" + str(centerX+x) + "," + str(centerY+y) + "</coordinates>")
    f.write("</Point>")
    f.write("</Placemark>\n")

f.write("</Document>\n")
f.write("</kml>\n")
f.close()