from netqasm.sdk.external import NetQASMConnection
from netqasm.sdk import EPRSocket
import sys


def main(phi, theta, app_config=None):
    print("sender main", file=sys.stderr)
    # Specify an EPR socket to receiver
    epr_socket = EPRSocket("receiver")

    sender = NetQASMConnection(
        "sender",
        log_config=app_config.log_config,
        epr_sockets=[epr_socket],
    )
    with sender:
        # Create an entangled pair using the EPR socket to receiver
        q_ent = epr_socket.create()[0]
        # Measure the qubit
        m = q_ent.measure()
    # Print the outcome
    print(f"sender's outcome is: {m}", file=sys.stderr)
    return f"sender measurement is: {m}"
