Installation
============

Paquets compilés
----------------

Des paquets compilés sont fournis pour les distributions (et architectures)
suivantes. Pour les autres architectures, le paquet peut être installé :ref:`à
partir des sources <install_sources>`.

Debian/Ubuntu
^^^^^^^^^^^^^

Téléchargez le paquet `.deb` de la dernière version :
`<http://example.com/TODO.deb>`_.

Pour la plupart des distributions, un double clic sur le fichier obtenu devrait
lancer l'installation. Sinon, utilisez la commande suivante : ::

    sudo dpkg -i patacrep python-patacrep_<TODO version>-1_all.deb

Fedora
^^^^^^

TODO

MacOSX
^^^^^^

Vous pouvez utiliser le package d'installation MacOSX disponible sur la page des téléchargements `<http://example.com/TODO.pkg>`_. Vous aurez aussi besoin d'installer les dépendances suivantes : 
 - `Python 2.7 <https://www.python.org/download/>`_
 - LaTeX. La distribution `MacTeX <https://tug.org/mactex/>`_ est la plus simple à installer, mais est un peu lourde. Si vous vous sentez l'âme aventureuse, vous pouvez utiliser l'installeur en ligne de commande de `TeXLive <https://www.tug.org/texlive/doc/texlive-en/texlive-en.html#x1-140003>`_ et personnaliser les options d'installation pour réduire le poids. Vous aurez besoin des paquets de base, ainsi que du support des langues étrangères.

Pour vérifier que tout s'est bien passé, ouvrez un terminal (/Applications/Utilitaires/Terminal) et entrez les commandes suivantes ::

   python --version
   pdflatex --version

Si le numéro de version s'affiche, tout va bien, si vous avez une erreur `command not found`, il y a un problème.

Windows
^^^^^^^

Un installeur windows est disponible sur la page des téléchargements `<http://example.com/TODO.msi>`_. L'installation en est tout ce qu'il y a de plus habituel. Vous aurez aussi besoin d'installer les dépendances habituelles : 
 - `Python 2.7 <https://www.python.org/download/>`_
 - TODO : LaTeX

TODO : PATH et vérifications


.. _install_sources:

Sources
-------

Archive :file:`.tar.gz`
^^^^^^^^^^^^^^^^^^^^^^^

Les sources de la dernière version stable sont disponibles ici :
`<http://example.com/TODO.tar.gz>`_. Après avoir décompressé l'archive, lancez
la commande suivante depuis le répertoire où les sont les fichiers : ::

    pip install -r Requirements.txt
    ./setup.py install

Ou alors, pour une installation avec `pip <http://pypi.python.org/pypi/pip/>`_
(sans décompresser l'archive) : ::

    pip intstall https://github.com/patacrep/patacrep/archive/patacrep_4.0.zip TODO: check path

Dépôt `git`
^^^^^^^^^^^

Pour obtenir la version de développement, il est possible de télécharger les
sources en utilisant `git <http://git-scm.com>`_ : ::

    git clone https://github.com/patacrep/patacrep.git

L'installation se fait ensuite de la même manière que pour l'installation à
partir des sources.
