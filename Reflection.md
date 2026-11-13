# Reflection – Markdown Buddy

**Student:** Nadeeka  **ID:** 664430944  **Course:** BDA400 – Data Science Tools and Techniques

> **AI Assistance Declaration:** I used Claude (Anthropic, Opus 5.5) for documentation drafting and formatting suggestions. Prompts used: see `Appendix_AI_Prompts.md`. I verified outputs by previewing the Markdown, running the R script and knitting the `.Rmd`. All final calculations are done by myself. I am responsible for the accuracy and originality of this work.

---

## 1. How did the AI tool help you create your documentation, and where did it fall short?

The AI was most useful as a **structure and formatting assistant**. The seed prompt gave me a clear list of README sections (Overview, Installation, Usage, Outputs, License) that matched what I later saw in tidyverse repositories such as `dplyr`. It also saved time on repetitive Markdown, like building tables, writing the project-structure tree and adding a table of contents with working anchor links.

It fell short in three areas:

- **No real results.** The first draft used invented example numbers. I replaced them with the values my script actually printed, because the AI did not run my code.
- **Generic wording.** Some sentences were vague ("this project provides powerful insights"). I rewrote these to describe exactly what the script does.
- **Small syntax gaps.** A few code blocks had no language tag, so GitHub would not highlight them. I only noticed this when I previewed the file.

## 2. How did you verify and refine the AI-generated content?

I followed the verification pattern from the instructions:

1. **Primary calculation** – I ran `scripts/sales_summary.R` in R 4.6.1 and recorded the regional totals myself.
2. **Independent cross-check** – In the `.Rmd` I recalculated the totals with base R `tapply()` and confirmed with `all.equal()` that they match the `dplyr` result. I also checked that the regional totals add up to the overall revenue.
3. **Self spot-check** – I knitted the `.Rmd` and previewed `README.md` to confirm that headers, tables, lists, code blocks and the image all render. I also compared my README layout with the `dplyr` README.

Refinements I made after review: added a table of contents, turned the requirements list into a table, added language tags to all code blocks, replaced placeholder numbers with real output, and added a Verification section to the `.Rmd`.

## 3. What ethical considerations did you follow when using AI, and what would you do differently next time?

- **Transparency:** I disclosed the tool, model, date and prompts in every file and in the appendix.
- **Privacy:** I only used a synthetic dataset generated with `set.seed()`. No real or personal data was shared with the AI.
- **Ownership and accuracy:** I treated the AI as a design assistant, not an answer generator. I ran every calculation myself and checked every output before keeping it.

Next time I would write my own outline **before** prompting the AI, so I can compare its suggestions against my own thinking rather than starting from its draft. I would also keep a short change log while working, so documenting the edits I made is quicker and more precise.
