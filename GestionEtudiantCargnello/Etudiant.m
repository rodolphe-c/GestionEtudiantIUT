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

#import "Etudiant.h"

@implementation Etudiant


@synthesize m_numeroEtudiant;
@synthesize m_nomEtudiant;
@synthesize m_prenomEtudiant;
@synthesize m_dateNaissance;
@synthesize m_civilite;
@synthesize m_semestreDInscription;
@synthesize m_adresseMail;
@synthesize m_listeModule;
@synthesize m_notes;

- (id) init
{
    self = [super init];
    if(self)
    {
        m_numeroEtudiant = 0;
        m_nomEtudiant = @"Vincent";
        m_prenomEtudiant = @"Steeve";
        m_dateNaissance = 10/12/1856;
        m_civilite = @"M.";
        m_semestreDInscription = @"S4";
        m_adresseMail = @"firegreen@YOLO.com";
        m_listeModule =[[NSMutableArray alloc]init];
        m_notes =[[NSMutableDictionary alloc]init];
    }
    return self;
}

- (id) initWithIdentifiant:(int)identifiant Nom:(NSString*)nom Prenom:(NSString*)prenom Civilite:(NSString*)civil Naissance:(NSDate*)naissance Inscription:(NSString*)inscription Mail:(NSString*)mail
{
    self = [self init];
    if(self)
    {
        m_numeroEtudiant = 10;
        m_nomEtudiant = nom;
        m_prenomEtudiant = prenom;
        m_dateNaissance = naissance;
        m_civilite = civil;
        m_semestreDInscription = inscription;
        m_adresseMail = mail;
    }
    return self;
}


- (NSString *) getFilePathFor:(NSString *)fileName
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
    if([fileManager fileExistsAtPath:filePath])
    {
        return filePath;
    }
    else
    {
        NSString* bundlePath = [[NSBundle mainBundle]bundlePath];
        NSString* bundlePlistPath = [bundlePath stringByAppendingPathComponent:fileName];
        [fileManager copyItemAtPath:bundlePlistPath toPath:filePath error:nil];
        return filePath;
    }
}

-(NSString*) toString
{
    NSString * message = [[NSString alloc ]init];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd/MM/yyyy"];
    NSString *myDate = [df stringFromDate:m_dateNaissance];
    
    message =  [NSString stringWithFormat: @"%@ %@, %@, %ld, %@, %@, %@, modules= %@, notes= %@", m_civilite, m_nomEtudiant, m_prenomEtudiant, (long)m_numeroEtudiant, myDate, m_semestreDInscription, m_adresseMail,[m_listeModule componentsJoinedByString:@" - "], m_notes ];
    
    return message;
}

@end
