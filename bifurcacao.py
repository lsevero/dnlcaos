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

def main():
	f=eval("lambda a,x:"+raw_input("digite a função.\nexemplo: 'a*x*(1-x)'\nf(a,x) := "))#criamos uma função anonima 'f' e executamos o texto passado como código
	x0,A,X=0.12345,[],[]
	for a in np.linspace(0,4,1000):#a variando de 0 a 4 dividido em 1000 espaços
		x=x0
		for i in xrange(1000):#iteramos a função até que se chegue relativamente próximo do ponto fixo
			x=f(a,x)
		for i in xrange(100):#adicionamos as coordenas no gráfico
			x=f(a,x)
			A.append(a)
			X.append(x)
	plt.plot(A,X,'b.',markersize=0.5)
	plt.savefig("bifurcação.png",format='png')
	plt.show()

	#print f(4,0.5)

if __name__ == '__main__':
	main()

