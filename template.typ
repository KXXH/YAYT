// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#import "@preview/tablex:0.0.8": tablex, rowspanx, colspanx

#let underline_block(
  width: 100%,
  height: auto,
  content
) = {
  block(
    width: width,
    height: height,
    stroke: (bottom: 0.5pt),
    inset: (bottom: 0.5em),
  )[
    #content
  ]
}

#let empty_par() = {
  text()[#v(0em, weak: true)];text()[#h(0em)]
}

#let project(
  title: "",
  author: (),
  date: datetime.today(),
  logo: none,
  body,
  year: datetime.today().year(),
  month: datetime.today().month(),
) = {
  // Set the document's basic properties.
  set document(author: author.name, title: title)
  set page(numbering: none, number-align: center, header: locate(loc => {
    let page-counter = counter(page)
    let matches = query(<toc>, loc)
    let current = page-counter.at(loc)
    if current.first() > 2 [
      #underline_block[
        #align(center)[
          #text(0.8em)[
            #author.grade - #author.name: #month 月工作汇报
          ]
        ]
      ]
    ]
  }))
  set text(font: ("Times New Roman", "STSongti SC", "SimSun", "Source Han Serif SC", "Serif"), lang: "zh")

  // Set paragraph spacing.
  show par: set block(above: 1.5em, below: 1.5em)
  show figure.where(kind: table): set figure.caption(position: top)

  set heading(numbering: "1.1")
  show outline.entry.where(
    level: 1
  ): it => {
    v(12pt, weak: true)
    strong(it)
  }
  

  // set par(leading: 1em)

  // Title page.
  // The page can contain a logo if you pass one with `logo: "logo.png"`.
  align(center)[
    #v(0.6fr)
    #image("figures/badge.png", width: 17%)
    #v(0.1fr)
    #image("figures/logo.png", width: 50%)
  ]
  // if logo != none {
  //   align(right, image(logo, width: 26%))
  // }
  // v(9.6fr)

  // text(1.1em, date.display("[year]年[month]月"))
  v(5em, weak: true)
  align(center)[
    #text(2em, weight: 700, [计算机学院 #box(image("figures/favicon.png"), width: 5%) 视觉计算实验室])
  ]
  v(4em, weak: true)
  align(center)[
    #text(2em, weight: 700, [
      < #year 年 #month 月工作汇报 >
    ])
  ]
  v(8em, weak: true)

  // Author information.
  text(1.1em)[
    #align(center)[
      #block(
        width: 60%,
      )[
        #grid(
          columns: (1fr, 2fr),
          rows: auto,
          gutter: 1em,
        )[
          #text(font: "SimHei")[#align(end)[作 #h(1fr) 者]]
        ][
          #underline_block[#author.name]
        ][
          #text(font: "SimHei")[#align(end)[提 #h(1fr) 交 #h(1fr) 日 #h(1fr) 期]]
        ][
          #underline_block[#date.display("[year]年[month]月[day]日")]
        ][
          #text(font: "SimHei")[#align(end)[专 #h(1fr) 业]]
        ][
          #underline_block[#author.major]
        ][
          #text(font: "SimHei")[#align(end)[研 #h(1fr) 究 #h(1fr) 方 #h(1fr) 向]]
        ][
          #underline_block[#author.direction]
        ]
      ]
    ]
  ]
  v(2.4fr)
  pagebreak()


  // Table of contents.
  show outline.entry.where(
    level: 1
  ): it => {
    v(16pt, weak: true)
    strong(it)
    // it
  }

  outline(depth: 3, indent: true, title: [
    #block(
      width: 100%
    )[
      #align(center)[
        #text(1.1em, weight: 700, [目  录])
      ]
    ]
  ])
  pagebreak()
  set page(numbering: "1", number-align: center)
  counter(page).update(1)

  // Main body.
  set par(justify: true, leading: 1.1em, first-line-indent: 2em) // 两端对齐，段前缩进2字符
  show heading: it => {it;text()[#v(0em, weak: true)];text()[#h(0em)]}

  // 引用格式使用GB/T 7714-2015
  set bibliography(style: "gb-7714-2015-numeric")

  body
}