.. _content:

Gestion du contenu
==================

Cette partie décrit comment insérer des chansons dans un recueil.

Introduction
^^^^^^^^^^^^

Le contenu d'un recueil est défini avec l'option ``content`` du fichier
:ref:`.yaml <yaml>`, sous la forme d'une liste. Le type de cette liste dépend du
contenu à inclure. Voici un exemple de contenu.


.. code-block:: yaml

    content:
      - tex: "intro.tex"
      - section: "Chansons à boire"
      - "boire/*.csg"
      - section: "Chansons d'amour"
      - sorted:
          key: ["by", "title"]
          content: 
            - "amour/*.csg"
            - "love/*.csg"

Comme nous pouvons le voir, la valeur de ``content`` est une liste de tableaux associatifs
ou de chaînes de caractères.
Une chaîne de caractères est automatiquement transformé en tableau avec une clé ``song``. Ainsi ``"boire/*.csg"`` et ``song: "boire/*.csg"`` sont équivalents.
La *clé* d'un tableau associatif (avant le ``:``) est une chaîne indiquant le
:ref:`type de contenu <content_types>` considéré : par exemple ``section: "Chansons à boire"`` va
créer une section ayant pour titre *Chansons à boire*, tandis que

.. code-block:: yaml

      - sorted:
          key: ["by", "title"]
          content: 
            - "amour/*.csg"
            - "love/*.csg"

va inclure toutes les chansons des répertoires ``amour/*.csg`` et ``love/*.csg``, triées par auteur (``by``), puis par titre (``title``).

Lorsqu'un tableau de type ``content`` n'a pas de contenu, cela va inclure toutes les chansons du répertoire :file:`songs`:

.. code-block:: yaml

  content:

Ou alors pour inclure toutes ces chansons, triées pas auteur, album puis
titre (c'est le tri par défaut) :

.. code-block:: yaml

  content:
    sorted:

.. _content_types:

Types de contenus disponibles
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Les types de contenus gérés par :py:mod:`patacrep` sont fournis par des extensions (ou
plugins). Un certain nombre (décrits ci-après) sont proposés par défaut, et il
est possible d'en écrire d'autres.

:py:mod:`song` : liste de chansons
  Ce plugin, utilisé par défaut en l'absence de mot-clé, permet d'inclure une liste de chansons, triées
  par ordre alphabétique du nom de fichier. Il est suivi d'une ou plusieurs expressions
  rationnelles correspondant aux noms de fichiers à inclure. La syntaxe précise de ces expressions est décrite dans la 
  documentation du module `glob <https://docs.python.org/3.4/library/glob.html>`_ ; le 
  minimum à savoir est que :file:`/` est utilisé pour parcourir les répertoires, :file:`..` 
  correspond au répertoire parent, et :file:`*` à n'importe quelle chaîne de caractères.

  .. code-block:: yaml
  
    content:
      song:
        - "premiere.csg"
        - "boire/*.tsg"
  
  Est équivalent à (mot-clé ``song`` automatique):
  
  .. code-block:: yaml
  
    content:
      - "premiere.csg"
      - "boire/*.tsg"


  Les fichiers sont recherchés successivement dans les datadirs associés 
  à un carnet : :py:mod:`song` commence par chercher dans le repertoire
  :file:`songs` du premier datadir et si au moins un fichier correspond 
  à l'expression rationnelle, stoppe la recherche et passe à l'expression suivante.
  Sinon, il cherche dans le datadir suivant, et ainsi de suite jusqu'à la 
  fin de la liste.

.. _plugin_sorted:

:py:mod:`sorted` : liste triée de chansons
  Ce plugin permet l'inclusion de chansons, triées selon un certain ordre.
  Il prend deux arguments (facultatifs): ``key`` pour la liste
  des champs selon lesquels les chansons de l'argument ``content`` doivent être triées. 
  Ces champs correspondent aux `keyvals` de
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
    cov        Chemin de l'image de couverture (relative ou non au répertoire du fichier :file:`.csg`)
    url        URL de la chanson
    ========== ===========

  Valeurs spéciales

    ========== ===========
    Nom        Description
    ========== ===========
    title      Titres
    path       Chemin du fichier
    ========== ===========

  L'ordre de tri par défaut est : auteurs, album, titre.

  Il faut remarque la liste de contenu de ``sorted`` n'est pas nécessairement
  une liste d'expression rationnelle : c'est n'importe quel élément de contenu
  qui renvoie une liste de chansons. Ainsi (en utilisant le plugin :py:mod:`cwd`
  décrit ci-après) le ``content`` suivant est parfaitement valide.

  .. code-block:: yaml
  
    content:
      sorted:
        content: 
          - cwd:
            path: repertoire
            content: "*.csg"

  Une conséquence de cela est que ne pas donner de ``content`` à  ``sorted`` permet
  d'inclure toutes les chansons du répertoire :file:`songs`, récursivement.

:py:mod:`cd` : changement de répertoire
  Lorsque plusieurs chansons du même répertoire sont incluses, il peut être
  fastidieux de redonner le chemin complet à chaque fois. Ce plugin permet
  d'éviter ce travail. Les deux valeurs suivantes de la variable ``content``
  sont équivalentes : 

  .. code-block:: yaml
  
    content: 
      - cd:
        path: des/repertoires/vers
        content: 
          - "chanson1.csg"
          - "chanson2.csg"
          - "chanson3.csg"
  
  .. code-block:: yaml
  
    content: 
      - "des/repertoires/vers/chanson1.csg"
      - "des/repertoires/vers/chanson2.csg"
      - "des/repertoires/vers/chanson3.csg"

  Cette commande recherche en priorité des chants dans le sous-dossier ``path`` relatif au
  dossier du fichier :ref:`.yaml <yaml>`. Si aucun contenu n'est trouvé, alors les chants
  sont recherché dans le sous-dossier  ``path`` relatif au répertoire :file:`songs` des :ref:`datadir <datadir>` (dans
  lequel sont cherchées les chansons par défaut).

  Enfin, il faut remarquer que, tout comme le plugin :py:mod:`sorted`, la liste de
  contenu de :py:mod:`cd` n'est pas limitée à une liste d'expressions rationnelles
  correspondant à des chansons : elle peut être n'importe quel contenu
  correspondant à une liste de chansons. De plus, la commande
  ``cd`` utlisée sans préciser de ``path`` permet d'inclure toutes les chansons (récursivement)
  comprises dans le répertoire :file:`path`.

  .. code-block:: yaml
  
    content: 
      - "chants_a_boire/*.csg"

  Ne va inclure que les chants situés directement dans le dossier :file:`chants_a_boire`, 
  alors que la command ``cd`` suivante va aussi inclure les chants des sous-dossiers 
  :file:`chants_a_boire/de_l_eau/`, :file:`chants_a_boire/du_vin/`...

  .. code-block:: yaml
  
    content: 
      cwd:
          path: chants_a_boire

:py:mod:`section` : sections LaTeX
  Ce plugin permet d'inclure des sections (et chapitres, paragraphes, etc.).
  Les mots-clefs sont ``part``, ``chapter``, ``section``, ``subsection``,
  ``subsubsection``, ``paragraph``, ``subparagraph``, ainsi que leurs versions
  étoilées (qui ne seront pas numérotées).

  Ces mots-clefs ont pour contenu soit une chaîne de caractères (le titre), 
  soit une valeur ``name`` et une valeur ``short`` pour les versions non étoilées (le titre, et
  le titre court, optionnel, pour la table des matières).

  .. code-block:: yaml
  
    content: 
      chapter: "Chansons d'amour"
      chapter:
        name: "Chansons à boire"
        short: "prosit"

:py:mod:`songsection` : sections du paquet `songs <http://songs.sourceforge.net>`__
  Ce plugin introduit deux mots-clefs ``songchapter`` et ``songsection``, qui
  correspondent aux sections et chapitres définis par le paquet `songs`. Le
  style de ces sections est plus cohérent avec l'apparence des chansons,
  mais elles ne sont pas numérotées, et il n'y a pas de version étoilée.

  Exemple : ``songchapter: "Chansons d'amour"``

.. _plugin_tex:

:py:mod:`tex` : inclusion de fichiers LaTeX quelconques
  Il est possible avec ce plugin d'inclure un fichier LaTeX quelconque.
  L'unique mot-clef ``tex`` prend en argument le ou les fichiers latex à inclure dans le recueil.

  Exemple : ``tex: "intro.tex"``

:py:mod:`include`: inclusion d'un autre fichier de contenu.
  Ce plugin permet d'inclure un autre fichier au format ``YAML`` dans le contenu du
  carnet courant. Ainsi, mettre ``include: "my_content.sbc"`` ira chercher le fichier 
  :file:`my_content.sbc` et placera le contenu de ce fichier dans le carnet principal.
  :file:`my_content.sbc` doit contenir une liste d'éléments de contenu valide. Par exemple, 
  on peut imaginer qu'il contienne ceci :
  
     .. code-block:: yaml
  
        - section: "Chansons à boire"
        - "boire/*.csg"
        - section: "Chansons d'amour"
        - include: "amour.sbc"
  
  En particulier, il peut donc contenir un ou plusieurs autres mot-clef ``"include"``, et 
  il est possible de les trier à postériori:
  
     .. code-block:: yaml

        content:
          - sorted:
              content:
                include: "amour.sbc"
  
  Un cas d'utilisation typique est l'inclusion du même contenu
  dans plusieurs carnets différents. L'extention :file:`.sbc` est arbitraire, et a été choisie
  commme abréviation de "SongBook Content" (contenu de carnet de chants), cependant il est tout
  à fait autorisé d'utiliser d'autres extensions: ``include: "fichier.yaml"``.
  
  Les fichiers inclus de cette manière sont recherchés dans tous les :ref:`datadir <datadir>`
  plus le dossier dans lequel se trouve le fichier dans lequel ``"include"`` a été rencontré.

.. _plugin_addsongdir:

:py:mod:`addsongdir` : ajout d'un dossier à la liste des dossiers à parcourir pour trouver des chansons.
  Le chemin (``path``) est relatif au chemin du fichier ``.yaml``.
  
     .. code-block:: yaml

        content:
          - addsongdir:
              path: "../sous_dossier/"
              content:

.. _plugin_setcounter:

:py:mod:`setcounter` : spécifie le numéro de la prochaine chanson.
  Utile si l'on souhaite qu'une nouvelle section recommence la numérotation à 1
  ou, au contraire, sauter des numéros pour que la section change de centaine par exemple.

  Usage : ``setcounter: 101``
  


Il est possible d'ajouter son propre type de contenu (images, fichiers abc, ...) à un carnet
en écrivant son propre plugin. La procédure est décrite dans la section :ref:`plugins_write`.

Les fichiers utilisés par :py:mod:`patacrep` pour créer des carnets de chant sont rassemblés
dans des dossier qui suivent une organisation particulière. Cette organisation est décrite 
dans la section :ref:`datadir`.
