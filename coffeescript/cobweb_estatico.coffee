container = document.getElementById('container')
mapa= (a,x) ->
	a*x*(1-x)
cobweb=()->
	it=100
	abcissa=(i/100 for i in [0...100])
	a=parseFloat document.getElementById('a').value
	x0=parseFloat document.getElementById('x0').value
	bissetriz=[[0,0],[1,1]]
	parabola=[]
	cob=[]
	for i in abcissa
		do (i) ->
			parabola.push([i,mapa(a,i)])
	x=x0
	cob.push([x0,0])
	for i in [0...it]
		do (i) ->
			cob.push([x,mapa(a,x)])
			x=mapa(a,x)
			cob.push([x,x])
	data=[{data:bissetriz},{data:parabola},{data:cob},{data:[[x0,0]],label:'x0',points:{show:true}}]
	graph = Flotr.draw(container, data, {yaxis:{max:1,min:0},xaxis:{max:1,min:0},legend:{position:'se'},HtmlText: false})#,xaxis:{min:0,max:1}})
cobweb()
