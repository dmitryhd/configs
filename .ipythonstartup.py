import pandas as pd
import numpy as np
import pyodbc
import matplotlib.pyplot as plt
from IPython.display import display
import os

# logging

import logging
import logging.handlers
import os.path as path

def configure_logger(logger_name='root', log_dir='/tmp/', filename='',
                     disable_stdout=False, disable_file=False):
    """
    Returns logger which output to stdout and and to specified file.
    Example: log = configure_logger(filename='abc.log')
    will output log with timestamps to /tmp/abc.log
    """
    if not filename:
        filename = logger_name + '.log'
    log_location = path.join(log_dir, filename)

    logger = logging.getLogger(logger_name)
    logger.setLevel(logging.INFO)
    logger.handlers = []

    log_format = '[%(asctime)s]  %(message)s'
    formatter = logging.Formatter(log_format)

    # Stdout
    if not disable_stdout:
        stdout = logging.StreamHandler()
        stdout.setLevel(logging.INFO)
        stdout.setFormatter(formatter)
        logger.addHandler(stdout)

    # Filehandler
    if not disable_file:
        file_handler = logging.handlers.RotatingFileHandler(
            log_location, mode='a', maxBytes=10**7, backupCount=1)
        file_handler.setLevel(logging.INFO)
        file_handler.setFormatter(formatter)
        logger.addHandler(file_handler)
        print('Log to file {}'.format(log_location))
    logger.info('Logger configured with name {}'.format(logger_name))
    logger.propagate = False
    return logger

import seaborn as sns

import time

def time_measure(func):
    def wrapper(*args, **kwargs):
        tbegin = time.time()
        res = func(*args, **kwargs)
        print('execution of {} took {:.4f}s'.format(
                func.__name__, time.time() - tbegin))
        return res
    return wrapper
    
# Example usage
"""
@time_measure
def long_func(s):
    time.sleep(s)
    
long_func(1)
# execution of long_func took 1.0011s
"""

from contextlib import contextmanager

@contextmanager
def TimeMeasure(name=''):
    tbegin = time.time()
    yield
    print("execution {} took {:.4f}s".format(
            'of ' + name if name else ' ',
            time.time() - tbegin))

"""
# Example usage
def long_func(s):
    with TimeMeasure():
        time.sleep(s)
    
long_func(1)
# execution of long_func took 1.0011s
"""

#%matplotlib inline
