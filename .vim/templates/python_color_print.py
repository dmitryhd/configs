start_profiler()
end_profiler()

timer_b = None

def start_profiler():
    import time;
    global timer_b
    timer_b = time.time();

def end_profiler(message = 'TIMING: '):    
    from colorama import init, Fore;
    init();
    print(message, Fore.YELLOW , round(time.time() - timer_b, 3), Fore.RESET)


