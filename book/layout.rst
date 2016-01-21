.. _layout:

Faire la mise en page d'un carnet
=================================

La mise en page des carnets est gérée par un système d'options : il est possible
de spécifier la taille et l'orientation du papier, le type de police des accords,
*etc.* en mettant le bon mot clef dans un fichier :file:`.sb`. Toutes ces options
ont des valeurs par défaut, définies à plusieurs endroits. La valeur finale d'une
option peut provenir de plusieurs origines, données ici par ordre de priorité
croissante :

Valeurs par défaut
------------------

La plupart des options peuvent être omises : elle prendront alors une
valeur par défaut, documentée ci-dessous.


Fichier :file:`.sb`
-------------------

La majeure partie de la personalisation d'un carnet est effectuée à cet endroit.
Un fichier :file:`.sb` contient un dictionnaire YAML, dont les clefs sont des options
et les valeurs les valeurs prisent par ces options. Lorsqu'un fichier :file:`.sb`
est compilé par :py:mod:`patacrep`, tous les mots clefs en dehors de ``"content"``
sont transmis au gestionnaire de mise en page.

Voici par exemple le fichier :file:`.sb` qui fournit les options par défaut :

.. code-block:: yaml

  book: # Options générales
    lang: en
    encoding: utf-8
    pictures: yes
    template: default.tex
    onesongperpage: no

  chords: # Options musicales
    show: yes
    diagramreminder: important
    diagrampage: yes
    repeatchords: yes
    lilypond: no
    tablatures: no
    instrument: guitar
    notation: alphascale

  authors: # Analyse des auteurs
    separators:
    - and
    ignore:
    - unknown
    after:
    - by

  titles: # Analyse des titres
    prefix:
    - The
    - Le
    - La
    - "L'"
    - A
    - Au
    - Ces
    - De
    - Des
    - El
    - Les
    - Ma
    - Mon
    - Un

.. _options:

Liste des options
-----------------

Les valeurs par défaut sont données ici en supposant que la langue principale
du recueil est le français.

Options générales
^^^^^^^^^^^^^^^^^

Ce sont des sous-clés de la clé ``book``.

.. tabularcolumns:: |l|L|L|L|

================= =========================================================== =========================================== ===================
 Option           Description                                                 Type                                        Valeur par défaut  
================= =========================================================== =========================================== ===================
 lang             Langue du carnet (Code ISO 639-1 à 2 lettres).              Chaîne de charactères                       ``en``         
                                                                              Actuellement "fr" et "en" sont supportés.                      
 onesongperpage   Commencer toutes les chansons sur une nouvelle page         Booléen                                     no                 
 pictures         Afficher les couvertures des albums                         Booléen                                     yes                
 template         Template de carnet à utiliser                               Chaîne de charactères                       ``patacrep.tex``    
 encoding         Encodage des fichiers à lire (chansons, templates, etc.).   Chaîne de charactères                       ``utf-8``          
                  Peut poser des problèmes d'accentuation.                                                                                   
================= =========================================================== =========================================== ===================

Options musicales
^^^^^^^^^^^^^^^^^

Ce sont des sous-clés de la clé ``chords``.

.. tabularcolumns:: |l|L|L|L|

=================  ===================================================== ========================================================== ===================
 Option            Description                                           Type                                                       Valeur par défaut  
=================  ===================================================== ========================================================== ===================
 show              Afficher les accords au dessus des paroles            Booléen                                                    yes                
 diagramreminder   Rappeler en début de chansons certains accords        - ``all`` : Rappel de tous les accords présents du chant   ``important``      
                                                                         - ``important`` : Rappel des accords peu communs                              
                                                                         - ``none`` : Aucun rappel d'accords                                           
 diagrampage       Montrer la page d'accords en début de carnet          Booléen                                                    yes                
 repeatchords      Afficher les accords pour tous les couplets           Booléen                                                    yes                
                   (pas disponible pour tous les chants)                                                                                               
 lilypond          Inclure les partitions musicales                      Booléen                                                    no                 
                   (nécéssite le logiciel libre lilypond)                                                                                              
 tablatures        Inclure les tablatures                                Booléen                                                    no                 
 instrument        Instrument pour lequel il faut rappeler les accords   ``guitar`` ou ``ukulele``                                  ``guitar``         
 notation          Notation des accords                                  - ``alphascale`` : Système internanial ABCDEFG             ``alphascale``     
                                                                         - ``solfedge`` :  Système français Do Ré Mi                                   
=================  ===================================================== ========================================================== ===================


Analyse des auteurs
^^^^^^^^^^^^^^^^^^^

Ce sont des sous-clés de la clé ``authors``.

.. tabularcolumns:: |l|L|L|L|

============= ======================================== ================= ===================
 Option       Description                              Type              Valeur par défaut  
============= ======================================== ================= ===================
 separators   Mots qui séparent les artistes           Tableau de mots   ``- and``          
 ignore       Noms d'artistes à ignorer                Tableau de mots   ``- unknown``      
 after        Mots introduisant les noms des auteurs   Tableau de mots   ``- by``           
============= ======================================== ================= ===================


Analyse des titres
^^^^^^^^^^^^^^^^^^^

Ce sont des sous-clés de la clé ``titles``.

.. tabularcolumns:: |l|L|L|L|

========= =============================== ================= ===================
 Option   Description                     Type              Valeur par défaut  
========= =============================== ================= ===================
 prefix   Préfixe à ignorer lors du tri   Tableau de mots   ``- The``          
                                                            ``- Le``            
                                                            ``- La``            
                                                            ``- "L'"``          
                                                            ``- A``             
                                                            ``- Au``            
                                                            ``- Ces``           
                                                            ``- De``            
                                                            ``- Des``           
                                                            ``- El``            
                                                            ``- Les``           
                                                            ``- Ma``            
                                                            ``- Mon``           
                                                            ``- Un``            
========= =============================== ================= ===================

Options des templates
---------------------

Certains options sont propres aux templates utilisés. Par exemple le template
:file:`patacrep.tex` (qui inclut notamment :file:`default.tex`) permet de personnaliser
certaines couleurs et la page de garde.

Les options des templates sont regroupés sous la clé ``template`` avec comme sous-clé le nom
du fichier de template:

.. code-block:: yaml
  
  # options précédentes `book`, `chords`...
  
  template:
    patacrep.tex:
      color:
        songlink: FF0000
        hyperlink: 0000FF
      bgcolor:
        note: D1E4AE
        songnumber: AED1E4
        index: E4AED1

Template :file:`default.tex`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

// TODO

.. tabularcolumns:: |l|L|L|L|

================== =========================== ============================================= ===========================
Option             Description                 Type                                          Valeur par défaut
================== =========================== ============================================= ===========================
instruments        instruments à afficher      Liste de chaînes de caractères parmi :        ``["guitar"]``
                                               ``guitar``, ``ukulele``
booktype           Type de recueil             Chaîne de caractères, parmi :                 ``"chorded"``
                                               ``chorded`` (avec accords) ou
                                               ``lyric`` (paroles uniquement)
bookoptions        éléments à afficher         Liste de chaînes de caractères parmi :        ``["diagram", "pictures"]``
                                               ``lilypond`` (partitions lilypond),
                                               ``diagram`` (diagrammes d'accords),
                                               ``importantdiagramonly`` (diagrammes
                                               importants uniquement),
                                               ``onesongperpage`` (une chanson par page),
                                               ``pictures`` (couvertures des albums),
                                               ``repeatchords`` (répéter les accords),
                                               ``tabs`` (tablatures)
classoptions       options passées à la        liste de chaînes de caractères                ``[]``
                   commande ``\documentclass``
                   du document LaTeX principal
notenamesout       Nom des notes               chaîne de caractères parmi :                  ``"solfedge"``
                                               ``solfedge`` (Do, Ré, Mi...) et
                                               ``alphascale`` (A, B, C...)
lang               langue du recueil           ``french``, ``english``, etc.                 ``"english"``
title              titre du recueil            chaîne de caractères                          ``"Recueil de chansons pour guitare"``
author             auteur du recueil           chaîne de caractères                          ``"L'équipe Patacrep"``
================== =========================== ============================================= ===========================

Template :file:`patacrep.tex`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabularcolumns:: |l|L|L|L|

================== =========================== =================================== =================
Option             Description                 Type                                Valeur par défaut
================== =========================== =================================== =================
titleprefixwords   *idem*                      *idem*                              ``["The", "Le", "La", "L'", "A", "Au", "Ces", "De", "Des", "El", "Les", "Ma", "Mon", "Un"]}``
songnumberbgcolor  couleur des numéros des     code hexadécimal                    ``"D1E4AE"``
                   chansons
notebgcolor        couleur des notes dans      code hexadécimal                    ``"D1E4AE"``
                   les chansons
indexbgcolor       couleur des liens dans      code hexadécimal                    ``"D1E4AE"``
                   l'index
subtitle           sous-titre du recueil       chaîne de caractères                           *vide*
version            version du recueil          chaîne de caractères                          ``"undefined"`` *(la version n'est alors pas indiquée)*
web                adresse du site web du      chaîne de caractères                          ``"http://www.patacrep.com"``
                   recueil
mail               adresse électronique        chaîne de caractères                          ``"crep@team-on-fire.com"``
                   associée au recueil

picture            image de la page de garde   chemin vers image, au format                  ``"treble_a.png"``
                                               ``jpg``, ``png`` ou ``pdf``
picturecopyright   copyright de l'image        chaîne de caractères                          ``"Dbolton \\url{http://commons.wikimedia.org/wiki/User:Dbolton}"``
footer             pied de page de la page     chaîne de caractères                          ``"Generated using Songbook (\\url{http://www.patacrep.com})"``
                   de garde
================== =========================== =================================== =================


