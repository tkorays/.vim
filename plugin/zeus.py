import json
import socket
import sys
import threading
import socketserver

thesocket = None


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
                if type(msg) != list:
                    response = [seq, [1, 'badmsg']]
                else:
                    if msg[0] != 'zeus':
                        response = [seq, [1, 'not a zeus message!']]
                    elif msg[1] == 'switch':
                        #  response = [0, 'switch to file {}'.format(msg[2])]
                        #  response = ['call', 'popup_dialog', ['wtf', {}]]
                        response = ['ex', 'edit ~/a.cpp']
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

