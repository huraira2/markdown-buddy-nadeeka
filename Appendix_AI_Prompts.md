# Appendix – AI Prompts and Key Responses

**Student:** Nadeeka  **ID:** 664430944  **Course:** BDA400 – Assignment 1

> **AI Assistance Declaration:** I used Claude (Anthropic, Opus 5.5) for README outlining, Markdown formatting and R Markdown layout suggestions. Prompts used: listed below. I verified outputs using GitHub Markdown preview, knitting in R 4.6.1, and base-R cross-checks of all totals. All final calculations are done by myself. I am responsible for the accuracy and originality of this work.

| Item  | Detail                                        |
|-------|-----------------------------------------------|
| Tool  | Claude (Anthropic)                            |
| Model | Opus 5.5                                      |
| Date  | November 13, 2026                             |
| Use   | Ideation, layout and writing assistance only  |

---

## Step 1 – Understanding README Structure

### Seed prompt

> Explain what sections a good GitHub README for an R data analysis project should include.

**Key response (summary):** Title and short description; Overview / purpose; Installation and requirements; Usage / example code; Data description; Outputs or results; Project structure; Contributing; License; Contact/author.

### Refinement prompt

> Revise the sections list so it's concise and uses Markdown headers and bullet formatting.

**Key response:**

```markdown
# Project Title
## Overview
## Project Structure
## Requirements
## Installation
## Example Code
## Outputs
## Data
## License
```

### Critique / validation prompt

> Check the Markdown syntax for correctness and readability.

**Key response (summary):** Syntax valid. Suggested one `#` H1 only, leaving a blank line before/after headers and lists, and using a Table of Contents for longer READMEs.

**My verification:** Compared with the [tidyverse/dplyr README](https://github.com/tidyverse/dplyr). It also uses Overview → Installation → Usage. I dropped "Contributing" and "Contact" because this is a single-author course project.

---

## Step 2 – Drafting README.md

### Seed prompt

> Here's a summary of my R project: *An R script that generates a synthetic retail sales dataset of 500 orders (region, category, units, unit price), calculates revenue, summarises it by region, and plots revenue by region and category. Dependencies: dplyr, ggplot2. Key files: scripts/sales_summary.R and sales_summary.Rmd.* Generate a professional README.md file using Markdown.

**Key response (summary):** A README with title, description, Overview, Usage and Outputs sections, plus an outputs table filled with **placeholder** numbers.

### Refinement prompt

> Add sections for Installation, Example Code, and License. Keep tone concise and professional.

**Key response (summary):** Added `git clone` and `install.packages()` steps, a `source()` example and an MIT License section.

### Critique / validation prompt

> Review the Markdown for syntax errors and suggest 2 improvements for clarity.

**Key response (summary):**
1. Add a Table of Contents with anchor links.
2. Present requirements as a table with versions instead of a plain list.
Also noted that some fenced code blocks were missing a language identifier.

**My edits:** Applied both suggestions, added language tags to every block, replaced placeholder numbers with my real script output, and added the project tree and AI disclosure.

---

## Step 3 – Documenting the R Script (.Rmd)

### Seed prompt

> Here's my R script description: *sales_summary.R creates synthetic sales data with set.seed(400), summarises revenue by region with dplyr and saves a CSV and a ggplot bar chart.* Suggest Markdown formatting and code block examples.

**Key response (summary):** Suggested a YAML header, a setup chunk, input/output tables, and splitting the script into named chunks.

### Refinement prompt

> Add syntax highlighting and improve section organization (e.g., # Purpose, ## Inputs, ## Outputs).

**Key response (summary):** Added `highlight: tango`, `toc: true`, and structure: `# Purpose` → `## Inputs` → `## Outputs` → `# Walkthrough` → `# How to Run` → `# Session Info`.

### Critique / validation prompt

> Is the Markdown consistent with RMarkdown best practices?

**Key response (summary):** Yes, with recommendations: give every chunk a unique label, hide package messages in the setup chunk, use `knitr::kable()` for tables, and include `sessionInfo()` for reproducibility.

**My edits:** Applied all four recommendations and added my own **Verification** section (base-R `tapply()` cross-check and grand-total check). On the first knit my `all.equal()` cross-check failed ("target is array, current is numeric") because `tapply()` returns a named array; I fixed it by converting to numeric and matching region order. After re-knitting I confirmed that both checks return `TRUE` and every header, table, code chunk and the figure render correctly.
