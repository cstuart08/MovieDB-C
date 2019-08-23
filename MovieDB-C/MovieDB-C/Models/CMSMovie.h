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
@property (nonatomic, readonly) NSInteger rating;
@property (nonatomic, readonly, copy) NSString *summary;
@property (nonatomic, readonly, copy) NSString *poster;

- (instancetype)initWithTitle:(NSString *)title rating:(NSInteger)rating summary:(NSString *)summary poster:(NSString *)poster;

@end

@interface CMSMovie (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
