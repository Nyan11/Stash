Extension { #name : 'Form' }

{ #category : '*Stash-Serialization' }
Form >> asStashContructor [

	| stream |
	stream := String new writeStream.
	self storeOn: stream.
	^ stream contents
]
