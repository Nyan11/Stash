Extension { #name : #Form }

{ #category : #'*Stash-Serializer' }
Form >> asStashContructor [

	| stream |
	stream := String new writeStream.
	self storeOn: stream.
	^ stream contents
]
