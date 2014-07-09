.. _content:

Éléments de contenu d'un carnet
===============================

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
  moteur gérant ce mot clef qui la traite, et sa signification dépend du mot-clef.

Types de contenus disponibles
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
  
  TODO : expliquer les règles de recherche des fichiers par "song"

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

:py:mod:`include`: inclusion d'un autre fichier de contenu.
  Ce plugin permet d'inclure un autre fichier au format ``JSON`` dans le contenu du
  carnet courant. Ainsi, mettre ``["include", "my_content.sbc"]`` ira chercher le fichier 
  :file:`my_content.sbc` et placera le contenu de ce fichier dans le carnet principal.
  :file:`my_content.sbc` doit contenir une liste d'éléments de contenu valide. Par exemple, 
  on peut imaginer qu'il contienne ceci :
  
     .. code-block:: json
  
        [
            ["section", "Chansons à boire"],
            "boire/*.sg",
            ["section", "Chansons d'amour"],
            ["include", "amour.sbc"]
        ]
  
  En particulier, il peut donc contenir un ou plusieurs autres mot-clef ``"include"``, et 
  il est possible d'écrire des choses comme ``["sorted(by, @title)", ["include", 
  "chansons_a_boire.sbc"]]``. Un cas d'utilisation typique est l'inclusion du même contenu
  dans plusieurs carnets différents. L'extention :file:`.sbc` est arbitraire, et a été choisie
  commme abréviation de "SongBook Content" (contenu de carnet de chants).
  
  Les fichiers inclus de cette manière sont recherchés dans tous les :ref:`datadir <datadir>`
  plus le dossier dans lequel se trouve le fichier dans lequel ``"include"`` a été rencontré.
   

TODO : Lien vers "Écrire son Plugin" 
TODO : Lien vers Répertoires 
