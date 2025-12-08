# LexDown: Markdown to HTML Converter using LEX

**A lexical analyzer based on LEX to process Markdown text and generate valid HTML code.**

This project is part of the **Language Processors** course (Computer Science + Business Ad.) at the **University of Granada (UGR)**.

## 👥 Team Members
* David Bacas Posadas
* Julián Carrión Tovar
* Jose Ángel Carretero Montes

## 🎯 Project Scope
The goal is to build a tool that recognizes specific Markdown patterns and translates them into HTML tags. As defined in our project proposal, the scope includes:

1.  **Headers:** Converting `#`, `##`, `###` into `<h1>`, `<h2>`, etc.
2.  **Text Styling:** Detecting bold text (`**text**`) and converting it to `<b>` or `<strong>`.
3.  **Lists:** Detecting hyphens (`-`) at the start of a line to generate unordered lists (`<ul>`, `<li>`).
4.  **Links:** Converting `[text](url)` format into `<a href="...">` tags.

## 🛠️ Tech Stack
* **Flex (Fast Lexical Analyzer Generator):** For defining lexical patterns and tokens.
* **C:** Host language for logic and state management.
* **GCC & Make:** For compilation and build automation.

## 🗺️ Development Roadmap

Based on the complexity of parsing inline elements (like bold text) alongside block elements, the development is divided into 5 phases:

### Phase 1: Environment Setup
- [ ] Initialize Git repository.
- [ ] Create `Makefile` for automated compilation (Flex + GCC).
- [ ] Implement a basic `.l` file (passthrough) to verify the build pipeline.

### Phase 2: Block Elements (Line-based)
*Focus on patterns that usually appear at the start of a line.*
- [ ] Implement **Headers** parsing (`#`).
- [ ] Implement **Lists** logic (`-`).
    - *Challenge:* We need to manage state variables in C to correctly open `<ul>` before the first item and close `</ul>` when the list ends.

### Phase 3: Inline Elements & State Management
*Addressing the complexity of mixing text and tags (as advised by the professor).*
- [ ] Implement **Links** parsing (`[ ](...)`).
- [ ] Implement **Bold** text (`**...**`).
    - *Challenge:* Use LEX **Start Conditions** (`%x state`) to distinguish between asterisks used for formatting and asterisks used as text.

### Phase 4: Edge Cases & "Stress Testing"
*Testing the limits of the parser.*
- [ ] Create `test_cases.md` containing:
    - Nested styles (e.g., bold inside a list).
    - Malformed tags.
    - Special characters.
- [ ] Refine regex rules to handle or ignore these cases gracefully.

### Phase 5: Documentation & Limitations
- [ ] Final code cleanup and commenting.
- [ ] **Report writing:** Specifically documenting the **limitations** of the parser (e.g., cases where the grammar might be ambiguous), as requested by the professor.

## 📦 How to Build and Run

1.  **Clone the repository:**
    ```bash
    git clone url
    cd lex-markdown-parser
    ```

2.  **Compile:**
    ```bash
    make
    ```

3.  **Run with an input file:**
    ```bash
    ./parser < input.md > output.html
    ```

---
*University of Granada - 2025*
