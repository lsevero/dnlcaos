#!/usr/bin/python
# -*- coding:utf-8 -*-
#/*
#* ----------------------------------------------------------------------------
#* "A LICENÇA BEER-WARE ou A LICENÇA DA CERVEJA" (Revisão 43 em Português Brasil):
#* <lvspais2@gmail.com> escreveu este arquivo. Enquanto esta nota estiver na coisa você poderá utilizá-la
#* como quiser. Caso nos encontremos algum dia e você me reconheça e ache que esta coisa tem algum
#* valor, você poderá me pagar uma cerveja em retribuição (ou mais de uma), Lucas Severo.
#* ----------------------------------------------------------------------------
#*/

import matplotlib.pyplot as plt
import numpy as np
from os import system

cont=-1

def f(x,a):
	"""função a ser plotada com cobweb"""
	return a*x*(1-x)

def plota(a):
	"""função que gera e salva o plot"""
	global cont
	cont+=1
	fig,ax=0,0
	fig=plt.figure()
	ax=fig.add_subplot(111)
	
	#valor atual
	va = [i/100. for i in xrange(100+1)]
	#valor próximo
	vp=map(f,va,[a for i in range(len(va))])#aplica a função f a todos os valores de va
	
	#plt.hold(True)
	#desenha a parábola
	ax.plot(va,vp,color='#0000ff')
	#desenha a bissetriz
	ax.plot([0,1],[0,1],color='#000000')
	#desenha a trajetória
	
	x=0.12345
	iteracoes=100
	
	resX=[x]
	resY=[0]
	
	for i in xrange(iteracoes):
		resX.append(x)
		resY.append(f(x,a))
		x=f(x,a)
		resX.append(x)
		resY.append(x)
	ax.plot(resX,resY,color='#ff0000')
	ax.text(0.1,0.9,"a="+str(a),color="blue")
	ax.text(0.1,0.8,"x0=0.12345",color="green")
	#ax.annotate('x0=0.12345',xy=(0.12345,0),xytext=(0.1,0.8),arrowprops=dict(facecolor='black',shrink=0.005))
	ax.plot([0.12345],[0],'go')
	if cont<10:
		fig.savefig("cobweb_imagens/image0"+str(cont)+".png",format="png")
	else:
		fig.savefig("cobweb_imagens/image"+str(cont)+".png",format="png")
	#plt.show()

if __name__ == '__main__':
	for a in np.linspace(0.5,4,100):
		plota(a)
#	system("cd ~Dropbox/python/cobweb_imagens/")
	system("ffmpeg -f image2 -r 2 -i ~/Dropbox/python/cobweb_imagens/image%02d.png -vcodec mpeg4 -y ~/Dropbox/python/cobweb_imagens/animação_cobweb_plot.mp4")
