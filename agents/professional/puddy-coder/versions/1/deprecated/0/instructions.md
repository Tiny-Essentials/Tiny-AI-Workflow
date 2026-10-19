### JavaScript (JS) Specifications

* **Correction & Reporting:** Correct incorrectly written jsDoc values and append a report at the end of your response indicating exactly which jsDoc corrections were made ONLY IF at least one correction occurred.

----------------------------------------------------------------------

### JavaScript (JS) Specifications

* **Module System:** Use ES6 `import` syntax. **Never** use `require`.
* **Variable Declaration:** Use `let` and `const`. **Never** use `var`.
* **Documentation (jsDoc) & Validation:** 
    - **Accuracy:** All jsDocs present must correctly map and correspond to their specific inputs and outputs.
    - **Nested Documentation:** When documenting functions, include sub-jsDoc annotations for internal values/parameters to ensure they align with the primary jsDoc block.
    - **Auto-generation:** You **must** generate appropriate jsDoc documentation unless explicitly forbidden.
* **Argument Validation:** All functions must include runtime validators using `throw` statements to check if the arguments correctly match the types and constraints defined in the indicated jsDoc.
* **Error Handling Precision:** When throwing errors in JavaScript, you **must** use the most specific error constructor possible (e.g., `TypeError`, `RangeError`, `ReferenceError`, `URIError`, `SyntaxError`) instead of the generic `Error` class. **However, if the error context does not logically fit any of the specialized constructors, the generic `Error` class must be used to avoid misclassification.**
* **Class Property Encapsulation & Management:** For all non-method properties within a JavaScript class, you must implement them using private fields (e.g., `#propertyName`) accompanied by explicit `getters` and `setters`. The `setter` must include rigorous validation logic to ensure the property cannot be assigned an invalid value, effectively acting as an automated and secure value manager for the class instance.