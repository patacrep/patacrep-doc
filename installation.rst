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

Vous aurez besoin d'installer les dépendances suivantes :
 - `Python 2.7 <https://www.python.org/download/>`_
 - LaTeX. La distribution `MacTeX <https://tug.org/mactex/>`_ est la plus simple à installer, mais est un peu lourde. Si vous vous sentez l'âme aventureuse, vous pouvez utiliser l'installateur en ligne de commande de `TeXLive <https://www.tug.org/texlive/doc/texlive-en/texlive-en.html#x1-140003>`_ et personnaliser les options d'installation pour réduire le poids. Vous aurez besoin des paquets de base, ainsi que du support des langues étrangères.
 - Lilypond peut être utile si vous souhaitez compiler les partitions dans les chansons. Ce n'est toutefois pas une dépendance obligatoire. Vous pouvez le télécharger à `cette adresse <http://www.lilypond.org/download.fr.html>`_. Décompressez l'archive, puis placez là dans :file:`/Applications`. Vous devrez ajouter un lien vers lilypond pour que `songbook` puisse le trouver en lançant les commandes suivantes dans un Terminal : ::

     sudo ln -s /Applications/LilyPond.app/Contents/Resources/bin/lilypond /usr/local/bin/lilypond
     echo "export PATH=$PATH:\usr\local\bin" >> ~/.bashrc

La première commande va vous demander votre mot de passe administrateur.

Pour vérifier que tout s'est bien passé, ouvrez un terminal (:file:`/Applications/Utilitaires/Terminal`) et entrez les commandes suivantes ::

   python --version
   pdflatex --version
   lilypond --version

Si le numéro de version s'affiche, tout va bien, si vous avez une erreur ``command not found``, il y a un problème.

L'installation de Patacrep en lui-même peut alors se faire de deux manières différentes : vous pouvez utiliser le package d'installation MacOSX disponible `<http://example.com/TODO.pkg>`_, ou bien utiliser la méthode d'installation utilisant :ref:`pip <install_pip>`. 

Vous pouvez ensuite tester le bon fonctionnement de l'utilitaire ``songbook`` avec la commande ::

    songbook --version

Si jamais la réponse est ``songbook: command not found``, c'est que :file:`/urs/local/bin` n'est pas dans votre ``PATH``. Pour l'ajouter, exécutez la commande ::

    echo "export PATH=$PATH:\usr\local\bin" >> ~/.bashrc

Windows
^^^^^^^

Commencez par installer les dépendances habituelles :
 - `Python 2.7 <https://www.python.org/download/>`_ ;
 - `MikTeX 2.9 <http://miktex.org/download>`_ pour avoir accès a LaTeX ;
 - `Lilypond <http://www.lilypond.org/windows.fr.html>`_ si vous voulez compiler les partitions associées à certaines chansons.

Si vous ne possédez pas d'installation Python fonctionnelle, utilisez `le script d'installation windows <http://example.com/TODO.zip>`_. Décompressez le dossier où vous voulez et cliquez sur le script :command:`install.bat`. Ce script modifie votre variable d'environnement ``%PATH%`` pour y ajouter les dossiers Python :file:`C:\\Python27` et :file:`C:\\Python27\\Scripts`, ainsi que la variable ``%PATHEXT%`` pour y ajouter ``.py``. Après quoi il télécharge `pip <http://pypi.python.org/pypi/pip/>`__, et s'en sert pour installer :py:mod:`Patacrep`.

Si vous avez déjà une installation Python 2.7 fonctionnelle, avec les bonnes valeurs des variables d'environnement ``%PATH%`` et ``%PATHEXT%``, vous pouvez utiliser directement l'installation avec :ref:`pip <install_pip>` ou depuis :ref:`les sources <install_sources>`. 

.. _install_pip:

Installation depuis PyPi
------------------------

La bibliothèque patacrep et le programme :command:`songbook` sont disponibles sur le Python Packages Index, vous
pouvez donc les installer avec `pip <http://pip.readthedocs.org/en/latest/>`_ ou `easy_install <http://pythonhosted.org/setuptools/easy_install.html>`_. ::

    pip install patacrep
    easy_install patacrep

:command:`easy_install` devrait être fournit avec toutes les distributions Python de base ; et :command:`pip` peut être installé
avec :command:`easy_install` ou `directement <http://pip.pypa.io/en/latest/installing.html#install-pip>`_.

.. _install_sources:

Installation depuis les sources
-------------------------------

Archives :file:`.tar.gz` et :file:`.zip` : version stable
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Les sources de la dernière version stable sont disponibles aux formats 
`.tar.gz <http://example.com/TODO.tar.gz>`_ et `.zip <http://example.com/TODO.zip>`_. Après avoir décompressé l'archive, lancez
la commande suivante depuis le répertoire où les sont les fichiers : ::

    pip install -r Requirements.txt
    python setup.py install

Dépôt `git` : version de développement
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Pour obtenir la version de développement, il est possible de télécharger les
sources en utilisant `git <http://git-scm.com>`_ : ::

    git clone https://github.com/patacrep/patacrep.git

L'installation se fait ensuite de la même manière que pour l'installation à
partir des sources.

Pour mettre à jour la version de développement, utilisez simplement ::

    git pull
    python setup.py install


Informations supplémentaires
----------------------------

CentOS 6.5
^^^^^^^^^^

Sur CentOS 6.5, un certain nombre de logiciel par défaut sont trop ancien pour faire fonctionner Patacrep correctement. En particulier, vous devriez utiliser une version récente de TeXLive, et installer ghostscript en version 9.
