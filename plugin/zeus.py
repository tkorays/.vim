import json
import socket
import sys
import threading
import socketserver
import os.path

thesocket = None


def JumpAlternateFile(f):
    a1 = ['.h', '.hpp', '.hxx', '.hh']
    a2 = ['.c', '.cpp', '.cxx', '.cc']
    prefix, ext = os.path.splitext(f)

    if str.lower(ext) not in a1 and str.lower(ext) not in a2:
        return ''

    if str.lower(ext) in a2:
        a1, a2 = a2, a1

    for a in a2:
        if os.path.exists(prefix + a):
            return prefix + a
        if os.path.exists(prefix + str.upper(a)):
            return prefix + str.upper(a)
    return ''


class ThreadedTCPRequestHandler(socketserver.BaseRequestHandler):

    def handle(self):
        print("=== socket opened ===")
        global thesocket
        thesocket = self.request
        while True:
            try:
                data = self.request.recv(4096).decode('utf-8')
            except socket.error:
                print("=== socket error ===")
                break
            except IOError:
                print("=== socket closed ===")
                break
            if data == '':
                print("=== socket closed ===")
                break
            print("received: {0}".format(data))
            try:
                decoded = json.loads(data)
            except ValueError:
                print("json decoding failed")
                decoded = [-1, '']

            # Send a response if the sequence number is positive.
            # Negative numbers are used for "eval" responses.
            if decoded[0] >= 0:
                seq = decoded[0]
                msg = decoded[1]
                if type(msg) != list or msg[0] != 'zeus':
                    response = [seq, [1, 'badmsg']]
                else:
                    if msg[1] == 'jump':
                        if msg[2] == '':
                            response = [seq, [1, 'not a filename']]
                        else:
                            alternate_file = JumpAlternateFile(msg[2])
                            if alternate_file:
                                response = ['ex', 'edit {}'.format(alternate_file)]
                            else:
                                response = [seq, [1, 'alternate file is not found!']]
                    else:
                        response = [seq, [0, 'what?']]
                encoded = json.dumps(response)
                print("sending {0}".format(encoded))
                self.request.sendall(encoded.encode('utf-8'))
        thesocket = None


class ThreadedTCPServer(socketserver.ThreadingMixIn, socketserver.TCPServer):
    pass


if __name__ == "__main__":
    HOST, PORT = "localhost", 9876 

    server = ThreadedTCPServer((HOST, PORT), ThreadedTCPRequestHandler)
    ip, port = server.server_address

    # Start a thread with the server -- that thread will then start one
    # more thread for each request
    server_thread = threading.Thread(target=server.serve_forever)

    # Exit the server thread when the main thread terminates
    server_thread.daemon = True
    server_thread.start()
    print("Server loop running in thread: ", server_thread.name)

    print("Listening on port {0}".format(PORT))
    while True:
        typed = sys.stdin.readline()
        if "quit" in typed:
            print("Goodbye!")
            break
        if thesocket is None:
            print("No socket yet")
        else:
            print("sending {0}".format(typed))
            thesocket.sendall(typed.encode('utf-8'))

    server.shutdown()
    server.server_close()

