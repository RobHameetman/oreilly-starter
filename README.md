# O'Reilly Author Starter Kit

> The ultimate toolkit for O'Reilly authors - because writing technical books
> shouldn't be harder than the technology itself.

This repository contains battle-tested templates, scripts, and resources used by
successful O'Reilly authors. Whether you're pitching your first book or working
on your tenth, this kit will help you work smarter, not harder.

## What's Inside

- **Professional Templates**: Proposal, outline, and chapter templates that align with O'Reilly's standards
- **Automation Tools**: Scripts to handle repetitive tasks and ensure consistency
- **Best Practices**: Documentation on the writing process, tools, and workflows
- **Community Resources**: Ways to get feedback and connect with other authors

## Quick Start

1. Use the proposal template to structure your book idea
2. Set up your writing environment with our automated scripts
3. Follow our writing workflow best practices
4. Use our export tools to prepare manuscripts for submission

## For Aspiring Authors

Start with `docs/writing-for-oreilly.md` and `templates/proposal-template.md` to
craft your winning proposal.

## For Accepted Authors

Check out `docs/production-process.md` and use our chapter templates and
automation scripts to streamline your writing process.

## Basics of AsciiDoc and Writing

An important observation to get started when authoring a book with AsciiDoc is the notion of the language vs the implementations. AsciiDoc is a language that's intended to be a lightweight semantic markup. To generate output from AsciiDoc we use text processor tools such as [Asciidoctor](https://asciidoctor.org/), which is free and open source.

Get up to date with the latest AsciiDoc syntax and features by reading the [AsciiDoc User Guide](https://asciidoctor.org/docs/asciidoc-writers-guide/).

## Features

Book authoring experience provides the following features with this repository:
- Table of Contents (TOC) generation.
- Template prelude chapters: A `Preface`, and a `Forward`.
- Template chapters with commonly used formatting in books.
- Chapters are structured into their own chapter directories so they can be co-located with their images and other assets, such as code snippets.
- A PDF output that uses a theme, and can be customized.
- A PDF output that uses custom fonts (Google's open fonts family). Specifically, an [Open Sans](https://fonts.google.com/specimen/Open+Sans) font for the body text, and a [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro?query=source+code+pro) font for source code snippets and inline code.

Book generation:
- No need for a local installation of Asciidoctor, as the book generation is done via Docker.
- No need for special CI setup, as the book generation is done via Docker.
- Docker-based scripts to generate the book in various formats, including PDF, HTML and ePUB.

## Getting Started with AsciiDoc Book Starter

We start off by getting familiar with the repository structure and the various files that are part of it.

The top-level directory structure looks like this:

```
.
├── 📂 manuscript/
│   ├── 📂 chapter-1/
│   │   ├── 📁 assets/
│   │   ├── 📁 code/
│   │   ├── 📁 research/
│   │   ├── 📖 chapter.adoc
│   │   ├── ✍️ section-1.adoc
│   │   ├── ✍️ section-2.adoc
│   │   ├── ✍️ section-3.adoc
│   │   ├── ✍️ section-4.adoc
│   │   └── ✍️ summary.adoc
│   ├── 📂 preface/
│   │   ├── ✍️ acknowledgements.adoc
│   │   ├── ✍️ conventions-used-in-this-book.adoc
│   │   ├── ✍️ forward.adoc
│   │   ├── ✍️ how-to-contact-us.adoc
│   │   ├── ✍️ navitating-this-book.adoc
│   │   ├── ✍️ reading.adoc
│   │   ├── ✍️ safari-books-online.adoc
│   │   └── ✍️ using-code-examples.adoc
│   ├── 📖 appendix.adoc
│   ├── 🌌 cover.png
│   ├── 📖 index.adoc
│   └── 📖 preface.adoc
├── 📂 proposal/
│   ├── 📄 OUTLINE.md
│   └── 📄 PROPOSAL.md
├── 📂 scripts/
│   ├── 📂 cli/
│   │   ├── ⚙️ cli.bat
│   │   └── ⚙️ cli.sh
│   ├── 📂 epub/
│   │   ├── ⚙️ epub.bat
│   │   └── ⚙️ epub.sh
│   └── 📂 pdf/
│   │   ├── ⚙️ pdf.bat
│   │   └── ⚙️ pdf.sh
├── .editorConfig
├── .gitignore
├── LICENSE
└── README.md
```

The `manuscript/` directory is where the book content is stored:
- The `index.adoc` file is the main entry point for the book, and it's where we include all the other chapters and prelude chapters.
- The `assets/` directory for each chapter is where you can store images that are used in the book.
- Chapters are written in their own directory, and each chapter directory contains a `chapter.adoc` file which is the main entry point for the chapter, and an optional `assets/` directory for images and diagrams that are used in the chapter. This helps to colocate assets for the same chapter together rather than having them all mixed together in one big directory.
- In the same directory, you'll find the theme-able PDF `themes` directory, and the `fonts` directory which contains the fonts used in the book.

## Generate the AsciiDoc book

### Building the AsciiDoc book locally

To build the book locally, you'll need to have Docker installed on your machine. Once you have Docker installed, you can run the following command to build the book in PDF format:

```bash
./scripts/cli.sh basic
```

Or, generate a dark-mode themed PDF book:

```bash
./scripts/pdf.sh dark
```

Then you can find the generated PDF file in the `book` directory. If you're on a macOS, you can open it with your default PDF reader as follows:

```bash
open book/index.pdf
```

### Helpful AsciiDoc Scripts

The asciidoc book starter repository also provides a few helpful scripts to help you generate other book output formats and debug the asciidoctor tool:
- `create-book-ePUB.sh` - Generates the book in ePUB format.
- `interactive-asciidoctor-shell.sh` - Starts an interactive shell inside the Docker image with the `asciidoctor` tool installed.

## AsciiDoc Book Assets

Static assets for the book are stored in the `book` directory, and include the following:
- The `images` directory is where you can store images that are used in the book. Inside this directory is a `cover.jpeg` image used for the book's cover, and a `space.jpeg` used as an example for an image in the book.
- The `fonts` directory is where you can store fonts that are used in the book. It currently houses the [Open Sans](https://fonts.google.com/specimen/Open+Sans) and [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro?query=source+code+pro) fonts, both with their original `.zip` file archived as downloaded from the Google Fonts website as well as extracted each to its own directory.

## Maintainer

Rob Hameetman <engineering@robhameetman.com>

## Contributing

This is a community resource—share your hard-earned knowledge! Please read our
contribution guidelines before submitting improvements.

[![book-generate-pdf](https://github.com/lirantal/asciidoc-book-starter/actions/workflows/book-generate-pdf.yaml/badge.svg?branch=main)](https://github.com/lirantal/asciidoc-book-starter/actions/workflows/book-generate-pdf.yaml)
