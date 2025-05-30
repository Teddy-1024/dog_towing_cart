
from models.base_3d_object import Base_3D_Object
from models.material import Material

from abc import abstractmethod
from typing import ClassVar

class Base_Tube_Clamp(Base_3D_Object):
    MATERIAL_DEFAULT: ClassVar[Material] = Material(
        name = 'Steel',
        density = 7.85,
        colour = 'LightGrey'
    )
    
    @abstractmethod
    def from_tube_diameter(cls, tube_diameter: float) -> 'Base_Tube_Clamp':
        pass