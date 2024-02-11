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
