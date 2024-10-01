Extension { #name : #BlockClosure }

{ #category : #'*Stash-Serialization' }
BlockClosure >> asStashConstructor [

	| variables props |
	variables := (self sourceNode variableNodes collect: #name) asSet.

	((variables select: [ :each | each first isUppercase ]) allSatisfy: [
		 :each |
		 Smalltalk environment
			 at: each
			 ifPresent: [ true ]
			 ifAbsent: [ false ] ]) ifFalse: [
		StashCannotSerializeBlockClosure new
			context: self;
			signal:
				'The BlockClosure reference a global variable that as not been found on the image. It cannot be serialize without risk.' ].
	variables := variables reject: [ :each | each first isUppercase ].
	props := self sourceNode allArgumentVariables
	         , self sourceNode allTemporaryVariables.
	(props size >= variables size and: [ props includesAll: variables ])
		ifFalse: [
			^ StashCannotSerializeBlockClosure new
				  context: self;
				  signal:
					  'The BlockClosure reference an outer context. It cannot be serialize without risk.' ].
	^ self printString
]
