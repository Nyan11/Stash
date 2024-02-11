Class {
	#name : #StashBlocConstraintsTest,
	#superclass : #TestCase,
	#category : #'Stash-Serializer-test-cases'
}

{ #category : #tests }
StashBlocConstraintsTest >> testAccountTransformation [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c accountTransformation ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints accountTransformation ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject constraints shouldAccountTransformation
]

{ #category : #tests }
StashBlocConstraintsTest >> testMargin1 [


	| object source newObject |
	object := BlElement new margin: BlInsets empty.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject margin equals: BlInsets empty
]

{ #category : #tests }
StashBlocConstraintsTest >> testMargin2 [

	| object source newObject |
	object := BlElement new margin:( BlInsets all: 5).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints margin: (BlInsets all: 5.0) ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject margin equals: (BlInsets all: 5)
]

{ #category : #tests }
StashBlocConstraintsTest >> testMargin3 [

	| object source newObject |
	object := BlElement new margin: (BlInsets
			 top: 1
			 right: 4
			 bottom: 3
			 left: 2).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints margin: (BlInsets top: 1.0 right: 4.0 bottom: 3.0 left: 2.0) ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject margin equals: (BlInsets
			 top: 1
			 right: 4
			 bottom: 3
			 left: 2)
]

{ #category : #tests }
StashBlocConstraintsTest >> testMarginAndPadding [

	| object source newObject |
	object := BlElement new padding: (BlInsets
			           top: 1
			           right: 4
			           bottom: 3
			           left: 2); margin: (BlInsets
			           top: 1
			           right: 4
			           bottom: 3
			           left: 2).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints padding: (BlInsets top: 1.0 right: 4.0 bottom: 3.0 left: 2.0).
      constraints margin: (BlInsets top: 1.0 right: 4.0 bottom: 3.0 left: 2.0) ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject margin equals: (BlInsets
			 top: 1
			 right: 4
			 bottom: 3
			 left: 2).
			self assert: newObject padding equals: (BlInsets
			 top: 1
			 right: 4
			 bottom: 3
			 left: 2)
]

{ #category : #tests }
StashBlocConstraintsTest >> testMaxHeight1 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c | c maxHeight: Float infinity ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject constraints maxHeight equals: Float infinity
]

{ #category : #tests }
StashBlocConstraintsTest >> testMaxHeight2 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c maxHeight: 500 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints maxHeight: 500.0 ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject constraints maxHeight equals: 500
]

{ #category : #tests }
StashBlocConstraintsTest >> testMaxWidth1 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c maxWidth: Float infinity ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject constraints maxWidth equals: Float infinity
]

{ #category : #tests }
StashBlocConstraintsTest >> testMaxWidth2 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c | c maxWidth: 500 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints maxWidth: 500.0 ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject constraints maxWidth equals: 500
]

{ #category : #tests }
StashBlocConstraintsTest >> testMinHeight1 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c | c minHeight: 0 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject constraints minHeight equals: 0
]

{ #category : #tests }
StashBlocConstraintsTest >> testMinHeight2 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c | c minHeight: 10 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints minHeight: 10.0 ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject constraints minHeight equals: 10
]

{ #category : #tests }
StashBlocConstraintsTest >> testMinWidth1 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c | c minWidth: 0 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject constraints minWidth equals: 0
]

{ #category : #tests }
StashBlocConstraintsTest >> testMinWidth2 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c | c minWidth: 10 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints minWidth: 10.0 ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject constraints minWidth equals: 10
]

{ #category : #tests }
StashBlocConstraintsTest >> testPadding1 [

	| object source newObject |
	object := BlElement new padding: BlInsets empty.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject padding equals: BlInsets empty
]

{ #category : #tests }
StashBlocConstraintsTest >> testPadding2 [

	| object source newObject |
	object := BlElement new padding: (BlInsets all: 5).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints padding: (BlInsets all: 5.0) ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject padding equals: (BlInsets all: 5)
]

{ #category : #tests }
StashBlocConstraintsTest >> testPadding3 [

	| object source newObject |
	object := BlElement new padding: (BlInsets
			           top: 1
			           right: 4
			           bottom: 3
			           left: 2).
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints padding: (BlInsets top: 1.0 right: 4.0 bottom: 3.0 left: 2.0) ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject padding equals: (BlInsets
			 top: 1
			 right: 4
			 bottom: 3
			 left: 2)
]

{ #category : #tests }
StashBlocConstraintsTest >> testPosition1 [

	| object source newObject |
	object := BlElement new.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject constraints position equals: 0 @ 0
]

{ #category : #tests }
StashBlocConstraintsTest >> testPosition2 [

	| object source newObject |
	object := BlElement new position: 0 @ 0.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject constraints position equals: 0 @ 0
]

{ #category : #tests }
StashBlocConstraintsTest >> testPosition3 [

	| object source newObject |
	object := BlElement new position: 10 @ 10.
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints position: 10 @ 10 ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject constraints position equals: 10 @ 10
]
