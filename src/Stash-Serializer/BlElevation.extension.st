Extension { #name : #BlElevation }

{ #category : #'*Stash-Serializer' }
BlElevation >> asStashContructor [

	^ self class printString , ' elevation: ' , self elevation printString
]
