Extension { #name : #ToCheckableGroup }

{ #category : #'*Stash-Serialization-Toplo' }
ToCheckableGroup >> stashAccessorsForCheckableGroup [

	<stashAccessors>
	^ { #registerAll: -> #registeredCheckables }
]
