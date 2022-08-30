import http.server
import socketserver
import json
import os
import re
import subprocess
from typing import Dict

PORT = os.environ.get("API_URL", 9000)


class MyHandler(http.server.SimpleHTTPRequestHandler):
    content_type = "text/json"

    def do_OPTIONS(self):
        self.send_response(200, "ok")
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', '*')
        self.send_header("Access-Control-Allow-Headers",
                         "X-Requested-With")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_POST(self):
        if(self.path != '/modifyvariables'):
            # - response - 404
            self.send_response(404)
            self.send_header('Content-type', self.content_type)
            self.send_header('Access-Control-Allow-Origin', '*')
            self.send_header('Access-Control-Allow-Methods', '*')
            self.send_header("Access-Control-Allow-Headers",
                             "X-Requested-With")
            self.send_header("Access-Control-Allow-Headers", "Content-Type")
            self.end_headers()
            output_data = {'status': 'Not Found',
                           'error': f'Path not implemented'}
            self.wfile.write(json.dumps(output_data).encode('utf-8'))
            return

        content_length = int(self.headers['Content-Length'])

        if content_length:
            input_json = self.rfile.read(content_length)
            input_data = json.loads(input_json)
        else:
            input_data = None

        print(input_data['budata']['buName'])
        print(input_data['budata']['buCode'])

        # Run command
        # TODO: Modify this to invoke shell script in required directly

        files = subprocess.call(
            ['sh', "./exec_script.sh", input_data['budata']['buName'], input_data['budata']['buCode']])

        # - response - 200
        self.send_response(200)
        self.send_header('Content-type', self.content_type)
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', '*')
        self.send_header("Access-Control-Allow-Headers",
                         "X-Requested-With")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()
        output_data = {'status': 'OK', 'result': f'Success = {files}'}
        self.wfile.write(json.dumps(output_data).encode('utf-8'))

    @staticmethod
    def __get_summary_report_data(file_path: str) -> Dict:
        """
            find google resources from json(terraform)

            Arguments:
                file_path: file path

            Returns:
                Dict: dict of google resources name as key and it's count as value
        """

        result = {}

        with open(file_path, 'r') as file:
            data = json.loads(file.read())
            terrform_output = json.dumps(data)

            matched_resources = re.findall(
                r"\W*type[^:]*:\W*(\w+)*\W", terrform_output)
            # above regex is to get the data against 'type' attribute in json file
            for each_match in matched_resources:
                if 'google' in each_match:
                    if each_match in result:
                        result[each_match] = result[each_match] + 1
                    else:
                        result[each_match] = 1

        return result

    def get_evidence_url(file_path: str) -> Dict:
        """
          find terraform logs & bucket(evidence) url from json

          Arguments:
              file_path: file path

          Returns:
              Dict: dict of terraform logs & bucket(evidence)  url
        """

        result = {}

        with open(file_path, 'r') as file:
            data = json.loads(file.read())

        result = data["evidenceBucket"]

        return result

    def do_GET(self):
        if self.path == '/summaryreport':
            self.get_summary_report()
        elif self.path == '/evidenceData':
            self.get_evidence_data()

    def get_summary_report(self):
        files = subprocess.call(['sh', "./tf-state.sh"])
        result = files
        if(result == 0):
            file_path = "./tf-state-inventory.json"
            if(os.path.exists(file_path)):
                result = MyHandler.__get_summary_report_data(
                    file_path)
                self.send_response(200)
                self.send_header('Content-type', self.content_type)
                self.send_header('Access-Control-Allow-Origin', '*')
                self.send_header('Access-Control-Allow-Methods', '*')
                self.send_header(
                    "Access-Control-Allow-Headers", "Content-Type")
                self.end_headers()
                output_data = {'status': 'OK', "body": result}
                self.wfile.write(json.dumps(output_data).encode('utf-8'))
                os.remove(file_path)
            else:
                self.send_response(401)
                self.send_header('Content-type', self.content_type)
                self.send_header('Access-Control-Allow-Origin', '*')
                self.send_header('Access-Control-Allow-Methods', '*')
                self.send_header(
                    "Access-Control-Allow-Headers", "Content-Type")
                self.end_headers()
        else:
            self.send_response(401)
            self.send_header('Content-type', self.content_type)
            self.send_header('Access-Control-Allow-Origin', '*')
            self.send_header('Access-Control-Allow-Methods', '*')
            self.send_header(
                "Access-Control-Allow-Headers", "Content-Type")
            self.end_headers()

    def get_evidence_data(self):
        file_path = "./frontend/terraform-state/State.json"
        result = MyHandler.get_evidence_url(
            file_path)
        if(os.path.exists(file_path)):
            self.send_response(200)
            self.send_header('Content-type', self.content_type)
            self.send_header('Access-Control-Allow-Origin', '*')
            self.send_header('Access-Control-Allow-Methods', '*')
            self.send_header(
                "Access-Control-Allow-Headers", "Content-Type")
            self.end_headers()
            output_data = {'status': 'OK', "body": result}
            self.wfile.write(json.dumps(output_data).encode('utf-8'))

        else:
            self.send_response(401)
            self.send_header('Content-type', self.content_type)
            self.send_header('Access-Control-Allow-Origin', '*')
            self.send_header('Access-Control-Allow-Methods', '*')
            self.send_header(
                "Access-Control-Allow-Headers", "Content-Type")
            self.end_headers()


Handler = MyHandler

try:
    with socketserver.TCPServer(("", int(PORT)), Handler) as httpd:
        print(f"Starting http://127.0.0.1:{PORT}")
        httpd.serve_forever()
except KeyboardInterrupt:
    print("Stopping by Ctrl+C")
    httpd.server_close()
