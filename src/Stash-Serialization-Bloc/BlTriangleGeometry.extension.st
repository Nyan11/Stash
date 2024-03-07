Extension { #name : #BlTriangleGeometry }

{ #category : #'*Stash-Serialization-Bloc' }
BlTriangleGeometry >> asStashContructor [

	self isTop ifTrue: [ ^ 'BlTriangleGeometry new beTop' ].
	self isBottom ifTrue: [ ^ 'BlTriangleGeometry new beBottom' ].
	self isLeft ifTrue: [ ^ 'BlTriangleGeometry new beLeft' ].
	^ 'BlTriangleGeometry new beRight'
]
