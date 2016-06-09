.. _songbookbin:

Programme :command:`songbook`
=============================

Le programme :command:`songbook` est une interface minimale à la bibliothèque
:py:mod:`patacrep` : il permet de compiler un carnet de chants à partir du fichier :file:`.yaml` (pour
des programmes qui permettent de manipuler ce fichier :file:`.yaml`, ou les chansons,
voir :ref:`patagui` ou :ref:`patanet`).

Utilisation
-----------

.. program:: songbook

.. code-block:: none

  songbook [-h] [--version] [--datadir DATADIR [DATADIR ...]] [--verbose] [--steps STEPS] [--cache CACHE] [--error {failonsong,failonbook,fix}] book.yaml

L'argument obligatoire est le nom d'un fichier :file:`.yaml`, qui est compilé en un
carnet de chants. Les options optionnelles sont les suivantes.

.. option:: -h, --help

  Affiche une aide et termine le programme.

.. option:: --version

  Affiche la version du programme.

.. option:: --datadir <DATADIR> [<DATADIR> ...], -d <DATADIR> [<DATADIR> ...]

  Répertoire contenant les données, contenant (mais ce n'est pas obligatoire)
  les sous-répertoires :file:`songs`, :file:`img`, :file:`latex`,
  :file:`templates`, :file:`python`.

.. option:: --verbose, -v

  Affiche davantage de messages lors de la compilation.

.. option:: --steps <STEPS>, -s <STEPS>

  Spécifie les étapes de la compilation à effectuer. La valeur par défaut est ``tex,pdf,sbx,pdf,clean``. Les étapes disponibles sont :

  =========   ===========
  Étape       Description
  =========   ===========
  ``tex``     Produit le fichier :file:`.tex`.
  ``pdf``     Compile le fichier :file:`.tex`.
  ``sbx``     Compile les index (chansons et auteurs).
  ``clean``   Supprime les fichiers temporaires.
  ``#cmd``    Étape spéciale : la suite d'une chaîne commençant par le signe ``#`` sera exécutée dans un shell.
  =========   ===========

  Plusieurs étapes (sauf l'étape spéciale) peuvent être combinées en une seule option ``--steps``, séparées par des virgules.

.. option:: --cache <CACHE>, -c <CACHE>

  Spécifie si oui ou non le cache devrait être utilisé (lu et écrit). Par défaut, vaut ``yes`` (le cache est utilisé) ; utiliser ``--cache=no`` pour désactiver son utilisation.

.. option:: --error {failonsong,failonbook,fix}, -e {failonsong,failonbook,fix}

  Par défaut, `songbook` essaye de corriger ou d'ignorer les erreurs (syntaxe, fichiers manquants, etc.) dans les chansons et le carnet. Cette option permet de changer ce comportement.

  - ``failonsong`` : arrête la compilation dés qu'une chanson présentant une erreur a été analysée.
  - ``failonbook`` : arrête la compilation après que toutes les chansons aient été analysées, si au moins une erreur a été rencontrée.
  - ``fix`` (valeur par défaut) : essaye de corriger ou d'ignorer les erreurs.

  Il faut remarquer que la compilation peut échouer même avec l'option ``--error=fix``.

Utilisation avec :ref:`patadata`
--------------------------------

Le projet :ref:`patadata` contient des carnets de chants prêts à être compilés.
Ils sont dans le répertoire `books
<https://github.com/patacrep/patadata/tree/master/books>`_.

Par exemple, pour compiler l'ensemble des chansons de ce répertoire en un seul
carnet, il est possible de se placer dans la racine de `patadata` et
d'exécuter ::

  songbook books/songbook.yaml

