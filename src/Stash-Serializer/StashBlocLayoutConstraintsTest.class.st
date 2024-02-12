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
		          c frame horizontal alignLeft ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self
		assert: newObject constraints frame horizontal alignment
		equals: BlElementAlignment horizontal start
]

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFrame10 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c frame vertical alignCenterAt: 0.5 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints frame vertical alignCenterAt: 0.5 ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self
		assert: newObject constraints frame vertical alignment class
		equals: BlVerticalCoordinateTopAlignment.
	self
		assert: newObject constraints frame vertical alignment coordinate
		equals: 0.5.
	self
		assert:
		newObject constraints frame vertical alignment relativeAlignment
		equals: BlElementAlignment vertical center
]

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFrame11 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c frame vertical alignBottom ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints frame vertical alignBottom ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self
		assert: newObject constraints frame vertical alignment
		equals: BlElementAlignment vertical end
]

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFrame12 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c frame vertical alignBottomAt: 0.5 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints frame vertical alignBottomAt: 0.5 ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self
		assert: newObject constraints frame vertical alignment class
		equals: BlVerticalCoordinateBottomAlignment.
	self
		assert: newObject constraints frame vertical alignment coordinate
		equals: 0.5.
	self
		assert:
		newObject constraints frame vertical alignment relativeAlignment
		equals: BlElementAlignment vertical end
]

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFrame13 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c frame vertical alignBottomAt: 0.5.
		          c frame vertical weight: 0.2 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints frame vertical alignBottomAt: 0.5.
      constraints frame vertical weight: 0.2 ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self
		assert: newObject constraints frame vertical alignment class
		equals: BlVerticalCoordinateBottomAlignment.
	self
		assert: newObject constraints frame vertical alignment coordinate
		equals: 0.5.
	self
		assert:
		newObject constraints frame vertical alignment relativeAlignment
		equals: BlElementAlignment vertical end.
	self assert: newObject constraints frame vertical weight equals: 0.2
]

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFrame2 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c frame horizontal alignLeftAt: 0.5 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints frame horizontal alignLeftAt: 0.5 ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self
		assert: newObject constraints frame horizontal alignment class
		equals: BlHorizontalCoordinateLeftAlignment.
	self
		assert: newObject constraints frame horizontal alignment coordinate
		equals: 0.5.
	self
		assert:
		newObject constraints frame horizontal alignment relativeAlignment
		equals: BlElementAlignment horizontal start
]

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFrame3 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c frame horizontal alignCenter ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints frame horizontal alignCenter ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self
		assert: newObject constraints frame horizontal alignment
		equals: BlElementAlignment horizontal center
]

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFrame4 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c frame horizontal alignCenterAt: 0.5 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints frame horizontal alignCenterAt: 0.5 ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self
		assert: newObject constraints frame horizontal alignment class
		equals: BlHorizontalCoordinateStartAlignment.
	self
		assert: newObject constraints frame horizontal alignment coordinate
		equals: 0.5.
	self
		assert:
		newObject constraints frame horizontal alignment relativeAlignment
		equals: BlElementAlignment horizontal center
]

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFrame5 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c frame horizontal alignRight ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints frame horizontal alignRight ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self
		assert: newObject constraints frame horizontal alignment
		equals: BlElementAlignment horizontal end
]

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFrame6 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c frame horizontal alignRightAt: 0.5 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints frame horizontal alignRightAt: 0.5 ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self
		assert: newObject constraints frame horizontal alignment class
		equals: BlHorizontalCoordinateRightAlignment.
	self
		assert: newObject constraints frame horizontal alignment coordinate
		equals: 0.5.
	self
		assert:
		newObject constraints frame horizontal alignment relativeAlignment
		equals: BlElementAlignment horizontal end
]

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFrame7 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c frame vertical alignTop ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self
		assert: newObject constraints frame vertical alignment
		equals: BlElementAlignment vertical start
]

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFrame8 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c frame vertical alignTopAt: 0.5 ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints frame vertical alignTopAt: 0.5 ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self
		assert: newObject constraints frame vertical alignment class
		equals: BlVerticalCoordinateTopAlignment.
	self
		assert: newObject constraints frame vertical alignment coordinate
		equals: 0.5.
	self
		assert:
		newObject constraints frame vertical alignment relativeAlignment
		equals: BlElementAlignment vertical start
]

{ #category : #tests }
StashBlocLayoutConstraintsTest >> testFrame9 [

	| object source newObject |
	object := BlElement new constraintsDo: [ :c |
		          c frame vertical alignCenter ].
	source := Stash new serialize: object.
	self assert: source equals: 'BlElement new
   constraintsDo: [:constraints |  constraints frame vertical alignCenter ];
   yourself'.
	newObject := self class compiler
		             source: source;
		             evaluate.
	self
		assert: newObject constraints frame vertical alignment
		equals: BlElementAlignment vertical center
]
