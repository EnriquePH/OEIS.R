# Package index

## Fetch a sequence

Validate an `ID` and download a complete sequence entry.

- [`OEIS_check()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_check.md)
  : OEIS ID Validation

- [`OEIS_ID()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_ID.md)
  :

  OEIS sequence authors from `internal format`, or from the sequence
  `ID`.

- [`OEIS_sequence()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_sequence.md)
  :

  S3 class constructor for `OEIS_sequence`

## Sequence fields

Read individual fields from a sequence `ID`, its parsed internal format,
or an already-built `OEIS_sequence` object.

- [`OEIS_description()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_description.md)
  : Get OEIS sequence description

- [`OEIS_terms()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_terms.md)
  :

  Get OEIS sequence terms from `XML` document.

- [`OEIS_offset()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_offset.md)
  :

  OEIS sequence offset from `xml2` data.

- [`OEIS_comments()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_comments.md)
  :

  OEIS sequence comments lines from sequence `internal_format`

- [`OEIS_links()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_links.md)
  : Links from sequence data

- [`OEIS_example()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_example.md)
  :

  OEIS sequence example lines from sequence `internal_format`

- [`OEIS_formula()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_formula.md)
  :

  OEIS sequence formula lines from sequence `internal_format`

- [`OEIS_mathematica()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_mathematica.md)
  :

  OEIS Wolfram Mathematica code from sequence `internal_format`

- [`OEIS_keywords()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_keywords.md)
  :

  OEIS sequence keywords from sequence `internal_format`

- [`OEIS_author()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_author.md)
  :

  OEIS sequence authors from `internal format`, or from the sequence
  `ID`.

- [`OEIS_date()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_date.md)
  :

  OEIS sequence creation date from `data.frame`

- [`OEIS_extensions()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_extensions.md)
  :

  OEIS sequence extensions from sequence `internal_format`

- [`OEIS_formerly()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_formerly.md)
  :

  Get OEIS sequence former `ID`

- [`OEIS_status()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_status.md)
  : Get OEIS sequence status

## Cross references

Sequences referenced by, in context with, or adjacent to a sequence.

- [`OEIS_crossrefs()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_crossrefs.md)
  : OEIS Cross references

- [`OEIS_cf()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_cf.md)
  :

  OEIS sequence linked cross references from sequence information
  `data.frame`

- [`OEIS_seqs_in_context()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_seqs_in_context.md)
  : OEIS Sequences in context from from XML document

- [`OEIS_seqs_adjacent()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_seqs_adjacent.md)
  : OEIS Adjacent sequences from XML document

## B-files (extended term lists)

OEIS sequences show a limited number of terms; b-files provide many
more.

- [`OEIS_bfile()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_bfile.md)
  :

  S3 class constructor for `bfile` data.

- [`OEIS_bfile_url()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_bfile_url.md)
  :

  Get sequence data url in `bfile` format.

- [`OEIS_download_bfile()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_download_bfile.md)
  : Download bfile from the OEIS

## Low-level access

URLs and raw document/format accessors used internally by the
higher-level functions above.

- [`OEIS_url()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_url.md)
  : Get sequence url in the OEIS server

- [`OEIS_web_url()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_web_url.md)
  : OEIS server main web page url

- [`OEIS_search_url()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_search_url.md)
  : Find url to search in OEIS a given text

- [`OEIS_xml()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_xml.md)
  :

  Retrieves content from OEIS web as an `XML` document

- [`OEIS_df()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_df.md)
  : Get OEIS sequence information lines from XML document data

- [`OEIS_internal_format()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_internal_format.md)
  : Get sequence internal format

- [`OEIS_total_sequences()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_total_sequences.md)
  : Retrieve the total number of sequences in the OEIS database

## Plotting

- [`OEIS_ggplot()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_ggplot.md)
  : OEIS_ggplot Plot OEIS sequence with ggplot
- [`plot(`*`<OEIS_sequence>`*`)`](https://enriqueph.github.io/OEIS.R/reference/plot.OEIS_sequence.md)
  : Plot class OEIS_Sequence

## Citing

- [`OEIS_bibtex()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_bibtex.md)
  : Getting BibTeX citation from OEIS sequence
- [`author_list()`](https://enriqueph.github.io/OEIS.R/reference/author_list.md)
  : Getting authors list from author vectors

## Utilities

- [`` `%>%` ``](https://enriqueph.github.io/OEIS.R/reference/pipe.md) :
  Pipe operator
- [`char0toNULL()`](https://enriqueph.github.io/OEIS.R/reference/char0toNULL.md)
  : Convert character(0) or list() into NULL
