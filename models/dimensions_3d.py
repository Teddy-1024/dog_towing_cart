
from pydantic import BaseModel, Field

class Dimensions_3D(BaseModel):
    x: float = Field(ge = 0)
    y: float = Field(ge = 0)
    z: float = Field(ge = 0)