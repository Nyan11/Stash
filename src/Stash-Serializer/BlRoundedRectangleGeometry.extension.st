Extension { #name : #BlRoundedRectangleGeometry }

{ #category : #'*Stash-Serializer' }
BlRoundedRectangleGeometry >> allSetterAndGettersForMyStash [

	(self cornerRadii topLeft = self cornerRadii bottomRight and: [
		 self cornerRadii topLeft = self cornerRadii topRight and: [
			 self cornerRadii topLeft = self cornerRadii bottomLeft ] ])
		ifTrue: [ ^ {  } ].

	^ { #cornerRadii }
]

{ #category : #'*Stash-Serializer' }
BlRoundedRectangleGeometry >> asStashContructor [

	(self cornerRadii topLeft = self cornerRadii bottomRight and: [
		 self cornerRadii topLeft = self cornerRadii topRight and: [
			 self cornerRadii topLeft = self cornerRadii bottomLeft ] ])
		ifTrue: [
			^ 'BlRoundedRectangleGeometry cornerRadius: '
			  , self cornerRadii topLeft printString ].

	^ 'BlRoundedRectangleGeometry'
]

{ #category : #'*Stash-Serializer' }
BlRoundedRectangleGeometry >> asStashObject [

	^ StashObjectWithBuilder new
		  builder: self;
		  methodToBuild: nil;
		  object: self;
		  yourself
]
