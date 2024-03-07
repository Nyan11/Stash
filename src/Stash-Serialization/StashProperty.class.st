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
StashProperty >> verifyContext [
	"context is either a symbol, or an association"

	self context isSymbol ifTrue: [ ^ self ].
	self context isBlock ifTrue: [ ^ self ].
	self context isAssociation ifFalse: [
		^ StashPropertyErrorWrongContext new
			  context: self context;
			  signal ].

	"setter -> key is either a symbol or a block"
	self isStashSetter ifTrue: [
		(self context key isSymbol or: [ self context key isBlock ])
			ifFalse: [
				StashPropertyErrorWrongContext new
					context: self context;
					signal ] ].

	"getter -> value is a symbol"
	self isStashGetter ifTrue: [
		(self context value isSymbol or: [ self context value isBlock ]) ifFalse: [
			StashPropertyErrorWrongContext new
				context: self context;
				signal ] ]
]
