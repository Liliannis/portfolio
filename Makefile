.PHONY: new-post dev build help

# Variables
DATE := $(shell date +'%Y-%m-%d')
TITLE ?= "Nuevo Post"
SLUG := $(shell echo $(TITLE) | tr '[:upper:]' '[:lower:]' | tr -cd '[:alnum:] ' | tr ' ' '-')
FILE := src/content/blog/$(SLUG).md

help:
	@echo "Comandos disponibles:"
	@echo "  make dev                 - Iniciar servidor de desarrollo"
	@echo "  make build               - Construir el sitio para producción"
	@echo "  make new-post TITLE=\"x\"  - Crear una nueva publicación en el blog"

dev:
	npm run dev

build:
	npm run build

new-post:
	@if [ "$(TITLE)" = "Nuevo Post" ]; then \
		echo "⚠️  Atención: Estás usando el título por defecto."; \
		echo "Recomendado: make new-post TITLE=\"Mi título genial\""; \
	fi
	@echo "---" > $(FILE)
	@echo "title: '$(TITLE)'" >> $(FILE)
	@echo "description: 'Breve descripción de la publicación.'" >> $(FILE)
	@echo "pubDate: '$(DATE)'" >> $(FILE)
	@echo "heroImage: '../../assets/blog-placeholder-1.jpg'" >> $(FILE)
	@echo "---" >> $(FILE)
	@echo "" >> $(FILE)
	@echo "Escribí el contenido de tu publicación acá usando **Markdown**..." >> $(FILE)
	@echo "✅ Publicación creada en: $(FILE)"
