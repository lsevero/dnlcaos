mapa= (a,x) ->
	a*x*(1-x)

bifurcacao= () ->
	it=100
	amin=parseFloat document.getElementById("amin").value
	amax=parseFloat document.getElementById("amax").value
	#x0=parseFloat document.getElementById("x0").value
	x0=0.12345#x0 qualquer
	if amin<1
		alert "amin precisa ser maior ou igual a 1"
		`return 0`
	A=(((amax-amin)*(i/100))+amin for i in [0..100])
	pontos=[]
	data=[{data:pontos,label:"a",points:{show:true}}]
	x=x0
	for a in A
		do (a) ->
			for i in [0...it]
				do (i) ->
					x=mapa(a,x)
			for j in [0...it]
				do (j) ->
					x=mapa(a,x)
					pontos.push([a,x])
	graph = Flotr.draw(container, data, {yaxis:{max:1,min:0},xaxis:{max:amax,min:amin}})#,xaxis:{min:0,max:1}})
bifurcacao()
