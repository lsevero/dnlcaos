#!/usr/bin/python
# -*- coding: utf-8 -*-
#/*
#* ----------------------------------------------------------------------------
#* "A LICENÇA BEER-WARE ou A LICENÇA DA CERVEJA" (Revisão 43 em Português Brasil):
#* <lvspais2@gmail.com> escreveu este arquivo. Enquanto esta nota estiver na coisa você poderá utilizá-la
#* como quiser. Caso nos encontremos algum dia e você me reconheça e ache que esta coisa tem algum
#* valor, você poderá me pagar uma cerveja em retribuição (ou mais de uma), Lucas Severo.
#* ----------------------------------------------------------------------------
#*/

import matplotlib.pyplot as plt

def main():
	iteracao,x,y=range(100),[0.12345],[0.123456]#x é um array contendo o x0 e y é um array contendo y0
	for i in iteracao[1:]:#itera sobre a iteração 1 em diante
		x.append(4*x[i-1]*(1-x[i-1]))
		y.append(4*y[i-1]*(1-y[i-1]))
	print 'iteracao: ',iteracao,'\n\nx com x0=',x[0],': ',x,'\n\ny com y0=',y[0],': ',y
	plt.grid(True)
	plt.ylabel("variavel")
	plt.xlabel("iteracao")
	plt.plot(iteracao,x,'b',iteracao,y,'r')
	plt.savefig("teste1.png",format="png")
	plt.show()
	plt.grid(True)
	plt.ylabel("variavel")
	plt.xlabel("iteracao")
	plt.plot(iteracao,x,'bs',iteracao,y,'r^')
	plt.savefig("teste2.png",format="png")
	plt.show()

if __name__ == '__main__':
	main()

