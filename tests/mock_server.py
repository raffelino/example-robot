from http.server import HTTPServer, BaseHTTPRequestHandler
import json

class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-Type', 'application/json')
        self.end_headers()
        response = {
            'message': 'GET request received',
            'path': self.path,
            'method': 'GET'
        }
        self.wfile.write(json.dumps(response).encode())
    
    def do_POST(self):
        content_length = int(self.headers.get('Content-Length', 0))
        body = self.rfile.read(content_length)
        
        self.send_response(200)
        self.send_header('Content-Type', 'application/json')
        self.end_headers()
        
        response = {
            'message': 'POST request received',
            'data': body.decode() if body else None
        }
        self.wfile.write(json.dumps(response).encode())
    
    def log_message(self, format, *args):
        pass  # Suppress server logs

if __name__ == '__main__':
    server = HTTPServer(('localhost', 8000), SimpleHTTPRequestHandler)
    print("Server running on http://localhost:8000")
    server.serve_forever()
