//
//  CMSMovie.h
//  MovieDB-C
//
//  Created by Apps on 8/23/19.
//  Copyright © 2019 Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CMSMovie : NSObject

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly) NSNumber *rating;
@property (nonatomic, readonly, nullable) NSString *summary;

- (instancetype)initWithTitle:(NSString *)title rating:(NSNumber *)rating summary:(NSString *)summary;

@end

@interface CMSMovie (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
