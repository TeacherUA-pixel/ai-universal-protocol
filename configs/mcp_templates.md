# MCP Server Configuration Templates

Цей файл містить шаблони для налаштування MCP-серверів на новому пристрої. 
Скопіюйте ці блоки у ваш файл налаштувань (наприклад, у Claude Desktop або інший клієнт).

## 1. Firebase MCP
```json
{
  "mcpServers": {
    "firebase": {
      "command": "npx",
      "args": ["-y", "@firebase/mcp-server"]
    }
  }
}
```

## 2. GitHub MCP
```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "ВАШ_ТОКЕН"
      }
    }
  }
}
```

## 3. Netlify MCP
```json
{
  "mcpServers": {
    "netlify": {
      "command": "npx",
      "args": ["-y", "@netlify/mcp-server"],
      "env": {
        "NETLIFY_AUTH_TOKEN": "ВАШ_ТОКЕН"
      }
    }
  }
}
```

## 4. NotebookLM MCP
```json
{
  "mcpServers": {
    "notebooklm": {
      "command": "npx",
      "args": ["-y", "notebooklm-mcp"]
    }
  }
}
```
