#!/usr/bin/python
# -*- coding:utf-8 -*-

import numpy as np

#GERADOR POLIGONO BOLA GRANDE
#ans,ans2=[],[]
#for i in np.linspace(0,2*np.pi,50):
	#ans.append([np.floor(np.cos(i)*150+148),np.floor(np.sin(i)*150+148)])
#print ans
#for i in np.linspace(0,2*np.pi,50):
	#ans2.append([np.floor(np.cos(i)*5+4),np.floor(np.sin(i)*5+4)])
#print ans2
ans,ans2=[],[]
for i in np.linspace(0,2*np.pi,25):
	ans.append([np.floor(np.cos(i)*75+75),np.floor(np.sin(i)*75+75)])
print ans
#[[300.0, 150.0], [0.0, 150.0], [300.0, 149.0]]
