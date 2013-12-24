container = document.getElementById('container')
#x0=0.12345
#x0=parseFloat(prompt('x0='))
#y0=parseFloat(x0)+0.005
mapa = (x) -> if 0<x<1 then 4*x*(1-x) else alert('Coloque um número entre 0 e 1 e recarregue a página')
cobweb = ->
	dados1=[]
	dados2=[]
	x=parseFloat document.getElementById('x0').value
	y=parseFloat document.getElementById('y0').value
	data = [{data:dados1,label:'x0='+x.toString()},{data:dados2,label:'y0='+y.toString()}]
	for i in [0..100]
		do (i) ->
			dados1.push [i,mapa(x)]
			dados2.push [i,mapa(y)]
			y = mapa y
			x = mapa x
	#alert dados
	document.getElementById('x0').innerHTML="x0 = "+x0
	document.getElementById('y0').innerHTML="y0 = "+y0
	graph = Flotr.draw(container, data, {yaxis:{max:1,min:0},legend:{position:'se'},HtmlText: false})#,xaxis:{min:0,max:1}})
cobweb()
