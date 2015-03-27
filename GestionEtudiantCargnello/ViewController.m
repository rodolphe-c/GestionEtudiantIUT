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

#import "ViewController.h"
#import "Module.h"
#import "SaisieEtudiantViewController.h"
#import "ListeModuleViewController.h"
#import "Etudiant.h"

@implementation ViewController

@synthesize m_listeEtudiant;
@synthesize m_listeModule;
@synthesize tableViewEtudiant;
@synthesize liste;

- (void)viewDidLoad
{
    [super viewDidLoad];
    m_listeEtudiant = [[NSMutableArray alloc]init];
    [self loadDataEtudiant];
    m_listeModule = [[NSMutableArray alloc]init];
    [tableViewEtudiant numberOfSections];
    tableViewEtudiant.dataSource = self;
    tableViewEtudiant.delegate = self;
    [self updateLabel];
	
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateLabel
{
    [self.nombreTotalEtudiant setText:[NSString stringWithFormat:@"Nombre d'étudiants : %d",(int)[m_listeEtudiant count]]];
}

- (void) updateEtudiant
{
    int i;
    for (i = 0 ; i < [m_listeEtudiant count] ; i++)
    {
        [self.liste setText:[[m_listeEtudiant objectAtIndex:i]toString]];
    }
}

- (IBAction)ajoutEtudiantTermine:(UIStoryboardSegue*) uwindsegue
{
    SaisieEtudiantViewController *controlleur = uwindsegue.sourceViewController;
    if(controlleur.m_etudiant != nil)
    {
        [m_listeEtudiant addObject:controlleur.m_etudiant];
        [self saveData];
        [self updateLabel];
        [self updateEtudiant];
    }
}


- (IBAction)retourListe:(UIStoryboardSegue*) uwindsegue
{}


- (void)saveData
{
    NSMutableArray* dico = [[NSMutableArray alloc]init];
    
    for (Etudiant* etu in m_listeEtudiant)
    {
        NSDictionary* etudico = [[NSDictionary alloc]initWithObjectsAndKeys:[NSString stringWithFormat:@"%d",etu.m_numeroEtudiant],@"numero",
                                 etu.m_nomEtudiant,@"nom",
                                 etu.m_prenomEtudiant, @"prenom",
                                 etu.m_civilite, @"civilite",
                                 etu.m_semestreDInscription, @"semestre",
                                 etu.m_adresseMail, @"adresseMail",
                                 etu.m_dateNaissance, @"dateNaissance",nil];
        [dico addObject:etudico];
    }
    [dico writeToFile:[self getFilePathFor:@"etudiant.plist"] atomically:false];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [m_listeEtudiant count];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"YOLO";
    
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[NSString stringWithFormat:@"%@", CellIdentifier]];
	cell.textLabel.text = [NSString stringWithFormat:@"%@",[[m_listeEtudiant objectAtIndex:[indexPath item]] toString]];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}

- (void)tableView: (UITableView *)tableView commitEditingStyle: (UITableViewCellEditingStyle)editingStyle forRowAtIndexPath: (NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source
        [m_listeEtudiant removeObjectAtIndex:[indexPath row]];
    
        // Delete row using the cool literal version of [NSArray arrayWithObject:indexPath]
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [self saveData];
        [self updateLabel];
    }
}

- (IBAction)btn_edit:(id)sender
{
    if(tableViewEtudiant.isEditing)
    {
        //[self.tableViewEtudiant ];
        [self.tableViewEtudiant setEditing:NO animated:YES];
    }
    else
    {
        [self.tableViewEtudiant setEditing:YES animated:YES];
    }
}


- (void) loadDataEtudiant
{
    NSMutableArray* dico = [[NSMutableArray alloc]initWithContentsOfFile:[self getFilePathFor:@"etudiant.plist"]];
    for (NSDictionary* d in dico)
    {
        Etudiant* e = [[Etudiant alloc]init ];
        e.m_numeroEtudiant = [[d objectForKey:@"numero"] integerValue];
        e.m_nomEtudiant =[d objectForKey:@"nom"];
        e.m_prenomEtudiant = [d objectForKey:@"prenom"];
        e.m_civilite =[d objectForKey:@"civilite"];
        e.m_dateNaissance = [d objectForKey:@"dateNaissance"];
        e.m_semestreDInscription=[d objectForKey:@"semestre"];
        e.m_adresseMail = [d objectForKey:@"adresseMail"];
        [m_listeEtudiant addObject:e];
    }
}


- (void) loadDataModule
{
	NSMutableArray* dico = [[NSMutableArray alloc]initWithContentsOfFile:[self getFilePathFor:@"module.plist"]];
	for (NSDictionary* d in dico)
	{
		Module* m = [[Module alloc]init ];
		m.identifiantModule = [[d objectForKey:@"identifiant"] integerValue];
		m.nomModule =[d objectForKey:@"nomModule"];
		m.enseignants = [d objectForKey:@"enseignant"];
		m.semestreDEnseignement =[d objectForKey:@"semestreDEnseignement"];
		[m_listeModule addObject:m];
	}
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


- (void) prepareForSegue:(UIStoryboardSegue *) segue sender:(id)sender
{
	
	if ([segue.identifier isEqualToString:@"abdelSegue"])
	{
		SaisieEtudiantViewController *controlleur = segue.destinationViewController;
		Etudiant *e  = [[Etudiant alloc]init];
		controlleur.m_etudiant = e;
	}
	
	if ([segue.identifier isEqualToString:@"YOLO"])
	{
		NSIndexPath *selectedRowIndex = [self.tableViewEtudiant indexPathForSelectedRow];
		NSString *str = [[NSString alloc] initWithFormat:@"%@", [[m_listeEtudiant objectAtIndex:selectedRowIndex.row] toString]];
		ListeModuleViewController *listeDetaille = segue.destinationViewController;
		listeDetaille.info.text =str;
	}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self performSegueWithIdentifier:@"YOLO" sender:[tableView cellForRowAtIndexPath:indexPath]];
}

@end
