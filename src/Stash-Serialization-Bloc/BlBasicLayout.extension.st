Extension { #name : #BlBasicLayout }

{ #category : #'*Stash-Serialization-Bloc' }
BlBasicLayout >> asStashContructor [

	^ 'BlBasicLayout uniqueInstance' 
]

{ #category : #'*Stash-Serialization-Bloc' }
BlBasicLayout >> shouldBeTagged [

	^ false
]
