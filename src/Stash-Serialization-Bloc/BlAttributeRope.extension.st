Extension { #name : #BlAttributeRope }

{ #category : #'*Stash-Serialization-Bloc' }
BlAttributeRope >> allSetterAndGettersForMyStash [

	^ {
		  #attributes.
		  #rope }
]

{ #category : #'*Stash-Serialization-Bloc' }
BlAttributeRope >> asStashContructor [

	^ self class printString
]

{ #category : #'*Stash-Serialization-Bloc' }
BlAttributeRope >> asStashObject [

	^ StashBlAttributeRope new
		  object: self;
		rope: self rope;
		attributes: self attributes;
		  yourself
]
