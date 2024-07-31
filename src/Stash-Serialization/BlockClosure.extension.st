Extension { #name : #BlockClosure }

{ #category : #'*Stash-Serialization' }
BlockClosure >> asStashConstructor [

	| variables props temps |
	variables := (self sourceNode variableNodes collect: #name) asSet.
	props := self sourceNode allArgumentVariables, self sourceNode allTemporaryVariables.
	(props size >= variables size and: [ props includesAll: variables ])
		ifFalse: [
			^ StashCannotSerializeBlockClosure new
				context: self;
				signal:
					'The BlockClosure reference an outer context. It cannot be serialize without risk.' ].
	^ self printString
]
