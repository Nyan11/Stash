Class {
	#name : #StashBlocTest,
	#superclass : #TestCase,
	#category : #'Stash-Serializer-test-cases'
}

{ #category : #tests }
StashBlocTest >> testBlElementBackground1 [

	| object source |
	object := BlElement new background: BlTransparentBackground new.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'
]

{ #category : #tests }
StashBlocTest >> testBlElementBackground2 [

	| object source newObject |
	object := BlElement new
		          background: Color red;
		          yourself.
	source := Stash new serialize: object.
		newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: object background paint color equals: newObject background paint color
]

{ #category : #tests }
StashBlocTest >> testBlElementBackground3 [

	| object source newObject |
	object := BlElement new
		          background:
			          (BlBackground paint:
					           (BlLinearGradientPaint horizontal stops: {
								            (0 -> Color red).
								            (1 -> Color blue) }));
		          yourself.
	source := Stash new serialize: object.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject background paint stops equals: {
			(0 -> Color red).
			(1 -> Color blue) }.
]

{ #category : #tests }
StashBlocTest >> testBlElementBackground4 [

	| object source newObject |
	object := BlElement new
		          background:
			          (BlBackground paint:
					           (BlRadialGradientPaint new
			                stops: {
					                (0 -> Color red).
					                (1 -> Color blue) };
			                innerCenter: 100 @ 100;
			                innerRadius: 0;
			                outerCenter: 200 @ 200;
			                outerRadius: 200));
		          yourself.
	source := Stash new serialize: object.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject background paint stops equals: {
			(0 -> Color red).
			(1 -> Color blue) }.
			self assert: newObject background paint innerCenter equals: 100 @ 100.
			self assert: newObject background paint innerRadius equals: 0.
			self assert: newObject background paint outerCenter equals: 200 @ 200.
			self assert: newObject background paint outerRadius equals: 200.
]

{ #category : #tests }
StashBlocTest >> testBlElementBorder1 [

	| object source newObject |
	object := BlElement new border: (BlBorder paint: Color red).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 1.0 g: 0.0 b: 0.0 alpha: 1.0);
               yourself);
         build);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject border paint color equals:  Color red
]

{ #category : #tests }
StashBlocTest >> testBlElementBorder10 [

	| object source newObject |
	object := BlElement new border: (BlBorderBuilder new
			           paint: (BlColorPaint new color: Color red);
			           width: 5;
			           joinMiter;
			           miterLimit: 2.0;
			           build).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 1.0 g: 0.0 b: 0.0 alpha: 1.0);
               yourself);
         width: 5;
         miterLimit: 2.0;
         build);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject border paint color equals: Color red.
	self assert: newObject border width equals: 5.0.
	self assert: newObject border opacity equals: 1.0.
	self assert: newObject border style dashArray equals: #(  ).
	self assert: newObject border style dashOffset equals: 0.0.
	self
		assert: newObject border style lineCap
		equals: BlStrokeLineCap butt.
	self
		assert: newObject border style lineJoin
		equals: BlStrokeLineJoin miter.
	self assert: newObject border style miterLimit equals: 2.0
]

{ #category : #tests }
StashBlocTest >> testBlElementBorder11 [

	| object source newObject |
	object := BlElement new border: (BlBorderBuilder new
			           paint: (BlColorPaint new color: Color red);
			           width: 5;
			           opacity: 0.5;
			           build).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 1.0 g: 0.0 b: 0.0 alpha: 1.0);
               yourself);
         width: 5;
         opacity: 0.5;
         build);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject border paint color equals: Color red.
	self assert: newObject border width equals: 5.0.
	self assert: newObject border opacity equals: 0.5.
	self assert: newObject border style dashArray equals: #(  ).
	self assert: newObject border style dashOffset equals: 0.0.
	self
		assert: newObject border style lineCap
		equals: BlStrokeLineCap butt.
	self
		assert: newObject border style lineJoin
		equals: BlStrokeLineJoin miter.
	self assert: newObject border style miterLimit equals: 4.0
]

{ #category : #tests }
StashBlocTest >> testBlElementBorder12 [

	| object source newObject |
	object := BlElement new border: (BlBorderBuilder new
			           paint: (BlColorPaint new color: Color red);
			           width: 5;
			           dashArray: #( 3.5 4 );
			           build).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 1.0 g: 0.0 b: 0.0 alpha: 1.0);
               yourself);
         width: 5;
         dashArray: {3.5 . 
            4};
         build);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject border paint color equals: Color red.
	self assert: newObject border width equals: 5.0.
	self assert: newObject border opacity equals: 1.0.
	self assert: newObject border style dashArray equals: #( 3.5 4 ).
	self assert: newObject border style dashOffset equals: 0.0.
	self
		assert: newObject border style lineCap
		equals: BlStrokeLineCap butt.
	self
		assert: newObject border style lineJoin
		equals: BlStrokeLineJoin miter.
	self assert: newObject border style miterLimit equals: 4.0
]

{ #category : #tests }
StashBlocTest >> testBlElementBorder13 [

	| object source newObject |
	object := BlElement new border: (BlBorderBuilder new
			           paint: (BlColorPaint new color: Color red);
			           width: 5;
			           dashArray: #( 3.5 4 );
			           dashOffset: 2.0;
			           build).
	source := Stash new serialize: object..
	self assert: source equals: 'BlElement new
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 1.0 g: 0.0 b: 0.0 alpha: 1.0);
               yourself);
         width: 5;
         dashArray: {3.5 . 
            4};
         dashOffset: 2.0;
         build);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject border paint color equals: Color red.
	self assert: newObject border width equals: 5.0.
	self assert: newObject border opacity equals: 1.0.
	self assert: newObject border style dashArray equals: #( 3.5 4 ).
	self assert: newObject border style dashOffset equals: 2.0.
	self
		assert: newObject border style lineCap
		equals: BlStrokeLineCap butt.
	self
		assert: newObject border style lineJoin
		equals: BlStrokeLineJoin miter.
	self assert: newObject border style miterLimit equals: 4.0
]

{ #category : #tests }
StashBlocTest >> testBlElementBorder2 [

	| object source newObject |
	object := BlElement new border: (BlBorder paint: Color red width: 3).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 1.0 g: 0.0 b: 0.0 alpha: 1.0);
               yourself);
         width: 3;
         build);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject border paint color equals: Color red.
	self assert: newObject border width equals: 3.0.
	self assert: newObject border opacity equals: 1.0.
	self assert: newObject border style dashArray equals: #(  ).
	self assert: newObject border style dashOffset equals: 0.0.
	self
		assert: newObject border style lineCap
		equals: BlStrokeLineCap butt.
	self
		assert: newObject border style lineJoin
		equals: BlStrokeLineJoin miter.
	self assert: newObject border style miterLimit equals: 4.0
]

{ #category : #tests }
StashBlocTest >> testBlElementBorder3 [

	| object source newObject |
	object := BlElement new border: (BlBorderBuilder new
			           paint: (BlColorPaint new color: Color red);
			           width: 5;
			           build).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 1.0 g: 0.0 b: 0.0 alpha: 1.0);
               yourself);
         width: 5;
         build);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject border paint color equals: Color red.
	self assert: newObject border width equals: 5.0.
	self assert: newObject border opacity equals: 1.0.
	self assert: newObject border style dashArray equals: #(  ).
	self assert: newObject border style dashOffset equals: 0.0.
	self
		assert: newObject border style lineCap
		equals: BlStrokeLineCap butt.
	self
		assert: newObject border style lineJoin
		equals: BlStrokeLineJoin miter.
	self assert: newObject border style miterLimit equals: 4.0
]

{ #category : #tests }
StashBlocTest >> testBlElementBorder4 [

	| object source newObject |
	object := BlElement new border: (BlBorderBuilder new
			           paint: (BlColorPaint new color: Color red);
			           width: 5;
			           capButt;
			           build).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 1.0 g: 0.0 b: 0.0 alpha: 1.0);
               yourself);
         width: 5;
         build);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject border paint color equals: Color red.
	self assert: newObject border width equals: 5.0.
	self assert: newObject border opacity equals: 1.0.
	self assert: newObject border style dashArray equals: #(  ).
	self assert: newObject border style dashOffset equals: 0.0.
	self
		assert: newObject border style lineCap
		equals: BlStrokeLineCap butt.
	self
		assert: newObject border style lineJoin
		equals: BlStrokeLineJoin miter.
	self assert: newObject border style miterLimit equals: 4.0
]

{ #category : #tests }
StashBlocTest >> testBlElementBorder5 [

	| object source newObject |
	object := BlElement new border: (BlBorderBuilder new
			           paint: (BlColorPaint new color: Color red);
			           width: 5;
			           capRound;
			           build).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 1.0 g: 0.0 b: 0.0 alpha: 1.0);
               yourself);
         width: 5;
         lineCap: BlStrokeLineCap round;
         build);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject border paint color equals: Color red.
	self assert: newObject border width equals: 5.0.
	self assert: newObject border opacity equals: 1.0.
	self assert: newObject border style dashArray equals: #(  ).
	self assert: newObject border style dashOffset equals: 0.0.
	self
		assert: newObject border style lineCap
		equals: BlStrokeLineCap round.
	self
		assert: newObject border style lineJoin
		equals: BlStrokeLineJoin miter.
	self assert: newObject border style miterLimit equals: 4.0
]

{ #category : #tests }
StashBlocTest >> testBlElementBorder6 [

	| object source newObject |
	object := BlElement new border: (BlBorderBuilder new
			           paint: (BlColorPaint new color: Color red);
			           width: 5;
			           capSquare;
			           build).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 1.0 g: 0.0 b: 0.0 alpha: 1.0);
               yourself);
         width: 5;
         lineCap: BlStrokeLineCap square;
         build);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject border paint color equals: Color red.
	self assert: newObject border width equals: 5.0.
	self assert: newObject border opacity equals: 1.0.
	self assert: newObject border style dashArray equals: #(  ).
	self assert: newObject border style dashOffset equals: 0.0.
	self
		assert: newObject border style lineCap
		equals: BlStrokeLineCap square.
	self
		assert: newObject border style lineJoin
		equals: BlStrokeLineJoin miter.
	self assert: newObject border style miterLimit equals: 4.0
]

{ #category : #tests }
StashBlocTest >> testBlElementBorder7 [

	| object source newObject |
	object := BlElement new border: (BlBorderBuilder new
			           paint: (BlColorPaint new color: Color red);
			           width: 5;
			           joinBevel;
			           build).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 1.0 g: 0.0 b: 0.0 alpha: 1.0);
               yourself);
         width: 5;
         lineJoin: BlStrokeLineJoin bevel;
         build);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject border paint color equals: Color red.
	self assert: newObject border width equals: 5.0.
	self assert: newObject border opacity equals: 1.0.
	self assert: newObject border style dashArray equals: #(  ).
	self assert: newObject border style dashOffset equals: 0.0.
	self
		assert: newObject border style lineCap
		equals: BlStrokeLineCap butt.
	self
		assert: newObject border style lineJoin
		equals: BlStrokeLineJoin bevel.
	self assert: newObject border style miterLimit equals: 4.0
]

{ #category : #tests }
StashBlocTest >> testBlElementBorder8 [

	| object source newObject |
	object := BlElement new border: (BlBorderBuilder new
			           paint: (BlColorPaint new color: Color red);
			           width: 5;
			           joinMiter;
			           build).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 1.0 g: 0.0 b: 0.0 alpha: 1.0);
               yourself);
         width: 5;
         build);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject border paint color equals: Color red.
	self assert: newObject border width equals: 5.0.
	self assert: newObject border opacity equals: 1.0.
	self assert: newObject border style dashArray equals: #(  ).
	self assert: newObject border style dashOffset equals: 0.0.
	self
		assert: newObject border style lineCap
		equals: BlStrokeLineCap butt.
	self
		assert: newObject border style lineJoin
		equals: BlStrokeLineJoin miter.
	self assert: newObject border style miterLimit equals: 4.0
]

{ #category : #tests }
StashBlocTest >> testBlElementBorder9 [

	| object source newObject |
	object := BlElement new border: (BlBorderBuilder new
			           paint: (BlColorPaint new color: Color red);
			           width: 5;
			           joinRound;
			           build).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   border: (BlBorderBuilder new
         paint: (BlColorPaint new
               color: (Color r: 1.0 g: 0.0 b: 0.0 alpha: 1.0);
               yourself);
         width: 5;
         lineJoin: BlStrokeLineJoin round;
         build);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject border paint color equals: Color red.
	self assert: newObject border width equals: 5.0.
	self assert: newObject border opacity equals: 1.0.
	self assert: newObject border style dashArray equals: #(  ).
	self assert: newObject border style dashOffset equals: 0.0.
	self
		assert: newObject border style lineCap
		equals: BlStrokeLineCap butt.
	self
		assert: newObject border style lineJoin
		equals: BlStrokeLineJoin round.
	self assert: newObject border style miterLimit equals: 4.0
]

{ #category : #tests }
StashBlocTest >> testBlElementChildren1 [

	| object source |
	object := BlElement new.
	source := Stash new serialize: object.
	self
		assert: source
		equals: 'BlElement new'
]

{ #category : #tests }
StashBlocTest >> testBlElementChildren2 [

	| object source |
	object := BlElement new
		          addChild: BlElement new;
		          yourself.
	source := Stash new serialize: object.
	self
		assert: source
		equals: 'BlElement new
   addChildren: {BlElement new};
   yourself'
]

{ #category : #tests }
StashBlocTest >> testBlElementChildren3 [

	| object source |
	object := BlElement new
		          addChild: BlElement new;
		          addChild: BlElement new;
		          addChild: BlElement new;
		          yourself.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   addChildren: {BlElement new . 
      BlElement new . 
      BlElement new};
   yourself'
]

{ #category : #tests }
StashBlocTest >> testBlElementChildren4 [

	| object source |
	object := BlElement new
		          addChild: BlElement new;
		          addChild: (BlElement new addChild: BlElement new; yourself);
		          addChild: BlElement new;
		          yourself.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   addChildren: {BlElement new . 
      (BlElement new
         addChildren: {BlElement new};
         yourself) . 
      BlElement new};
   yourself'
]

{ #category : #tests }
StashBlocTest >> testBlElementOutskirst1 [

	| object source newObject |
	object := BlElement new outskirts: BlOutskirts inside.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject outskirts class equals: BlOutskirtsInside
]

{ #category : #tests }
StashBlocTest >> testBlElementOutskirst2 [

	| object source newObject |
	object := BlElement new outskirts: BlOutskirts centered.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   outskirts: BlOutskirts centered;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject outskirts class equals: BlOutskirtsCentered
]

{ #category : #tests }
StashBlocTest >> testBlElementOutskirst3 [

	| object source newObject |
	object := BlElement new outskirts: BlOutskirts outside.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   outskirts: BlOutskirts outside;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject outskirts class equals: BlOutskirtsOutside
]

{ #category : #tests }
StashBlocTest >> testBlElementVisibility1 [

	| object source newObject |
	object := BlElement new visibility: BlVisibility visible. 
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject visibility isVisible.
]

{ #category : #tests }
StashBlocTest >> testBlElementVisibility2 [

	| object source newObject |
	object := BlElement new visibility: BlVisibility hidden.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   visibility: BlVisibility hidden;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject visibility isHidden
]

{ #category : #tests }
StashBlocTest >> testBlElementVisibility3 [

	| object source newObject |
	object := BlElement new visibility: BlVisibility gone.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   visibility: BlVisibility gone;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject visibility isGone
]
