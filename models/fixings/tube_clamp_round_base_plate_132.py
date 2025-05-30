
from models.base_3d_object import Base_3D_Object
from models.fixings.base_tube_clamp import Base_Tube_Clamp
from models.dimensions_3d import Dimensions_3D
from models.material import Material

from pydantic import Field
# import solid
import openpyscad as ops

class Tube_Clamp_Round_Base_Plate_132(Base_Tube_Clamp):
    

    @classmethod
    def from_tube_diameter_and_parent(cls, tube_diameter: float, parent: Base_3D_Object) -> 'Tube_Clamp_Round_Base_Plate_132':
        L_shaft_with_base_plate = cls.get_L_shaft_with_base_plate(tube_diameter = tube_diameter)
        R_plate = cls.get_R_plate(tube_diameter = tube_diameter)
        y_offset_hole = cls.get_offset_hole_y(tube_diameter = tube_diameter)
        diameter_hole_bolt = cls.get_diameter_hole(tube_diameter = tube_diameter)

        tube_clamp = cls.from_dimensions_and_material_and_parent(
            dimensions_enclosing_cube = Dimensions_3D(
                x = R_plate.x,
                y = R_plate.y,
                z = L_shaft_with_base_plate
            ),
            material = cls.MATERIAL_DEFAULT,
            parent = parent,
        )

        clamp_shaft = cls.__make_shaft_object(
            tube_diameter = tube_diameter,
            L_shaft_with_base_plate = L_shaft_with_base_plate,
            R_plate = R_plate,
        )
        clamp_shaft.translate([0, 0, L_shaft_with_base_plate / 2])

        base_plate = cls.__make_base_plate_object(
            R_plate = R_plate,
            y_offset_hole = y_offset_hole,
            diameter_hole_bolt = diameter_hole_bolt,
        )
        base_plate.translate([0, 0, R_plate.z / 2])

        tube_clamp.object = ops.Union()
        tube_clamp.object.append(base_plate)
        tube_clamp.object.append(clamp_shaft)

        tube_clamp.object.color(cls.MATERIAL_DEFAULT.colour)
        return tube_clamp
    
    @classmethod
    def __make_shaft_object(cls, tube_diameter: float, L_shaft_with_base_plate: float, R_plate: tuple[float, float, float]) -> ops.base.BaseObject:
        clamp_shaft = ops.Difference()
        clamp_shaft.append(
            ops.Cylinder(
                h = L_shaft_with_base_plate,
                r = tube_diameter / 2 + R_plate.z,
            )
        )
        clamp_shaft.append(
            ops.Cylinder(
                h = L_shaft_with_base_plate,
                r = tube_diameter / 2,
            )
        )
        return clamp_shaft
    @classmethod
    def __make_base_plate_object(cls, R_plate: Dimensions_3D, y_offset_hole: float, diameter_hole_bolt: float) -> ops.base.BaseObject:
        base_plate = ops.Difference()
        base_plate.append(
            ops.Cube(
                v = [R_plate.x, R_plate.y, R_plate.z],
                center = True,
            )
        )
        base_plate.append(
            ops.Cylinder(
                h = R_plate.z,
                r = diameter_hole_bolt / 2,
                center = True,
            ).translate([0, y_offset_hole, 0])
        )
        base_plate.append(
            ops.Cylinder(
                h = R_plate.z,
                r = diameter_hole_bolt / 2,
                center = True,
            ).translate([0, -y_offset_hole, 0])
        )
        return base_plate

    @classmethod
    def get_L_shaft_with_base_plate(cls, tube_diameter: float) -> float:
        L_shaft = 25
        if tube_diameter == 27:
            L_shaft = 85
        elif tube_diameter == 42:
            L_shaft = 122
        return L_shaft
    
    @classmethod
    def get_R_plate(cls, tube_diameter: float) -> Dimensions_3D:
        R_plate = Dimensions_3D(
            x = 10,
            y = 20,
            z = 1
        )
        if tube_diameter == 27:
            R_plate = Dimensions_3D(
            x = 64,
            y = 114,
            z = 7
        )
        elif tube_diameter == 42:
            R_plate = Dimensions_3D(
            x = 80,
            y = 140,
            z = 10
        )
        else:
            raise ValueError(f"Unsupported tube diameter: {tube_diameter}")
        return R_plate
    
    @classmethod
    def get_offset_hole_y(cls, tube_diameter: float) -> float:
        y_offset = 10
        if tube_diameter == 27:
            y_offset = 38
        elif tube_diameter == 42:
            y_offset = 50
        else:
            raise ValueError(f"Unsupported tube diameter: {tube_diameter}")
        return y_offset
    
    @classmethod
    def get_diameter_hole(cls, tube_diameter: float) -> float:
        return 10
    
    @classmethod
    def get_mass(cls, tube_diameter: float) -> float:
        mass = 0
        if tube_diameter == 27:
            mass = 0.5
        elif tube_diameter == 42:
            mass = 1.06
        else:
            raise ValueError(f"Unsupported tube diameter: {tube_diameter}")
        return mass
        