import numpy as np

class SuperexchangeModel:
    def __init__(self, V1, V2, V3, delta12, delta23, delta13=0, mass=2000):
        self.V1 = V1
        self.V2 = V2
        self.V3 = V3
        self.delta12 = delta12
        self.delta23 = delta23
        self.delta13 = delta13
        self.mass = mass

    def potential(self, x):
        V = np.zeros((3, 3))
        V[0, 0] = self.V1
        V[1, 1] = self.V2
        V[2, 2] = self.V3
        V[0, 1] = V[1, 0] = self.delta12 * np.exp(-x**2 / 2)
        V[1, 2] = V[2, 1] = self.delta23 * np.exp(-x**2 / 2)
        V[0, 2] = V[2, 0] = self.delta13 * np.exp(-x**2 / 2)
        return V
    
    def gradient(self, x):
        dV = np.zeros((3, 3))
        dV[0, 1] = dV[1, 0] = -self.delta12 * x * np.exp(-x**2 / 2)
        dV[1, 2] = dV[2, 1] = -self.delta23 * x * np.exp(-x**2 / 2)
        dV[0, 2] = dV[2, 0] = -self.delta13 * x * np.exp(-x**2 / 2)
        return dV