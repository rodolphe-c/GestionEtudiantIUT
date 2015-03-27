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
 * @brief Module
 *
 * @code
	#import <Foundation/Foundation.h>
	@endcode
 */
@interface Module : NSObject

/// Identifiant du module
@property NSInteger identifiantModule;
/// Nom du module
@property NSString * nomModule;
/// La liste des enseignants
@property NSMutableArray * enseignants;
/// Liste des semestres d'enseignement
@property NSMutableArray * semestreDEnseignement;

/// @brief Constructeur par défaut
/// @return id
- (id) init;

/// @brief Constructeur
/// @param[in] identifiant i
/// @param[in] nom n
/// @return id
- (id) initWithIdentifiant:(NSInteger*)i Nom:(NSString*)n;

/// @brief Valeurs des attributs de la classe en NSString
/// @return Retourne les valeurs des attributs de la classe en NSString
- (NSString*) toString;

@end
