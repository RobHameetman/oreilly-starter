# Tools and Setup for O'Reilly Authors

This guide covers the recommended tooling and setup for writing O'Reilly books efficiently. The right tools can significantly improve your writing workflow and help you maintain consistency throughout your manuscript.


## Table of Contents
1. [Core Writing Tools](#core-writing-tools)
2. [Development Environment Setup](#development-environment-setup)
3. [AsciiDoctor Configuration](#asciidoctor-configuration)
4. [Version Control Setup](#version-control-setup)
5. [Automation Tools](#automation-tools)
6. [Collaboration Tools](#collaboration-tools)
7. [Troubleshooting Common Issues](#troubleshooting-common-issues)


## Core Writing Tools

### Recommended Editors
- **VS Code** (Recommended)
  - Extensions: AsciiDoc, Code Spell Checker, GitLens
  - Settings: Use our provided `.editorConfig` file
- **IntelliJ IDEA**
  - Plugins: AsciiDoc, Rainbow Brackets, IdeaVim (optional)
- **Sublime Text**
  - Packages: AsciiDoc, GitGutter, WordCount

### Essential Command Line Tools
- **AsciiDoctor**: Document processor (`gem install asciidoctor`)
- **AsciiDoctor PDF**: PDF generation (`gem install asciidoctor-pdf`)
- **Pandoc**: Document conversion (optional for some workflows)
- **Git**: Version control system


## Development Environment Setup

### Quick Start Script
We provide a setup script to configure your environment:

```bash
# Run the setup script from the repository root
./scripts/setup-asciidoc.sh
```

This script will:
1. Check for required dependencies (Ruby, Node.js, Python)
2. Install necessary gems (AsciiDoctor and related tools)
3. Set up git hooks for pre-commit validation
4. Configure your environment variables

### Manual Setup Steps

1. **Install Ruby** (required for AsciiDoctor):

```bash
# Using rbenv (recommended)
rbenv install 3.1.2
rbenv global 3.1.2

# Or using system Ruby
sudo apt-get install ruby-full  # Ubuntu/Debian
brew install ruby               # macOS
```

2. **Install AsciiDoctor and extensions**:

```bash
gem install asciidoctor
gem install asciidoctor-pdf
gem install asciidoctor-diagram
gem install rouge
```

3. **Install validation tools**:

```bash
# Python tools for validation scripts
pip install pygments
pip install requests
```


## AsciiDoctor Configuration

### Using Our Configuration
Our repository includes optimized configuration files:

1. **asciidoc-attributes.conf**: Standard O'Reilly attributes
2. **Theme extensions**: Custom styles for PDF and HTML output
3. **Build scripts**: Automated manuscript compilation

### Building Your Manuscript

```bash
# Build HTML version
./scripts/export-manuscript.sh html

# Build PDF version
./scripts/export-manuscript.sh pdf

# Build all formats
./scripts/export-manuscript.sh all
```

### Customizing Output
Modify the `config/` directory files to customize output:

- `pdf-theme.yml`: PDF styling options
- `html-theme.css`: HTML styling options
- `attributes.conf`: Document-wide attributes


## Version Control Setup

### Git Configuration
We recommend these git settings for authors:

```bash
# Set up git attributes for better diffing
git config diff.asciidoc.textconv "asciidoc -b -"
git config diff.asciidoc.cachetextconv true

# Set up git aliases for common tasks
git config alias.adiff 'diff --word-diff --color-words'
git config alias.wip "commit -am 'WIP'"
git config alias.quick "commit -am 'Quick commit'"
```

### Git Hooks
We provide pre-configured git hooks in the `config/git-hooks/` directory:

- **Pre-commit**: Validates AsciiDoc syntax and checks for common issues
- **Pre-push**: Runs full test suite before pushing to remote

To install these hooks:

```bash
cp config/git-hooks/* .git/hooks/
chmod +x .git/hooks/*
```


## Automation Tools

### Validation Scripts
Our scripts directory includes several quality assurance tools:

```bash
# Check word count by chapter
python scripts/word-count.py

# Validate all external links
python scripts/validate-references.py

# Check for consistent terminology
python scripts/term-consistency.py
```

### Continuous Integration
We provide GitHub Actions workflows that:

- Build your manuscript on each commit
- Validate links and references
- Check for style guide compliance
- Generate word count reports


## Collaboration Tools

### Review Workflow
1. **Technical Review**: Use GitHub Issues with our review template
2. **Inline Comments**: Use VS Code Live Share or Google Docs for initial reviews
3. **Final Review**: Use PDF annotation tools or dedicated review platforms

### Communication Tools
- **Slack/Discord**: For quick questions and team communication
- **Zoom/Teams**: For regular sync meetings
- **Google Docs**: For initial outline and planning stages


## Troubleshooting Common Issues

### AsciiDoctor Installation Issues
Problem: "command not found: asciidoctor"
Solution:

```bash
# Ensure Ruby gems are in your PATH
echo 'export PATH="$HOME/.gem/ruby/X.X.0/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### PDF Generation Issues
Problem: PDF generation fails with font errors
Solution:

```bash
# Install required fonts
# On macOS
brew install homebrew/cask-fonts/font-dejavu-sans

# On Ubuntu/Debian
sudo apt-get install fonts-dejavu
```

### Diagram Generation Issues
Problem: PlantUML diagrams not rendering
Solution:

```bash
# Install Java (required for PlantUML)
sudo apt-get install default-jre  # Ubuntu/Debian
brew install openjdk             # macOS

# Install Graphviz (for structural diagrams)
sudo apt-get install graphviz    # Ubuntu/Debian
brew install graphviz            # macOS
```

### Performance Issues
Problem: Slow build times for large manuscripts
Solution:

```bash
# Use parallel processing (if supported)
asciidoctor-pdf -r asciidoctor-multipage -o book.pdf book.adoc

# Build individual chapters separately
./scripts/build-chapter.sh chapter1.adoc
```


## Additional Resources
- [O'Reilly Author Guidelines](https://www.oreilly.com/author/)
- [AsciiDoctor Documentation](https://asciidoctor.org/docs/)
- [Technical Writing Resources](https://github.com/CynthiaPeter/Technical-Writing-Resources)

*Remember to regularly update your tools and check this document for updates, as tooling recommendations may change over time.*
