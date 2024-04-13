import time
import numpy as np
import matplotlib.pyplot as plt
from IPython.display import clear_output

print("done")


class Lenia:
    def __init__( s, world_size, R, peaks, mu, sigma, dt, kernel_type=0, delta_type=0 ):
        s.world_size = world_size
        s.R = R
        s.peaks = peaks
        s.mu = mu
        s.sigma = sigma
        s.dt = dt
        s.kernel_type = kernel_type
        s.delta_type = delta_type
        s.world = np.zeros( (s.world_size, s.world_size) )
        s.calc_kernel()
    
    def reset( s ):
        s.world = np.zeros( (s.world_size, s.world_size) )
    
    def delta_func(s, n):
        if s.delta_type == 0:
            return np.maximum(0, 1 - (n - s.mu)**2 / (s.sigma**2 * 9) )**4 * 2 - 1
        else:
            return np.exp( - (n - s.mu)**2 / (s.sigma**2 * 2) ) * 2 - 1
    
    def calc_once(s, is_update=True):
        MID = int( s.world.shape[0] / 2 )
        world_FFT = np.fft.fft2(s.world)
        s.potential = np.roll(np.real(np.fft.ifft2(s.kernel_FFT * world_FFT)), MID, (0, 1))
        s.delta = s.delta_func(s.potential)
        if is_update: 
            s.world = np.maximum(0, np.minimum(1, s.world + s.delta * s.dt))
    
    def calc_kernel(s):
        MID = int( s.world.shape[0] / 2 )
        I = np.array([np.arange(s.world_size),]*s.world_size)
        X = (I-MID) / s.R
        Y = X.T
        D = np.sqrt(X**2 + Y**2)

        s.kernel = s.kernel_shell(D)
        s.kernel_sum = np.sum(s.kernel)
        kernel_norm = s.kernel / s.kernel_sum
        s.kernel_FFT = np.fft.fft2(kernel_norm)
    
    def kernel_core(s, r):
        rm = np.minimum(r, 1)
        if s.kernel_type == 0:
            return (4 * rm * (1-rm))**4
        else:
            return np.exp( 4 - 1 / (rm * (1-rm)) )
    
    def kernel_shell(s, r):
        k = len(s.peaks)
        kr = k * r
        peak = s.peaks[np.minimum(np.floor(kr).astype(int), k-1)]
        return (r<1) * s.kernel_core(kr % 1) * peak

lenia = Lenia(
    world_size=256,
    R=13, 
    peaks=np.array([1]), 
    mu=0.15, 
    sigma=0.0143, 
    dt=0.1,
    kernel_type=0, 
    delta_type=0
)

plt.imshow( lenia.kernel )
plt.show()

print("done")

lenia.world = np.random.random( size=(256,256) )

lenia.world = np.zeros( (256,256) )
lenia.world[100:150,100:150] = np.random.normal( size=(50,50) )
lenia.world[200:250,100:150] = np.random.normal( size=(50,50) )
lenia.world[100:150,200:250] = np.random.normal( size=(50,50) )
lenia.world[200:250,200:250] = np.random.normal( size=(50,50) )

t0, t1 = 0, 0
for i in range( 10 ):
    clear_output( True )
    
    plt.figure( figsize=(10,10) )
    plt.imshow( lenia.world )
    plt.show()
    print( i, t1-t0 )
    
    t0 = time.time()
    lenia.calc_once()
    t1 = time.time()
    #time.sleep( 0.1 )

print( "done" )