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
#for i in np.linspace(0,2*np.pi,25):
	#ans.append([np.cos(i)*75+75,np.sin(i)*75+75])
#print ans
#[[300.0, 150.0], [0.0, 150.0], [300.0, 149.0]]

####################################################
#CALCULOS POSIÇÃO BOLAS ESPALHAMENTO 2
##################################################
cx=425#500
cy=225#300
theta=np.linspace(0,2*np.pi,360)#(np.pi/180)#1 grau
r=100#75#DISTANCIA ENTRE AS BOLAS
cont=360
#pos=[[np.cos(t)*r+cx,np.sin(t)*r+cy] for t in theta]
#print pos[0],pos[len(pos)/3],pos[2*len(pos)/3]
#primeira tentativa [575.0, 300.0] [462.12171286391754, 364.73202734069503] [463.26039030302695, 234.61497817302433]
#segunda tentativa [450.0, 200.0] [148.99123430378009, 372.61873957518674] [152.02770747473852, 25.639941794731556]
#terceira tentativa [505.0, 225.0] [234.09211087340208, 380.35686561766806] [236.82493672726469, 68.0759476152584] QUASE BOM
posverde1=[[np.cos(t)*r+cx,np.sin(t)*r+cy] for t in np.linspace(0,2*np.pi,cont)]
posverde2=[[np.cos(t)*r+cx,np.sin(t)*r+cy] for t in np.linspace(2*np.pi/3,(2*np.pi/3)+2*np.pi,cont)]
posverde3=[[np.cos(t)*r+cx,np.sin(t)*r+cy] for t in np.linspace(4*np.pi/3,(4*np.pi/3)+2*np.pi,cont)]
print posverde1[0]
print posverde2[0]
print posverde3[0]

#######################################################
