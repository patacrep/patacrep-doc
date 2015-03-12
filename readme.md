# Patacrep-doc

Documentation for the [patacrep](https://github.com/patacrep/patacrep) project, using Sphinx. 

This documentation may be read online on [Read the Docs](http://patacrep.readthedocs.org/).

To build the documentation, you will need a `make` implementation and sphinx. Sphinx can be installed with `pip`, or very likely with the package manager of your distribution.

# Compilation

## HTML
      
    make html
    
## PDF

You will need a working LaTeX distribution.

    make latexpdf

## Translated version

The main language of the documentation is French. English version is also available, and can be build with the following steps : 

1. Install `gettext`, or make sure you have it.
2. Install `sphinx-intl` with `pip`.
3. Create the `gettext` `.pot` files with `make gettext`
4. Update the `locale` directory with `sphinx-intl update -p _build/locale -l en`
5. Translate the `.po` files in `locale/en/LC_MESSAGES/`
6. Build the HTML version with `make -e SPHINXOPTS="-D language='en'" html`
7. Build the PDF version with `make -e SPHINXOPTS="-D language='en'" latexpdf`

When the French documentation is updated, restart at step 3.

# Compiled version

A compiled PDF version should be available, someday, here : http://www.patacrep.com/data/documents/doc_fr.pdf
