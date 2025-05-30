
from coordinates_3d import Coordinates_3D
from dimensions_3d import Dimensions_3D
from material import Material

from abc import ABC
from pydantic import BaseModel
import openpyscad as ops
# from solid import OpenSCADObject
from typing import Optional

class Base_3D_Object(BaseModel, ABC):
    colour: str = ''
    dimensions_enclosing_cube: Dimensions_3D
    __mass: float
    material: Material
    object: ops.base.BaseObject
    parent: 'Base_3D_Object' = None
    position_centre_local_assembly: Coordinates_3D = Coordinates_3D(x = 0, y = 0, z = 0)
    rotation: Coordinates_3D = Coordinates_3D(x = 0, y = 0, z = 0)
    __volume_solid: float

    """
    @classmethod
    def make_local_object(cls, colour: str, dimensions_enclosing_cube: Dimensions_3D, material: Material, position_centre_local_assembly: Coordinates_3D, rotation: Coordinates_3D) -> 'Base_3D_Object':
        return cls(
            colour=colour,
            dimensions_enclosing_cube=dimensions_enclosing_cube,
            mass=material.density * dimensions_enclosing_cube.x * dimensions_enclosing_cube.y * dimensions_enclosing_cube.z,
            material=material,
            position_centre_local_assembly=position_centre_local_assembly,
            position_centre_major_assembly=position_centre_local_assembly,
            rotation=rotation,
            volume_solid=dimensions_enclosing_cube.x * dimensions_enclosing_cube.y * dimensions_enclosing_cube.z
        )
    """

    @classmethod
    def from_dimensions_and_material_and_parent(cls, dimensions_enclosing_cube: Dimensions_3D, material: Material, parent: Optional['Base_3D_Object']) -> 'Base_3D_Object':
        return cls(
            dimensions_enclosing_cube = dimensions_enclosing_cube,
            material = material,
            colour = material.colour,
            parent = parent,
        )

    def get_position_centre_major_assembly(self) -> Coordinates_3D:
        if self.parent is None:
            return self.position_centre_local_assembly
        else:
            position_centre_parent_major_assembly = self.parent.get_position_centre_major_assembly()
            return Coordinates_3D(
                x=self.position_centre_local_assembly.x + position_centre_parent_major_assembly.x,
                y=self.position_centre_local_assembly.y + position_centre_parent_major_assembly.y,
                z=self.position_centre_local_assembly.z + position_centre_parent_major_assembly.z
            )
    
    def get_mass(self) -> float:
        if self.__mass is None:
            self.__mass = self.material.density * self.volume_solid
        return self.__mass
    
    def get_volume_solid(self) -> float:
        if self.__volume_solid is None:
            self.__volume_solid = self.dimensions_enclosing_cube.x * self.dimensions_enclosing_cube.y * self.dimensions_enclosing_cube.z
        return self.__volume_solid
    
        
        