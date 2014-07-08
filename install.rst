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

MacOSX
^^^^^^

Vous pouvez utiliser le package d'installation MacOSX disponible sur la page des téléchargements `<http://example.com/TODO.pkg>`_. Vous aurez aussi besoin d'installer les dépendances suivantes :
 - `Python 2.7 <https://www.python.org/download/>`_
 - LaTeX. La distribution `MacTeX <https://tug.org/mactex/>`_ est la plus simple à installer, mais est un peu lourde. Si vous vous sentez l'âme aventureuse, vous pouvez utiliser l'installateur en ligne de commande de `TeXLive <https://www.tug.org/texlive/doc/texlive-en/texlive-en.html#x1-140003>`_ et personnaliser les options d'installation pour réduire le poids. Vous aurez besoin des paquets de base, ainsi que du support des langues étrangères.

Pour vérifier que tout s'est bien passé, ouvrez un terminal (:file:`/Applications/Utilitaires/Terminal`) et entrez les commandes suivantes ::

   python --version
   pdflatex --version


Si le numéro de version s'affiche, tout va bien, si vous avez une erreur ``command not found``, il y a un problème.

Vous pouvez ensuite tester le bon fonctionnement de l'utilitaire ``songbook`` avec la commande ::

    songbook --version

Si jamais la réponse est ``songbook: command not found``, c'est que :file:`/urs/local/bin` n'est pas dans votre ``PATH``. Pour l'ajouter, exécutez la commande ::

    echo "export PATH=$PATH:\usr\local\bin" >> ~/.bashrc

Windows
^^^^^^^

Commencez par installer les dépendances habituelles :
 - `Python 2.7 <https://www.python.org/download/>`_
 - `MikTeX 2.9 <http://miktex.org/download>`_ pour avoir accès a LaTeX.

Puis téléchargez `les sources <http://example.com/TODO.zip>`_ de Patacrep. Décompressez le fichier où vous voulez (cette explication suppose que vous l'avez mis sur le bureau), puis lancez une invite de commande en tapant ``cmd`` dans le menu démarrer. Déplacez-vous dans le dossier où sont les sources, par exemple : ::

    cd Desktop\Patacrep

puis lancez le script d'installation Windows : ::

    install_windows.bat

Ce script modifie votre variable d'environnement ``%PATH%`` pour y ajouter les dossiers Python :file:`C:\\Python27` et :file:`C:\\Python27\\Scripts`, ainsi que la variable ``%PATHEXT%`` pour y ajouter ``.py``. Après quoi il télécharge `pip <http://pypi.python.org/pypi/pip/>`_, et s'en sert pour installer les dépendances de ``Patacrep``. Enfin, il installe ``Patacrep`` et l'utilitaire ``songbook``.


.. _install_sources:

Installation depuis les sources
-------------------------------

Archive :file:`.tar.gz` : version stable
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Les sources de la dernière version stable sont disponibles ici :
`<http://example.com/TODO.tar.gz>`_. Après avoir décompressé l'archive, lancez
la commande suivante depuis le répertoire où les sont les fichiers : ::

    pip install -r Requirements.txt
    ./setup.py install

Ou alors, pour une installation avec `pip <http://pypi.python.org/pypi/pip/>`_
(sans décompresser l'archive) : ::

    pip install https://github.com/patacrep/patacrep/archive/TODO.zip

TODO: installation via Pypi ?

Dépôt `git` : version de développement
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Pour obtenir la version de développement, il est possible de télécharger les
sources en utilisant `git <http://git-scm.com>`_ : ::

    git clone https://github.com/patacrep/patacrep.git

L'installation se fait ensuite de la même manière que pour l'installation à
partir des sources.

Pour mettre à jour la version de développement, utilisez simplement ::

    git pull
    ./setup.py install


Informations supplémentaires
----------------------------

CentOS 6.5
^^^^^^^^^^

Sur CentOS 6.5, un certain nombre de logiciel par défaut sont trop ancien pour faire fonctionner Patacrep correctement. En particulier, vous devriez utiliser une version récente de TeXLive, et installer ghostscript en version 9.
