Introduction
============

Le cœur d'un recueil est un ensemble de chansons, mais il peut être accompagné
d'autres éléments : index des chansons ou auteurs, page de titre, liste
d'accords, préface, etc.

Un recueil est décrit par un fichier :file:`.sb` (détaillé :ref:`ci-après <sb>`).
Il est généré par ``songbook`` en assemblant des fichiers de chansons :file:`.sg`,
des templates :file:`.tex`, des fichiers LaTeX :file:`.tex`, des images, etc.
Tout ce contenu est placé dans des dossiers de donnée appelés :ref:`datadir <datadir>`.

Un carnet fini, au format PDF, est la jonction d'un contenu et d'une mise en
page particulière. Les options qui gouvernent cette mise en page sont
principalement décrites dans les :ref:`templates <layout>`. Les différentes manières
d'ajouter du contenu à un carnet sont décrites dans la section :ref:`content`.

.. _example:

Exemple de fichier :file:`.sb`
------------------------------

Un exemple de fichier :file:`.sb` est fourni `avec le code source
TODO remplacer avec le blob de la version 4.0.0
<https://github.com/patacrep/patacrep/blob/master/examples/example.sb>`_ :

.. code-block:: yaml

	content:
	  - section: "Chants Traditionnels"
	  - "chevaliers_de_la_table_ronde.sg"
	  - "greensleeves.sg"
	  - "vent_frais.sg",
	  - section: "Exemples"
	  - "exemple*.sg"
	  
	book:
	  lang: en
	  encoding: utf-8
	  pictures: yes
	  template: default.tex
	  onesongperpage: no

	chords: # Options relatives aux accords
	  show: yes
	  diagramreminder: important
	  diagrampage: yes
	  repeatchords: yes
	  lilypond: no
	  tablatures: no
	  instrument: guitar
	  notation: alphascale

	authors: # Comment sont analysés les auteurs
	  separators:
	  - and
	  ignore:
	  - unknown
	  after:
	  - by

	titles: # Comment sont analysés les titres
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

.. _sb:

Syntaxe des fichiers :file:`.sb`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Un fichier :file:`.sb` est écrit au format `YAML`. Le format YAML est un type de fichier
texte dans lequel on représente des information de trois manières différentes :

  - les listes sont des listes d'éléments ordonnés : chaque élément commence sur une nouvelle ligne, précédé d'un tiret ``-``. Tous les élements d'une même liste doivent avoir la même indentation (décalage à depuis le bord gauche) ;
  - les tableaux associatifs composé de multiples *clef/valeur*, les clefs étant la plupart du temps des chaînes, et les valeurs pouvant être n'importe quel type de données accepté par YAML.
  - les données scalaires : chaînes de charactère (délimitées par des guillemets anglais ``"..."``), nombre, booléen (``yes``/``no``);


Le fichier :file:`.sb` contient un tableau associatif, dont les clefs sont les noms d'options, et les valeurs associées 
sont les valeurs de ces options. Le type des valeurs dépend de l'option considérée, et est
détaillé dans la section sur la :ref:`mise en page <layout>`. Une option est un peu spéciale, il 
s'agit de l'option ``"content"``, qui traduit le contenu du futur carnet de chants. Sa syntaxe est 
détaillé dans la partie sur le :ref:`contenu des carnets <content>`.


.. _build_songbook:

Compiler un fichier :file:`.sb`
-------------------------------

Le fichier :file:`carnet.sb` peut être compilé (*ie* transformé en fichier PDF)
en ligne de commande, avec la commande suivante : ::

  songbook chemin/vers/carnet.sb
  
L'intégralité des options de la commande ``songbook`` sont disponible dans
la :ref:`section dédiée <songbookbin>`.

Ecrire ses propres fichiers :file:`.sb`
---------------------------------------

Le contenu d'un carnet est géré par le mot-clef ``content`` d'un fichier :file:`.sb`.
Les différents types de contenus disponibles sont décrits dans la section :ref:`content`.

Tous les autres mots-clefs des fichiers :file:`.sb` servent à faire la mise en page des
carnets. Les options sont présentées dans la section :ref:`layout`.

