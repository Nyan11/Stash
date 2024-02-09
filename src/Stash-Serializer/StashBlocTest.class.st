Class {
	#name : #StashBlocTest,
	#superclass : #TestCase,
	#category : #'Stash-Serializer-test-cases'
}

{ #category : #tests }
StashBlocTest >> testBlElement1 [

	| object source |
	object := BlElement new.
	source := Stash new serialize: object.
	self
		assert: source
		equals: 'BlElement new'
]

{ #category : #tests }
StashBlocTest >> testBlElement2 [

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
StashBlocTest >> testBlElement3 [

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
StashBlocTest >> testBlElement4 [

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
StashBlocTest >> testBlElement5 [

	| object source |
	object := BlElement new background: BlTransparentBackground new.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'
]

{ #category : #tests }
StashBlocTest >> testBlElement6 [

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
StashBlocTest >> testBlElement7 [

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
StashBlocTest >> testBlElement8 [

	| object source newObject |
	object := BlElement new
		          background:
			          (BlBackground paint:
					           (BlRadialGradientPaint new
			                stops: {
					                (0 -> Color blue).
					                (1 -> Color red) };
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
			self assert: newObject background innerCenter equals: 100 @ 100.
			self assert: newObject background innerRadius equals: 0.
			self assert: newObject background outerCenter equals: 200 @ 200.
			self assert: newObject background outerRadius equals: 200.
]
