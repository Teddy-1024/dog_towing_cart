
from models.dimensions_3d import Dimensions_3D

from pydantic import BaseModel
from typing import ClassVar

class Config(BaseModel):
    D_AXLE_FRONT: ClassVar[float] = 42
    D_AXLE_REAR: ClassVar[float] = 27
    D_WASHER_AXLE_REAR_WHEEL_POSITIONING: ClassVar[float] = 50
    D_WASHER_BOLT_REAR_WHEEL_POSITIONING: ClassVar[float] = 30
    D_WHEEL: ClassVar[float] = 400
    D_WHEEL_BONE: ClassVar[float] = 25
    L_BOLT_EXTENSION: ClassVar[float] = 10
    # M_TOTAL: ClassVar[float] = 160
    R_BED: ClassVar[Dimensions_3D] = Dimensions_3D(x=400, y=1200, z=18)
    SIZE_BOLT: ClassVar[float] = 25
    SIZE_BOLT_REAR_WHEEL_POSITIONING: ClassVar[float] = 10
    SPACING_WASHER_AXLE_REAR_WHEEL_POSITIONING: ClassVar[float] = 1
    SPACING_XY_BED_BORDER: ClassVar[float] = 10
    T_CLAMP: ClassVar[float] = 20
    T_PLATE: ClassVar[float] = 8
    T_WASHER_AXLE_REAR_WHEEL_POSITIONING: ClassVar[float] = 4
    T_WASHER_BOLT_REAR_WHEEL_POSITIONING: ClassVar[float] = 1.5
    T_WHEEL: ClassVar[float] = 100
    Z_OVERLAP_TEE_CLAMP_ROUND: ClassVar[float] = 80
    Z_OFFSET_WHEEL_TO_BED_BASE: ClassVar[float] = 5

    X_POSITION_WHEEL_CENTRE: float
    Y_POSITION_AXLE_FRONT: float
    Y_POSITION_AXLE_REAR: float
    Z_OFFSET_BED_TO_AXLE: float
