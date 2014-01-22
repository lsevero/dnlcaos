window.onload = ->
	height=width=600
	Crafty.init(width,height)
	Crafty.canvas.init(width,height)
	Crafty.sprite(300,300,"images/preto300.png", {preto:[0,0]})
	Crafty.sprite(10,10,"images/azul10.png", {azul:[0,0]})
	Crafty.sprite(10,10,"images/vermelho10.png", {vermelho:[0,0]})
	Crafty.c("Preto",{
		init: ->
			@requires("2D, Canvas, Collision, preto")
			@attr({x:(width/2)-(300/2),y:(height/2)-(300/2),w:300,h:300})
			@addComponent('preto').origin("center")
		})
	Crafty.c("Vermelho",{
		init: ->
			@requires("2D, Canvas, Collision, vermelho")
			@attr({x:45,y:40,w:10,h:10,v:(new Crafty.math.Vector2D(2,2)),ponto:[]})
			@addComponent('vermelho').origin("center")
		})
	Crafty.c("Azul",{
		init: ->
			@requires("2D, Canvas, Collision, azul")
			@attr({x:55,y:40,w:10,h:10,v:(new Crafty.math.Vector2D(2,2)),ponto:[]})
			@addComponent('azul').origin("center")
		})
	Crafty.pause()
	Crafty.e("Preto")
		.collision(new Crafty.polygon([[299.0, 149.0], [297.0, 168.0], [294.0, 187.0], [288.0, 205.0], [279.0, 222.0], [269.0, 238.0], [256.0, 253.0], [242.0, 266.0], [226.0, 277.0], [209.0, 286.0], [191.0, 292.0], [172.0, 297.0], [153.0, 298.0], [134.0, 298.0], [115.0, 295.0], [97.0, 289.0], [79.0, 281.0], [63.0, 272.0], [48.0, 260.0], [34.0, 246.0], [23.0, 230.0], [13.0, 214.0], [6.0, 196.0], [1.0, 177.0], [-1.0, 158.0], [-1.0, 139.0], [1.0, 120.0], [6.0, 101.0], [13.0, 83.0], [23.0, 67.0], [34.0, 51.0], [48.0, 37.0], [63.0, 25.0], [79.0, 16.0], [97.0, 8.0], [115.0, 2.0], [134.0, -1.0], [153.0, -1.0], [172.0, 0.0], [191.0, 5.0], [209.0, 11.0], [226.0, 20.0], [242.0, 31.0], [256.0, 44.0], [269.0, 59.0], [279.0, 75.0], [288.0, 92.0], [294.0, 110.0], [297.0, 129.0], [299.0, 148.0]]))
	red=Crafty.e("Vermelho")
		.collision(new Crafty.polygon([[9.0, 4.0], [7.0, 7.0], [4.0, 8.0], [1.0, 8.0], [-1.0, 5.0], [-1.0, 2.0], [1.0, -1.0], [4.0, -1.0], [7.0, 0.0], [9.0, 3.0]]))
		.bind("EnterFrame", ->
			@x+=@v.x
			@y+=@v.y
			#5 é o raio das bolas pequenas
			@ponto.push Crafty.e('2D, Canvas, Color').attr({x:red.x+5,y:red.y+5,w:1,h:1}).color('#f00')
		)
		.onHit('barE', ->
			@v.x*=-1
		)
		.onHit('barD', ->
			@v.x*=-1
		)
		.onHit('barC', ->
			@v.y*=-1
		)
		.onHit('barB', ->
			@v.y*=-1
		)
		.onHit('Preto', ->
			#alert @v.toString()
			theta=@v.angleBetween((new Crafty.math.Vector2D(@x-300,@y-300)))
			#alert theta
			novoX=-1*(@v.x*Math.cos(2*theta)-@v.y*Math.sin(2*theta))
			novoY=-1*(@v.x*Math.sin(2*theta)+@v.y*Math.cos(2*theta))
			#alert [novoX,novoY]
			@v.setValues(novoX,novoY)
		)
	blue=Crafty.e("Azul")
		.collision(new Crafty.polygon([[9.0, 4.0], [7.0, 7.0], [4.0, 8.0], [1.0, 8.0], [-1.0, 5.0], [-1.0, 2.0], [1.0, -1.0], [4.0, -1.0], [7.0, 0.0], [9.0, 3.0]]))
		.bind("EnterFrame", ->
			@x+=@v.x
			@y+=@v.y
			#5 é o raio das bolas pequenas
			@ponto.push Crafty.e('2D, Canvas, Color').attr({x:blue.x+5,y:blue.y+5,w:1,h:1}).color('#00f')
		)
		.onHit('barE', ->
			@v.x*=-1
		)
		.onHit('barD', ->
			@v.x*=-1
		)
		.onHit('barC', ->
			@v.y*=-1
		)
		.onHit('barB', ->
			@v.y*=-1
		)
		.onHit('Preto', ->
			#alert @v.toString()
			theta=@v.angleBetween((new Crafty.math.Vector2D(@x-300,@y-300)))
			#alert theta
			novoX=-1*(@v.x*Math.cos(2*theta)-@v.y*Math.sin(2*theta))
			novoY=-1*(@v.x*Math.sin(2*theta)+@v.y*Math.cos(2*theta))
			#alert [novoX,novoY]
			@v.setValues(novoX,novoY)
		)
	Crafty.e("barE, 2D, Canvas, Color")
		.color('rgb(0,0,0)')
		.attr({ x: 0, y: 0, w: 3, h: height })
	Crafty.e("barD, 2D, Canvas, Color")
		.color('rgb(0,0,0)')
		.attr({ x: 597, y: 0, w: 3, h: height })
	Crafty.e("barC, 2D, Canvas, Color")
		.color('rgb(0,0,0)')
		.attr({ x: 0, y: 0, w: width, h: 3 })
	Crafty.e("barB, 2D, Canvas, Color")
		.color('rgb(0,0,0)')
		.attr({ x: 0, y: 597, w: width, h: 3 })
	window.reset = ->
		red.x= parseInt $('#xred').val()
		red.y= parseInt $('#yred').val()
		red.v.setValues(parseInt($('#vxred').val()),parseInt($('#vyred').val()))
		blue.x= parseInt $('#xblue').val()
		blue.y= parseInt $('#yblue').val()
		blue.v.setValues(parseInt($('#vxblue').val()),parseInt($('#vyblue').val()))
		i.destroy() for i in red.ponto
		i.destroy() for i in blue.ponto
		Crafty.init(width,height)
		#Crafty.pause() if false is Crafty.isPaused()
		#Crafty.canvas.init(width,height)
