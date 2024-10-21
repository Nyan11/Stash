Class {
	#name : #StashProperty,
	#superclass : #Object,
	#instVars : [
		'context'
	],
	#category : #'Stash-Serialization-stash'
}

{ #category : #converting }
StashProperty >> asStashProperty [

	^ self
]

{ #category : #accessing }
StashProperty >> context [

	^ context
]

{ #category : #accessing }
StashProperty >> context: anObject [

	context := anObject.
	self verifyContext
]

{ #category : #resolving }
StashProperty >> getter [

	^ StashPropertyErrorCannotGet new
		  context: self context;
		  signal
]

{ #category : #testing }
StashProperty >> isStashGetter [

	^ false
]

{ #category : #testing }
StashProperty >> isStashSetter [

	^ false
]

{ #category : #resolving }
StashProperty >> setter [

	^ StashPropertyErrorCannotSet new
		  context: self context;
		  signal
]

{ #category : #accessing }
StashProperty >> signalWrongContextError [
		
		^ StashPropertyErrorWrongContext new
			  context: self context;
			  signal
]

{ #category : #accessing }
StashProperty >> verifyContext [
	"context is either a symbol, or an association"

	self context isSymbol ifTrue: [ ^ self ].
	self context isBlock ifTrue: [ ^ self ].
	self context isAssociation ifFalse: [ ^ self signalWrongContextError ].

	"setter -> key is either a symbol or a block"
	self isStashSetter ifTrue: [
		(self context key isSymbol or: [ self context key isBlock ])
			ifFalse: [ ^ self signalWrongContextError ] ].

	"getter -> value is a symbol or a block or a collection of others"
	self isStashGetter ifTrue: [
		self context value isSymbol ifTrue: [ ^ self ].
		self context value isBlock ifTrue: [ ^ self ].

		"multi arguments:
		1) if setter is symbol and do end with $:
				setter split on $: = getter size.
		2) if setter is symbol and do not end with $:
				getter size = 2."
		(self context value isCollection and: [
			 self context value allSatisfy: [ :each |
				 each isBlock or: [ each isSymbol ] ] ]) ifFalse: [
			^ self signalWrongContextError ].
		(self isStashSetter and: [ self context key isSymbol ]) ifTrue: [
			self context key last = $:
				ifTrue: [
					(($: split: self context key) select: #isNotEmpty) size
					= self context value size ifFalse: [
						^ self signalWrongContextError ] ]
				ifFalse: [
					self context value size = 2 ifFalse: [
						^ self signalWrongContextError ] ] ] ].
]
