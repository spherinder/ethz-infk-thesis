#import "@preview/cheq:0.2.1": checklist

#let declaration-of-originality(
  author: "",
  author-email: "",
  title: "",
  document-type: "",
  supervisor: "",
  tutor: "",
  semester: "",
  student-nr: "",
  sans-font: "CMU Sans Serif",
  declaration-of-originality-choice: none,
  ..rest
) = {
  set page(header: context {
    set text(size: 11.5pt)
    grid(
      rows: 2,
      gutter: 5pt,
      emph("Declaration of Originality"),
      line(length: 100%, stroke: 0.7pt),
    )
  })
  set text(size: 10pt)

  align(center)[
    #text(font: sans-font, 14pt, weight: 700, "Declaration of Originality")
  ]
  set par(leading: 3pt)

  text("The signed declaration of originality is a component of every written paper or thesis authored during the course of studies. In consultation with the supervisor, one of the following three options must be selected:")

  show: checklist
  set list(tight: false, spacing: 6pt, indent: 10pt)

  let checklist-item(i, content) = list.item(
    [#if declaration-of-originality-choice == i [\[x\] ] else [\[ \] ]]
    + content)

  checklist-item(1, [I confirm that I authored the work in question independently and in my own words, i.e. that no one helped me to author it. Suggestions from the supervisor regarding language and content are excepted. I used no generative artificial intelligence technologies #footnote[E.g., ChatGPT, DALL E 2, Google Bard.]<fn_ai>.])
  checklist-item(2, [I confirm that I authored the work in question independently and in my own words, i.e. that no one helped me to author it. Suggestions from the supervisor regarding language and content are excepted. I used and cited generative artificial intelligence technologies @fn_ai.])
  checklist-item(3, [I confirm that I authored the work in question independently and in my own words, i.e. that no one helped me to author it. Suggestions from the supervisor regarding language and content are excepted. I used generative artificial intelligence technologies @fn_ai. In consultation with the supervisor, I did not cite them.])

  let custom_title(title) = {
    text(title, weight: "bold")
  }

  set par(justify: true)

  v(2pt)

  custom_title("Title of Work:")
  v(8pt, weak: true)
  text(title)
  v(3pt)

  custom_title("Thesis type and date:")
  v(8pt, weak: true)
  text(document-type + ", " + datetime.today().display("[day] [month repr:long] [year]"))
  v(3pt)

  custom_title("Supervision:")
  v(8pt, weak: true)
  text(supervisor)
  v(6pt, weak: true)
  text(tutor)
  v(3pt)

  custom_title("Student:")
  v(8pt, weak: true)
  grid(
    columns: 2,
    column-gutter: 20pt,
    row-gutter: 5pt,
    "Name:", author,
    "E-mail:", author-email,
    "Stud.-Nr.:", student-nr,
    "Study Semester:", semester
  )

  v(10pt)
  [
    With my signature I confirm the following:
      - I have committed none of the forms of plagiarism described in the citation etiquette #footnote(link("https://ethz.ch/content/dam/ethz/main/education/rechtliches-abschluesse/leistungskontrollen/plagiarism-citationetiquette.pdf")).

      - I have documented all methods, data, and processes truthfully.

      - I have not manipulated any data.

      - I have mentioned all persons who were significant facilitators of the work.
    I am aware that the work may be screened electronically for originality.
  ]

  v(30pt)
  grid(
    columns: 2,
    column-gutter: 40pt,
    row-gutter: 10pt,
    line(length: 160pt, stroke: 0.5pt),
      line(length: 200pt, stroke: 0.5pt),
    text("Place, Date", size: 9pt),
    text(author, size: 9pt),
  )
}
