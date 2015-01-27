#!/usr/bin/env python3

import argparse


def parse_args():
    """ Process command line arguments. """
    parser = argparse.ArgumentParser()
    parser.add_argument("-d", "--db_name", type=str,
                        default='data/vac.db',
                        help="database name")
    parser.add_argument("-c", "--compress",
                        help="do compression",
                        action="store_true")
    args = parser.parse_args()
    if args.compress:
        args.db_name = 'xxx'
    return args


def main():
    """ """
    pass

if __name__ == '__main__':
    main()
