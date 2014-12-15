Installation
============

Dépendances
-----------

`Patacrep` est un projet reposant sur beaucoup de techniques, il a donc un certain nombre de
dépendances à installer pour le faire fonctionner. Ces dépendances sont les mêmes pour tous
les systèmes d'exploitation, mais la méthode d'installation diffère. Ces dépendance sont les
suivantes :
 - Python 3.3 ou plus récent. Python 2 n'est pas supporté ;
 - LaTeX, et en particulier ``pdflatex`` ;

`Patacrep` a aussi des dépendances optionelles, qui peuvent ajouter des fonctionnalités,
mais ne sont pas obligatoires :
 - Lilypond, pour compiler des partitions.

GNU/Linux
^^^^^^^^^

Il n'existe pas (pour le moment ?) de paquet pour les différentes
distributions. En attendant, ``patacrep`` peut être installé en utilisant pip
(éventuellement dans un `virtualenv <http://virtualenv.readthedocs.org>`_, pour
garder un environnement d'installation propre). Voir la :ref:`section suivante
<install_pip>` pour les instructions.

Voici quelques informations supplémentaires pour certaines distributions.

Debian
""""""

Les paquets à installer sous Debian sont :

- Python (il n'est pas nécessaire d'installer ces paquets avec apt : :ref:`pypi <install_pip>` s'en chargera) : TODO

- LaTeX :

  - Nécessaire : TODO
  - Optionnel pour ``patacrep``, nécessaire pour ``patadata`` : TODO

- Lilypond (optionnel) : TODO

Bilan :

- Paquets nécessaires :

  .. code-block:: shell

    apt-get install TODO Latex minimal

- Paquets recommandés :

  .. code-block:: shell

    apt-get install TODO Latex recommandé + lilypond

CentOS 6.5
""""""""""

Sur CentOS 6.5, un certain nombre de logiciel par défaut sont trop ancien pour faire fonctionner Patacrep correctement. En particulier, vous devriez utiliser une version récente de TeXLive, et installer ghostscript en version 9.


MacOSX
^^^^^^

Vous devrez installer les dépendaces suivantes:
 - `Python 3 <https://www.python.org/download/>`_ ;
 - LaTeX. La distribution `MacTeX <https://tug.org/mactex/>`_ est la plus simple à installer. Une installation personnalisée de TeXLive fonctionnera aussi si vous savez ce que vous faites.
 - Lilypond peut être utile si vous souhaitez compiler les partitions dans les chansons. Ce n'est toutefois pas une dépendance obligatoire. Vous pouvez le télécharger à `cette adresse <http://www.lilypond.org/download.fr.html>`_. Décompressez l'archive, puis placez la dans :file:`/Applications`. Vous devrez ajouter un lien vers lilypond pour que `songbook` puisse le trouver en lançant les commandes suivantes dans un Terminal : ::

     sudo ln -s /Applications/LilyPond.app/Contents/Resources/bin/lilypond /usr/local/bin/lilypond
     echo "export PATH=$PATH:\usr\local\bin" >> ~/.bashrc

  La première commande va vous demander votre mot de passe administrateur.

Windows
^^^^^^^

Voici où vous pourez trouver les dépendances nécessaires :
 - `Python 3 <https://www.python.org/download/>`_ ;
 - `MikTeX <http://miktex.org/download>`_ pour avoir accès a LaTeX ;
 - `Lilypond <http://www.lilypond.org/windows.fr.html>`_.

.. _install_pip:

Installation depuis PyPi
------------------------

Une fois les dépendances installées, vous pouvez vérifier que tout s'est bien passé en lançant les commandes ::

   python --version
   pdflatex --version

   # Uniquement si vous avez installé lilypond
   lilypond --version

Si le numéro de version s'affiche, tout va bien, si vous avez une erreur ``command not found``, il y a un problème.

Pour la suite, la bibliothèque `Patacrep` et le programme :command:`songbook` sont disponibles sur le `Python Packages Index <http://pypi.python.org/pypi/patacrep>`_, vous pouvez donc les installer avec ``pip`` ::

    pip3 install patacrep

Puis pour tester si tout a bien fonctionné ::

   songbook --version

Mac OS X
^^^^^^^^

Si vous avez des erreurs lors de l'installation, deux cas sont possibles :
   - erreur ``permission denied`` : vous n'avez pas de droits en écriture dans :path:`/usr/bin`. Ajoutez ``sudo`` devant la commande fautive, et relancez là (``sudo pip3 install patacrep``). Un mot de passe administrateur vous sera demandé.
   - ``songbook: command not found``, c'est que :file:`/urs/local/bin` n'est pas dans votre ``PATH``. Pour l'ajouter, exécutez la commande ::

       echo "export PATH=$PATH:\usr\local\bin" >> ~/.bashrc

.. _install_sources:

Installation de la version de développement
-------------------------------------------

Pour obtenir la version de développement, il est possible de télécharger les
sources en utilisant `git <http://git-scm.com>`_ : ::

    git clone https://github.com/patacrep/patacrep.git
    cd patacrep
    pip3 install -r Requirements.txt
    python3 setup.py install


Pour mettre à jour la version de développement, utilisez simplement ::

    git pull
    pip3 install -r Requirements.txt
    python3 setup.py install

Depuis le dossier :file:`patacrep`


Mise à jour
===========

Pour effectuer une mise à jour de `Patacrep`, vérifiez que les dépendances sont à jour, puis lancez la commande ::

   pip3 install --upgrade patacrep
