
from pydantic import BaseModel, Field

class Material(BaseModel):
    colour: str
    density: float = Field(gt = 0)
    name: str