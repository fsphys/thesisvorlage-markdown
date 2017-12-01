# Vorlage für Abschlussarbeiten am KIT
Bereitgestellt von der Fachschaft Physik

## Übersicht
[Markdown](https://daringfireball.net/projects/markdown/)
ist eine minimalistische Sprache die darauf abzielt,
dass nicht nur die Übersetzung in z.B. eine PDF Datei,
sondern auch der Quellcode selbst ein menschenlesbares Dokument ist.

Das bedeutet nicht, dass man auf Features von LaTeX verzichten muss.
[Pandoc's Erweiterung von Markdown](https://pandoc.org/MANUAL.html)
erlaubt dem Author viele praktische Sprachelemente von LaTeX,
mit deutlich weniger Tipparbeit zu nutzen.
Im Zweifelsfall erlaubt es auch direkt
[LaTeX Befehle in Markdown zu nutzen](https://pandoc.org/MANUAL.html#extension-raw_tex).

## Voraussetzungen
Zum Benutzen dieser Vorlage werden folgende Programme benötigt:

* make
* [Tex-Live](https://tug.org/texlive/)
* [Pandoc](https://pandoc.org) (mind. Version 1.12)
  und übliche Filter:
  [pandoc-crossref](https://github.com/lierdakil/pandoc-crossref),
  [pandoc-citeproc](https://github.com/jgm/pandoc-citeproc)

Auf Ubuntu, Debian und ähnlichen Systemen
können diese mit folgendem Befehl installiert werden:

    $ sudo apt install make texlive pandoc pandoc-crossref pandoc-citeproc

Auf Arch Linux und Manjaro:

    $ sudo pacman -S make texlive-most pandoc pandoc-crossref pandoc-citeproc

( **Pro Tip**: Die Haskell-Dependencies können mit den statisch kompilierten AUR-Paketen
`pandoc-bin`, `pandoc-crossref-bin` und `pandoc-citeproc-bin` umgangen werden.)

Auf Mac mit [Homebrew](https://brew.sh):

    $ brew install brew-cask make pandoc pandoc-crossref pandoc-citeproc
    $ brew cask install mactex

## Benutzung
Der folgende Befehl kopiert die Vorlage in ein neues Verzeichnis auf deinem Rechner:

    $ git clone https://github.com/fsphys/thesisvorlage-markdown <verzeichnis_name>
    $ cd <verzeichnis_name>

Die gesamte Arbeit kann mit einem einfachen `make`-Befehl compiliert werden.

    $ make

Da erfahrungsgemäß das Compilieren im späteren Stadium der Arbeit recht lange dauert,
kann auch kapitelweise gearbeitet werden, z.B. für Kapitel 3:

    $ make chapter3.pdf

Das erzeugt dann eine PDF-Datei `chapter3.pdf` die nur Kapitel 3 enthält.
Die Kapitelnummerierung und Referenzierung von Inhalten in anderen Kapiteln
wird dabei nicht funktionieren.

### Bibliographiemanagement

#### Mit pandoc-citeproc
Der Pandoc-Filter `pandoc-citeproc` erlaubt
[beliebige Zitationsstile](https://github.com/citation-style-language/styles)
zu benutzen.
Um Zitate einzubauen, können beliebig viele Bibtex-Dateien in `refs/` abgelegt werden,
die dann beim ausführen von `make` automatisch übersetzt werden.
(Die Dateien werden an der Endung `.bib` erkannt, diese also beibehalten.)
In der `config.yaml` muss dann noch stehen:
```yaml
# config.yaml
bibliography: references.yaml
citation-style: /path/to/file.csl
```

#### Mit Bibtex
Es kann auch einfach Bibtex verwendet werden,
dann stehen aber nur die Standard Zitationsstile zur Verfügung.
Du musst dich dann auch selbst darum kümmern,
dass alle Zitate in einer Bibtex-Datei zusammenkopiert werden
(im Beispiel unten `references.bib`).
```yaml
# config.yaml
bibliography: references.bib
biblio-style: <style>
```
Wobei `<style>` durch einen Bibtex Stil, z.B. `apalike`/`numeric`/…, ersetzt werden muss.
Wenn du diese Option wählst kannst du `references.yaml` aus dem Makefile löschen,
damit es keine Fehlermeldungen gibt.
```diff
# Makefile
-thesis: config.yaml references.yaml chapter*.md appendix*.md
+thesis: config.yaml chapter*.md appendix*.md
```

## Contributing
Auf der [Github-Seite](https://github.com/fsphys/thesisvorlage-markdown) -> `Issues` -> `New issue` auswählen.
Problem, Fragen und Verbesserungsvorschläge sind herzlich willkommen.
