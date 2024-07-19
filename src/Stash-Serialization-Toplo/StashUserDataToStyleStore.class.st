Class {
	#name : #StashUserDataToStyleStore,
	#superclass : #Object,
	#category : #'Stash-Serialization-Toplo'
}

{ #category : #'class initialization' }
StashUserDataToStyleStore class >> initialize [

	StashBlElementUserData setterAndGetterBlocks add: #toStyleStore -> [ :styleStore |
		{ #addAllStamps: -> #allStamps }
	]
]
