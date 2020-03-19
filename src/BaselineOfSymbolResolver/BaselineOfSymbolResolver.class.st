Class {
	#name : #BaselineOfSymbolResolver,
	#superclass : #BaselineOf,
	#category : #BaselineOfSymbolResolver
}

{ #category : #baselines }
BaselineOfSymbolResolver >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'SymbolResolver';
				package: 'SymbolResolver-Tests'
					with: [ spec requires: #('SymbolResolver') ] ].
	spec
		for: #WithoutMoose
		do: [ self baselineOfFamix: spec.
			spec
				package: 'SymbolResolver'
				with: [ spec requires: #('Famix') ] ]
]

{ #category : #baselines }
BaselineOfSymbolResolver >> baselineOfFamix: spec [
	spec
    	baseline: 'Famix'
    	with: [ spec repository: 'github://moosetechnology/Moose:development/src' ]
]

{ #category : #accessing }
BaselineOfSymbolResolver >> customProjectAttributes [
	self class environment
		at: #MooseEntity
		ifAbsent: [ ^ #(#WithoutMoose) ].
	^ #()
]
