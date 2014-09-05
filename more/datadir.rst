.. _datadir:

Organisation des ``datadirs``
=============================

La bibliothèque :py:mod:`patacrep` va chercher des information dans un ensemble de
répertoires, relatif à un répertoire de base (nommé :file:`datadir`). Plusieurs
:file:`datadir` peuvent être définis : si le fichier requis n'est pas trouvé dans le
premier :file:`datadir`, il est cherché dans le second, et ainsi de suite.

Les sous-répertoires de ces :file:`datadir` sont les suivants.

.. _datadir_img:

:file:`img`
  Ce répertoire contient des images qui peuvent être incluses à l'aide de la
  commande :

  .. code-block:: latex

    \includegraphics{image.png}

  Ce répertoire est automatiquement inclus dans la liste des répertoires dans
  lesquels ``\includegraphics`` va chercher les images : pour les fichiers de
  ce répertoire, il n'est donc pas nécessaire de préciser leur chemin d'accès
  absolu.

.. _datadir_latex:

:file:`latex`
  Ce répertoire peut contenir des fichiers LaTeX (:file:`.tex` ou :file:`.sty`). Lors
  d'inclusion de fichiers, ou de chargement de paquets. C'est dans ce
  répertoire que vous pouvez mettre les fichiers de paquets LaTeX qui ne sont
  pas inclus avec votre distribution.

.. _datadir_songs:

:file:`songs`
  Les chansons pouvant être incluses dans le carnet de chant sont dans ce
  répertoire. Aucune organisation spécifique n'est imposée à l'intérieur de ce
  répertoire.

.. _datadir_templates:

:file:`templates`
  Comme son nom l'indique, les :ref:`templates <templates>` sont recherchés
  dans ce répertoire.

.. _datadir_python:

:file:`python`
  Dans ce répertoire peuvent être placés des modules Python complémentaires.
  Pour le moment, ceci est uniquement utilisé pour :ref:`écrire ses propres
  plugins <plugins_write>`.
