Extension { #name : #BlElementLocalTransformation }

{ #category : #'*Stash-Serialization-Bloc' }
BlElementLocalTransformation >> stashAccessors [

	<stashAccessors>
	^ self affineTransformation allSetterAndGettersForMyStash
]
