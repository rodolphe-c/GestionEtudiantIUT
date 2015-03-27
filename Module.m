// Copyright � 2015 Rodolphe Cargnello, rodolphe.cargnello@gmail.com

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "Module.h"

@implementation Module

@synthesize identifiantModule;
@synthesize nomModule;
@synthesize enseignants;
@synthesize semestreDEnseignement;

- (id) init
{
    self = [super init];
    if(self)
    {
        identifiantModule = 0;
        nomModule = @"YOLO";
        enseignants =[[NSMutableArray alloc]init];
        [enseignants insertObject:@"Pierre" atIndex:0];
        [enseignants insertObject:@"Michel" atIndex:1];
        semestreDEnseignement =[[NSMutableArray alloc]init];
    }
    return self;
}

- (id) initWithIdentifiant:(NSInteger *)i Nom:(NSString *)n
{
    self = [super init];
    if(self)
    {
        identifiantModule = i;
        nomModule = n;
        enseignants =[[NSMutableArray alloc]init];
        semestreDEnseignement =[[NSMutableArray alloc]init];
    }
    return self;
}

- (NSString*) toString
{
    NSString * message = [[NSString alloc ]init];
    
    message =  [NSString stringWithFormat: @"identifiantModule= %ld, nomModule= %@, enseignants= %@, semestreDEnseignement= %@", (long)identifiantModule, nomModule, [enseignants componentsJoinedByString:@" - "], [semestreDEnseignement componentsJoinedByString:@" - "]];
    
    return message;
}

@end

