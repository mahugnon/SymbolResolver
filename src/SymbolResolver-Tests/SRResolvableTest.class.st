Class {
	#name : #SRResolvableTest,
	#superclass : #TestCase,
	#instVars : [
		'scope',
		'variable1',
		'variable2',
		'variable3'
	],
	#category : #'SymbolResolver-Tests'
}

{ #category : #running }
SRResolvableTest >> setUp [
	variable1 := FamixTest2Class  new
		name: 'aVariable1';
		yourself.
	variable2 := FamixTest2Class new
		name: 'aVariable2';
		yourself.
	variable3 := FamixTest2Class new
		name: 'aVariable3';
		yourself.
	scope := SRCollectionScope new.
	scope
		reachableEntitiesOwned:
			{variable1.
			variable2.
			variable3}
]

{ #category : #tests }
SRResolvableTest >> testResolveConsiderCase [
	| resolver |
	resolver := (SRIdentifierWithNode identifier: 'AVariable1' node: nil)
		isCaseSensitive: true;
		foundAction: [ :identifier :currentEntity |  ];
		yourself.
	self
		should: [ resolver resolveInScope: scope currentEntity: nil ]
		raise: NotFound
]

{ #category : #tests }
SRResolvableTest >> testResolveIgnoreCase [
	| resolver |
	resolver := (SRIdentifierWithNode identifier: 'AVariable1' node: nil)
		isCaseSensitive: false ;
		foundAction: [ :identifier :currentEntity |  ];
		yourself.
	resolver resolveInScope: scope currentEntity: nil.
	self assert: resolver entity equals: variable1
]

{ #category : #tests }
SRResolvableTest >> testResolveSameCase [
	| resolver |
	resolver := (SRIdentifierWithNode identifier: 'aVariable1' node: nil)
		isCaseSensitive: false ;
		foundAction: [ :identifier :currentEntity | ];
		yourself.
		
	resolver resolveInScope: scope currentEntity: nil.
	self assert: resolver entity equals: variable1
]
