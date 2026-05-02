# MCP Server Configuration Templates

Цей файл містить шаблони для налаштування MCP-серверів на новому пристрої. 
Скопіюйте ці блоки у ваш файл налаштувань (наприклад, у Claude Desktop або інший клієнт).

### 4. Brave Search (Internet Access)
Дозволяє мені шукати інформацію в реальному часі.
```json
"brave-search": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-brave-search"],
  "env": {
    "BRAVE_API_KEY": "ВАШ_КЛЮЧ_ТУТ"
  }
}
```
*Отримати ключ:* [Brave Search API](https://brave.com/search/api/)

### 5. Memory (Persistent Knowledge Graph)
Створює базу знань, яка не залежить від файлів у проєкті.
```json
"memory": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-memory"]
}
```

### 6. Puppeteer (Browser Automation)
Дозволяє мені «бачити» ваш сайт та робити скріншоти для перевірки дизайну.
```json
"puppeteer": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-puppeteer"]
}
```

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
