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

#import <UIKit/UIKit.h>
#import "Etudiant.h"


/**
 * @brief SaisieEtudiantViewController
 *
 * @code
	#import <UIKit/UIKit.h>
	#import "Etudiant.h"
	@endcode
 */
@interface SaisieEtudiantViewController : UIViewController<UIImagePickerControllerDelegate>

/// TextField du nom
@property (weak, nonatomic) IBOutlet UITextField *nomSaisie;
/// TextField du prénom
@property (weak, nonatomic) IBOutlet UITextField *prenomSaisie;
/// TextField de la date de naissance
@property (weak, nonatomic) IBOutlet UIDatePicker *dateSaisie;
/// TextField de la civilité
@property (weak, nonatomic) IBOutlet UISegmentedControl *civiliteSaisie;
/// TextField du numéro étudiant
@property (weak, nonatomic) IBOutlet UITextField *numeroSaisie;
/// TextField du semestre choisi
@property (weak, nonatomic) IBOutlet UITextField *semestreSaisie;
/// TextField de l'adresse mail
@property (weak, nonatomic) IBOutlet UITextField *mailSaisie;
/// UIImagePickerController
@property UIImagePickerController * pick;
/// Etudiant à créer
@property Etudiant *m_etudiant;


/// @brief Bouton enregistrer
/// @param[in] sender sender
/// @return action
-(IBAction)enregistrer:(id)sender;

/// @brief Prepare for segue
/// @param[in] segue segue
/// @param[in] sender sender
- (void) prepareForSegue:(UIStoryboardSegue *) segue sender:(id)sender;

@end
