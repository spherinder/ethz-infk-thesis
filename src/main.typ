#import "../template.typ": template
// #import "@preview/eth-zurich-infk-thesis:0.1.0": template
#import "dependencies.typ": *

#show: template.with(
  title: "Assembly Code Generation for Black-Box Hardware Fuzzing",
  author: "John Doe",
  author-email: "johndoe@mailbox.com",
  document-type: "Bachelor's thesis",
  semester: "6",
  student-nr: "24-681-012",
  supervisor: "Prof. Dr. Example",
  tutor: "Dr. Example",
  text-font: "New Computer Modern",
  sans-font: "CMU Sans Serif",
  incl-declaration-of-originality: true,
  incl-list-of-figures: true,
  incl-list-of-tables: true,
  incl-listings: true,
  declaration-of-originality-choice: 2,
  timespan: "October 2024 to April 2025",
  header-logo: image("assets/header-image.svg", width: 100%),
  keywords:  ("Live", "Universe", "Everything"),
  abstract: lorem(30),
)

// Enable glossary
// Use: @key, #gls("key") or @key:pl, #glspl("key") to reference and #print-glossary to print it
// More documentation: https://typst.app/universe/package/glossarium/
#show: make-glossary

// Include chapters of thesis
#pagebreak(weak: true)
#include "chapters/01-introduction.typ"
#include "chapters/02-background.typ"

// Print glossary
// #pagebreak(weak: true)
// #include "glossary.typ"

// Print abbreviations
#pagebreak(weak: true)
#include "abbreviations.typ"

// Print bibliography
#pagebreak(weak: true)
#bibliography("bibliography.bib")
