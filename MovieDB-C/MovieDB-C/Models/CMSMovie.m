//
//  CMSMovie.m
//  MovieDB-C
//
//  Created by Apps on 8/23/19.
//  Copyright © 2019 Apps. All rights reserved.
//

#import "CMSMovie.h"

static NSString * const titleKey = @"original_title";
static NSString * const ratingKey = @"vote_average";
static NSString * const summaryKey = @"overview";

@implementation CMSMovie

- (instancetype)initWithTitle:(NSString *)title rating:(NSNumber *)rating summary:(NSString *)summary
{
    self = [super init];
    
    if (self)
    {
        _title = title;
        _rating = rating;
        _summary = summary;
    }
    return self;
}

@end

@implementation CMSMovie (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[titleKey];
    NSNumber *rating = dictionary[ratingKey];
    NSString *summary = dictionary[summaryKey];
    
    return [self initWithTitle:title rating:rating summary:summary];
}

@end
