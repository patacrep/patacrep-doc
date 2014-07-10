.. _templates:

Changer la mise en page des carnets : le système des templates
==============================================================

Le processus de génération d'un carnet en PDF est le suivant : 

1. Création du fichier .tex
2. Compilation avec :command:`pdflatex`
3. Compilation des index
4. Compilation avec :command:`pdflatex` prenant en compte les index

Après l'étape 1, l'intégralité du carnet (contenu et mise en page) est défini. 
Pour modifier un carnet, il faut donc se pencher sur cette étape. La gestion du 
contenu est délégée aux :ref:`plugins <plugins_write>`, ici nous allons voir comment 
modifier la mise en page. LaTeX étant utilisé pour créer ces carnets, une bonne connaissance
de ce langage est nécessaire.

Ces fichiers :file:`.tex` sont créés avec le moteur de template `Jinja2 <http://jinja.pocoo.org/>`_,
en utilisant une syntaxe dérivée légèrement différente et plus adaptée à LaTeX.

Fonctionnement d'un système de templates
----------------------------------------

Idée de base
^^^^^^^^^^^^

Lors de la création de carnets de chants avec LaTeX, on écrit souvent des fichier ayant la 
même structure, mais un contenu un peu différent. Un moteur de template permet de décrire la
structure du fichier final, en indiquant quelle valeur devra être utilisée à quel endroit pour
effectuer le rendu du document.

Syntaxe
^^^^^^^

Il y a deux types d'éléments de syntaxe avec Jinja2 : des variables, qui seront simplement 
remplacés par leur valeur et des instructions de contrôle, qui permettent d'ajouter de la logique
dans la construction des templates.

:dfn:`Variables` :
   Les variables sont délimitées par deux parenthèses : ``((song))`` sera replacé par le 
   contenu de la variable ``song`` lors du rendu d'un template. Il est possible d'appeller
   des méthodes python sur les variables : ``(( songlist.length() ))`` est tout à fait valide.
   
   Les variables accessibles dans un template sont l'ensemble des options définies dans le 
   :ref:`bloc de déclaration des variables <templates_vars>`, et prennent soit les valeur par
   défaut, soit les valeurs définies par les utilisateurs dans les fichiers :file:`.sb`.
   
   Lorsque ces variables sont des chemins de fichiers, il est important de toujours utiliser
   la fonction :py:func:`path2posix` afin de normaliser l'écriture de ces chemins. Par exemple : 
   ``(( path2posix(path) ))``.

:dfn:`Instructions` :
   Les instructions sont signalés par ``(* *)``. Ils existe plusieurs, qui suivent le même
   format : ``(* <instruction> <arguments> *)``, et se termine parfois par ``(* end<instruction> *)``.
   
Les instructions les plus utiles sont détaillées ici.

:dfn:`block` :
   L'instruction ``(* block *)`` permet de placer du contenu à un endroit du document. Si le bloc en question
   existe dans un des :ref:`templates parents <template_extends>`, le contenu du bloc sera placé à cet endroit.
   
   La syntaxe exacte est : ::
      
      (* block mon_bloc *)
         Contenu
      (* endblock *)

:dfn:`extend et include` :
   TODO

:dfn:`if` :
   TODO
   
:dfn:`for` :
   TODO

Pour le reste des fonctionalités de Jinja, vous pouvez aller voir la `documentation <http://jinja.pocoo.org/>`_,
en retenant que ``{{ variable }}`` et ``{% instruction %}`` on été remplacés par ``(( variable ))`` et ``(* instruction *)``.


Templates par défaut
--------------------

Les templates suivant sont fournis par défaut par ``Patacrep``, et remplissent des
fonctions différentes.  

:file:`layout.tex`
  Défini l'ensemble des ``block`` qui seront accessibles aux autres templates.

:file:`songs.tex`
  Le template :file:`songs.tex` étends :file:`layout.tex`, et permet de placer les chansons dans le document.

:file:`default.tex`
  Le template :file:`default.tex` étends :file:`songs.tex`, et applique une mise en forme minimale.
  Si vous voulez créer votre propre mise en page, c'est sans doutes celui-ci qu'il vous faudra étendre.

:file:`patacrep.tex`
  Le template :file:`patacrep.tex` étends :file:`default.tex`, et applique la mise en forme spéciale du
  projet Patacrep.


Créer son propre template
-------------------------

Pour créer votre propre template et l'utiliser, il vous faudra creer un fichier mon_template.tex dans un 
sous-dossier :file:`templates` d'un :ref:`datadir <datadir_templates>`, et ajouter 
``"template":"mon_template.tex"`` dans votre fichier :file:`.sb`. Le plus simple pour vous est encore 
de faire hériter votre template de l'un des templates par défaut de Patacrep, comme :file:`default.tex` 
ou :file:`patacrep.tex`.

.. _templates_vars:

Les variables
^^^^^^^^^^^^^

TODO


Pour modifier la mise en page des carnet, la `documentation <http://songs.sourceforge.net/songsdoc/songs.html#sec11>`_ 
correspondante du package ``songs`` sera aussi très utile !