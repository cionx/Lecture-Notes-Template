# Lecture Notes Template

This repository contains a class for lecture notes in LaTeX.
It it build on the class `scrbook` and the font `Libertinus`.
A test version of the template can be downloaded [here][1].

To use this template for an actual project you should make the following changes:
- To adjust the titlepage, redefine the macros `\lectureTitle`, `\lectureSubtitle`, `\authorname`, `\onlineadress`, `\emailadress`
- Delete or adjust the various test files in the subdirectory `sections`.
  Remove the entries in the main file `main.tex` corresponding to the deleted files.
- Adjust the entries in the bibliography file `bibliography.bib`.
	(You could have a look at [another repository of mine][2] too see how entries should look like.)
- Adjust the entries in the list of symbols `symbols.tex`.
- Adjust the text of `README.md`.
- Adjust in the GitLab build file `.gitlab-ci.yml` the name of the files.
  The download link will be available at
	```
	http://<group/user name>.gitlab.io/<project name>/<pdf file name>.pdf
	```

[1]: https://lecture-notes-bonn.gitlab.io/lecture-notes-template/lecture-notes-template.pdf
[2]: https://gitlab.com/cionx/bibliography
