Class {
	#name : #StashBlocLayoutConstraintsTest,
	#superclass : #TestCase,
	#category : #'Stash-Serializer-test-cases'
}

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFlow1 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c | c flow newLine: true ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints flow newLine: true ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject constraints flow isNewLine
]

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFlow2 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c | c flow newLine: false ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self deny: newObject constraints flow isNewLine
]

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFlow3 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c | c flow weight: 30.0 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints flow weight: 30.0 ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self assert: newObject constraints flow weight equals: 30.0
]

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFlow4 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c flow horizontal alignLeft ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self
		assert: newObject constraints flow horizontal alignment
		equals: BlElementAlignment horizontal start
]

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFlow5 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c flow horizontal alignCenter ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints flow horizontal alignCenter ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self
		assert: newObject constraints flow horizontal alignment
		equals: BlElementAlignment horizontal center
]

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFlow6 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c flow horizontal alignRight ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints flow horizontal alignRight ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self
		assert: newObject constraints flow horizontal alignment
		equals: BlElementAlignment horizontal end
]

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFlow7 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c flow vertical alignTop ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self
		assert: newObject constraints flow vertical alignment
		equals: BlElementAlignment vertical start
]

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFlow8 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c flow vertical alignCenter ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints flow vertical alignCenter ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self
		assert: newObject constraints flow vertical alignment
		equals: BlElementAlignment vertical center
]

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFlow9 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c flow vertical alignBottom ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints flow vertical alignBottom ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self
		assert: newObject constraints flow vertical alignment
		equals: BlElementAlignment vertical end
]

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFrame1 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c flow horizontal alignLeftAt: 0.5 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self
		assert: newObject constraints frame horizontal alignment
		equals: BlElementAlignment horizontal start
]
