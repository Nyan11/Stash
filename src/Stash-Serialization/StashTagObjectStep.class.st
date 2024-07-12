Class {
	#name : 'StashTagObjectStep',
	#superclass : 'StashStep',
	#category : 'Stash-Serialization-stash-steps',
	#package : 'Stash-Serialization',
	#tag : 'stash-steps'
}

{ #category : 'actions' }
StashTagObjectStep >> runOn: aStash [

	aStash do: [ :each |
		each shouldBeTagged ifTrue: [ aStash addTaggedObject: each ] ]
]
