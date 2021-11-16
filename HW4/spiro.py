'''
Author: Yanpeng Zhuo
Github: https://github.com/zhuoyanpeng
Date: 2021-10-30 09:43:17
LastEditors: Yanpeng Zhuo
Description: file content
'''
import math

f = open("spiro.kml", "w")
f.write("[" + "\n")
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
    f.write("{" + "\n")
    f.write('"loc"' + ":[" + str(centerX+x) + "," + str(centerY+y)+ "]" + "\n")
    f.write("}," + "\n")
f.write("]" + "\n")
f.close()