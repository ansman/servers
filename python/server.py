#!/usr/bin/env python

import socket
import sys

host = sys.argv[2] if len(sys.argv) >= 3 else '127.0.0.1'
port = int(sys.argv[1]) if len(sys.argv) >= 2 else 8080

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

try:
    s.bind((host, port))
    s.listen(1)
    sys.stderr.write('Server listening on {0}:{1}\n\n'.format(host, port))

    while 1:
        conn, addr = s.accept()
        data = ''
        while 1:
            data += conn.recv(1024)
            if data.endswith('\r\n\r\n'):
                break

        print data.replace('\r\n', '\n'),

        conn.sendall("HTTP/1.1 200 OK")
        conn.close()

except KeyboardInterrupt:
    pass
finally:
    s.close()
