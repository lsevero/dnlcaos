window.onload = ->
	`function getMousePos(canvas, evt) {
		var rect = canvas.getBoundingClientRect();
		return {
		x: evt.clientX - rect.left,
		y: evt.clientY - rect.top
		};
	}`
	#linspace = (a,b,n) ->
		#(i*((b-a)/(n-1)) for i in [0...n])
	height=600
	width=1000
	r=75#raio das bolas verdes
	cx=500#centro em x
	cy=300#centro em y
	d=160#distancia entre as bolas
	cxx=375
	cyy=225
	cont=360*4
	frame=0
	passo=3
	particulas=20
	passoframe=3
	posverde1=[525.0, 225.0]
	posverde2=[375.0, 311.6025403784439]
	posverde3=[374.99999999999994, 138.39745962155615]
	endblocos=[]
	endblocos.push([i,j]) for i in [1.3*cx/2...1.3*cx/2 + particulas] for j in [cy-20...cy-20 + particulas]
	blocos=[]
	resultados=[]
	#for i in [(cx/4)...(cx/4)+particulas]
		#do (i) ->
			#for j in [cy...cy+particulas]
				#do (j) ->
					#endblocos.push([i,j])
	window.geraBlocos=()->
		cont=0
		for i in endblocos
			do (i) ->
				blocos.push(Crafty.e("bloco").attr({x:i[0],y:i[1],ponto:i,v:(new Crafty.math.Vector2D(1,(cont/400)-0.5))}))
				cont+=1
		#setInterval(Crafty.e("bloco").attr({x:i[0],y:i[1]}),0.1) for i in endblocos
		#alert i for i in endblocos
	#posverde1=([Math.cos(t1)*d+cxx,Math.sin(t1)*d+cyy] for t1 in linspace(0,2*Math.PI,cont))
	#alert posverde1
	#posverde2=([Math.cos(t2)*d+cxx,Math.sin(t2)*d+cyy] for t2 in linspace((2*Math.PI/3),((2*Math.PI/3)+2*Math.PI),cont))
	#alert linspace((2*Math.PI/3),((2*Math.PI/3)+2*Math.PI),cont)
	#posverde3=([Math.cos(t3)*d+cxx,Math.sin(t3)*d+cyy] for t3 in linspace((4*Math.PI/3),((4*Math.PI/3)+2*Math.PI),cont))
	#alert linspace((4*Math.PI/3),((4*Math.PI/3)+2*Math.PI),cont)
	#trajetoria = (x,y) ->
		#novox=(Math.cos(0.05235)*r)+cx
		#novoy=(Math.sin(0.05235)*r)+cy
		#[novox,novoy]
	Crafty.init(width,height)
	Crafty.canvas.init(width,height)
	can=Crafty.canvas._canvas
	Crafty.pause()
	Crafty.sprite(150,150,"images/verde150.png", {verde:[0,0]})
	Crafty.sprite(10,10,"images/azul10.png", {azul:[0,0]})
	Crafty.sprite(10,10,"images/vermelho10.png", {vermelho:[0,0]})
	Crafty.c("Tela",{
		init: ->
			@requires("2D, Canvas, Mouse")
			@attr({x:0,y:0,w:width,h:height,blocos:[]})
			#@bind("Click", (e)->
				#pos=getMousePos(can,e)
				#@blocos.push Crafty.e("bloco").attr({x:pos.x,y:pos.y})
			#)
	})
	Crafty.c("Verde",{
		init: ->
			@requires("2D, Canvas, Collision, verde, WiredHitBox")
			#@debugPolygon(new Crafty.circle(r,r,r))
			#@drawDebugPolygon()
			@attr({w:150,h:150,rotation:1})
			@addComponent('verde').origin("center")
			@collision(new Crafty.polygon([[150.0, 75.0], [147.44443697168012, 94.411428382689053], [139.9519052838329, 112.5], [128.03300858899107, 128.03300858899107], [112.5, 139.9519052838329], [94.411428382689067, 147.44443697168012], [75.0, 150.0], [55.588571617310954, 147.44443697168012], [37.500000000000014, 139.9519052838329], [21.966991411008941, 128.03300858899107], [10.048094716167114, 112.50000000000003], [2.5555630283198809, 94.411428382689081], [0.0, 75.000000000000014], [2.5555630283198667, 55.588571617310976], [10.048094716167085, 37.500000000000021], [21.966991411008905, 21.966991411008962], [37.499999999999964, 10.048094716167128], [55.58857161731089, 2.5555630283198951], [74.999999999999986, 0.0], [94.411428382689024, 2.5555630283198667], [112.49999999999994, 10.048094716167071], [128.03300858899104, 21.966991411008927], [139.95190528383287, 37.499999999999964], [147.44443697168009, 55.588571617310883], [150.0, 74.999999999999986]]))#new Crafty.circle(r,r,r))
			#@bind("EnterFrame", ->
				#theta=0.01#3 graus
				#novoX=-1*((@x-r)*Math.cos(theta)-(@y-r)*Math.sin(theta))
				#novoY=-1*((@x-r)*Math.sin(theta)+(@y-r)*Math.cos(theta))
				#@x=novoX
				#@y=novoY
				#@x=(Math.cos(theta)*(@x-cx))+cx
				#@y=(Math.sin(theta)*(@y-cy))+cy
				#theta+=0.05235
				#@rotation+=1
				#@trigger("Change")
				#@trigger("Rotate")
				#@trigger("NewHitbox") if @intersect(verde1.x,verde1.y,150,150)
				#@trigger("NewHitbox") if @intersect(verde2.x,verde2.y,150,150)
				#@trigger("NewHitbox") if @intersect(verde3.x,verde3.y,150,150)
				#)
		})
	#Crafty.c("Vermelho",{
		#init: ->
			#@requires("2D, Canvas, Collision, vermelho")
			#@attr({x:45,y:40,w:10,h:10,v:(new Crafty.math.Vector2D(2,2)),ponto:[]})
			#@addComponent('vermelho').origin("center")
		#})
	#Crafty.c("Azul",{
		#init: ->
			#@requires("2D, Canvas, Collision, azul")
			#@attr({x:55,y:40,w:10,h:10,v:(new Crafty.math.Vector2D(2,2)),ponto:[]})
			#@addComponent('azul').origin("center")
		#})
	Crafty.c("bloco",{
		init: ->
			#lista_cor = ['1','2','3','4','5','6','7','8','9','a','b','c','d','e','f']
			@requires("2D, Canvas, Collision, Color")
			@attr({w:1,h:1})#,v:(new Crafty.math.Vector2D(1+Math.random(),Math.random()))#,ponto:[],
				#cor:"#"+lista_cor[Crafty.math.randomInt(0,lista_cor.length-1)]+lista_cor[Crafty.math.randomInt(0,lista_cor.length-1)]+lista_cor[Crafty.math.randomInt(0,lista_cor.length-1)]})
			#})
			#@color(@cor)
			@color("#000")
			@bind("EnterFrame", ->
				@x+=@v.x
				@y+=@v.y
				if (@x>width and @y<cy) or (@x<0 and @y<cy)
					resultados.push(Crafty.e("2D, Canvas, Color").attr({x:@ponto[0],y:@ponto[1],w:3,h:3}).color("#f00"))
				else if (@x>width and @y>=cy) or (@x<0 and @y>=cy)
					resultados.push(Crafty.e("2D, Canvas, Color").attr({x:@ponto[0],y:@ponto[1],w:3,h:3}).color("#00f"))
				@destroy() if @x>width+5 or @x<0-5 or @y>height+5 or @y<0-5
				#2 é o raio das bolas pequenas
				#@ponto.push Crafty.e('2D, Canvas, Color').attr({x:red.x+2,y:red.y+2,w:1,h:1}).color(blocos[blocos.length].color)
			)
			@onHit("verde1", ->
				#alert @v.toString()
				theta=@v.angleBetween((new Crafty.math.Vector2D(@x-verde1.x-r,@y-verde1.y-r)))
				#alert theta
				novoX=-1*(@v.x*Math.cos(2*theta)-@v.y*Math.sin(2*theta))
				novoY=-1*(@v.x*Math.sin(2*theta)+@v.y*Math.cos(2*theta))
				#alert [novoX,novoY]
				@v.setValues(novoX,novoY)
			)
			@onHit("verde2", ->
				#alert @v.toString()
				theta=@v.angleBetween((new Crafty.math.Vector2D(@x-verde2.x-r,@y-verde2.y-r)))
				#alert theta
				novoX=-1*(@v.x*Math.cos(2*theta)-@v.y*Math.sin(2*theta))
				novoY=-1*(@v.x*Math.sin(2*theta)+@v.y*Math.cos(2*theta))
				#alert [novoX,novoY]
				@v.setValues(novoX,novoY)
			)
			@onHit("verde3", ->
				#alert @v.toString()
				theta=@v.angleBetween((new Crafty.math.Vector2D(@x-verde3.x-r,@y-verde3.y-r)))
				#alert theta
				novoX=-1*(@v.x*Math.cos(2*theta)-@v.y*Math.sin(2*theta))
				novoY=-1*(@v.x*Math.sin(2*theta)+@v.y*Math.cos(2*theta))
				#alert [novoX,novoY]
				@v.setValues(novoX,novoY)
			)
	})
	#ctx=Crafty.canvas.context
	#ctx.translate(cx,cy)
	window.tela=Crafty.e("Tela")
	verde1=Crafty.e("Verde, verde1, Collision")
		.attr({x:posverde1[0],y:posverde1[1],i:0})#.attr({x:cx-(r),y:(r)}).origin(r,150)#a origem para cada entidade é relativa, é contada do canto superior esquerdo
		#.bind("EnterFrame", ->
			#frame+=1
			#if frame%passoframe is 0
				#@x=posverde1[@i][0]
				#@y=posverde1[@i][1]
				#@i+=passo
				#@i=0 if @i >= cont
		#)
	verde2=Crafty.e("Verde, verde2, Collision")
		.attr({x:posverde2[0],y:posverde2[1],i:0})#.attr({x:cx-3.1*r,y:height-4*r}).origin(150,-50)
		#.bind("EnterFrame", ->
			#if frame%passoframe is 0
				#@x=posverde2[@i][0]
				#@y=posverde2[@i][1]
				#@i+=passo
				#@i=0 if @i >= cont
		#)
	verde3=Crafty.e("Verde, verde3, Collision")
		.attr({x:posverde3[0],y:posverde3[1],i:0})#.attr({x:cx+1.1*r,y:height-4*r}).origin(-150,-50)
		#.bind("EnterFrame", ->
			#if frame%passoframe is 0
				#@x=posverde3[@i][0]
				#@y=posverde3[@i][1]
				#@i+=passo
				#@i=0 if @i >= cont
		#)
	window.geraBlocos()
	#Crafty.timer.FPS(100)
	#Crafty.pause()
	
	window.reset = ->
		i.destroy() for i in blocos
		i.destroy() for i in resultados
