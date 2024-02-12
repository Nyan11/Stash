Extension { #name : #BlBasicLayout }

{ #category : #'*Stash-Serializer' }
BlBasicLayout >> asStashContructor [

	^ 'BlBasicLayout uniqueInstance' 
]

{ #category : #'*Stash-Serializer' }
BlBasicLayout >> shouldBeTagged [

	^ false
]
