//
//  CMSMovieController.m
//  MovieDB-C
//
//  Created by Apps on 8/23/19.
//  Copyright © 2019 Apps. All rights reserved.
//

#import "CMSMovieController.h"
#import "CMSMovie.h"
#import <UIKit/UIKit.h>

static NSString * const baseURLString = @"https://api.themoviedb.org/3/search/movie";
static NSString * const apiKeyTerm = @"api_key";
static NSString * const apiKeyValue = @"f773bd99f1300ca88446eb3e01aed5a6";
static NSString * const queryTerm = @"query";

@implementation CMSMovieController

+ (void)searchForMovieWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<CMSMovie *> *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *apiQueryItem = [NSURLQueryItem queryItemWithName:apiKeyTerm value:apiKeyValue];
    NSURLQueryItem *searchQueryItem = [NSURLQueryItem queryItemWithName:queryTerm value:searchTerm];
    components.queryItems = @[apiQueryItem, searchQueryItem];
    
    NSURL *finalURL = components.URL;
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        
        if (error) {
            NSLog(@"Error: %@, %@", error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"Error receiving data: %@, %@", error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
        if (!topLevelDictionary)
        {
            NSLog(@"Error parsing JSON %@", error);
            completion(nil);
            return;
        }
        
        NSMutableArray<CMSMovie *> *moviesArray = [NSMutableArray new];
        
        for (NSDictionary *movieDictionary in topLevelDictionary)
        {
            CMSMovie *movie = [[CMSMovie alloc]initWithDictionary:movieDictionary];
            [moviesArray addObject:movie];
        }
        completion(moviesArray);
        
    }]resume];
}

+ (void)fetchPosterForMovie:(CMSMovie *)movie completion:(void (^)(UIImage *))completion
{
    NSURL *posterURL = [[NSURL alloc] initWithString:movie.poster];
    
    [[NSURLSession.sharedSession dataTaskWithURL:posterURL completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        
        if (error) {
            NSLog(@"Error: %@, %@", error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"Error receiving data: %@, %@", error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        UIImage *poster = [[UIImage alloc] initWithData:data];
        completion(poster);
        
    }]resume];
}

@end
