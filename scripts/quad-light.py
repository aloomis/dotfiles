#!/usr/bin/env python

import argparse
import math
import os
import subprocess

def _quad_from_linear(x):
    return int(round(100 * math.sqrt(x / 100.0)))

def _linear_from_quad(x):
    return int(round(100 * ((x / 100.0) ** 2)))

class Backlight(object):
    def setBrightness(self, x):
        self._setBrightness(_linear_from_quad(x))
    def getBrightness(self):
        return _quad_from_linear(self._getBrightness())
    def _setBrightness(self, x):
        raise NotImplementedError("Missing '_setBrightness' implementation.")
    def _getBrightness(self):
        raise NotImplementedError("Missing '_getBrightness' implementation.")

class Light(Backlight):
    def _setBrightness(self, x):
        subprocess.call(["light", "-S", str(x)])
    def _getBrightness(self):
        return float(subprocess.check_output(["light", "-G"], encoding="utf-8"))

class BrightnessCtl(Backlight):
    def _setBrightness(self, x):
        subprocess.call(["brightnessctl", "s", "{0}%%".format(x)], stdout=open(os.devnull, "wb"))
    def _getBrightness(self):
        return float(subprocess.check_output(["brightnessctl", "-m"], encoding="utf-8").split(",")[3][:-1])

def main():
    parser = argparse.ArgumentParser(prog="quad-light")
    parser.add_argument("-G", action="store_true", help="Get value")
    parser.add_argument("-A", type=int, metavar="value", help="Add value")
    parser.add_argument("-U", type=int, metavar="value", help="Subtract value")
    args = parser.parse_args()

    backlight = BrightnessCtl()
    if args.A: backlight.setBrightness(backlight.getBrightness() + args.A)
    elif args.U: backlight.setBrightness(backlight.getBrightness() - args.U)
    elif args.G: print(backlight.getBrightness())
    else: parser.print_help()

if __name__ == "__main__":
    main()
