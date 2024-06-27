Class {
	#name : 'BaselineOfStashSerialization',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfStashSerialization',
	#package : 'BaselineOfStashSerialization'
}

{ #category : 'baselines' }
BaselineOfStashSerialization >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self dependencies: spec.
		spec package: #'Stash-Serialization'.
		spec
			package: #'Stash-Serialization-Bloc'
			with: [ spec requires: #(  #'Stash-Serialization' #Bloc ) ] ]
]

{ #category : 'baselines' }
BaselineOfStashSerialization >> dependencies: spec [

	spec
		baseline: #Bloc
		with: [ spec repository: 'github://pharo-graphics/Bloc:master/src' ]
]
