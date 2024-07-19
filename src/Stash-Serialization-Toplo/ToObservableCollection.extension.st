Extension { #name : #ToObservableCollection }

{ #category : #'*Stash-Serialization-Toplo' }
ToObservableCollection >> asStashObject [

	^ StashCollection new
		  object: collection;
		  classType: collection class;
		  yourself
]
