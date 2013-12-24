container = document.getElementById('container')
running=false
a=parseFloat document.getElementById('amin').value
aaux=a
mapa= (a,x) ->
	a*x*(1-x)

toggle=()->
	a=aaux#parseFloat document.getElementById('amin').value
	if running is true
		running=false
		document.getElementById('pause').innerHTML='Play'
	else
		running=true
		document.getElementById('pause').innerHTML='Pause'
		animate()

set_default=()->
	a=parseFloat document.getElementById('amin').value
	aaux=a
	running=false
	document.getElementById('pause').innerHTML='Play'
	Flotr.draw(container, [[0,0],[0,0]], {yaxis:{max:1,min:0},xaxis:{max:1,min:0},legend:{position:'se'},HtmlText: false})#,xaxis:{min:0,max:1}})

cobweb=(a)->
	it=100
	abcissa=(i/100 for i in [0...100])
	#a=parseFloat document.getElementById('a').value
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

animate = () ->
	cobweb(a)
	set_default() if a >= parseFloat(document.getElementById('amax').value)
	a+=parseFloat document.getElementById("apasso").value
	aaux=a
	setTimeout( ->
		animate() if running is true
	,parseInt document.getElementById("tempo").value)
	#as=(0.05*i/4 for i in [0..200])
	#for a in as
		#do (a) ->
			#setTimeout(cobweb(a),100)

Flotr.draw(container, [[0,0],[0,0]], {yaxis:{max:1,min:0},xaxis:{max:1,min:0},legend:{position:'se'},HtmlText: false})#,xaxis:{min:0,max:1}})
