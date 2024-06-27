Extension { #name : 'Point' }

{ #category : '*Stash-Serialization' }
Point >> asStashObject [

	^ StashPoint new
		  object: self;
		  yourself
]
