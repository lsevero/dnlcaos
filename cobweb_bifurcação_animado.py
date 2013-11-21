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


x0=0.12345
cont=-1
frames=200
pasta='/home/lvspais/Dropbox/python/cobweb_bifurcacao_imagens/'
fps='4'
nome_do_video='animação_cobweb_bifurcação'
pontos_bifurcacao=100
a_iter_bifurcacao=1000
def bifurcacao(x0):
	A,X=[],[]
	for a in np.linspace(0,4,a_iter_bifurcacao):#a variando de 0 a 4 dividido em 1000 espaços
		x=x0
		for i in xrange(1000):#iteramos a função até que se chegue relativamente próximo do ponto fixo
			x=f(x,a)
		for i in xrange(pontos_bifurcacao):#adicionamos as coordenas no gráfico
			x=f(x,a)
			A.append(a)
			X.append(x)
	return A,X
		#plt.plot(A,X,'b.',markersize=0.5)

def f(x,a):
	"""função a ser plotada com cobweb"""
	return a*x*(1-x)

def plota(a):
	"""função que gera e salva o plot"""
	global cont,x0,Abi,Xbi,frames
	cont+=1
	fig,cobweb,bi=0,0,0
	fig=plt.figure()
	cobweb=fig.add_subplot(211)
	bi=fig.add_subplot(212)
	#valor atual
	va = [i/100. for i in xrange(100+1)]
	#valor próximo
	vp=map(f,va,[a for i in range(len(va))])#aplica a função f a todos os valores de va
	
	#plt.hold(True)
	#desenha a parábola
	cobweb.plot(va,vp,color='#0000ff')
	#desenha a bissetriz
	cobweb.plot([0,1],[0,1],color='#000000')
	#desenha a trajetória
	
	x=x0
	iteracoes=100
	
	resX=[x]
	resY=[0]
	
	for i in xrange(iteracoes):
		resX.append(x)
		resY.append(f(x,a))
		x=f(x,a)
		resX.append(x)
		resY.append(x)
	cobweb.plot(resX,resY,color='#ff0000')
	cobweb.text(0.03,0.9,"a="+str(a),color="blue")
	cobweb.text(0.03,0.8,"x0=0.12345",color="green")
	cobweb.set_title("cobweb plot")
	#cobweb.annotate('x0=0.12345',xy=(0.12345,0),xytext=(0.1,0.8),arrowprops=dict(facecolor='black',shrink=0.005))
	cobweb.plot([x0],[0],'go')
	#BIFURCAÇÃO
	#Abi,Xbi=bifurcacao(x0,a)
	bi.set_xlim(0,4)
	bi.set_ylim(0,1)
	bi.set_xlabel("a")
	bi.set_ylabel("x")
	bi.set_title(u"diagrama de bifurcação")
	bi.plot(Abi[:cont*pontos_bifurcacao*(a_iter_bifurcacao/frames)],Xbi[:cont*pontos_bifurcacao*(a_iter_bifurcacao/frames)],'bo',markersize=0.5)
	#print len(Abi[:cont*pontos_bifurcacao])
	#print len(Xbi[:cont*pontos_bifurcacao])
	if cont<10:
		fig.savefig(pasta+"image00"+str(cont)+".png",format="png")
	elif 10<=cont<100:
		fig.savefig(pasta+"image0"+str(cont)+".png",format="png")
	else:
		fig.savefig(pasta+"image"+str(cont)+".png",format="png")

if __name__ == '__main__':
	print "montando o array da bifurcação..."
	Abi,Xbi=bifurcacao(x0)
	print 'Abi ',len(Abi)
	print 'Xbi ',len(Xbi)
	print "feito!!\niniciando cobweb plot..."
	for a in np.linspace(0,4,frames):
		plota(a)
		print cont
	print "feito!!!\nmontando a animação...."
	system("ffmpeg -f image2 -r "+fps+" -i "+pasta+"image%03d.png -vcodec mpeg4 -y "+pasta+nome_do_video+".mp4")
