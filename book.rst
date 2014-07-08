.. _songbook:

Recueil
=======

Introduction
------------

Le cœur d'un recueil est un ensemble de chansons, mais il peut être accompagné
d'autres éléments : index des chansons ou auteurs, page de titre, liste
d'accords, préface, etc.

Un recueil est décrit par un fichier :file:`.sb` (détaillé :ref:`ci-après <sb>`).
Il est généré par ``songbook`` en assemblant des fichiers de chansons :file:`.sg`,
des templates :file:`.tex`, des fichiers LaTeX :file:`.tex`, des images, etc.
Tout ce contenu est placé dans des dossiers de donnée appelés :ref:`datadir <datadir>`.

Un carnet fini, au format PDF, est la jonction d'un contenu et d'une mise en
page particulière. Les options qui gouvernent cette mise en page sont
principalement décrites dans les :ref:`templates`. Les différentes manières
d'ajouter du contenu à un carnet sont décrites dans la section :ref:`contenu`.

Exemple
-------

Un exemple de fichier :file:`.sb` est fourni `avec le code source
TODO remplacer avec le blob de la version 4.0.0
<https://github.com/patacrep/patacrep/blob/master/patacrep/data/examples/example.sb>`_ :

.. code-block:: json

    {
    "bookoptions" : [
        "importantdiagramonly",
        "repeatchords",
        "lilypond",
        "pictures"
      ],
    "booktype" : "chorded",
    "lang" : "french",
    "authwords" : {
      "sep" : ["and", "et"]
      },
    "content" : [
      ["section", "Traditional"],
      "chevaliers_de_la_table_ronde.sg",
      "greensleeves.sg",
      "vent_frais.sg",
      ["section", "Example"],
      "example*.sg",
      "example*.sg"
      ]
    }

La syntaxe de ce fichier sera détaillée dans la section :ref:`sb`.


.. _datadir:

Répertoires
-----------

La bibliothèque :py:mod:`patacrep` va chercher des information dans un ensemble de
répertoires, relatif à un répertoire de base (nommé :file:`datadir`). Plusieurs
:file:`datadir` peuvent être définis : si le fichier requis n'est pas trouvé dans le
premier :file:`datadir`, il est cherché dans le second, et ainsi de suite.

Les sous-répertoires de ces :file:`datadir` sont les suivants.

:file:`img`
  Ce répertoire contient des images qui peuvent être incluses à l'aide de la
  commande :

  .. code-block:: latex

    \includegraphics{image.png}

  Ce répertoire est automatiquement inclus dans la liste des répertoires dans
  lesquels ``\includegraphics`` va chercher les images : pour les fichiers de
  ce répertoire, il n'est donc pas nécessaire de préciser leur chemin d'accès
  absolu.

:file:`latex`
  Ce répertoire peut contenir des fichiers LaTeX (:file:`.tex` ou :file:`.sty`). Lors
  d'inclusion de fichiers, ou de chargement de paquets. C'est dans ce
  répertoire que vous pouvez mettre les fichiers de paquets LaTeX qui ne sont
  pas inclus avec votre distribution.

:file:`songs`
  Les chansons pouvant être incluses dans le carnet de chant sont dans ce
  répertoire. Aucune organisation spécifique n'est imposée à l'intérieur de ce
  répertoire.

:file:`templates`
  Comme son nom l'indique, les :ref:`templates <templates>` sont recherchés
  dans ce répertoire.

:file:`python`
  Dans ce répertoire peuvent être placés des modules Python complémentaires.
  Pour le moment, ceci est uniquement utilisé pour :ref:`écrire ses propres
  plugins <plugins_write>`.

Options
-------

La plupart des options ne sont pas traitées d'une manière spécifique par
:py:mod:`patacrep` : elles ne font que peupler la variable correspondante dans le
template. Quelques-unes d'entre elles (comme ``content`` par exemple sont
manipulées explicitement par :py:mod:`patacrep`). Ceci signifie qu'en écrivant le
template adéquat, il est possible de définir de nouvelles options (plus
d'information dans la :ref:`partie correspondante <templates>`).

Il existe différentes manières de définir les options utilisées pour générer le
carnet de chant. Nous les donnons ici par ordre de priorité décroissante.

Valeurs par défaut
^^^^^^^^^^^^^^^^^^

Quelques options ne peuvent pas être laissées vides, et doivent avoir une
valeur par défaut. Celle-ci est inscrite *en dur* dans le code source de
:py:mod:`patacrep`, et est donnée dans la liste des options ci-dessous.


Templates
^^^^^^^^^

Les templates permettent de définir des valeurs particulières à certaines
options. Par exemple, pour réaliser une collection de recueils, il est possible
d'en définir les caractéristiques générales dans un template particulier. Les
options prenant des valeurs différentes pour chacun des recueils sont définies
dans les fichiers :file:`.sb`.

La syntaxe de ces options est décrite dans la partie :ref:`templates`.

.. _sb:

Fichier :file:`.sb`
^^^^^^^^^^^^^^^^^^^

Ces options ne s'appliquent qu'à un carnet de chant particulier.

Un fichier :file:`.sb` est écrit au format `JSON`. Il contient un dictionnaire, dont
les clefs sont les noms des options, et les valeurs associées sont les valeurs
de ces options. Le type des valeurs dépend de l'option considérée, et est
détaillé dans la section suivante.

.. _options:

Liste des options
^^^^^^^^^^^^^^^^^

Les valeurs par défaut sont données ici en supposant que la langue principale
du recueil est le français.

Définies hors des templates
"""""""""""""""""""""""""""

.. tabularcolumns:: |l|L|L|L|

================= =========================== =================================== =================
Option            Description                 Type                                Valeur par défaut
================= =========================== =================================== =================
content           contenu à inclure dans le   liste, décrite dans la section      ``[]``
                  recueil                     :ref:`contenu`
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
                  noms des auteurs).
================= =========================== =================================== =================

Template :file:`default.tex`
""""""""""""""""""""""""""""

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
subtitle           sous-titre du recueil       chaîne de caractères                           *vide*
version            version du recueil          chaîne de caractères                          ``"undefined"``
web                adresse du site web du      chaîne de caractères                          ``"http://www.patacrep.com"``
                   recueil
mail               adresse électronique        chaîne de caractères                          ``"crep@team-on-fire.com"``
                   associée au recueil

picture            image de la page de garde   chemin vers image, au format                  ``"treble_a.png"``
                                               ``jpg``, ``png`` ou ``pdf``
picturecopyright   copyright de l'image        chaîne de caractères                          ``"Dbolton \\url{http://commons.wikimedia.org/wiki/User:Dbolton}"``
footer             pied de page de la page     chaîne de caractères                          ``"Generated using Songbook (\\url{http://www.patacrep.com})"``
                   de garde
================== =========================== ============================================= ===========================

Template :file:`patacrep.tex`
"""""""""""""""""""""""""""""

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
================== =========================== =================================== =================

.. _contenu:

Contenu
-------

Cette partie décrit comment insérer des chansons dans un recueil.

Introduction
^^^^^^^^^^^^

Le contenu d'un recueil est défini avec l'option ``content`` du fichier
:ref:`.sb <sb>`, sous la forme d'une liste. Le type de cette liste dépend du
contenu à inclure. Voici un exemple de contenu.

.. code-block:: json

  {
  "content": [
                ["tex", "intro.tex"],
                ["section", "Chansons à boire"],
                ["song", "boire/*.sg"],
                ["section", "Chansons d'amour"],
                ["sorted(by, @title)", "amour/*.sg"]
              ]
  }

Comme nous pouvons le voir, la valeur de ``content`` est une liste de listes.
Le premier élément de chacune de ces sous-listes est une chaîne indiquant le
type de contenu considéré : par exemple, ``["section", "Chansons à boire"]`` va
créer une section ayant pour titre *Chansons à boire*, tandis que
``["sorted(by, @title)", "amour/*.sg"]`` va inclure toutes les chansons du
répertoire ``amour/*.sg``, triées par auteur, puis par titre.

Pour alléger les notations, une chaîne de caractères à la place d'une
sous-liste correspond à l'inclusion d'une chanson, et une liste vide correspond
à l'inclusion de toutes les chansons du répertoire :file:`songs`.

Ainsi, les deux contenus suivants sont équivalents.

.. code-block:: json

  {
  "content": [
               ["section", "Chansons à boire"],
               "boire/*.sg",
             ]
  }

.. code-block:: json

  {
  "content": [
               ["section", "Chansons à boire"],
               ["song", "boire/*.sg"],
             ]
  }

En pratique, on utilisera souvent un des deux `content` suivant, le premier
pour inclure toutes les chansons (fichiers :file:`.sg`) trouvées dans le répertoire
:file:`songs` (en fait, ne pas mentionner du tout l'option `content` dans le fichier
:file:`.sb` est équivalent à cette forme) :

.. code-block:: json

  {
  "content": []
  }

et le second pour inclure toutes ces chansons, triées pas auteur, album puis
titre (c'est le tri par défaut) :

.. code-block:: json

  {
  "content": [["sorted"]]
  }

La structure générale d'un élément de contenu est le suivant ``["keyword",
contentlist]`` ou ``["keyword(arguments)", contentlist]``, où:

``keyword``
  est un mot clef, précisant le type de contenu

``arguments``
  est un argument, optionnel, au mot-clef. Il est passé tel quel, sans analyse,
  au moteur gérant ce mot-clef, et son type et sa forme dépendent du mot-clef.

``contentlist``
  est la suite de la liste (éventuellement vide). Encore une fois, c'est le
  moteur gérant ce mot clef qui la traite, et sa signification dépend du mot
clef.


Plugins
^^^^^^^

Les types de contenus gérés par :py:mod:`patacrep` sont fournis par des extensions (ou
plugins). Un certain nombre (décrits ci-après) sont proposés par défaut, et il
est possible d'en écrire d'autres.

:py:mod:`song` : liste de chansons
  Ce plugin, utilisé par défaut, permet d'inclure une liste de chansons, triées
  par ordre alphabétique du nom de fichier. L'unique mot-clef de ce plugin est
  ``song``, qui ne prend pas d'arguments. Il est suivi d'une liste
  d'expressions régulières correspondant aux noms de fichiers à inclure. La
  syntaxe précise de ces expressions est décrite dans la documentation du
  module `glob <https://docs.python.org/2/library/glob.html>`_ ; la base est
  que :file:`/` est utilisé pour parcourir les répertoires, :file:`..` correspond au
  répertoire parent, et :file:`*` à n'importe quelle chaîne de caractères.

  Exemple : ``["song", "premiere.sg", "boire/*.sg"]``.

.. _plugin_sorted:

:py:mod:`sorted` : liste triée de chansons
  Ce plugin permet l'inclusion de chansons, triées selon un certain ordre.
  L'unique mot-clef de ce plugin est ``sorted``. Il prend en argument la liste
  des champs selon lesquels triés. Ces champs correspondent aux `keyvals` de
  l'environnement ``song`` (`documentation
  <http://songs.sourceforge.net/songsdoc/songs.html#sec5.1>`_), à ceux ajoutés
  par :py:mod:`patacrep`, ainsi que ceux éventuellement ajoutés par le template
  courant, et à des champs spéciaux. cela donne finalement :

  Paquet `songs <http://songs.sourceforge.net>`__


    ========== ===========
    Nom        Description
    ========== ===========
    by         auteurs
    cr         informations de copyright
    li         licence
    sr         référence à la bible (le paquet `songs` a été écrit à l'origine pour des chants religieux)
    index      une entrée supplémentaire dans l'index pour un vers
    ititle     une entrée supplémentaire dans l'index pour un titre
    ========== ===========

  Paquet `patacrep`

    ========== ===========
    Nom        Description
    ========== ===========
    album      Album
    original   Titre original
    cov        Chemin de l'image de couverture (relative au répertoire du fichier :file:`.sg`)
    vcov       Chemin de l'image de couverture
    url        URL de la chanson
    ========== ===========

  Valeurs spéciales

    ========== ===========
    Nom        Description
    ========== ===========
    @title     Titres
    @path      Chemin du fichier
    ========== ===========

  L'ordre de tri par défaut est : auteurs, album, titre.

  Il faut remarque la liste de contenu de ``sorted`` n'est pas nécessairement
  une liste d'expression régulière : c'est n'importe quel élément de contenu
  qui renvoie une liste de chansons. Ainsi (en utilisant le plugin :py:mod:`cwd`
  décrit ci-après), ``["sorted", ["cwd(repertoire)", "*.sg"]]`` est une liste
  de contenu parfaitement valide.

  Une conséquence de cela est que donner une liste vide ``["sorted"]`` permet
  d'inclure toutes les chansons du répertoire :file:`songs`, récursivement.

  Exemple : ``["sorted(by, @title)", "boire/*.sg", "amour/*.sg"]``.

:py:mod:`cwd` : changement de répertoire
  Lorsque plusieurs chansons du même répertoire sont incluses, il peut être
  fastidieux de redonner le chemin complet à chaque fois. Ce plugin permet de
  s'éviter ce travail. Les deux valeurs suivantes de la variable ``content``
  sont équivalentes : ``["des/repertoires/vers/chanson1.sg",
  "des/repertoires/vers/chanson2.sg", "des/repertoires/vers/chanson3.sg"]`` et
  ``["cwd(des/repertoires/vers)", "chanson1.sg", "chanson2.sg",
  "chanson3.sg"]``.

  Cette commande permet aussi de s'affranchir du répertoire :file:`songs`, dans
  lequel sont cherchées les chansons par défaut. La commande
  ``["cwd(repertoire)", "*.sg"]`` va inclure toutes les chansons
  :file:`repertoire/*.sg` puis, seulement si aucune chanson n'a été trouvée, toutes
  les chansons de :file:`songs/repertoire/*.sg`.

  Enfin, il faut remarque que, tout comme le plugin :py:mod:`sorted`, la liste de
  contenu de :py:mod:`cwd` n'est pas limitée à une liste d'expressions régulières
  correspondant à des chansons : elle peut être n'importe quel contenu
  correspondant à une liste de chansons. La commande ``["cwd(repertoire)",
  ["sorted", "*""]]`` est donc valide. De plus, la commande
  ``["cwd(repertoire)"]`` permet d'inclure toutes les chansons (récursivement)
  comprises dans le répertoire :file:`repertoire`.

  Exemple : ``["cwd(repertoire)", "chanson1.sg", "chanson2.sg", "chanson3.sg"]]``

:py:mod:`section` : sections LaTeX
  Ce plugin permet d'inclure des sections (et chapitres, paragraphes, etc.).
  Les mots-clefs sont ``part``, ``chapter``, ``section``, ``subsection``,
  ``subsubsection``, ``paragraph``, ``subparagraph``, ainsi que leurs versions
  étoilées.

  Ces mots-clefs ne prennent pas d'arguments, et ont pour contenu une chaîne de
  caractères (le titre), ou deux pour les versions non étoilées (le titre, et
  le titre court pour la table des matières).

  Exemple : ``["chapter", "Chansons d'amour"]``

:py:mod:`songsection` : sections du paquet `songs <http://songs.sourceforge.net>`__
  Ce plugin introduit deux mots-clefs ``songchapter`` et ``songsection``, qui
  correspondent aux sections et chapitres définis par le paquet `songs`. Le
  style de ces sections est plus cohérent avec l'apparence des chansons,
  mais elles ne sont pas numérotées, et il n'y a pas de version étoilée.

  Exemple : ``["songchapter", "Chansons d'amour"]``

.. _plugin_tex:

:py:mod:`tex` : inclusion de fichiers LaTeX quelconques
  Il est possible avec ce plugin d'inclure un fichier LaTeX quelconque.
  L'unique mot-clef ``tex`` ne prend pas d'arguments, et sa liste de contenu
  est une liste de fichiers latex à inclure dans le recueil.

  Exemple : ``["tex", "intro.tex"]``

:py:mod:`include`: inclusion de contenu au format ``json``.
  TODO Voir https://github.com/patacrep/patacrep/pull/53

.. _plugins_write:

Créer son propre plugin
^^^^^^^^^^^^^^^^^^^^^^^

Dans toute la suite, nous allons créer un plugin :py:mod:`foo`, associé au mot-clef
``foo``, qui écrit dans le recueil les arguments et contenu associé, quasiment
sans traitement. Ce plugin se présente sous la forme d'un fichier :file:`foo.py` (le
nom de fichier est libre), présent dans un sous répertoire :file:`python/content`
d'un :file:`datadir`.

Définition
""""""""""

Un plugin se présente sous la forme d'un fichier Python, présent dans un
répertoire :file:`python/content` (relativement à un des :file:`datadir`). Ce fichier doit
contenir une variable :py:data:`CONTENT_PLUGIN`, qui est un dictionnaire dont les
clefs sont des mots-clefs, et les valeurs des fonctions :ref:`parse <parse>`.

Lors de la compilation du recueil, lors de l'analyse de la variable ``content``
du fichier :file:`.sb`, lorsqu'un de ces mots-clefs est rencontré, la fonction
:py:func:`parse` correspondante est appelée.

Notre plugin d'exemple contient donc le code suivant (où :py:func:`parse` est une
fonction, définie plus tôt dans le fichier, dont nous allons parler dans la
partie suivante).

.. code-block:: python

  CONTENT_PLUGIN = {'foo': parse}

Classe :py:class:`content.Content`
""""""""""""""""""""""""""""""""""

L'objet qui produit quelque chose dans le recueil est une instance de la classe
:py:class:`content.Content`. La méthode d'initialisation est libre, et la méthode
principale est la méthode :py:meth:`content.Content.render`, qui prend en
argument le `contexte <http://jinja.pocoo.org/docs/api/#the-context>`_ courant,
et renvoie une chaîne de caractères à inclure dans le fichier :file:`.tex`.

Plus de détails sur cette classe (ainsi que sur les autres méthodes utilisées)
sont disponibles dans le docstring de `cette classe TODO(remplacer le lien par
le blob vers la version 4.0.0)
<https://github.com/patacrep/patacrep/blob/master/patacrep/content/__init__.py#L84>`_.

Pour notre exemple, nous allons définir une nouvelle classe :py:class:`Foo`,
héritant de cette classe :py:class:`content.Content`.

.. code-block:: python

  from patacrep.content import Content

  class Foo(Content):

    def __init__(self, arguments, contentlist):
      """Fonction d'initialisation

      Le moteur de plugin ne va pas appeler cette fonction directement : chaque
      plugin est donc libre de définir cette initialisation comme il l'entend.
      """
      self.arguments = arguments
      self.contentlist = contentlist

    def render(self, __context):
      return self.arguments + str(self.contentlist)


.. _parse:

Fonction :py:func:`parse`
"""""""""""""""""""""""""

La fonction :py:func:`parse` est appelée lorsque le mot clef est rencontré,
avec comme arguments :

`keyword`
  le mot clef ayant déclenché l'appel à cette fonction ;
`argument`
  l'argument passé au mot-clef ;
`contentlist`
  la suite de la liste du contenu
`config`
  le dictionnaire contenant la configuration du recueil en cours de
  construction. Le modifier est autorisé.

Ainsi, si le contenu du recueil comprend ``["foo(bar)", "one", "two",
"three"]``, notre fonction :py:func:`parse` sera appelée avec comme arguments
:samp:`parse('foo', 'bar', ['one', 'two', 'three'], config)`.

Cette fonction doit retourner une liste (éventuellement vide) d'objets de
classe :py:class:`content.Content` (ou une de ces sous-classes). Ces objets seront
intégrés au recueil (en utilisant principalement leur méthode
:py:meth:`content.Content.render`) dans l'ordre dans lequel ils apparaissent
dans cette liste.

Notre fonction va donc être la suivante :

.. code-block:: python

  def parse(keyword, argument, contentlist, config):
    return [Foo(argument, contentlist)]

Bilan
"""""

Notre plugin est maintenant fonctionnel. Il va être appelé si la variable
``content`` du recueil contient par exemple ``["foo(bar)", "one", "two",
"three"]``.

.. _templates:

Templates
---------

TODO

Templates par défaut
^^^^^^^^^^^^^^^^^^^^

TODO

:file:`layout.tex`
  TODO

:file:`songs.tex`
  TODO

:file:`default.tex`
  TODO

:file:`patacrep.tex`
  TODO

Syntaxe
^^^^^^^

(sans réinventer la documentation de jinja2)

TODO

Créer son propre template
^^^^^^^^^^^^^^^^^^^^^^^^^

TODO
