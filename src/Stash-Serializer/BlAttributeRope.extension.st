Extension { #name : #BlAttributeRope }

{ #category : #'*Stash-Serializer' }
BlAttributeRope >> allSetterAndGettersForMyStash [

	^ {
		  #attributes.
		  #rope }
]

{ #category : #'*Stash-Serializer' }
BlAttributeRope >> asStashContructor [

	^ self class printString
]

{ #category : #'*Stash-Serializer' }
BlAttributeRope >> asStashObject [

	^ StashBlAttributeRope new
		  object: self;
		rope: self rope;
		attributes: self attributes;
		  yourself
]
