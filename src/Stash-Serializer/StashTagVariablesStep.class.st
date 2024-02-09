Class {
	#name : #StashTagVariablesStep,
	#superclass : #StashStep,
	#category : #'Stash-Serializer-stash'
}

{ #category : #actions }
StashTagVariablesStep >> runOn: aStash [

	aStash addOnSourceCode: '| '.
	aStash taggedObject
		do: [ :each | aStash addOnSourceCode: each tag ]
		separatedBy: [ aStash addOnSourceCode: ' ' ].
	aStash addOnSourceCode: '|<r><r>'
]
