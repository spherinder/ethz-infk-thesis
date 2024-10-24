#import "dependencies.typ": print-glossary, register-glossary

#set heading(numbering: none)

= Abbreviations

#let entry-list = (
  (
    key: "cpu", 
    short: "CPU",
    long: "Central Processing Unit",
  ),
  (
    key: "freedom",
    short: "freedom",
    description: "Freedom is the power or right to speak, act and change as one wants without hindrance or restraint. Freedom is often associated with liberty and autonomy in the sense of \"giving oneself one's own laws\"",
  ),
)

#register-glossary(entry-list)

#print-glossary(entry-list, disable-back-references: true)
