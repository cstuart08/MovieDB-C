//
//  CMSMovieController.h
//  MovieDB-C
//
//  Created by Apps on 8/23/19.
//  Copyright © 2019 Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class CMSMovie;

NS_ASSUME_NONNULL_BEGIN

@interface CMSMovieController : NSObject

+ (void)searchForMovieWithSearchTerm:(NSString *)searchTerm completion:(void (^) (NSArray<CMSMovie *> *movies))completion;

@end

NS_ASSUME_NONNULL_END
