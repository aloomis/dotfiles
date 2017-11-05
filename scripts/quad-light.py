#!/usr/bin/env python

import argparse
import math
import subprocess

def quad_from_linear(x):
    return int(round(100 * math.sqrt(x / 100.0)))

def linear_from_quad(x):
    return int(round(100 * ((x / 100.0) ** 2)))

def get():
    return quad_from_linear(float(subprocess.check_output(["light", "-G"])))

def set(x):
    subprocess.call(["light", "-S", str(linear_from_quad(x))])

def main():
    parser = argparse.ArgumentParser(prog="quad-light")
    parser.add_argument("-G", action="store_true", help="Get value")
    parser.add_argument("-A", type=int, metavar="value", help="Add value")
    parser.add_argument("-U", type=int, metavar="value", help="Subtract value")
    args = parser.parse_args()

    if args.A: set(get() + args.A)
    elif args.U: set(get() - args.U)
    elif args.G: print(get())
    else: parser.print_help()

if __name__ == "__main__":
    main()
