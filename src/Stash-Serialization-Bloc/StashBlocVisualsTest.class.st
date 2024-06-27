Class {
	#name : 'StashBlocVisualsTest',
	#superclass : 'TestCase',
	#category : 'Stash-Serialization-Bloc-test-cases',
	#package : 'Stash-Serialization-Bloc',
	#tag : 'test-cases'
}

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementBackground1 [

	| object source |
	object := BlElement new background: BlTransparentBackground new.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementBackground2 [

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

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementBackground3 [

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

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementBackground4 [

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

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementBorder1 [

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

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementBorder10 [

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

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementBorder11 [

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

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementBorder12 [

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

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementBorder13 [

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

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementBorder2 [

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

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementBorder3 [

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

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementBorder4 [

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

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementBorder5 [

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

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementBorder6 [

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

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementBorder7 [

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

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementBorder8 [

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

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementBorder9 [

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

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementClipChildren1 [

	| object source newObject |
	object := BlElement new clipChildren: true.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject clipChildren
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementClipChildren2 [

	| object source newObject |
	object := BlElement new clipChildren: false.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   clipChildren: false;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self deny: newObject clipChildren
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementEffect1 [

	| object source newObject |
	object := BlElement new effect: BlNullEffect new.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   effect: BlNullEffect new;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject effect class equals: BlNullEffect
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementEffect2 [

	| object source newObject |
	object := BlElement new effect:
		          (BlGaussianShadowEffect
			           color: Color black
			           width: 5
			           offset: 10 @ 20).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   effect: (BlGaussianShadowEffect color: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 1.0) width: 5 offset: 10 @ 20);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject effect class equals: BlGaussianShadowEffect.
	self assert: newObject effect color equals: Color black.
	self assert: newObject effect width equals: 5.
	self assert: newObject effect offset equals: 10 @ 20
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementEffect3 [

	| object source newObject |
	object := BlElement new effect:
		          (BlSimpleShadowEffect color: Color black offset: 5 @ 41).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   effect: (BlSimpleShadowEffect color: (Color r: 0.0 g: 0.0 b: 0.0 alpha: 1.0) offset: 5 @ 41);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject effect class equals: BlSimpleShadowEffect.
	self assert: newObject effect color equals: Color black.
	self assert: newObject effect offset equals: 5 @ 41
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementElevation1 [

	| object source newObject |
	object := BlElement new zIndex: 1.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   elevation: (BlRelativeElevation elevation: 1);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject elevation elevation equals: 1
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementElevation2 [

	| object source newObject |
	object := BlElement new zIndex: 4.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   elevation: (BlRelativeElevation elevation: 4);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject elevation elevation equals: 4
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementFocusability1 [

	| object source newObject |
	object := BlElement new
		          focusability: BlFocusability after;
		          yourself.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   focusability: BlFocusability after;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject focusability equals: BlFocusability after
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementFocusability2 [

	| object source newObject |
	object := BlElement new
		          focusability: BlFocusability before;
		          yourself.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject focusability equals: BlFocusability before
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementFocusability3 [

	| object source newObject |
	object := BlElement new
		          focusability: BlFocusability block;
		          yourself.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   focusability: BlFocusability block;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject focusability equals: BlFocusability block
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementFocusability4 [

	| object source newObject |
	object := BlElement new
		          focusability: BlFocusability ignore;
		          yourself.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   focusability: BlFocusability ignore;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject focusability equals: BlFocusability ignore
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementFocusability5 [

	| object source newObject |
	object := BlElement new
		          focusability: BlFocusability none;
		          yourself.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   focusability: BlFocusability none;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject focusability equals: BlFocusability none
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementFocused1 [

	| object source newObject |
	object := BlElement new focused: false.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject focused equals: false
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementFocused2 [

	| object source newObject |
	object := BlElement new focused: true.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   focused: true;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject focused equals: true
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementGeometry1 [

	| object source newObject |
	object := BlElement new geometry: (BlRectangleGeometry new).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   geometry: BlRectangleGeometry new;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject geometry equals: BlRectangleGeometry new
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementGeometry10 [

	| object source newObject |
	object := BlElement new geometry:
		          (BlRoundedRectangleGeometry cornerRadii:
			           (BlCornerRadii new
				            topLeft: 1;
				            topRight: 2;
				            bottomRight: 3;
				            bottomLeft: 4;
				            yourself)).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   geometry: (BlRoundedRectangleGeometry cornerRadii: (BlCornerRadii new
               topLeft: 1;
               topRight: 2;
               bottomLeft: 4;
               bottomRight: 3;
               yourself));
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert:
		(newObject geometry isKindOf: BlRoundedRectangleGeometry).
	self assert: newObject geometry cornerRadii topLeft equals: 1.
	self assert: newObject geometry cornerRadii topRight equals: 2.
	self assert: newObject geometry cornerRadii bottomRight equals: 3.
	self assert: newObject geometry cornerRadii bottomLeft equals: 4
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementGeometry11 [

	| object source newObject |
	object := BlElement new geometry: BlTriangleGeometry new beTop.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   geometry: BlTriangleGeometry new beTop;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: (newObject geometry isKindOf: BlTriangleGeometry).
	self assert: newObject geometry isTop
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementGeometry12 [

	| object source newObject |
	object := BlElement new geometry: BlTriangleGeometry new beLeft.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   geometry: BlTriangleGeometry new beLeft;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: (newObject geometry isKindOf: BlTriangleGeometry).
	self assert: newObject geometry isLeft
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementGeometry13 [

	| object source newObject |
	object := BlElement new geometry: BlTriangleGeometry new beRight.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   geometry: BlTriangleGeometry new beRight;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: (newObject geometry isKindOf: BlTriangleGeometry).
	self assert: newObject geometry isRight
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementGeometry14 [

	| object source newObject |
	object := BlElement new geometry: BlTriangleGeometry new beBottom.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   geometry: BlTriangleGeometry new beBottom;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: (newObject geometry isKindOf: BlTriangleGeometry).
	self assert: newObject geometry isBottom
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementGeometry15 [

	| object source newObject |
	object := BlElement new geometry: BlTriangleGeometry new.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   geometry: BlTriangleGeometry new beRight;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: (newObject geometry isKindOf: BlTriangleGeometry).
	self assert: newObject geometry isRight
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementGeometry2 [

	| object source newObject |
	object := BlElement new geometry: (BlAnnulusSectorGeometry new
			           startAngle: 10;
			           endAngle: 50;
			           innerRadius: 0.2;
			           outerRadius: 0.7).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   geometry: (BlAnnulusSectorGeometry new
         startAngle: 10;
         endAngle: 50;
         innerRadius: 0.2;
         outerRadius: 0.7;
         yourself);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject geometry class equals: BlAnnulusSectorGeometry.
	self assert: newObject geometry startAngle equals: 10.
	self assert: newObject geometry endAngle equals: 50.
	self assert: newObject geometry innerRadius equals: 0.2.
	self assert: newObject geometry outerRadius equals: 0.7
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementGeometry3 [

	| object source newObject |
	object := BlElement new geometry:
		          (BlBezierCurveGeometry controlPoints: {
				           (5 @ 0).
				           (20 @ 35).
				           (35 @ 40) }).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   geometry: (BlBezierCurveGeometry new
         controlPoints: {(5 @ 0) . 
            (20 @ 35) . 
            (35 @ 40)};
         yourself);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject geometry class equals: BlBezierCurveGeometry.
	self assert: newObject geometry controlPoints equals: {
				           (5 @ 0).
				           (20 @ 35).
				           (35 @ 40) }
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementGeometry4 [

	| object source newObject |
	object := BlElement new geometry: BlCircleGeometry new.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   geometry: BlCircleGeometry new;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject geometry class equals: BlCircleGeometry
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementGeometry5 [

	| object source newObject |
	object := BlElement new geometry: BlEllipseGeometry new.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   geometry: BlEllipseGeometry new;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject geometry class equals: BlEllipseGeometry
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementGeometry6 [

	| object source newObject |
	object := (BlElement new geometry: (BlLineGeometry new from: 10@ 0 to: 100 @ 100)).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   geometry: (BlLineGeometry new
         from: 10 @ 0;
         to: 100 @ 100;
         yourself);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject geometry class equals: BlLineGeometry.
	self assert: newObject geometry from equals: 10 @ 0.
	self assert: newObject geometry to equals: 100 @ 100
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementGeometry7 [

	| object source newObject |
	object := BlElement new geometry: (BlPolylineGeometry vertices: {
				           (100 @ 10).
				           (40 @ 198).
				           (190 @ 78).
				           (10 @ 78).
				           (160 @ 198) }).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   geometry: (BlPolylineGeometry new
         vertices: {(100 @ 10) . 
            (40 @ 198) . 
            (190 @ 78) . 
            (10 @ 78) . 
            (160 @ 198)};
         yourself);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject geometry class equals: BlPolylineGeometry.
	self assert: newObject geometry vertices equals: {
			(100 @ 10).
			(40 @ 198).
			(190 @ 78).
			(10 @ 78).
			(160 @ 198) }
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementGeometry8 [

	| object source newObject |
	object := BlElement new geometry: BlSquareGeometry new.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   geometry: BlSquareGeometry new;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject geometry class equals: BlSquareGeometry
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementGeometry9 [

	| object source newObject |
	object := BlElement new geometry:
		          (BlRoundedRectangleGeometry cornerRadius: 4).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject geometry equals: (BlRoundedRectangleGeometry cornerRadius: 4)
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementMouseCursor1 [

	| object source newObject |
	object := BlElement new mouseCursor: nil.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject mouseCursor equals: nil
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementMouseCursor2 [

	| object source newObject |
	object := BlElement new mouseCursor: Cursor webLink.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   mouseCursor: (Cursor classPool at: #WebLinkCursor);
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject mouseCursor equals: Cursor webLink
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementOpacity1 [

	| object source newObject |
	object := BlElement new opacity: 1.0.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject opacity equals: 1.0
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementOpacity2 [

	| object source newObject |
	object := BlElement new opacity: 0.2.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   opacity: 0.2;
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject opacity equals: 0.2
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementOutskirst1 [

	| object source newObject |
	object := BlElement new outskirts: BlOutskirts inside.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject outskirts class equals: BlOutskirtsInside
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementOutskirst2 [

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

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementOutskirst3 [

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

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementVisibility1 [

	| object source newObject |
	object := BlElement new visibility: BlVisibility visible. 
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject visibility isVisible.
]

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementVisibility2 [

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

{ #category : 'tests' }
StashBlocVisualsTest >> testBlElementVisibility3 [

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
