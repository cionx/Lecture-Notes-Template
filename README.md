# Lecture Notes Template

This repository contains a template for lecture notes in LaTeX. It uses the class `scrbook` and the font `Libertinus`.
A compiled version of the template can be downloaded [here][1].
More detailed information will be added in the future.

To use this template for an actual project you should make the following changes:
- Adjust in the file `styles/titlepage_style.sty` the following information:
  - Title of the lecture.
  - Author name.
  - Date and place.
  - Link and email.
- Delete or adjust the various test files in the subdirectory `sections`.
  Remove the entries in the main file `main.tex` corresponding to the deleted files.
- Adjust the entries in the bibliography file `bibliography.bib`.
- Adjust the text of `README.md` and remove the file `CHANGELOG.txt`.
- Adjust in the gitlab make file `.gitlab-ci.yml` the name of the resulting pdf document from `lecture-notes-template.pdf` to the name of your choice.
  The download link will be available at `<link to the github project page>/<your choosen file name>`.

[1]: https://lecture-notes-bonn.gitlab.io/lecture-notes-template/lecture-notes-template.pdf