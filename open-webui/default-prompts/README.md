# OpenWebUI Prompt Templates

This directory contains a collection of structured prompt templates specifically designed for use with **OpenWebUI**.

## Description

The goal of this folder is to provide a repository of high-quality, ready-to-use prompts that facilitate diverse user interactions. These templates are optimized to help users get better results from Large Language Models (LLMs) within the OpenWebUI interface.

## Source and Inspiration

All templates included in this repository are based on the standard prompt list provided by **OpenWebUI**. They have been adapted and structured into a JSON format to ensure they are easy to read, maintain, and potentially automate.

## Data Structure

Each template is stored as an object within a JSON array, following this specific schema:

* `title`: An array of strings containing a primary heading and a descriptive subtitle.
* `content`: The actual prompt text intended to be executed by the LLM.

## Usage

You can use these templates to:
1. Manually copy and paste prompts into OpenWebUI.
2. Use them as a reference for building automated prompt injection systems.
3. Expand the collection by adding new JSON objects following the established schema.
