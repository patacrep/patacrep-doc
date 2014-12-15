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

Quelques options ne peuvent pas être laissées vides, et doivent avoir une
valeur par défaut. Celle-ci est inscrite *en dur* dans le code source de
:py:mod:`patacrep`, et est donnée dans la liste des options ci-dessous.


Templates
---------

Les templates permettent de définir des valeurs particulières à certaines
options. Par exemple, pour réaliser une collection de recueils, il est possible
d'en définir les caractéristiques générales dans un template particulier. Les
options prenant des valeurs différentes pour chacun des recueils sont définies
dans les fichiers :file:`.sb`. Ceci signifie qu'en écrivant le template adéquat,
il est possible de définir de nouvelles options de mise en page (plus
d'information dans la :ref:`partie correspondante <templates>`).

Fichier :file:`.sb`
-------------------

La majeure partie de la personalisation d'un carnet est effectuée à cet endroit.
Un fichier :file:`.sb` contient un dictionnaire JSON, dont les clefs sont des options
et les valeurs les valeurs prisent par ces options. Losrqu'un fichier :file:`.sb`
est compilé par :py:mod:`patacrep`, tous les mots clefs en dehors de ``"content"``
sont transmis au gestionnaire de mise en page.

Ces options ne s'appliquent qu'à un carnet de chant particulier.

.. _options:

Liste des options
-----------------

Les valeurs par défaut sont données ici en supposant que la langue principale
du recueil est le français.

Définies hors des templates
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabularcolumns:: |l|L|L|L|

================= =========================== =================================== =================
Option            Description                 Type                                Valeur par défaut
================= =========================== =================================== =================
content           contenu à inclure dans le   liste, décrite dans la section      ``[]``
                  recueil                     :ref:`content`
encoding          encodage des fichiers       chaîne de charactères               ``""``
                  à lire (chansons,
                  templates, etc.).

                  Si aucune valeur n'est
                  renseignée, ``patacrep``
                  essaye de deviner
                  l'encodage des fichiers.

template          template à utiliser         nom d'un fichier présent dans un    ``"default.tex"``
                                              dossier :file:`templates`
titleprefixwords  Mots à ignorer dans le      liste de chaînes de caractères      ``[]``
                  classement des chansons
authwords         Options pour traiter les    dictionnaire de listes de chaînes   ``{"after": ["by"], "ignore": ["unknown"], "sep": ["and"]}``
                  noms d'auteurs (commandes   de caractères, dont les clefs
                  LaTeX ``authsepword``       sont ``sep``,
                  (sépatareurs de noms),      ``ignore`` et
                  ``authignoreword`` (noms à  ``after``
                  ignorer), ``authbyword``
                  (mots introduisant les
                  noms des auteurs)).
================= =========================== =================================== =================

Template :file:`default.tex`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
