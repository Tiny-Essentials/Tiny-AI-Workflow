Para ambientes de programação usando modelos locais (como no VS Code, Neovim ou Continue.dev), a melhor configuração depende diretamente do **papel** que o modelo está desempenhando no seu fluxo de trabalho: **Autocompletar (Infill / FIM)** ou **Chat / Refatoração**.

---

### Configurações Recomendadas

**1. Autocompletar Inline (FIM - Fill-In-the-Middle)**

* **`max_tokens` / `num_predict`:** **`64` a `128`**
* **Por que:** O autocomplete precisa ser instantâneo. Se você definir um limite alto, o modelo pode "delirar" e tentar escrever funções inteiras ou repeating blocks, aumentando a latência. Um valor baixo força a geração a parar logo após fechar a linha ou o bloco atual.

**2. Chat, Refatoração e Edição de Código**

* **`max_tokens` / `num_predict`:** **`2048` a `4096`**
* **Por que:** Para reescrever funções longas, criar testes unitários ou explicar arquiteturas de código, você precisa de espaço para a resposta completa sem que ela seja cortada no meio de uma chave `}` ou instrução de fechamento.

---

### Tabela Resumo por Caso de Uso

| Caso de Uso | `max_tokens` Recomendado | Objetivo |
| --- | --- | --- |
| **Autocomplete (Inline)** | `64` – `128` | Baixa latência, sugestões de 1 a 3 linhas. |
| **Geração de Funções/Testes** | `512` – `1024` | Criar blocos de código específicos e rápidos. |
| **Chat / Refatoração Complexa** | `2048` – `4096` | Manter contexto de arquivos inteiros sem corte. |

---

### Dicas Importantes para Modelos Locais

* **Diferença entre Janela de Contexto e `max_tokens`:** Certifique-se de que sua **janela de contexto total** (ex: `num_ctx` no Ollama, geralmente `8192` ou `16384`) seja bem maior que o `max_tokens`. O contexto precisa abrigar os arquivos abertos, enquanto o `max_tokens` é apenas o limite do que o modelo vai *escrever de volta*.
* **Ajuste na extensão/extensões do editor:** Se estiver usando plugins como **Continue.dev**, você pode configurar limites separados no `config.json`: no bloco do modelo de autocomplete, defina `maxTokens: 128`, e no modelo principal de chat, use `maxTokens: 4096`.