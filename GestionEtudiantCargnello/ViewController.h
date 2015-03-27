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


/**
 * @brief Module
 *
 * @code
	#import <UIKit/UIKit.h>
	@endcode
 */
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

/// Label nombre d'étudiant
@property (weak, nonatomic) IBOutlet UILabel *nombreTotalEtudiant;
/// Liste d'étudiant
@property NSMutableArray * m_listeEtudiant;
/// Liste des modules
@property NSMutableArray * m_listeModule;
/// Identifiant du module
@property (weak, nonatomic) IBOutlet UITextView *liste;
/// Table d'étudiants
@property (weak, nonatomic) IBOutlet UITableView *tableViewEtudiant;

/// @brief Bouton éditer
/// @param[in] sender sender
/// @return action
- (IBAction)btn_edit:(id)sender;

/// @brief Mise à jour du label du nombre d'étudiants inscrits
- (void) updateLabel;

/// @brief Prepare for segue
/// @param[in] segue segue
/// @param[in] sender sender
- (void) prepareForSegue:(UIStoryboardSegue *) segue sender:(id)sender;

/// @brief Bouton éditer
/// @param[in] uwindsegue uwindsegue
/// @return action
- (IBAction)ajoutEtudiantTermine:(UIStoryboardSegue*) uwindsegue;

/// @brief Nombre de ligne du tableau d'étudiant
/// @param[in] tableView tableView
/// @param[in] numberOfRowsInSection section
/// @return un nombre de ligne
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

/// @brief Nombre de sections du tableau d'étudiant
/// @param[in] tableView tableView
/// @return un nombre de sections
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView;

/// @brief cellForRowAtIndexPath
/// @param[in] tableView tableView
/// @param[in] indexPath indexPath
/// @return UITableViewCell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

/// @brief Path du fichier
/// @param[in] fileName fileName
/// @return le path du fichier indiqué
- (NSString *) getFilePathFor:(NSString *)fileName;

/// @brief Chargement des étudiants
- (void) loadDataEtudiant;

/// @brief Chargement des modules
- (void) loadDataModule;

/// @brief Path du fichier
/// @param[in] tableView tableView
/// @param[in] didSelectRowAtIndexPath indexPath
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

