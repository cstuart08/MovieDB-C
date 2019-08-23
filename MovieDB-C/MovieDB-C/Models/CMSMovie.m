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
static NSString * const posterKey = @"poster_path";

@implementation CMSMovie

- (instancetype)initWithTitle:(NSString *)title rating:(NSInteger)rating summary:(NSString *)summary poster:(NSString *)poster
{
    self = [super init];
    
    if (self)
    {
        _title = title;
        _rating = rating;
        _summary = summary;
        _poster = poster;
    }
    return self;
}

@end

@implementation CMSMovie (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[titleKey];
    NSInteger rating = [dictionary[ratingKey] integerValue];         //CHECK THIS***
    NSString *summary = dictionary[summaryKey];
    NSString *poster = dictionary[posterKey];
    
    return [self initWithTitle:title rating:rating summary:summary poster:poster];
}

@end
