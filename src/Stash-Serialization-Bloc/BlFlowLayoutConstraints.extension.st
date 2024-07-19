Extension { #name : #BlFlowLayoutConstraints }

{ #category : #'*Stash-Serialization-Bloc' }
BlFlowLayoutConstraints >> stashAccessorsNewLine [

	<stashAccessors>
	newLine ifTrue: [ ^ { #newLine: -> #isNewLine } ].
	^ {  }

]

{ #category : #'*Stash-Serialization-Bloc' }
BlFlowLayoutConstraints >> stashAccessorsWeight [

	<stashAccessors>
	weight == 0 ifFalse: [ ^ { #weight } ].
	^ {  }

]
