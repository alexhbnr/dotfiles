#!/usr/bin/env python
########################################################################
#
#
# Alex Huebner,
########################################################################

from __future__ import print_function
import argparse
import sys


def main():
    '''
    '''


# Argument parser
Parser = argparse.ArgumentParser(description='Description of your program')
Parser.add_argument('-o', '--output', help='Description for output specification')
Args = vars(Parser.parse_args())

if __name__ == '__main__':
    main()
