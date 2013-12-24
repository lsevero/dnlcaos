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

a=4
def f(x):
	"""função a ser plotada com cobweb"""
	return a*x*(1-x)

#valor atual
va = [i/100. for i in xrange(100+1)]
#valor próximo
vp=map(f,va)#aplica a função f a todos os valores de va

plt.hold(True)
#desenha a parábola
plt.plot(va,vp,color='#0000ff')
#desenha a bissetriz
plt.plot([0,1],[0,1],color='#000000')
#desenha a trajetória

x=0.12345
iteracoes=100

resX=[x]
resY=[0]

for i in xrange(iteracoes):
	resX.append(x)
	resY.append(f(x))
	x=f(x)
	resX.append(x)
	resY.append(x)

plt.plot(resX,resY,color='#ff0000')
plt.show()
