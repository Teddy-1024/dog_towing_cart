
from pydantic import BaseModel, Field

class Coordinates_3D(BaseModel):
    x: float
    y: float
    z: float