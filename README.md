# example-robot
Beispiel Robotframework Testfälle

## Installation

Installiere die Abhängigkeiten mit:

```bash
pip install -r requirements.txt
```

Für Browser-Tests (Browser Library), initialisiere Playwright:

```bash
rfbrowser init
```

## Tests ausführen

Führe alle Tests aus mit:

```bash
robot tests/
```

Führe einen spezifischen Test aus:

```bash
robot tests/basic_tests.robot
robot tests/browser_tests.robot
robot tests/selenium_tests.robot
robot tests/requests_tests.robot
robot tests/screenshot_tests.robot
```

## Testfälle

Die folgenden Beispiel-Testfälle sind enthalten:

### Basic Tests (basic_tests.robot)
1. **Einfacher Test mit Assertions** - Demonstriert grundlegende Assertions
2. **String-Operationen Test** - Testet verschiedene String-Operationen
3. **Mathematische Operationen Test** - Testet grundlegende mathematische Operationen
4. **Listen-Operationen Test** - Testet Operationen mit Listen

### Browser Tests (browser_tests.robot)
Verwendet die Browser Library (Playwright-basiert) für moderne Browser-Automatisierung:
1. **Open Browser and Check Page Title** - Öffnet eine Seite und prüft den Titel
2. **Navigate and Find Element** - Navigiert und findet spezifische Elemente
3. **Interact with Page Elements** - Interagiert mit verschiedenen Seitenelementen

### Selenium Tests (selenium_tests.robot)
Verwendet SeleniumLibrary für Browser-Automatisierung:
1. **Test Selenium Library Import** - Testet die Verfügbarkeit der SeleniumLibrary
2. **Selenium Locator Strategy Test** - Testet verschiedene Locator-Strategien
3. **Test Selenium WebDriver Options** - Testet WebDriver-Konfiguration

### Requests Tests (requests_tests.robot)
Verwendet RequestsLibrary für HTTP/API-Tests:
1. **GET Request Test** - Testet einfache GET-Requests
2. **POST Request Test** - Testet POST-Requests mit JSON-Daten
3. **Request with Custom Headers** - Testet Requests mit benutzerdefinierten Headern
4. **Session Management Test** - Testet Session-Verwaltung

### Screenshot Tests (screenshot_tests.robot)
Demonstriert Screenshot-Funktionalität und Dateisystem-Operationen:
1. **Create and Verify Screenshot Directory** - Erstellt und verifiziert Screenshot-Verzeichnisse
2. **File System Screenshot Test** - Testet Dateisystem-Operationen
3. **Screenshot Metadata Test** - Testet Screenshot-Metadaten-Handling

## Test-Ergebnisse

Nach dem Ausführen der Tests werden folgende Dateien generiert:
- `output.xml` - Detaillierte Test-Ergebnisse im XML-Format
- `log.html` - Detailliertes Log aller Test-Schritte
- `report.html` - Übersichtlicher Test-Report

## Bibliotheken

Dieses Projekt verwendet folgende Robot Framework Bibliotheken:
- **robotframework** - Das Basis-Framework
- **robotframework-browser** - Moderne Browser-Automatisierung mit Playwright
- **robotframework-seleniumlibrary** - Klassische Browser-Automatisierung mit Selenium
- **robotframework-requests** - HTTP/REST API Testing
- **robotframework-screencaplibrary** - Screenshot-Funktionalität
