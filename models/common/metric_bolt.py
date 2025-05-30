
from models.base_3d_object import Base_3D_Object
from models.dimensions_3d import Dimensions_3D
from models.material import Material

from pydantic import Field


class Metric_Bolt(Base_3D_Object):
    head_diameter: float = Field(gt = 0)
    head_length: float = Field(gt = 0)
    length: float = Field(gt = 0)
    shaft_length: float = Field(gt = 0)
    size: float = Field(gt = 0)

    @classmethod
    def from_size_and_length_and_material(cls, size: float, length: float, material: Material) -> 'Metric_Bolt':
        head_diameter = cls.get_head_diameter(size = size)
        bolt = Metric_Bolt.from_dimensions_and_material(
            dimensions_enclosing_cube = Dimensions_3D(
                x = head_diameter,
                y = head_diameter,
                z = length
            ),
            material = material
        )
        bolt.size = size
        bolt.length = length
        bolt.head_diameter = head_diameter
        bolt.head_length = cls.get_head_length(size = size)
        bolt.shaft_length = bolt.length - bolt.head_length

    @classmethod
    def get_head_diameter(cls, size: float) -> float:
        return size * 2
    
    @classmethod
    def get_head_length(cls, size: float) -> float:
        return size
    
    @classmethod
    def get_washer_diameter_safe_working_clearance(cls, size: float) -> float:
        return size * 4 if size < 20 else size * 3