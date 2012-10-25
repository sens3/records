//
//  RecordSpecs.m
//  Records
//
//  Created by smn on 10/25/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import "SpectaTestCase.h"
#import "Record.h"


SpecBegin(Record)

describe(@"Record", ^{
    
    __block Record *record;
    
    before(^{
        record = [[Record alloc] init];
    });
    
    it(@"exists", ^{
        expect(record).notTo.beNil();
    });
    
    it(@"has an artist name", ^{
        expect([record respondsToSelector:@selector(artistName)]).to.beTruthy();
        expect([record respondsToSelector:@selector(setArtistName:)]).to.beTruthy();
    });
    
    it(@"has a title", ^{
        expect([record respondsToSelector:@selector(title)]).to.beTruthy();
        expect([record respondsToSelector:@selector(setTitle:)]).to.beTruthy();
    });
    
    it(@"has a discogs URL", ^{
        expect([record respondsToSelector:@selector(discogsURL)]).to.beTruthy();
        expect([record respondsToSelector:@selector(setDiscogsURL:)]).to.beTruthy();
    });
});

SpecEnd


