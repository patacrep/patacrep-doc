Créer un recueil
================

Introduction
-------------

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

Exemple de fichier :file:`.sb`
------------------------------

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

Compiler un fichier :file:`.sb`
-------------------------------

TODO

Ecrire ses propres fichiers :file:`.sb`
---------------------------------------

Mettre du contenu
TODO : liens vers content

Faire une mise en page
TODO : liens vers layout