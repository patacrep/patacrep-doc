.. _latex:

LaTeX
=====

.. warning::

  Afin de détecter les méta-informations de la chanson (titre, auteur, etc.), une analyse syntaxique du préambule du fichier (les arguments de ``\beginsong`` est effectuée. Mais puisque LaTeX est Turing-complet, une vraie analyse syntaxique est très complexe, et dépasse de loin le cadre de ce projet. Patacrep n'est donc capable de lire correctement qu'un sous-ensemble du LaTeX. Il n'y a pas de spécification de ce qui est analysé et ce qui ne l'est pas, mais pour faire simple, si tous les arguments sont entourés d'accolades (``by={Boris Vian}}``) et ne contient aucune commande LaTeX (mis à part les accents), cela devrait fonctionner.

Une chanson est un fichier texte :file:`chanson.tsg` placé dans le répertoire
:file:`songs` (ou un de ses sous-répertoires) d'un datadir. C'est un fichier LaTeX
interprété avec le paquet `songs <http://songs.sourceforge.net>`__. Si la
connaissance de LaTeX peut-être nécessaire pour faire des choses compliquées,
cette documentation devrait permettre d'écrire des chansons sans connaissance
préalable de LaTeX. Pour un langage encore plus simple (moins puisant que
LaTeX, mais qui devrait suffire dans la plupart des cas), il est aussi possible
d'utiliser :ref:`chordpro`.

Ce fichier commence par la ligne :samp:`\\beginsong{{titres}}` (éventuellement
précédée des commandes définissant la :ref:`langue <langue>` de la chanson et
le :ref:`nombre de colonnes <colonnes>`), termine par la ligne
:samp:`\\endsong`, et contient entre ces deux lignes les commandes nécessaires
pour renseigner :ref:`les titres <titres>`, écrire les :ref:`couplets et
refrains <couplets>`, placer des :ref:`accords <accords>`, ou insérer
:ref:`d'autres éléments <autres>`.

Exemple
-------

Voici un exemple simplifié de la chanson `Sad robot
<http://www.jamendo.com/fr/track/81740>`_ par *Pornophonique*.

.. code-block:: latex

  \selectlanguage{english}
  \songcolumns{2}
  \beginsong{Sad robot}
    [by=Pornophonique,cov=8-bit-lagerfeuer,album=8-bit lagerfeuer]

    \cover
    \gtab{Dm}{XX0231}
    \gtab{F}{1:022100}
    \gtab{C}{X32010}
    \utab{Dm}{2210}
    \utab{F}{2010}
    \utab{C}{0003}

    \lilypond{Sad_robot}

    \beginverse
      His \[Dm]steely skin is covered
      By \[F]centuries of dust
      \[C]Once he was a great one
      \[Dm]Now he's dull and rust
    \endverse

    \begin{repeatedchords}
      \beginverse*
        An \[Dm]oily tear he's crying
        \[F]Can you feel the pain
        Of the \[C]sad, sad robot
        And it's \[Dm]driving him insane
      \endverse*

      \beginverse*
        He can't \[Dm]turn back time nor history
        So his \[F]life became a misery
        He \[C]has to face the destiny
        Nobody \[Dm]cares anymore
      \endverse*

      \beginchorus
        \[Dm]Sad, sad robot
        \[F]Sad, sad robot
        \[C]Sad, sad robot
        All a\[Dm]lone
      \endchorus
    \end{repeatedchords}
  \endsong

.. _langue:

Langue
------

Définir la langue de la chanson permet de respecter la typographie. Par
exemple, en français, un point d'exclamation est précédé d'une espace, alors
qu'en anglais, il est collé au mot qui le précède.

La définition de la langue se fait avant la commande
:samp:`\\beginsong{{Titre}}`, en utilisant :

.. code-block:: latex

  \selectlanguage{english}
  \beginsong{Titre}

Les langues disponibles sont celles reconnues par le paquet LaTeX `Babel
<http://www.ctan.org/pkg/babel>`_.

.. _titres:

Titres et méta-informations
---------------------------

Les titres (le titre principal, et des titres alternatifs éventuels), ainsi que
le nom de l'auteur, l'album, etc., sont définis avec la commande
:samp:`\beginsong{{titres}}[{informations}]`. Par exemple :

.. code-block:: latex

  \beginsong{Sad Robot}
    [by={Pornophonique}, cov={8-bit-lagerfeuer}, album={8-bit lagerfeuer}]

Les différents titres sont séparés par des doubles barre obliques :
:samp:`\beginsong{{titre1} \\\\ {titre2} \\\\ {titre3}}`.

La liste des paramètres disponibles (certains paramètres de `songs`, et
d'autres ajoutés par `patacrep`), est donnée ici. Pour une utilisation avancée,
il est possible de `définir de nouveaux paramètres
<http://songs.sourceforge.net/songsdoc/songs.html#sec11.8>`_.

* Paquet `songs <http://songs.sourceforge.net>`__


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

* Paquet `patacrep`

  ========== ===========
  Nom        Description
  ========== ===========
  album      Album
  original   Titre original
  cov        Chemin de l'image de couverture (relative ou non au répertoire du fichier :file:`.tsg`)
  url        URL de la chanson
  ========== ===========

Index
^^^^^

Les titres et auteurs des chansons reçoivent un traitement particulier avant d'être intégrés dans l'index.

Titres
  Les articles courants (*Les*, *Le*, *The*, *A*, etc.) en début de titre peuvent
  être supprimés. Cela permet de trier les titres selon le premier mot «
  important ».

  :ref:`L'option <options>` :samp:`titleprefixwords` permet de définir la liste
  des articles à ne pas considérer en début des titres.

  Par défaut, les titres sont affichés dans la table des matières en rejetant
  l'article entre parenthèses (par exemple `Raven (The)`). Il est
  possible de modifier cela en redéfinissant la commande LaTeX
  :samp:`\\indextitle{{article}}{{titre}}`. Par exemple, pour afficher le titre
  sans modifications (`The Raven`), on pourra mettre dans le préambule du
  fichier LaTeX (ou plutôt dans un :ref:`template <templates>`) :

  .. code-block:: latex

    \renewcommand{\indextitle}[2]{#1 #2}

  Noter que cette commande prend toujours deux arguments, le premier pouvant
  être vide (par exemple :samp:`\\indextitle{{}}{{Enivrez-vous}}`).  Il faut donc être
  vigilant à ce que le résultat de la commande prenne en compte ce cas-là.

Auteurs
  Le traitement des auteurs est fait de telle manière à ce que, par exemple,
  une chanson ayant pour auteur :samp:`Composée par Jean Boyer (1945), chantée
  par Georges Brassens` apparaisse dans l'index des auteurs à `Boyer` et
  `Brassens`.

  :ref:`Les options  <options>` :samp:`authwords` permettent de paramétrer ce
  traitement. Cette option est un dictionnaire ayant trois clefs ``sep``,
  ``ignore`` et ``after``. Le traitement est le suivant (en prenant pour
  exemple `Paroles de William Blake (Milton, 1808), musique de Hubert Parry
  (1916), chanté par Emerson,~Lake~and~Palmer`, avec :samp:`authwords` valant
  :samp:`{"sep": ["and", "et"], "ignore": ["anonyme"], "after": ["de", "par"]}`).

  #. Les parenthèses (et leur contenu) sont supprimées.

      .. code-block:: latex

        Paroles de William Blake, musique de Hubert Parry, chanté par Emerson,~Lake~and~Palmer

  #. La chaîne est découpée suivant les séparateurs de :samp:`authwords['sep']` (c'est-à-dire ``and`` et ``et`` dans le cas présent), ainsi que la virgule.

      .. code-block:: latex

        Paroles de William Blake
        musique de Hubert Parry
        chanté par Emerson,~Lake~and~Palmer

      On remarque que ``Emerson,~Lake~and~Palmer`` n'a pas été découpé selon le
      ``and``, car ce séparateur n'est pas entouré d'espaces mais d'espaces
      insécables ``~``.

  #. Tout ce qui précède des éléments de ``authwords['after']`` (``par`` et ``de`` dans notre exemple) est supprimé.

      .. code-block:: latex

        William Blake
        Hubert Parry
        Emerson,~Lake~and~Palmer

  #. Les auteurs correspondant à des auteurs de la liste ``authwords['ignore']`` sont supprimés (aucun dans notre exemple).

      .. code-block:: latex

        William Blake
        Hubert Parry
        Emerson,~Lake~and~Palmer

  #. Les auteurs sont découpés entre le prénom (ou l'article pour les groupes) et le nom de famille. Le découpage est fait à la dernière espace.

      .. code-block:: latex

        William / Blake
        Hubert / Parry
        / Emerson,~Lake~and~Palmer

  #. Les auteurs sont passés à la commande :samp:`\\indexauthor{{prénom}}{{nom}}`, qui va se charger d'afficher correctement les noms (voir paragraphe suivant).


  Par défaut, les auteurs sont affichés dans l'index avec le prénom rejeté
  après le nom, avec une virgule (par exemple *Poe, Edgar Allan*). Il est
  possible de modifier cela en redéfinissant la commande LaTeX
  :samp:`\\indexauthor{{prénom}}{{nom}}`. Par exemple, pour afficher le prénom
  entre parenthèse en début de nom (*(Edgar Allan) Poe*), on pourra mettre dans
  le préambule du fichier :

  .. code-block:: latex

    \renewcommand{\indexauthor}[2]{(#1) #2}

  Cette commande prend toujours deux arguments, le premier pouvant être vide
  (par example :samp:`\\indexauthor{{}}{{Simon and Garfunkel}}`). Il faut être donc
  vigilant à ce que sa définition prenne en compte ce cas spécial.


.. _couplets:

Couplets, refrains
------------------

La chanson se compose d'une succession de couplets (*verse*) et
de refrains (*chorus*). Un couplet figure dans un environnement
:samp:`verse`, c'est-à-dire qu'il commence par :samp:`\\beginverse`
et se termine par :samp:`\\endverse`. De la même manière, un refrain
est placé dans un environnement :samp:`chorus`, c'est-à-dire entre les
balises :samp:`\\beginchorus` et :samp:`\\endchorus`. Les paroles sont
écrites normalement entre les balises d'ouverture et de fermeture de
l'environnement.

.. note::

  Contrairement à ce qui est habituel en LaTeX, les retours à la ligne sont
  respectés. Il n'est donc pas nécessaire de sauter une ligne ou d'utiliser une
  commande :samp:`\\\\` ou :samp:`\\par` à chaque fin de vers.

Numérotation
^^^^^^^^^^^^

La numérotation se fait automatiquement pour chaque
:samp:`\\beginverse` rencontré. Cependant, il est parfois plus
lisible de scinder un couplet en deux parties, la deuxième partie ne
devant pas être numérotée. Pour cela, nous utilisons la commande
:samp:`\\beginverse*` ; il faut alors fermer l'environnement par
:samp:`\\endverse*`. Par exemple, un couplet en huit vers se
décompose souvent en deux strophes de quatre vers comme dans l'exemple
suivant.

.. code-block:: latex

  \beginverse
    His \[Dm]steely skin is covered
    By \[F]centuries of dust
    \[C]Once he was a great one
    \[Dm]Now he's dull and rust
  \endverse

  \beginverse*
    An oily tear he's crying
    Can you feel the pain
    Of the sad, sad robot
    And it's driving him insane
  \endverse*

.. _accords:

Accords
^^^^^^^

Pour préciser sur quelle syllabe un accord doit être joué, on utilise
une commande spéciale. Par exemple, la commande :samp:`\\[E]`
produira un :samp:`Mi` au dessus de la syllabe suivante dans le PDF.

Il est impératif d'utiliser la convention anglo-saxone de notation des accords
(A, B, C, D, E, F, G) et non pas la notation latine (La, Si, Do, Ré, Mi, Fa,
Sol). En revanche, suivant la langue utilisée pour le recueil, le rendu des
accords dans le PDF pourra être différent (l'accord :samp:`\\[D]` sera affiché
:samp:`Ré` si la langue du songbook est :samp:`french`). Ce rendu est
paramétrable avec :ref:`l'option <options>` :samp:`notenamesout`.

Par défaut, l'accord est majeur (C fait référence à l'accord de Do
majeur). Les accords mineurs sont précisés par un :samp:`m`
minuscule.  Le symbole bémol ♭ est représenté en utilisant le
caractère :samp:`&`. Le dièse ♯ est codé par le caractère
:samp:`#`. Les autres notations sont simplement ajoutées comme des
caractères à l'accord principal. Par exemple, l'accord de :samp:`La bémol
mineur` est noté :samp:`[A&m]`.

.. note::

  Pour des raisons techniques, le symbole :samp:`#` (tout comme :samp:`&`) ne peut pas
  être utilisé dans les environnements :samp:`nolyrics`. Dans ce
  cas là, il faut utiliser :samp:`shrp` (respectivement :samp:`flt`).


Répétition
""""""""""

De façon à avoir un document lisible et relativement compact, les
accords des couplets et des refrains ne sont renseignés qu'une seule
fois à leur première occurrence. En effet, même si jouer les morceaux
du premier couplet en chantant les paroles du second peut demander un
peu de gymnastique, cela fera travailler votre mémoire tout en offrant
un texte bien moins surchargé et (beaucoup) moins de pages à imprimer.

Si toutefois vous souhaitez que les accords soient répétés dans toute la
chanson, vous pouvez utiliser l'option :samp:`repeatchords` du
template de votre recueil (voir la section :ref:`songbook`).
Il faut évidemment pour cela que les accords soient renseignés dans tous les
couplets des chansons.

Chœurs et répétitions
^^^^^^^^^^^^^^^^^^^^^

Lorsqu'une phrase ou un couplet est répété plusieurs fois d'affilée,
il est conseillé d'utiliser la commande :samp:`\\rep` plutôt que d'écrire
:samp:`\\bis` ou d'indiquer directement (x4). Par exemple, si le mot
:samp:`Hallelujah` est répété quatre fois, nous écrirons~:

.. code-block:: latex

  Hallelujah \rep{4}

La commande :samp:`echo` fait référence à des chœurs (ou
similaire).

.. code-block:: latex

  Hallelujah \echo{Hallelujah}

Caractères spéciaux
^^^^^^^^^^^^^^^^^^^

Quelques caractères doivent être écrits différemment en utilisant des
commandes LaTeX pour un obtenir un meilleur rendu typographique
dans le PDF. Les deux exemples principaux sont les trois points de
suspension (…) et le caractère *œ*. Pour représenter ces
caractères, vous devez utiliser respectivement les commandes
:samp:`\\dots{}` et :samp:`\\oe{}` (ou utiliser les caractère UTF-8
:samp:`…` et :samp:`œ`). On utilise des accolades autour des commandes de sorte
que les commandes puissent être insérées où vous le désirez sans interférer
avec le reste du texte.

.. _autres:

Inclure d'autres éléments
-------------------------

.. _partitions:

Partitions
^^^^^^^^^^

Si vous souhaitez ajouter une ligne mélodique dans une chanson, vous
pouvez utiliser `Lilypond <http://www.lilypond.org/>`_ pour générer la
partition. Créez pour cela un nouveau fichier :file:`partition.ly` dans le
même répertoire que la chanson. Il faut inclure le fichier d'en-tête
:file:`header` et définir l'option :samp:`paper-height` de façon à ce que la
partition produite tienne sur une page avec le moins de blanc possible. Une
première estimation est de compter 1.6 cm pour une ligne. Puis, écrivez votre
partition entre accolades, comme dans l'exemple suivant.

.. code-block:: lilypond

  \begin{lilypond}
  \include "header"
  \paper{paper-height = 3.3\cm}
  {
    \key c \major
    \time 2/4
    \relative c''
      {
        e4 c g'2 a4 a8. a16 g8 e4 c8
        a'4 a8. a16 g8 f e c d2~ d4
        e8 f g4 g8. g16 f8 e d c a c4 a8 g4
        c8 d e8 g4 g,8 e' e d d c2
      }
  }
  \end{lilypond}

Enfin, pour insérer votre partition :file:`partition.ly` dans une
chanson, utilisez la commande :samp:`lilypond` dans le fichier
:file:`sg` adéquat :

.. code-block:: latex

    \lilypond{partition}

Diagrammes des accords
^^^^^^^^^^^^^^^^^^^^^^

Étant donné qu'un accord de guitare ou de ukulélé peut se jouer de
plusieurs façons différentes et qu'il est parfois judicieux de
privilégier telle ou telle position, `patacrep` permet de représenter
schématiquement ces accords en début de chanson sous forme de
diagramme. Pour cela, nous utilisons les commandes :samp:`\\gtab`
(guitare) et :samp:`\\utab` (ukulélé) juste avant le premier couplet
ou refrain. Dans le cas où ces accords ne sont pas standards, ils
peuvent être marqués comme importants avec les commandes
:samp:`\\gtab*` et :samp:`\\utab*`. Voici quelques exemples
classiques~:

.. code-block:: latex

    \gtab{C}{3:002220}
    \gtab*{Amaj7}{5:X0221X}
    \utab{C}{0003}
    \utab{B&m}{1:2000}

* Les six chiffres correspondent aux six cordes de la guitare (:samp:`Mi`, :samp:`La`, :samp:`Ré`, :samp:`Sol`, :samp:`Si`, :samp:`Mi`).
* La valeur du chiffre indique la frette sur laquelle on appuie.
* Un 0 désigne une corde jouée à vide.
* Un X indique que la corde ne doit pas être jouée.
* Une valeur avant un « : » désigne un barré (« :samp:`3:` » indique un barré à la 3 :sup:`e` frette).

.. note::

  * X est la lettre majuscule x. Un x minuscule produira une erreur lors de la compilation.
  * 0 est le chiffre zéro et non pas la lettre majuscule o.


Intersongs
^^^^^^^^^^

Le paquet `songs <http://songs.sourceforge.net>`__ permet d'insérer du texte
quelconque entre deux chansons (une autre méthode consiste à utiliser le plugin
:ref:`tex <plugin_tex>`).

Un *intersong* est un fichier ayant pour extension :file:`.is`, et contenant un
environnement ``intersong``, c'est-à-dire commençant par la ligne
``\begin{intersong}`` et finissant par ``\end{intersong}``.

Tout a été fait pour qu'ils puissent être manipulés comme des chansons,
c'est-à-dire :

* il est possible de spécifier la :ref:`langue <langue>` et le nombre de
  :ref:`colonnes <colonnes>` comme pour les chansons (en plaçant les commandes
  correspondantes en tout début de fichier, avant même ``\begin{intersong}``) ;
* il est possible de trier les intersong avec les chansons, en utilisant la
  commande :samp:`\\sortassong{{Titre}}[{Paramêtres}]`. Cette commande ne
  produit rien dans le document final, mais indique au plugin :ref:`sort
  <plugin_sort>` comment trier les chansons.

Par exemple, pour introduire une biographie de Georges Brassens avant
l'ensemble de ses chansons (dans un recueil trié par auteur, album puis titre),
on pourra avoir le fichier :file:`brassens.is` suivant :

.. code-block:: latex

  \selectlanguage{french}
  \begin{intersong}
  \sortassong{}[by={Georges Brassens}]

  Georges Brassens était un chic type né en 1921.
  \end{intersong}

.. _colonnes:

Colonnes
--------

La commande :samp:`songcolumns` détermine le nombre de colonnes sur
lequel sera présentée la chanson. Elle s'utilise juste avant la
commande :samp:`beginsong`. Généralement une chanson se présente
sur 1, 2 ou 3 colonnes. Par convention, utilisez deux colonnes par
défaut.

.. code-block:: latex

    \songcolumns{2}
    \beginsong{Titre}
