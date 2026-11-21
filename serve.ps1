param(
    [int]$Port = 5500,
    [switch]$NoBrowser
)

$Root = $PSScriptRoot
if (-not $Root) { $Root = Get-Location }

$listener = New-Object System.Net.HttpListener
$prefix = "http://localhost:$Port/"
$listener.Prefixes.Add($prefix)

try {
    $listener.Start()
} catch {
    Write-Warning "Port $Port is in use or unavailable. Trying alternative ports..."
    foreach ($p in 5501..5510) {
        try {
            $listener = New-Object System.Net.HttpListener
            $prefix = "http://localhost:$p/"
            $listener.Prefixes.Add($prefix)
            $listener.Start()
            $Port = $p
            break
        } catch { }
    }
}

if (-not $listener.IsListening) {
    Write-Error "Failed to start HTTP listener on any port."
    exit 1
}

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " Handwriting Studio Pro Deluxe - Local Web Server Running " -ForegroundColor Yellow
Write-Host " URL: http://localhost:$Port/" -ForegroundColor Green
Write-Host " Serving from: $Root" -ForegroundColor Gray
Write-Host " Press Ctrl+C in this console to stop the server." -ForegroundColor DarkGray
Write-Host "==========================================================" -ForegroundColor Cyan

if (-not $NoBrowser) {
    Start-Process "http://localhost:$Port/"
}

$mimeTypes = @{
    ".html" = "text/html; charset=utf-8"
    ".htm"  = "text/html; charset=utf-8"
    ".css"  = "text/css; charset=utf-8"
    ".js"   = "application/javascript; charset=utf-8"
    ".json" = "application/json; charset=utf-8"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".jpeg" = "image/jpeg"
    ".gif"  = "image/gif"
    ".svg"  = "image/svg+xml"
    ".ico"  = "image/x-icon"
    ".woff" = "font/woff"
    ".woff2"= "font/woff2"
    ".ttf"  = "font/ttf"
    ".txt"  = "text/plain; charset=utf-8"
}

try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $urlPath = $request.Url.LocalPath
        if ($urlPath -eq "/" -or [string]::IsNullOrWhiteSpace($urlPath)) {
            $urlPath = "/index.html"
        }

        $decodedPath = [System.Uri]::UnescapeDataString($urlPath.TrimStart('/'))
        $filePath = Join-Path $Root $decodedPath

        if (Test-Path $filePath -PathType Leaf) {
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
            $mime = if ($mimeTypes.ContainsKey($ext)) { $mimeTypes[$ext] } else { "application/octet-stream" }
            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            $response.ContentType = $mime
            $response.ContentLength64 = $bytes.Length
            $response.Headers.Add("Access-Control-Allow-Origin", "*")
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $response.StatusCode = 404
            $notFoundBytes = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found: $urlPath")
            $response.ContentType = "text/plain"
            $response.ContentLength64 = $notFoundBytes.Length
            $response.OutputStream.Write($notFoundBytes, 0, $notFoundBytes.Length)
        }
        $response.Close()
    }
} finally {
    if ($listener.IsListening) {
        $listener.Stop()
    }
    $listener.Close()
}
