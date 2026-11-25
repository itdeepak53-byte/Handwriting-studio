# 🖋️ Handwriting Studio Pro Deluxe (हैंडराइटिंग स्टूडियो प्रो • AI Luxury Deluxe Studio)

A professional, high-fidelity A4 Ruled Sheet Handwriting & Calligraphy Web Application.

---

## 🚀 How to Run the Website

### Option 1: Double-Click Launcher (Recommended)
Double-click `start.bat` in this folder. It will start a local server on `http://localhost:5500` and automatically open your web browser.

### Option 2: PowerShell Server
Open PowerShell in this directory and execute:
```powershell
.\serve.ps1
```
*(Or `.\serve.ps1 -Port 5500 -NoBrowser` if you do not want it to auto-open the browser.)*

### Option 3: Direct File Open
You can directly open `index.html` in any modern web browser (Google Chrome, Microsoft Edge, Mozilla Firefox, Brave):
- Double click `index.html` or drag-and-drop it into your browser.

---

## ✨ Features & Capabilities

- **⚡ In-App Page Converter (Header Actions)**:
  - **कन्वर्ट JPEG (Convert to JPEG)** & **कन्वर्ट PDF (Convert to PDF)** buttons directly in the top header.
  - **पेज चयन विकल्प (Page Selector Options)**:
    1. **वर्तमान सक्रिय पेज (Current Page)**: केवल वर्तमान पेज को कन्वर्ट करें।
    2. **सभी पेज एक साथ (All Pages)**: प्रोजेक्ट के सभी पेजों को एक साथ कन्वर्ट करें।
    3. **विशिष्ट पेज चुनें (Specific Page)**: ड्रॉपडाउन से किसी भी विशिष्ट पेज को चुनें।
    4. **कस्टम पेज रेंज (Custom Range)**: मनपसंद पेज नंबर या रेंज दर्ज करें (जैसे: `1, 3` या `1-4`).
  - **In-App Result Studio (इन-ऐप परिणाम व्यूअर)**:
    - कन्वर्शन का परिणाम तुरंत इसी ऐप के अंदर दिखता है।
    - **JPEG परिणाम**: सिंगल पेज ज़ूम व्यू, मल्टी-पेज थंबनेल कैरोसेल, सभी पेजों का ग्रिड व्यू, एक-क्लिक डाउनलोड, क्लिपबोर्ड कॉपी व ZIP बंडल।
    - **PDF परिणाम**: ऐप के अंदर ही लाइव इंटरैक्टिव PDF व्यूअर, नए टैब में खोलना व डायरेक्ट प्रिंट।

- **📝 Input Text Editor & Multi-Page Studio**:
  - Live preview on realistic ruled paper sheets
  - Multi-page pagination, auto-break, and dynamic page management
  - Direct sheet on-paper click & type editing
  - Multi-page PDF / image import with local in-browser OCR (Tesseract.js)
- **🔤 85+ Handwriting & Calligraphy Fonts**:
  - Playwrite World Series (DE, US, GB, IT, FR, AU, ES, etc.)
  - Hindi / Devanagari calligraphy & handwriting fonts (Baloo 2, Kalam, Kadwa, Martel, Mukta, Tiro Devanagari, Yatra One, etc.)
  - English script fonts (Caveat, Dancing Script, Indie Flower, Great Vibes, Sacramento, etc.)
- **✒️ Pen Type & Ink Physics Simulation**:
  - Ballpoint, gel pen, fountain pen, calligraphy nib, and pencil simulations
  - Realistic ink flow, line thickness jitter, and pressure variation
  - Ink bleed, feathering, and paper fiber absorption effects
- **📏 Dual Line-Touch Alignment**:
  - Hindi Top-Line (Shirorekha) snapping to ruled lines
  - English Baseline snapping to ruled lines
  - Slant angles, word spacing, letter spacing, line height controls
- **🎨 Luxury Ruled Sheet & Paper Styles**:
  - Single ruled, double ruled, 4-line ruled, grid/graph, dot grid, unruled/blank
  - Spiral notebook binding simulation (left or top)
  - Margin rules, custom red/blue margin lines, and header blocks (Date, Page No.)
- **🖼️ Image Insertion & Diagram Staging**:
  - Insert diagrams, stamps, illustrations directly onto paper lines
  - Move, scale, rotate, and adjust opacity/tint of placed drawings
- **📔 Cover Studio**:
  - Front and back notebook cover designer
  - Custom titles, badges, barcodes, textures, and student info cards
- **📥 High-Resolution Vector Export**:
  - Multi-page PDF export via vector jsPDF
  - High-res PNG / JPEG image downloads
- **🔊 AI Voice TTS & Audio Playback**:
  - Read aloud sheet text in multiple voices
