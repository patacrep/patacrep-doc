.. _plugins_write:

Ajouter du contenu aux carnet : écrire un plugin
================================================

Dans toute la suite, nous allons créer un plugin :py:mod:`foo`, associé au mot-clef
``foo``, qui écrit dans le recueil les arguments et contenu associé, quasiment
sans traitement. Ce plugin se présente sous la forme d'un fichier :file:`foo.py` (le
nom de fichier est libre), présent dans un sous répertoire :file:`python/content`
d'un :file:`datadir`.

Définition
----------

Un plugin se présente sous la forme d'un fichier Python, présent dans un
répertoire :file:`python/content` (relativement à un des :file:`datadir`). Ce fichier doit
contenir une variable :py:data:`CONTENT_PLUGIN`, qui est un dictionnaire dont les
clefs sont des mots-clefs, et les valeurs des fonctions :ref:`parse <parse>`.

Lors de la compilation du recueil, lors de l'analyse de la variable ``content``
du fichier :file:`.sb`, lorsqu'un de ces mots-clefs est rencontré, la fonction
:py:func:`parse` correspondante est appelée.

Notre plugin d'exemple contient donc le code suivant (où :py:func:`parse` est une
fonction, définie plus tôt dans le fichier, dont nous allons parler dans la
partie suivante).

.. code-block:: python

  CONTENT_PLUGIN = {'foo': parse}

Classe :py:class:`content.Content`
----------------------------------

L'objet qui produit quelque chose dans le recueil est une instance de la classe
:py:class:`content.Content`. La méthode d'initialisation est libre, et la méthode
principale est la méthode :py:meth:`content.Content.render`, qui prend en
argument le `contexte <http://jinja.pocoo.org/docs/api/#the-context>`_ courant,
et renvoie une chaîne de caractères à inclure dans le fichier :file:`.tex`.

Plus de détails sur cette classe (ainsi que sur les autres méthodes utilisées)
sont disponibles dans le docstring de `cette classe TODO(remplacer le lien par
le blob vers la version 4.0.0)
<https://github.com/patacrep/patacrep/blob/master/patacrep/content/__init__.py#L84>`_.

Pour notre exemple, nous allons définir une nouvelle classe :py:class:`Foo`,
héritant de cette classe :py:class:`content.Content`.

.. code-block:: python

  from patacrep.content import Content

  class Foo(Content):

    def __init__(self, arguments, contentlist):
      """Fonction d'initialisation

      Le moteur de plugin ne va pas appeler cette fonction directement : chaque
      plugin est donc libre de définir cette initialisation comme il l'entend.
      """
      self.arguments = arguments
      self.contentlist = contentlist

    def render(self, __context):
      return self.arguments + str(self.contentlist)


.. _parse:

Fonction :py:func:`parse`
-------------------------

La fonction :py:func:`parse` est appelée lorsque le mot clef est rencontré,
avec comme arguments :

`keyword`
  le mot clef ayant déclenché l'appel à cette fonction ;
`argument`
  l'argument passé au mot-clef ;
`contentlist`
  la suite de la liste du contenu
`config`
  le dictionnaire contenant la configuration du recueil en cours de
  construction. Le modifier est autorisé.

Ainsi, si le contenu du recueil comprend ``["foo(bar)", "one", "two",
"three"]``, notre fonction :py:func:`parse` sera appelée avec comme arguments
:samp:`parse('foo', 'bar', ['one', 'two', 'three'], config)`.

Cette fonction doit retourner une liste (éventuellement vide) d'objets de
classe :py:class:`content.Content` (ou une de ces sous-classes). Ces objets seront
intégrés au recueil (en utilisant principalement leur méthode
:py:meth:`content.Content.render`) dans l'ordre dans lequel ils apparaissent
dans cette liste.

Notre fonction va donc être la suivante :

.. code-block:: python

  def parse(keyword, argument, contentlist, config):
    return [Foo(argument, contentlist)]

Bilan
-----

Notre plugin est maintenant fonctionnel. Il va être appelé si la variable
``content`` du recueil contient par exemple ``["foo(bar)", "one", "two",
"three"]``.
