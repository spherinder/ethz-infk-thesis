#let abstract_page(
  author: "",
  title: "",
  keywords: (),
  abstract: "",
  ..metadata
) = {
  // TODO Needed, because context creates empty pages with wrong numbering
  set page(
    numbering: "i",
  )

  let custom_title(title) = {
    text(title, weight: "bold")
  }

  set par(justify: true)

  stack(
    spacing: 10mm,
    custom_title(author),

    v(9mm),

    custom_title("Thesis title"),
    v(6mm),
    text(title),

    v(9mm),

    custom_title("Keywords"),
    v(6mm),
    text(keywords.join(", ")),

    v(9mm),

    custom_title("Abstract"),
    v(6mm),
    text(abstract),
  )
}
