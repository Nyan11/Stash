Extension { #name : #BlElevation }

{ #category : #'*Stash-Serialization-Bloc' }
BlElevation >> asStashContructor [

	^ self class printString , ' elevation: ' , self elevation printString
]
