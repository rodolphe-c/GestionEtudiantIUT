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

#import "SaisieEtudiantViewController.h"
#import "Etudiant.h"
#import "ViewController.h"

@implementation SaisieEtudiantViewController

@synthesize m_etudiant;
@synthesize nomSaisie;
@synthesize prenomSaisie;
@synthesize dateSaisie;
@synthesize civiliteSaisie;
@synthesize numeroSaisie;
@synthesize semestreSaisie;
@synthesize mailSaisie;

- (IBAction)enregistrer:(id)sender
{ }

- (void)viewDidLoad
{
    [super viewDidLoad];
    m_etudiant = [[Etudiant alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    float kbheight;
    if(orientation == 0 || orientation == UIInterfaceOrientationPortrait)
    {
        kbheight = 264;
    }
    else if(orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight)
    {
        kbheight = 352;
    }
    CGFloat y = textField.frame.origin.y;
    if (y >= kbheight)
    {
        CGRect frame = self.view.frame;
        frame.origin.y = -kbheight;
        [UIView animateWithDuration:0.3 animations:^{self.view.frame = frame;}];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    CGRect returnframe =self.view.frame;
    returnframe.origin.y = 0;
    [UIView animateWithDuration:0.3 animations:^{self.view.frame = returnframe;}];
}

- (void) prepareForSegue:(UIStoryboardSegue *) segue sender:(id)sender
{
    if([nomSaisie.text length] !=0 && [prenomSaisie.text length] !=0 && [civiliteSaisie isEnabled] && [numeroSaisie.text length] !=0 && [semestreSaisie.text length] !=0 && [mailSaisie.text length] !=0)
    {
        m_etudiant =[[Etudiant alloc] initWithIdentifiant: [numeroSaisie.text integerValue] Nom:nomSaisie.text Prenom:prenomSaisie.text Civilite:[civiliteSaisie titleForSegmentAtIndex:civiliteSaisie.selectedSegmentIndex] Naissance:dateSaisie.date Inscription:semestreSaisie.text Mail:mailSaisie.text];
    }
    
    else
    {
        m_etudiant = nil;
    }
}

@end
