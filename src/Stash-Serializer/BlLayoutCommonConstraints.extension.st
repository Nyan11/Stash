Extension { #name : #BlLayoutCommonConstraints }

{ #category : #'*Stash-Serializer' }
BlLayoutCommonConstraints >> allSetterAndGettersForMyStash [

	| settersAndGetters |
	settersAndGetters := super allSetterAndGettersForMyStash asOrderedCollection.
	self position = (0 @ 0) ifFalse: [ settersAndGetters add: #position ].
	self padding = BlInsets empty ifFalse: [
		settersAndGetters add: #padding ].
	self margin = BlInsets empty ifFalse: [
		settersAndGetters add: #margin ].

	self maxHeight = Float infinity ifFalse: [
		settersAndGetters add: #maxHeight ].
	self maxWidth = Float infinity ifFalse: [
		settersAndGetters add: #maxWidth ].
	self minHeight = 0 ifFalse: [ settersAndGetters add: #minHeight ].
	self minWidth = 0 ifFalse: [ settersAndGetters add: #minWidth ].

	accountTransformation ifTrue: [
		settersAndGetters add:
			([ :c | #accountTransformation ] -> self) onlySetOnStash ].

	^ settersAndGetters
]
