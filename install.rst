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

Mac OS
^^^^^^

TODO

Windows
^^^^^^^

TODO

.. _install_sources:

Sources
-------

Archive :file:`.tar.gz`
^^^^^^^^^^^^^^^^^^^^^^^

Les sources de la dernière version sont disponibles ici :
`<http://example.com/TODO.tar.gz>`_. Après avoir décompressé l'archive, lancez
la commande suivante pour l'installation : ::

    ./setup.py install

Ou alors, pour une installation avec `pip <http://pypi.python.org/pypi/pip/>`_
(sans décompresser l'archive) : ::

    pip intstall TODO.tar.gz

Dépôt `git`
^^^^^^^^^^^

Pour obtenir la version de développement, il est possible de télécharger les
sources en utilisant `git <http://git-scm.com>`_ : ::

    git clone https://github.com/patacrep/patacrep.git

L'installation se fait ensuite de la même manière que pour l'installation à
partir de l'archive :file:`.tar.gz`.
