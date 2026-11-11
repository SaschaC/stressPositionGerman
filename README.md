# German Word Stress Explorer
### An interactive view of lexical stress in German

An R/Shiny application for exploring where stress falls in German words. Users filter by word class and frequency, then compare stress-position counts across syllable lengths.

**Original repository commits:** September 2016 · **Author:** Sascha Coridun  
**Context:** Language-data exploration, related to the Developing Data Products coursework · **Stack:** R, Shiny, ggplot2

The original implementation was written without AI coding assistance. This README was refreshed with AI assistance in November 2026; the original source and commit history are preserved.

## Research question

How does the distribution of stressed syllables vary with word length, word class, and word frequency?

The interface allows users to select adjectives, nouns, verbs, or all words, and adjust a frequency range. Faceted bar charts show stress-position counts for each syllable length. A stress position of 1 means that the first syllable is stressed.

This project connects a linguistic question to corpus filtering and an interactive visualization. The charts show descriptive counts; they do not establish causal relationships or constitute a pronunciation predictor.

## Data and reproducibility

The application is based on the German CELEX lexical database. The [related project presentation](https://github.com/SaschaC/dataProducts/blob/master/presentation/index.Rmd) describes a selection of 44,378 adjectives, nouns, and verbs with two to five syllables.

**The full application dataset is not included in this repository.** The server expects `database.txt`, while the repository contains only [database_excerpt.txt](database_excerpt.txt). Consequently, a fresh checkout is not a complete runnable reproduction.

The excerpt documents these fields:

| Field | Meaning |
| --- | --- |
| `index` | Source row identifier |
| `word` | German word |
| `frequency` | Corpus frequency |
| `wordType` | Adjective (`A`), noun (`N`), or verb (`V`) |
| `stressPosition` | Index of the stressed syllable |
| `syllableNumber` | Number of syllables |

The excerpt starts with explanatory lines before its tabular header. Simply renaming it to `database.txt` will not reproduce the expected input.

## Running the historical application

With an appropriately licensed, tab-delimited `database.txt` in the repository root, the application entry point is:

```r
shiny::runApp(".")
```

The original server loads `dplyr`, `ggplot2`, `rCharts`, and `plyr`; Shiny is required to launch the application.

**Compatibility has not been validated on a current R environment.** In particular:

- `rCharts` is loaded even though the displayed plot uses `ggplot2`.
- The code assumes `wordType` is a factor. Modern R defaults for reading character columns differ from the historical behavior.
- Package versions and the full source dataset are not pinned or bundled.

These are documented reproduction requirements, not changes to the historical application.

## Repository guide

| Path | Purpose |
| --- | --- |
| [ui.r](ui.r) | Word-class selector, frequency slider, and plot layout |
| [server.r](server.r) | Dataset loading, filtering, and faceted stress plots |
| [database_excerpt.txt](database_excerpt.txt) | Example data schema and rows |
| [rsconnect/](rsconnect/) | Historical deployment metadata |

## Related work and provenance

The companion [dataProducts repository](https://github.com/SaschaC/dataProducts) contains a related app version, Python extraction code, and the project presentation. These repositories form one project family rather than two independent portfolio projects.

- [Original source snapshot](https://github.com/SaschaC/stressPositionGerman/tree/ecd0a9871fab6f3b5054fd6a8e367ed7dbeba4ba)
- [Development history](https://github.com/SaschaC/stressPositionGerman/commits/master/)
- [CELEX database catalogue](https://catalog.ldc.upenn.edu/LDC96L14)

My contribution is the application and its filtering/visualization logic. CELEX is the external lexical data source. Access and redistribution of that data are subject to its own terms; this documentation refresh does not add a license to the source code or dataset.

