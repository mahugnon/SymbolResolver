"
I am a resolvable only identified by an identifier (like an instance variable or a property)
"
Class {
	#name : #SRIdentifierWithNode,
	#superclass : #SRResolvable,
	#instVars : [
		'entity',
		'access'
	],
	#category : #'SymbolResolver-Core'
}

{ #category : #'as yet unclassified' }
SRIdentifierWithNode class >> identifier: anIdentifier expectedKind: aKind node: aNode arrayWithSize: aString [
	^ (self identifier: anIdentifier node: aNode)
		expectedKind: aKind;
		arrayWithSize: aString;
		yourself
]

{ #category : #accessing }
SRIdentifierWithNode >> access [
	^ access
]

{ #category : #accessing }
SRIdentifierWithNode >> access: anObject [
	access := anObject
]

{ #category : #hooks }
SRIdentifierWithNode >> applyReplacementStrategyWithCurrentEntity: aCurrentEntity [
	aCurrentEntity isNullPatternObject ifTrue: [ ^ self ].
	self
		entity: (self notFoundReplacementEntity cull: self cull: aCurrentEntity)
]

{ #category : #accessing }
SRIdentifierWithNode >> entity [
	^ entity
]

{ #category : #accessing }
SRIdentifierWithNode >> entity: anObject [
	entity := anObject
]

{ #category : #access }
SRIdentifierWithNode >> foundActionFromPreviousInChain: aSRIdentifierWithNode [
	foundAction := aSRIdentifierWithNode foundAction
]

{ #category : #resolution }
SRIdentifierWithNode >> resolveInScope: aScope currentEntity: currentEntity [
	currentEntity isNullPatternObject
		ifTrue: [ ^ currentEntity ].
	self
		entity:
			(aScope
				detect: [ :anEntity | 
					(self name: anEntity name isSameAs: self identifier)
						and: [ self checkKindOfEntity: anEntity ] ]).
	self isLast
		ifFalse: [ ^ self next
				foundActionFromPreviousInChain: self;
				resolveInScope: (SREntityScope entity: self entity)
					currentEntity: currentEntity ]
		ifTrue: [ self triggerFoundActionWithCurrentEntity: currentEntity.
			^ self entity ]
]
