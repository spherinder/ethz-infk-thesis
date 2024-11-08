#let cover_page(
  title: "",
  document-type: "",
  supervisor: "",
  tutor: "",
  author: none,
  timespan: "",
  header-logo: none,
  sans-font: "New Computer Modern Sans",
  ..rest
) = {
  set page(numbering: none, margin: 2.4cm)

  set par(
    leading: 1em,
    first-line-indent: 0em,
    justify: false,
  )

  align(center, header-logo)

  v(38mm)

  block(
      inset: 1.8cm,
  align(center)[
    #par(leading: 0.3em,
        text(font: sans-font, 2.3em, weight: 700, title)
      )
    #v(0.8em)
    #par(leading: 0.6em, text(font: sans-font, 1.3em, weight: "bold", document-type))
    #v(-0.4em)
    #text(font: sans-font, 1.3em, weight: "bold", "Author: " + author)
    #v(0.5em)
    #text(font: sans-font, "Tutor: " + tutor)
    #v(0.5em)
    #text(font: sans-font, "Supervisor: " + supervisor)
    #v(8em)
    #text(font: sans-font, timespan)
  ])

  pagebreak(weak: true)
}


