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

#import <Foundation/Foundation.h>


/**
 * @brief Etudiant
 *
 * @code
	#import <Foundation/Foundation.h>
	@endcode
 */
@interface Etudiant : NSObject

/// Numéro
@property NSInteger m_numeroEtudiant;
/// Nom
@property NSString * m_nomEtudiant;
/// Prénom
@property NSString * m_prenomEtudiant;
/// Civilité
@property NSString * m_civilite;
/// Date de naissance
@property NSDate * m_dateNaissance;
/// Semestre d'inscription
@property NSString * m_semestreDInscription;
/// Adresse mail
@property NSString * m_adresseMail;
/// Liste de modules
@property NSMutableArray * m_listeModule;
/// Liste de notes
@property NSMutableDictionary * m_notes;

/// @brief Constructeur par défaut
/// @return id
-(id) init;

/// @brief Constructeur
/// @param[in] Identifiant identifiant
/// @param[in] Nom nom
/// @param[in] Prenom prenom
/// @param[in] Civilite civilite
/// @param[in] Naissance naissance
/// @param[in] Inscription inscription
/// @param[in] Mail mail
/// @return id
-(id) initWithIdentifiant:(NSInteger)identifiant Nom:(NSString*)nom Prenom:(NSString*)prenom Civilite:(NSString*)civilite Naissance:(NSDate*)naissance Inscription:(NSString*)inscription Mail:(NSString*)mail;

/// @brief Valeurs des attributs de la classe en NSString
/// @return Retourne les valeurs des attributs de la classe en NSString
- (NSString*) toString;

@end
