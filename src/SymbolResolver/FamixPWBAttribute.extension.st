Extension { #name : #FamixPWBAttribute }

{ #category : #'*SymbolResolver' }
FamixPWBAttribute >> asSREntityScope [
	^attributeType asSREntityScope
]

{ #category : #'*SymbolResolver' }
FamixPWBAttribute >> postResolveActionWith: aSRReferenceToResolve [
	attributeType isResolvable
		ifTrue: [ | toResolve |
			toResolve := SRReferenceToResolve
				newFromScopes: aSRReferenceToResolve scopes
				identifiers: attributeType.
			attributeType := toResolve resolve ]
]
