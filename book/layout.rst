.. _layout:

Mise en page du carnet
=================================

La mise en page des carnets est gérée par un système d'options : il est possible
de spécifier la taille et l'orientation du papier, le type de police des accords,
*etc.* en mettant le bon mot clef dans un fichier :file:`.yaml`. 

La plupart des options peuvent être omises : elle prendront alors une
valeur par défaut, documentée ci-dessous.


Exemple de fichier :file:`.yaml`
--------------------------------

Un fichier :file:`.yaml` contient un dictionnaire YAML, dont les clefs sont les noms
des options et leur valeur associée pour la mise en page.
Le mot-clef ``content`` ne gère pas la mise en page, mais le :ref:`contenu du carnet <content>`.

Voici par exemple le fichier :file:`.yaml` qui fournit les options par défaut :

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
  content:

.. _options:

Liste des options
-----------------

Les valeurs par défaut sont données ici en supposant que **la langue principale
du carnet est le français**.

Options générales
^^^^^^^^^^^^^^^^^

Ce sont des sous-clés de la clé ``book``.


lang
````
Langue du carnet (Code ISO 639-1 à 2 lettres).

* Défaut: ``en``
* Type: Chaîne de charactères
* Valeurs: ``fr`` et ``en`` sont actuellement supportés


onesongperpage
``````````````
Commencer toutes les chansons sur une nouvelle page.

* Défaut: ``no``
* Type: Booléen


pictures
````````
Afficher les couvertures des albums.

* Défaut: ``yes``
* Type: Booléen


template
````````
Template de carnet à utiliser.

* Défaut: ``patacrep.tex``
* Type: Chaîne de charactères
* Valeurs: Voir le dossier ``templates`` des datadirs pour les autres fichiers disponibles


encoding
````````
Encodage des fichiers à lire (chansons, templates, etc.). Peut aider à résoudre des problèmes d'accentuation.

* Défaut: ``utf-8``
* Type: Chaîne de charactères


Options musicales
^^^^^^^^^^^^^^^^^

Ce sont des sous-clés de la clé ``chords``.

show
````
Afficher les accords au sein des paroles.

* Défaut: ``yes``
* Type: Booléen


diagramreminder
```````````````
Rappeler en début de chansons certains diagrammes d'accords.

* Défaut: ``important``
* Type: Chaîne de charactères
* Valeurs:

  - ``all`` : Rappel de tous les accords présents dans le chant
  - ``important`` : Rappel des accords peu communs du chant
  - ``none`` : Aucun rappel d'accords


diagrampage
```````````
Insérer une page d'accords en début de carnet.

* Défaut: ``yes``
* Type: Booléen


repeatchords
````````````
Afficher les accords dans tous les couplets (disponible uniquement pour certains chants).

* Défaut: ``yes``
* Type: Booléen


lilypond
````````
Inclure les partitions musicales (nécéssite le logiciel libre lilypond).

* Défaut: ``no``
* Type: Booléen


tablatures
``````````
Inclure les tablatures.

* Défaut: ``no``
* Type: Booléen


instrument
``````````
Instrument pour lequel il faut rappeler les accords.

* Défaut: ``guitar``
* Type: Chaîne de charactères
* Valeurs:

  - ``guitar`` : Guitare
  - ``ukulele`` : Ukulélé


notation
````````
Notation des accords.

* Défaut: ``solfedge``
* Type: Chaîne de charactères, ou liste de sept chaînes de caractères.
* Valeurs:

  - ``alphascale`` : Système internanial ABCDEFG
  - ``solfedge`` :  Système français Do Ré Mi
  - liste : Liste des noms des notes, en commençant par La. Ainsi, par exemple, ``solfedge`` est équivalent à ``['La', 'Si', 'Do', 'Ré', 'Mi', 'Fa', 'Sol']``.


Analyse des auteurs
^^^^^^^^^^^^^^^^^^^

Ce sont des sous-clés de la clé ``authors``.


separators
``````````
Mots qui séparent les noms d'artistes. Par exemple, si cette option contient ``et``, une chanson ayant comme artiste ``Georges Brassens et Charles Trenet`` apparaitra dans l'index à la fois à ``Brassens`` et ``Trenet``.

* Défaut: ``- and``
* Type: Tableau de mots


ignore
``````
Noms d'artistes à ignorer. Permet par exemple de spécifier que l'auteur d'une chanson est inconnu, sans pour autant avoir ``Anonyme`` apparaitre dans l'index.

* Défaut: ``- unknown``
* Type: Tableau de mots


after
`````
Mots introduisant les noms des auteurs. Par exemple, si cette option contient ``de``, une chanson ayant comme artiste ``Musique de Jean Boyer, chantée par Georges Brassens`` apparaitra dans l'index à la fois à ``Jean Boyer`` et ``Georges Brassens``.

* Défaut: ``- by``
* Type: Tableau de mots


Analyse des titres
^^^^^^^^^^^^^^^^^^^

Ce sont des sous-clés de la clé ``titles``.


prefix
``````
Préfixe à ignorer lors du tri des titres (notamment dans l'index).

* Défaut:

.. code-block:: yaml

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

* Type: Tableau de mots


Options des templates
---------------------

Certains options sont propres aux templates utilisés. Par exemple le template
:file:`patacrep.tex` (qui inclut notamment :file:`default.tex`) permet de personnaliser
certaines couleurs et la page de garde.

Les options des templates sont regroupées sous la clé ``template`` avec comme sous-clé le nom
du fichier de template:

.. code-block:: yaml
  
  # options précédentes `book`, `chords`...
  
  template:
    default.tex:
      title: "Recueil de chansons pour guitare"
      author: "L'équipe Patacrep"
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


title
`````
Titre du carnet de chants.

* Défaut: ``"Recueil de chansons pour guitare"``
* Type: Chaîne de charactères


author
``````
Auteur du carnet de chants.

* Défaut: ``"L'équipe Patacrep"``
* Type: Chaîne de charactères


classoptions
````````````
Options de la classe LaTeX.

* Défaut: *(vide)*
* Type: Chaîne de charactères


Template :file:`patacrep.tex`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


subtitle
````````
Sous-titre du carnet (pour la page de garde).

* Défaut: *(vide)*
* Type: Chaîne de charactères


version
````````
Version du carnet (pour la page de garde).

* Défaut: *(vide)*
* Type: Chaîne de charactères


url
```
Site web de l'auteur (pour la page de garde).

* Défaut: ``"http://www.patacrep.com"``
* Type: Chaîne de charactères


email
`````
Courriel de l'auteur (pour la page de garde).

* Défaut: ``"crep@team-on-fire.com"``
* Type: Chaîne de charactères


picture
```````
Image pour la page de garde.

* Défaut: ``"img/treble_a"``
* Type: Chaîne de charactères


picturecopyright
````````````````
Copyright pour l'image de la page de garde.

* Défaut: ``"Dbolton \\url{http://commons.wikimedia.org/wiki/User:Dbolton}"``
* Type: Chaîne de charactères


footer
``````
Pied de page de la page de garde.

* Défaut: ``"Créé avec le programme Songbook (\\url{http://www.patacrep.com})"``
* Type: Chaîne de charactères


color: songlink
```````````````
Couleur des liens vers les chants.

* Défaut: ``4e9a06``
* Type: Couleur en hexadécimal


color: hyperlink
````````````````
Couleurs des liens hypertextes.

* Défaut: ``204a87``
* Type: Couleur en hexadécimal


bgcolor: songnumber
```````````````````
Couleur de fond des numéros de chants.

* Défaut: ``D1E4AE``
* Type: Couleur en hexadécimal


bgcolor: note
`````````````
Couleur de fond des indications.

* Défaut: ``D1E4AE``
* Type: Couleur en hexadécimal


bgcolor: index
``````````````
Couleur de fond des lettres de l'index.

* Défaut: ``D1E4AE``
* Type: Couleur en hexadécimal

