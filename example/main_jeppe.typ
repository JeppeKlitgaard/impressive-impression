#import "../src/utils.typ": crop-image
#import "../src/elements.typ": dot-ratings, make-aside-persona, make-aside-grid, make-main-content-block, make-main-content-block-with-timeline
#import "../src/theme.typ": assert-theme, theme-helper, theme-prop
#import "../src/themes/forty-seconds.typ": theme-fortyseconds
#import "../src/lib.typ": cv

#import "utils.typ": flag, fa-icon-factory, fa-icon-factory-stack, read-and-colorize-svg, make-pill

#import "@preview/fontawesome:0.5.0": fa-icon, fa-stack
#import "@preview/nth:1.0.1": nth

#let name = "Jeppe Klitgaard"
#let pronouns = "he/him"
#let profile-image = image("assets/profile.jpg")
#let short-description = [
  MSc Student\
  Physics, Math, Computation
]

#let theme = theme-fortyseconds
#let th = theme-helper(theme)

#let iconer-stack = fa-icon-factory-stack(theme)
#let iconer = fa-icon-factory(theme)
#let dot-ratings = dot-ratings.with(
  size: 6.5pt,
  spacing: 3.5pt,
  color-active: theme-prop(theme-fortyseconds, "primary-accent-color"),
  color-inactive: theme-prop(theme-fortyseconds, "faint-text-color").transparentize(65%),
)

#let linker(dest, body) = {
  let body-wrapped = [#text(body, fill: th("primary-accent-color"))#h(0.2em)#box(iconer("link", size: 0.7em), height: 0.8em)]
  return link(dest, body-wrapped)
}

#let linker-pdf(dest, body) = {
  let body-prefixed = [#fa-icon("file-pdf")#h(0.2em)#body]
  return linker(dest, body-prefixed)
}

#let make-main-content-block = make-main-content-block.with(theme: theme)
#let make-main-content-block-with-timeline = make-main-content-block-with-timeline.with(theme: theme)

#let url-for(path) = {
  return "https://jeppe.science/profile/" + path
}

// Page 1
#let main-content-1 = [
  == Introduction
  #block([
    #set par(justify: true)
    Ambitious student with interests in Natural, Computer & Data Sciences, as well as
    Society & Culture.

    I have a teachable and well-rounded profile with experience in organisational, technical, and academic work through a variety of activities including political work,
    board work in Denmark's Academy of Talented Youth and the Nordic Study Abroad
    Community, participation in the European CanSat Competition & internships within
    FinTech, academia, and industry.
  ])

  == Work Experience
  #make-main-content-block-with-timeline(
    ([2025], [2023]),
    "Research & Development Scientist",
    supplement: [#link("https://www.nanonord.dk", "NanoNord A/S")],
    [
      Research and development pertaining to Nuclear Magnetic Resonance (NMR) applied to the
      #linker("https://nanonord.com/", "Tveskaeg") system. Design and manufacturing of an automated hardware platform mapping the local
      magnetic field inside $1 "T"$ Halbach array magnet to improve passive shimming outcomes
    ]
  )
  #make-main-content-block-with-timeline(
    ([2021], [2021]),
    "Research Intern – SciML",
    supplement: [#link("https://www.cam.ac.uk/", "University of Cambridge")],
    [
      10-week summer internship with  #linker("https://www.phy.cam.ac.uk/directory/cicuta", [Prof.~Pietro Cicuta])
      and #linker("https://www.cl.cam.ac.uk/~pl219/", [Prof.~Pietro Liò]) at University of Cambridge.\
      Developed #linker("https://jeppeklitgaard.github.io/CartER/", [CartER]),
      an open-source physical cartpole platform
      for experimentation and investigation of reinforcement learning algorithms.
    ]
  )
  #make-main-content-block-with-timeline(
    ([2020], [2020]),
    "Software Engineering Intern",
    supplement: [#link("https://intropic.io/", "Intropic Limited")],
    [
      9-week summer internship in a London-based FinTech startup.\
      Introduced and authored a variety of Python projects centered on REST API development,
      data processing and created a streaming data pipeline in Kafka/Faust.
    ]
  )

  #make-main-content-block-with-timeline(
    ([2019], [2018]),
    "Substitute Teacher",
    supplement: [#link("https://ansskole.aula.dk/", "Ans") & #link("https://grauballe-skole.aula.dk/", "Grauballe") Skole],
    [
      Fixed temporary position in Ans Skole's Special Education section.\
      Also worked as a regular substitute teacher in the public school section.
      Primarily taught STEM and English, ages 13 — 16.
    ]
  )
  #make-main-content-block-with-timeline(
    [2016 — 2019],
    "Language Camp Organiser and Teacher",
    supplement: [#link("https://www.rejsby-efterskole.dk/", "Rejsby Europæiske Efterskole")],
    [
      // Helped organise the annual Language Camp at Rejsby Europæiske Efterskole for 4 consecutive years.\
      // Taught English, Danish, and German to students aged 14 — 18.
    ]
  )

  == Education
  #make-main-content-block-with-timeline(
    ([2025], [2023]),
    [MSc Mathematical Modelling\ and Computation],
    supplement: [#link("https://www.dtu.dk", "Technical University of Denmark")],
    [Applied Mathematics with a focus on Scientific Computing and Data Science.],
  )
  #make-main-content-block-with-timeline(
    ([2023], [2019]),
    "BA (Hons) Natural Sciences",
    supplement: [#link("https://cam.ac.uk", "University of Cambridge")],
    [
      Specialisation in Physics and Mathematics with an emphasis on Computational and Experimental Physics.\
      Student Representative at Cavendish Laboratory (years 1 — 3).
    ]
  )
  #make-main-content-block-with-timeline(
    ([2017], [2014]),
    "Danish STX",
    supplement: [#link("https://www.gymnasiet.dk/", "Silkeborg Gymnasium")],
    [
      Studentereksamen (STX) with Physics A, Chemistry A, Mathematics A.
      Master Classes in Mathematics, Physics, and Chemistry. Part of the CanSat competition team.\
      GPA: 12.2 / 12.0 (extra credit).
    ]
  )
  #make-main-content-block-with-timeline(
    ([2017], [2014]),
    "Academy of Talented Youth",
    supplement: [Denmark],
    [
      #linker("https://talentfuldeunge.dk/", "Extracurricular organisation") providing advanced classes, lectures,
      and camps for academically gifted students in collaboration with universities
      and leading companies.\
      Student Representative to the Advisory Board, representing ≈200 talented students.
    ]
  )
]

#let aside-content-1 = [
  #make-aside-persona(
    name,
    pronouns: pronouns,
    short-description: short-description,
    image: profile-image,
    theme: theme,
  )

  #make-aside-grid(
    theme: theme,
    iconer-stack("calendar"),
    [February #nth(6, sup: true), 1997],
    iconer-stack("map-marker-alt"),
    [Kongens Lyngby, Denmark],
    iconer-stack("globe"),
    [#link("https://jeppe.science", "jeppe.science")],
    // Currently broken: https://github.com/samrenault/flagada/issues/1
    iconer-stack("phone"),
    [#link("tel:+4522461358", [+45 22 46 13 58])],
    iconer-stack("at"),
    [#link("mailto:hi@jeppe.science", "hi@jeppe.science")],
  )

  == Social Network
  #make-aside-grid(
    theme: theme,
    iconer("linkedin"),
    [#link("https://www.linkedin.com/in/jeppeklitgaard", "jeppeklitgaard")],
    iconer("github"),
    [#link("https://github.com/JeppeKlitgaard", "JeppeKlitgaard")],
  )

  == Languages
  #make-aside-grid(
    columns: 3,
    rows: 12pt,
    align: (horizon + center, horizon + left, horizon + right),
    theme: theme,
    flag("DK"),
    [Danish],
    dot-ratings(5, 5),
    flag("GB"),
    [English],
    dot-ratings(5, 5),
    flag("DE"),
    [German],
    dot-ratings(1, 5),
  )

  == Hard Skills
  #make-aside-grid(
    columns: 2,
    theme: theme,
    iconer("python"), [Programming],
    iconer("chart-column"), [Data Science],
    iconer("calculator"), [Mathematics],
    iconer("atom"), [Physics],
    iconer("bolt-lightning"), [Electronics],
  )

  == Soft Skills
  #make-aside-grid(
    columns: 2,
    theme: theme,
    iconer("bug"), [Problem Solving],
    iconer("users"), [Teamwork],
    iconer("check"), [Dependability],
    iconer("comments", solid: true), [Earnestness],
  )
]

// Page 2
#let main-content-2 = [
  == Awards
  #[
    #set par(spacing: 0.0em, leading: 0.3em)

    #make-main-content-block-with-timeline(
      [2021],
      [#nth(1, sup: true) Place in Research Skills Presentation],
      supplement: [#link("https://www.phy.cam.ac.uk/", "Dept. Physics, Cambridge")],
      [],
      title-as-heading: false,
      timeline-line-gap: 0pt,
    )
    #make-main-content-block-with-timeline(
      [2017],
      "Recognition of Extraordinary Community Effort",
      supplement: [#link("https://gymnasiet.dk/", "Silkeborg Gymnasium")],
      [],
      title-as-heading: false,
      timeline-line-gap: 0pt,
    )
    #make-main-content-block-with-timeline(
      [2017],
      "Recognition of Extraordinary Academic Achievement",
      supplement: [#link("https://gymnasiet.dk/", "Silkeborg Gymnasium")],
      [],
      title-as-heading: false,
      timeline-line-gap: 0pt,
    )
    #make-main-content-block-with-timeline(
      [2015],
      [#nth(3, sup: true) Place in #link("https://www.esa.int/Education/CanSat", "European CanSat Competition")],
      supplement: [#link("https://www.esa.int/", "European Space Agency")],
      [],
      title-as-heading: false,
      timeline-line-gap: 0pt,
    )
  ]

  #v(-0.8em)
  == Other Certifications
  #make-main-content-block-with-timeline(
    [2014],
    [#link("https://www.cambridgeinternational.org/programmes-and-qualifications/cambridge-igcse-english-second-language-speaking-endorsement-9-1-0993/", "IGSCE – English as a Second Language")],
    supplement: [#link("https://www.cambridgeinternational.org/", "Cambridge Examinations")],
    [A\*(a\*) grade],
    timeline-line-gap: 0pt,
  )

  == Open Source Contributions
  #make-main-content-block-with-timeline(
    ([Present], [2013]),
    "Personal Projects and Smaller Contributions",
    supplement: [#link("https://github.com/JeppeKlitgaard", "GitHub")],
    [
      Throughout most of my adolescent and adult life I've contributed
      to various Open Source projects and authored a wide variety of
      different projects. Most of this activity can be found on my GitHub
      profile
    ]
  )
  #make-main-content-block-with-timeline(
    ([2023], [2022]),
    "Font Compilation Tooling",
    supplement: [#link("https://openmoji.org/", "OpenMoji")],
    [
      Development of a dockerised font compilation toolset that enables
      compilation of vector files into color-fonts in a variety of formats
      using Google's `nanoemoji` tool.
    ],
  )
  #make-main-content-block-with-timeline(
    ([2022], [2021]),
    "Continuous Integration and Release Tooling",
    supplement: [#link("https://github.com/pyFFTW/pyFFTW", "PyFFTW")],
    [
      Tooling to build the `PyFTTW` Python bindings using _GitHub Actions_ across various platforms.
    ],
  )

  == Association and Voluntary Work
  #make-main-content-block-with-timeline(
    ([2024], [2018]),
    "Chair of the Board",
    supplement: [#link("https://nordic-sac.org/", "Nordic Study Abroad Community")],
    [
      Chair of the Board 2023 – 2024, Senior Advisor and Member of the Board 2021— 2024, Director 2019 — 2021, Organiser 2018 — 2019.\
      Previously website development, IT and organisation of the annual Nordic Study Abroad Conference.
    ]
  )

  #make-main-content-block-with-timeline(
    ([2015], [2015]),
    "Senior Mentor",
    supplement: [#link("https://www.videnskabsklubben.dk/", [The Science Club, Royal Danish Academy of Sciences])],
    [Taught primatology to school children in collaboration with Aarhus University.]
  )
  #make-main-content-block-with-timeline(
    ([2016], [2013]),
    "Youth Politician",
    supplement: [#link("https://www.radikalungdom.com/", "Social-Liberal Youth Party of Denmark")],
    [
      Board member in local organisation. Elected as representative to the National Executive of the Social-Liberal Youth Party of Denmark.
    ]
  )

  == References
  #make-main-content-block-with-timeline(
    [2021],
    "Research Intern – SciML",
    supplement: [#link("https://www.cam.ac.uk/", "University of Cambridge")],
    [Letter of recommendation available upon request.],
    timeline-line-gap: 0pt,
  )

  #make-main-content-block-with-timeline(
    [2020],
    "Software Engineering Intern",
    supplement: [#link("https://intropic.io/", "Intropic Limited")],
    [
      Letter of recommendation available here: #linker-pdf(url-for("references/intropic.pdf"), "intropic.pdf")
    ],
    timeline-line-gap: 0pt,
  )

  #make-main-content-block-with-timeline(
    [2018],
    "Teacher",
    supplement: [#link("https://ansskole.aula.dk/", "Ans Skole")],
    [
      Letter of recommendation available here: #linker-pdf(url-for("references/ans_skole.pdf"), "ans_skole.pdf")
    ],
    timeline-line-gap: 0pt,
  )

  == Other Documents

  #[
    #set text(size: 9pt)

    #grid(
      columns: 2,
      align: (left, left),
      column-gutter: 2em,
      row-gutter: 6pt,

      [Academy of Talented Youth], linker-pdf(url-for("documents/diploma_academy_talented_youth.pdf"), "diploma_academy_talented_youth.pdf"),
      [Cambridge Examinations - IGSCE], linker-pdf(url-for("documents/diploma_IGCSE_english.pdf"), "diploma_IGCSE_english.pdf"),
      [European Space Agency], linker-pdf(url-for("documents/diploma_cansats_in_europe.pdf"), "diploma_cansats_in_europe.pdf"),
      [Royal Danish Academy of Sciences], linker-pdf(url-for("documents/diploma_science_club.pdf"), "diploma_science_club.pdf"),
      [Silkeborg Gymnasium], linker-pdf(url-for("documents/award_community_effort.pdf"), "award_community_effort.pdf"),
      [Silkeborg Gymnasium], linker-pdf(url-for("documents/diploma_highschool.pdf"), "diploma_highschool.pdf"),
      [Silkeborg Gymnasium], linker-pdf(url-for("documents/diploma_masterclass_phys_chem.pdf"), "diploma_masterclass_phys_chem.pdf"),
    )

  ]


  // Footer
  #v(1fr)
  #grid(
    columns: (1fr, 2fr, 1fr),
    align: (center + horizon, center + horizon, center + horizon),
    {
      let today = datetime.today()
      let day = nth(today.display("[day padding:none]"), sup: true)
      let month = today.display("[month repr:long]")
      let year = today.display("[year]")
      text([#month #day, #year], fill: th("secondary-text-color"), weight: "semibold")
    },
    [
      #image("assets/signature.png", height: 3em)
    ],
    text(name,
      fill: th("secondary-text-color"),
      weight: "semibold",
    ),
  )
]

#let aside-content-2 = [
  #make-aside-persona(
    name,
    short-description: short-description,
    theme: theme,
  )

  == Programming
  #let c-icon = read-and-colorize-svg("assets/devicons/c-plain.svg", th("primary-accent-color"))
  #let cpp-icon = read-and-colorize-svg("assets/devicons/cplusplus-plain.svg", th("primary-accent-color"))
  #let typescript-icon = read-and-colorize-svg("assets/devicons/typescript-plain.svg", th("primary-accent-color"))
  #let javascript-icon = read-and-colorize-svg("assets/devicons/javascript-plain.svg", th("primary-accent-color"))
  #make-aside-grid(
    columns: 3,
    align: (horizon + center, horizon + left, horizon + right),
    theme: theme,
    iconer("python"), [Python], dot-ratings(5, 5),
    iconer("linux"), [bash/zsh/fish], dot-ratings(4, 5),
    iconer("git-alt"), [Git], dot-ratings(4, 5),
    iconer("database"), [SQL], dot-ratings(3, 5),
    iconer("rust"), [Rust], dot-ratings(3, 5),
    cpp-icon, [C++], dot-ratings(3, 5),
    c-icon, [C], dot-ratings(2, 5),
    typescript-icon, [TypeScript], dot-ratings(4, 5),
    javascript-icon, [JavaScript], dot-ratings(3, 5),
    iconer("css3-alt"), [CSS3], dot-ratings(3, 5),
    iconer("html5"), [HTML5], dot-ratings(4, 5),
  )

  == Design
  #make-aside-grid(
    columns: 3,
    align: (horizon + center, horizon + left, horizon + right),
    theme: theme,
    iconer("compass-drafting"), [Fusion 360], dot-ratings(4, 5),
    iconer("cube"), [Cura], dot-ratings(3, 5),
    iconer("network-wired"), [KiCad], dot-ratings(4, 5),
  )

  == Technologies
  #let pill = body => make-pill(body, theme)

  #pill("Linux")
  #pill("Docker")
  #pill("Faust")
  #pill("Arduino")
  #pill("GitHub Actions")
  #pill("Django")
  #pill("Jupyter")
  #pill("Pandas")
  #pill("Apache Kafka")
  #pill("REST")
  #pill("Numpy")
  #pill("Matplotlib")
  #pill("Debian")
  #pill("Typst")
  #pill("PyTorch")
  #pill("Unicode")
  #pill("Jsonnet")
  #pill("Protocol Buffers")
  #pill("JAX")
  #pill("CVXOPT")
  #pill("Traefik")
  #pill("Eigen3")
  #pill("PlatformIO")

]

// Generate CV
#show: cv.with(
  theme: theme-fortyseconds,
  paper: "a4",
  main-contents: (main-content-1, main-content-2),
  aside-contents: (aside-content-1, aside-content-2),
)()
