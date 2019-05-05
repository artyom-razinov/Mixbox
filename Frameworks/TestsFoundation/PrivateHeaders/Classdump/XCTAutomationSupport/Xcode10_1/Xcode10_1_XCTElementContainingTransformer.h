#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 120100 && __IPHONE_OS_VERSION_MAX_ALLOWED < 120200

#import "Xcode10_1_XCTAutomationSupport_CDStructures.h"
#import "Xcode10_1_SharedHeader.h"
#import "Xcode10_1_XCTElementSetCodableTransformer.h"

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTElementContainingTransformer : XCTElementSetCodableTransformer
{
    NSPredicate *_predicate;
}

+ (_Bool)supportsSecureCoding;
@property(readonly, copy) NSPredicate *predicate; // @synthesize predicate=_predicate;
- (id)iteratorForInput:(id)arg1;
- (void)encodeWithCoder:(id)arg1;
- (id)initWithCoder:(id)arg1;
- (id)requiredKeyPathsOrError:(id *)arg1;
- (_Bool)supportsAttributeKeyPathAnalysis;
- (_Bool)supportsRemoteEvaluation;
- (id)transform:(id)arg1 relatedElements:(id *)arg2;
- (_Bool)_elementMatches:(id)arg1 relatedElement:(id *)arg2;
- (_Bool)isEqual:(id)arg1;
- (unsigned long long)hash;
- (id)initWithPredicate:(id)arg1;

@end

#endif