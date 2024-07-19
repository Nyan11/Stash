Extension { #name : #BlLinearLayoutConstraints }

{ #category : #'*Stash-Serialization-Bloc' }
BlLinearLayoutConstraints >> stashAccessorsWeight [

	<stashAccessors>
	weight = 1 ifFalse: [ ^ { #weight } ].
	^ {  }

]
