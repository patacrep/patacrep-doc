.. _songbook:

Programme :command:`songbook`
=============================

Le programme :command:`songbook` est une interface minimale à la bibliothèque
:py:mod:`patacrep` : il permet de compiler un recueil à partir du fichier :file:`.sb` (pour
des programme qui permettent de manipuler ce fichier :file:`.sb`, ou les chansons,
voir :ref:`patagui` ou :ref:`patanet`).

Utilisation
-----------

.. code-block:: none

  songbook [-h] [--version] [--datadir DATADIR [DATADIR ...]] [--verbose] [--steps STEPS] book.sb

L'argument obligatoire est le nom d'un fichier :file:`.sb`, qui est compilé en un
recueil de chansons. Les options optionnelles sont les suivantes.

``-h, --help``
  Affiche une aide et termine le programme.

``--version``
  Affiche la version du programme.

:samp:`--datadir {DATADIR} [{DATADIR} ...], -d {DATADIR} [{DATADIR} ...]`
  Répertoire contenant les données, contenant (mais ce n'est pas obligatoire)
  les sous-répertoires :file:`songs`, :file:`img`, :file:`latex`,
  :file:`templates`, :file:`python`.

``--verbose, -v``
  Affiche davantage de messages lors de la compilation.

:samp:`--steps {STEPS}, -s {STEPS}`
  Spécifie les étapes de la compilation à effectuer. La valeur par défaut est ``tex,pdf,sbx,pdf,clean``. Les étapes disponibles sont :

  =========   ===========
  Étape       Description
  =========   ===========
  ``tex``     Produit le fichier :file:`.tex`.
  ``pdf``     Compile le fichier :file:`.tex`.
  ``sbx``     Compile les index (chansons et auteurs).
  ``clean``   Supprime les fichiers temporaires.
  ``%cmd``    Étape spéciale : la suite d'une chaîne commençant par le signe ``%`` sera exécutée dans un shell.
  =========   ===========

  Plusieurs étapes (sauf l'étape spéciale) peuvent être combinées en une seule option ``--steps``, séparées par des virgules.

Utilisation avec :ref:`patadata`
--------------------------------

Le projet :ref:`patadata` contient des carnets de chants prêts à être compilés.
Ils sont dans le répertoire `books
<https://github.com/patacrep/patadata/tree/master/books>`_.

Par exemple, pour compiler l'ensemble des chansons de ce répertoire en un seul
recueil, il est possible de se placer dans la racine de `patadata` et
d'exécuter ::

  songbook books/songbook.sb

