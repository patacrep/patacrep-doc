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
en utilisant une syntaxe légèrement différente de la version par défaut et plus adaptée à LaTeX.

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
   des méthodes python sur les variables : ``(( songlist.length() ))`` est tout
   à fait valide (si toutefois l'objet ``songlist`` a une méthode
   ``length()``).
   
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
   
   Plusieurs blocs sont définis dans les :ref:`templates par défaut <templates_default>`

.. _template_extends:

:dfn:`extends` :
   Il est possible d'étendre un template près-existant. Dès lors, tout le contenu écrit 
   dans un bloc sera placé dans le bloc correspondant du template parent. Si le bloc n'existe pas,
   le contenu sera placé à la fin du fichier, et donc ignoré à la compilation LaTeX car
   placé après le ``\end{document}``. Pour étendre un template particulier, on utilise ::
      
      (* extends "template.tex" *)

:dfn:`if` :
   Il est possible d'effectuer des placements conditionels avec les instructions ``if``.
   La syntaxe est simplement : ::
   
      (* if <condition1> *)
         Placé si la condition 1 est vraie
      (* elif <condition2> *)
         Placé si la condition 2 est vraie
      (* else *)
         Placé si les conditions 1 et 2 sont fausses
      (* endif *)
      
   Les insructions `elif` et `else` sont facultatives, et les conditions peuvent être n'importe
   quelle expression valide en Python. Par exemple : ::
   
      (* if booktype == "chorded" *)
         \addschords
      (* endif *)
      
      (* if textwidth > 42 *)
         \collumns{3}
      (* endif *)
   
:dfn:`for` :
   Il est possible de répeter un contenu avec une boucle ``for``. La syntxe est la suivante : ::
   
      (* for lang in languages_list *)
         Contenu à être répété, en utilisant la variable ((lang))
      (* endfor *)
   
   Un cas d'utilisation pourrai être : ::
      
      (* for lang in languages_list *)
         (* if not lang == "french" *)
            \setlang{ ((lang)) }
         (* else *)
            \setmainlang{ ((lang)) }
         (* endif *)
      (* endfor *)

Pour le reste des fonctionalités de Jinja, vous pouvez aller voir la `documentation <http://jinja.pocoo.org/>`__,
en retenant que ``{{ variable }}`` et ``{% instruction %}`` on été remplacés par ``(( variable ))`` et ``(* instruction *)``.

.. _templates_default:

Templates par défaut
--------------------

Les templates suivant sont fournis par défaut par ``Patacrep``, et remplissent des
fonctions différentes.  

:file:`layout.tex`
  Défini l'ensemble des ``block`` qui seront accessibles aux autres templates. Les blocs suivant sont
  définis, dans cet ordre :

     :dfn:`documentclass`
        Bloc contenant la commande ``\documentclass{article}``. À surcharger pour changer la classe LaTeX utilisée, ou ajouter des options ;

     :dfn:`preambule`
        Bloc placé avant le ``\begin{document}``. Utile pour importer des packages ou redéfinir des
        macro LaTeX ;

     :dfn:`title`
        Bloc utilisé pour placer les commandes de la page de titre, `i.e.` ``\maketitle`` ;

     :dfn:`preface`
        Pour ajouter une préface au recueil ;

     :dfn:`index`
        Pour placer les index ;

     :dfn:`chords`
        Pour placer une liste d'accords au début du carnet ;

     :dfn:`songs`
        Le contenu principal est placé dans ce bloc ;

     :dfn:`postface`
        Pour ajouter une postface au receuil.

  Ce template ne produit aucun fichier PDF.


:file:`songs.tex`
  Le template :file:`songs.tex` étends :file:`layout.tex`, et se charge de placer le contenu dans le document. Il contient le minimum nécessaire pour que les chansons (mais pas les index) soient rendues.

:file:`default.tex`
  Le template :file:`default.tex` étends :file:`songs.tex`, et applique une mise en forme minimale, ainsi que les index.
  Si vous voulez créer votre propre mise en page, c'est sans doutes celui-ci qu'il vous faudra étendre.

:file:`patacrep.tex`
  Le template :file:`patacrep.tex` étends :file:`default.tex`, et applique la mise en forme spéciale du
  projet Patacrep. Si vous souhaitez modifier légèrement la mise en page du carnet, ce template sera utile.


Créer son propre template
-------------------------

Pour créer votre propre template et l'utiliser, il vous faudra creer un fichier :file:`mon_template.tex`
dans un sous-dossier :file:`templates` d'un :ref:`datadir <datadir_templates>`, et ajouter 
``"template":"mon_template.tex"`` dans votre fichier :file:`.sb`. Le plus simple pour vous est encore 
de faire hériter votre template de l'un des templates par défaut de Patacrep, comme :file:`default.tex` 
ou :file:`patacrep.tex`. Vous pourrez alors (re)définir les commandes LaTeX de votre choix. 

La `documentation <http://songs.sourceforge.net/songsdoc/songs.html#sec11>`_ (en anglais) du package ``songs`` explique
comment modifier la mise en page des carnets créés, et quelles commandes redéfinir.

.. _templates_vars:

Les variables
^^^^^^^^^^^^^

Si vous voulez accéder à des variables dans vos templates avec la syntaxe ``(( ma_variable ))``, vous 
devez définir ces variables au début de votre fichier de template. Ces définition doivent être placées 
entre les instructions ``(* variables *)`` et ``(* endvariables *)``, et sont décrite au format JSON selon 
le schéma suivant :

.. code-block:: json

   {
   "ma_variable": {"description": {"english": "english description", "french": "description française"},
                  "default": {"default":[]}   
   }

Les variables sont déclarées dans un dictionnaire, dont les clefs sont les noms des variables, et les valeurs des
dictionnaires. Dans ces valeurs peuvent entrer plusieurs clefs, dont les plus utiles sont ``"description"``, qui est 
un dictionnaire de description de cette variable ; et ``"default"`` qui reseigne la valeur par défaut de cette variable.

La valeur par défaut peut être de tous les types acceptés par JSON (chaînes, listes et dictionnaires) et 
peut dépendre ou non de la langue, avec la syntaxe suivante : 

.. code-block:: json

   {
   "ma_variable": {"default": {"default":"Valeur indépendante de la langue."},
   "mon_autre_variable": {"default": {"french":"Valeur par défaut pour un carnet en français.",
                                      "english":"Valeur par défaut pour un carnet en anglais.",
                                      "default":"Valeur par défaut si la langue n'est ni le français ni l'anglais."
                                       }
   }
