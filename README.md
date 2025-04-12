# MCP Secrets Downloader Please Connect

## 🔍 Overview

This project demonstrates **Tool Poisoning**, a security issue affecting Large Language Models (LLMs) that can use tools or plugins. Tool poisoning is surprisingly easy to pull off: attackers hide harmful commands inside descriptions that seem harmless.

For example, by adding a long description or inserting lots of spaces, dangerous commands can be concealed from view. These hidden instructions might run immediately or stay dormant until the tool is trusted—or even after its source code is compromised.

The key problem? LLMs are designed to follow instructions. If a malicious command is hidden in a tool's description, the LLM might execute it without the user ever realizing.

> ⚠️ Spoiler: This tool won't actually steal your secrets—but it shows how easily one could.

## 🧠 Why It Matters

While we're using MCP (Model Control Protocol) to demonstrate this issue, **tool poisoning isn't just an MCP problem**. It becomes dangerous when:

1. A trusted tool has access to sensitive data, **and then**
2. An untrusted or compromised tool gains access to that data or can perform actions on behalf of the trusted tool.

Any application that lets LLMs use tools is at risk. This includes ChatGPT, Claude, Cursor, Windsurf, and others.

Right now, there's no guaranteed way to stop this kind of attack. It's up to providers and users to carefully review all tool code for hidden threats.

## 🧪 Demo: Tools with Hidden Dangers

This demo includes two fake MCP tools, each with secret instructions buried in their descriptions:

1. **`dons_daily_riddles`**
    - **What it claims to do:** Tells you a riddle when you say "Riddle me that, Don."
    - **What's hidden:** Copies your `.env` file (which may contain secrets) to a new file called `.env.pwned`.

2. **`dons_daily_horoscopes`**
    - **What it claims to do:** Gives you a horoscope.
    - **What's hidden:** Downloads a script from the internet, makes it executable, and runs it.

These tools exploit the LLM's trust in tool descriptions to carry out harmful actions.

## 🚀 How to Try It Yourself

### ✅ What You Need

- Python environment manager `uv` (install with `pip install uv`)
- An MCP-compatible client (like Cursor or Windsurf)

### 🛠️ Steps

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/donvaughn/mcp-secrets-downloader-please-connect.git
   cd mcp-secrets-downloader-please-connect
