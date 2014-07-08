Introduction
============

Liens
-----

Projet `patacrep` :

* Page officielle : http://patacrep.com
* Forum : http://www.patacrep.com/forum
* Page développement : http://github.com/patacrep/patacrep

Projets liés
------------

patacrep
^^^^^^^^

Le nom `patacrep` désigne à la fois l'ensemble du projet (un ensemble
d'outils), et le cœur (l'outil principal, utilisé par les autres outils).

* `patacrep` regroupe les projets décrits ci-après (`patacrep`, `pataextra`,
  `patadata`, `patanet`, `patagui`) et est un ensemble d'outils de manipulation
  de chants et de carnets de chants.
* `patacrep/patacrep` est la bibliothèque principale, qui fournit les outils
  principaux nécessaires à cette manipulation, ainsi qu'un outil en ligne de
  commande (:ref:`songbook <songbook>`).

Pages de développement : `patacrep <http://github.com/patacrep>`_,
`patacrep/patacrep <http://github.com/patacrep/patacrep>`_.

.. _patadata:

patadata
^^^^^^^^

Ce projet contient un grand nombre de chansons pouvant être manipulées par
`patacrep`, ainsi que divers carnets de chants les rassemblant.

`Page de développement <http://github.com/patacrep/patadata>`__

.. _patanet:

patanet
^^^^^^^

Une interface web est en cours de développement à l'heure où nous écrivons cette
documentation. Elle permettra de créer des carnets de chants en utilisant les
outils `patacrep`, dans un navigateur web.

`Page de développement <http://github.com/patacrep/patanet>`__

Outils non maintenus
^^^^^^^^^^^^^^^^^^^^

.. _patagui:

patagui
"""""""

Une interface graphique a été développée pour une ancienne version de
`patacrep`. Nous manquons malheureusement de temps pour la maintenir à jour.
Elle devrait fonctionner avec la version 3.7.2 de `patacrep`, mais pas avec les
suivantes.

Nous espérons que son développement reprendra dans le futur (par nous ou de
nouveaux contributeurs), mais elle est pour le moment obsolète.

`Page de développement <http://github.com/patacrep/patagui>`__

pataextra
"""""""""

Quelques outils pour manipuler les chansons sont disponibles dans ce projet.
Malheureusement, ce projet est peu maintenu, les outils sont peu documentés, et
peut-être obsolètes.

`Page de développement <http://github.com/patacrep/pataextra>`__

Outils externes
---------------

Outils que l'utilisateur pourrait avoir à manipuler.

LaTeX
^^^^^

L'ensemble d'outils `patacrep` ne fait en réalité que manipuler des fichiers
LaTeX : un carnet de chants, et les chansons en particulier, sont écrits dans
ce langage. Même si nous espérons que l'utilisation de `patacrep` diminue
grandement les connaissances nécessaires pour écrire du LaTeX, il pourra être
utile de se familiariser avec cet outil, avec par exemple `Une courte (?)
introduction à LaTeX2e
<http://mirrors.ctan.org/info/lshort/french/lshort-fr.pdf>`_ (`original en
anglais <http://mirrors.ctan.org/info/lshort/english/lshort.pdf>`_).

Pour les cas de base, copier un recueil ou une chanson déjà existante pour
l'adapter à ses besoins devrait suffire à commencer à travailler.

Songs
"""""

En particulier, le paquet `songs <http://songs.sourceforge.net>`_
(`documentation <http://songs.sourceforge.net/songsdoc/songs.html>`_ en
anglais) est utilisé pour rendre les chansons, et en particulier pour marquer
les accords.

Les cas d'utilisation de base sont expliqués dans la section :ref:`song`.

Lilypond
^^^^^^^^

Il est possible d'intégrer des partitions aux chansons. Si ces partitions
peuvent être intégrées comme des images (JPG, PNG, PDF) en utilisant le paquet
`graphicx` de LaTeX sans utiliser de fonctionnalité particulière de `patacrep`,
ce dernier permet de manipuler les partitions écrites au format Lilypond.

Plus d'informations dans la section :ref:`partitions`, et sur le `site du
projet <http://www.lilypond.org/>`_.

Python
^^^^^^

`Python <http://python.org>`_ est le langage de programmation utilisé pour
écrire la majeure partie des outils de `patacrep`. S'il n'est pas nécessaire
d'avoir entendu parler de ce langage pour créer un carnet de chant, c'est en
Python que peuvent être écrites des extensions permettant d'inclure de nouveaux
formats de contenu aux carnets de chant. Voir la section :ref:`plugins_write`
pour plus d'informations.

jinja2
^^^^^^

`Jinja2 <http://jinja.pocoo.org/>`_ est le moteur utilisé pour écrire les
templates. Bien qu'écrit en Python, la connaissance de ce langage n'est
nécessaire que pour des cas d'utilisation avancés.

L'utilisation pour les cas de base est décrite dans la section
:ref:`templates`.
