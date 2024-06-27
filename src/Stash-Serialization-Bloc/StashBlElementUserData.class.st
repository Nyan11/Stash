Class {
	#name : 'StashBlElementUserData',
	#superclass : 'Object',
	#instVars : [
		'setterAndGetterBlockDictionnary'
	],
	#classInstVars : [
		'uniqueInstance',
		'setterAndGetterBlocks'
	],
	#category : 'Stash-Serialization-Bloc-stash-bloc-utility',
	#package : 'Stash-Serialization-Bloc',
	#tag : 'stash-bloc-utility'
}

{ #category : 'initialization' }
StashBlElementUserData class >> reset [

	<script>
	uniqueInstance := nil.
	setterAndGetterBlocks := nil.
]

{ #category : 'accessing' }
StashBlElementUserData class >> setterAndGetterBlocks [

	setterAndGetterBlocks ifNil: [
		  setterAndGetterBlocks := Set new.
		  setterAndGetterBlocks add: #elementId -> [ :elementId |
			  elementId class = BlElementNoId
				  ifTrue: [ {  } ]
				  ifFalse: [
					  elementId class = BlElementNamedId
						  ifTrue: [ { #id } ]
						  ifFalse: [ { #elementId } ] ] ] ].
	^ setterAndGetterBlocks
]

{ #category : 'accessing' }
StashBlElementUserData class >> uniqueInstance [

	uniqueInstance ifNil: [
		  uniqueInstance := self new.
		  self setterAndGetterBlocks do: [ :each |
			  uniqueInstance setterAndGetterBlockDictionnary
				  at: each key
				  put: each value ] ].
	^ uniqueInstance
]

{ #category : 'initialization' }
StashBlElementUserData >> initialize [

	setterAndGetterBlockDictionnary := Dictionary new.
]

{ #category : 'accessing' }
StashBlElementUserData >> setterAndGetterBlockDictionnary [

	^	setterAndGetterBlockDictionnary
]

{ #category : 'as yet unclassified' }
StashBlElementUserData >> setterAndGetterBlockFor: aSymbol [

	^ self setterAndGetterBlockDictionnary at: aSymbol ifAbsent: [ nil ]
]
