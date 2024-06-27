Extension { #name : #BlRoundedRectangleGeometry }

{ #category : #'*Stash-Serialization-Bloc' }
BlRoundedRectangleGeometry >> allSetterAndGettersForMyStash [

	(self cornerRadii topLeft = self cornerRadii bottomRight and: [
		 self cornerRadii topLeft = self cornerRadii topRight and: [
			 self cornerRadii topLeft = self cornerRadii bottomLeft ] ])
		ifTrue: [ ^ {  } ].

	^ { #cornerRadii }
]

{ #category : #'*Stash-Serialization-Bloc' }
BlRoundedRectangleGeometry >> asStashContructor [

	(self cornerRadii topLeft = self cornerRadii bottomRight and: [
		 self cornerRadii topLeft = self cornerRadii topRight and: [
			 self cornerRadii topLeft = self cornerRadii bottomLeft ] ])
		ifTrue: [
			^ 'BlRoundedRectangleGeometry cornerRadius: '
			  , self cornerRadii topLeft printString ].

	^ 'BlRoundedRectangleGeometry'
]

{ #category : #'*Stash-Serialization-Bloc' }
BlRoundedRectangleGeometry >> asStashObject [

	^ StashObjectWithBuilder new
		  builder: self;
		  methodToBuild: nil;
		  object: self;
		  yourself
]
