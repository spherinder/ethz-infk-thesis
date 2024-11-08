
#let template(..metadata, body) = ((
  title: none,
  author: none,
  abstract: none,
  incl-declaration-of-originality: true,
  incl-list-of-figures: true,
  incl-list-of-tables: true,
  incl-listings: true,
  text-font: "New Computer Modern",
  ..rest
) => {
  let HEADING_1_TOP_MARGIN = 40pt
  let PAGE_MARGIN_TOP = 37mm

  // Set the document's basic properties.
  set document(author: author, title: title)
  set page(
    margin: (left: 31.5mm, right: 31.5mm, top: PAGE_MARGIN_TOP, bottom: 30mm),
    numbering: "1",
    number-align: center,
    binding: left,
    header-ascent: 24pt,
    header: context {
      // Before
      let selector_before = selector(heading.where(level: 1)).before(here())
      let level_before = counter(selector_before)
      let headings_before = query(selector_before)

      if headings_before.len() == 0 {
        return
      }

      // After
      let selector_after = selector(heading.where(level: 1)).after(here())
      let level_after = counter(selector_after)
      let headings_after = query(selector_after)

      if headings_after.len() == 0 {
        return
      }

      // Get headings
      let heading_before = headings_before.last()
      let heading_after = headings_after.first()

      let c1 = heading_after.location().page() == here().page()
      let c2 = heading_after.location().position().y == (HEADING_1_TOP_MARGIN + PAGE_MARGIN_TOP) or heading_after.location().position().y == PAGE_MARGIN_TOP

      if c1 and c2 {
        return
      }

      // Decide on heading
      let (heading, level) = if c1 and not c2 {
        (heading_before, level_before)
      } else {
        (heading_after, level_after)
      }

      set text(size: 11.5pt)
      grid(
        rows: 2,
        gutter: 5pt,
        if heading.numbering != none { 
          emph(level.display() + " " + heading.body)
        } else {
          emph(heading.body)
        },
        line(length: 100%, stroke: 0.7pt),
      )
    }
  )
  set par(leading: 9pt)
  set text(font: text-font, size: 10.85pt)
  set heading(
    numbering: "1.1", 
  )

  let num_subheading = (top_margin, bottom_margin, counter_size, text_size, h) => {
    v(top_margin)
    if h.numbering != none {
      grid(
        columns: 2,
        gutter: 10pt,
        text(counter(heading).display(), size: counter_size),
        text(h.body, size: text_size)
      )
    } else {
      text(h.body, size: text_size)
    }
    v(bottom_margin)
  }
  // Configure correct spacing between headings and headings or paragraphs
  show heading: h => if h.level == 1 {
    pagebreak(weak: true)
    v(HEADING_1_TOP_MARGIN)
    if h.numbering != none [
      #text("Chapter " + counter(heading).display(), font: text-font, size: 21pt, weight: 700)

      #text(h.body, font: text-font, size: 24pt, weight: 700)
    ] else {
      text(h.body, font: text-font, size: 24pt, weight: 700)
    }
    v(30pt)
  } else if h.level == 2 {
    num_subheading(14pt,14pt,20pt,20pt,h)
  } else {
    num_subheading(9pt,10pt,20pt,20pt,h)
  }

  // Cover
  import "pages/cover.typ": cover_page
  cover_page(..metadata)

  // Abstract
  if abstract != none {
    import "pages/abstract.typ": abstract_page
    abstract_page(..metadata)
  }

  // Table of contents.
  import "pages/outline.typ": outline_page
  outline_page()

  // List of Figures
  if incl-list-of-figures {
    include "pages/list-of-figures.typ"
  }

  // List of Tables
  if incl-list-of-tables {
    include "pages/list-of-tables.typ"
  }

  // Listings
  if incl-listings {
    include "pages/listings.typ"
  }

  // Reset page numbering and set it to numbers
  set page(
    numbering: "1",
  )
  counter(page).update(1)

  // Main body.
  set par(justify: true)

  body

  // Declaration of originality
  if incl-declaration-of-originality {
    pagebreak(weak: true)
    import "pages/declaration-of-originality.typ": declaration-of-originality
    declaration-of-originality(..metadata)
  }

})(..metadata)
