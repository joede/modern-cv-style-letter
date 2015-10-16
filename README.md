# modern-cv-style-letter

The goal of this project is a simple to use template for LaTeX (and TeXstudio) for modern looking letters.

The layout an style is adapted to the good looking `modern-cv` package.

Since the target of this template are German users, the remaining part of the description is in German. If you need a translation, just add an issue. ;-)


**Und nun in Deutsch**

Das Paket `modern-cv-style-letter` hat zum Ziel, eine einfach zu verwendete Vorlage für DIN Briefe zu implementieren, die dann auch noch modern aussieht. Das Layout ist hierbei an das Aussehen der Lebensläufe des LaTeX-Pakets `modern-cv` angelehnt. Das nachfolgende Beispiel zeigt einen Musterbrief (hier als [PDF-Beispiel](https://raw.github.com/joede/modern-cv-style-letter/master/sample.pdf)).

![Musterbrief](https://raw.github.com/joede/modern-cv-style-letter/master/texstudio/modern-cv-style-letter.png)


## Konfiguration

Alle Informationen sind in die `lco`-Datei `absender.lco` ausgelagert. Hier befinden sich neben den Daten des Absenders auch alle Konfigurationen. Will man diese Daten nicht ständig anpassen, muss man einfach nur die Datei `absender.lco` öffnen und den Abschnitt "PERSÖNLICHE DATEN" suchen. Zwischen den Linien sind alle notwendigen Felder aufgeführt.

````
%=========================================================
%\newcommand{\myTitel}{Dipl\@.-Ing\@.}                % NEED TITLE? UNCOMMENT
%\newcommand{\myTitel}{Dr\@.}                         % NEED TITLE? UNCOMMENT
\newcommand{\myVorname}{Max}
\newcommand{\myNachname}{Mustermann}
\newcommand{\myStrasse}{Musterstraße~1}
\newcommand{\myStadt}{Musterhausen}
\newcommand{\myPLZ}{11111}
\newcommand{\myEMail}{max@mustermann.net}
\newcommand{\myTelefon}{+49~(0)1234~567890}
%\newcommand{\myMobilefone}{+49~(0)1234~567890}       % NEED MOBILE? UNCOMMENT
%\newcommand{\myTelefax}{+49~(0)1234~567890}          % NEED FAX? UNCOMMENT
%=========================================================
````

Die farbliche Abstimmung wird im Abschnitt "FARBEN" einfach durch die Definition der Farben für *wichtige* (`myColorMore`) und *weniger wichtige* (`myColorLess`) Teile des Briefkopfes definiert. Als Vorgabe sind die Werte hier Grau bzw. Hellgrau.

````
%=========================================================
\definecolor{myColorRegular}{rgb}{0,0,0}              % Schwarz (normale Schrift)
\definecolor{myColorMore}{rgb}{0.45,0.45,0.45}        % wichtige Teile des Kopfes
\definecolor{myColorLess}{rgb}{0.68,0.68,0.68}        % weniger wichtige Teile des Kopfes
%=========================================================
````

Der Brief selbst reduziert sich durch diese Maßnahmen auf ein angenehmes Minimum. Die `.lco` Datei wird einfach als Parameter an die Dokumentenklasse übergeben, und schon kann man loslegen.

````
\documentclass[absender]{scrlttr2}

\begin{document}
\setkomavar{subject}{Betreff: der Stein ist sehr groß}

\begin{letter}{
    Herr Flitzpipe\\
    Pipen GmbH\\
    Musterstr. 1\\
    12345 Musterhausen
}
\opening{Sehr geehrter Herr Flitzpipe,}

hier geht dann das eigenliche Schreiben los.

\closing{Mit freundlichen Grüßen,}
\encl{Staubsauger}
\end{letter}
\end{document}
````

## Vorlage für TeXstudio

Die grafische Oberfläche *TeXstudio* erlaubt die Verwendung von Dokumentenvorlagen. Diese können im einfachsten Fall einzelne Dateien sein, oder wie in diesem Fall ein ZIP-Archiv. Details kann man der Dokumentation von *TeXstudio* entnehmen. Unter Linux werden die Dateien einer Vorlage unter `~/.config/texstudio/templates/user` gespeichert. Benutzer von Windows müssen unterhalb der Anwendungesdaten des jeweiligen Benutzer suchen. In Windows 7 zum Beispiel `C:\Users\XXX\AppData\Roaming\texstudio\templates\user\` wobei *XXX* für den Usernamen steht.

Zusätzlich zur Vorlage selbst gibt es eine Beschreibungsdatei im JSON Format und ein optionales Vorschaubild. Alle diese Dateien müssen mit dem Präfix `template_` beginnen und grundsätzlich den gleichen Basisnamen verwenden.

### Benutzerspezifische Anpassungen

Am sinnvollsten ist es, wenn man für jeden Absender eine eigene Vorlage verwendet. Hier entpackt man die ZIP-Datei dieser Vorlage hier (`modern-cv-style-letter.zip`) in ein temporäres Verzeichnis. Danach muss man die `.lco` Datei nach den jeweiligen Wünschen des Absenders anpassen. In der `.json`-Datei sollte man mindestens den Namen der Vorlage (`"Name":`) an den Absender anpassen.

Nachdem man die `.lco` und `.json` Dateien angepasst hat, muss man die `.lco` Datei wieder in das ZIP-Archiv der Vorlage (`modern-cv-style-letter.zip`) aufnehmen. Die so angepassten drei Dateien (`.zip`, `.json` und `.png`) können dann in das Vorlagenverzeichnis von *TeXstudio* kopiert werden.

**Tipp:** das Script `build.sh` baut unter Linux das Beispiel PDF , erzeugt das Vorschaubild und packt die Dateien in das ZIP-Archiv.

**Hinweis:** will man mehrere Briefvorlagen für verschiedene Absender im gleichen Vorlagenverzeichnis speichern, dann muss man den Basisnamen der Vorlage (`modern-cv-style-letter`) entsprechend abändern. Dazu reicht es, wenn man das Kürzel an den Namen anhängt. Für *Max Mustermann* könnte die Vorlage dann `modern-cv-style-letter--mm` heißen.



*Viel Spass mit der Vorlage*

