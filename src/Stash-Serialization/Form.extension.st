Extension { #name : #Form }

{ #category : #'*Stash-Serialization' }
Form >> asStashConstructor [

	| stream |
	stream := String new writeStream.
	self storeOn: stream.
	^ stream contents
]
