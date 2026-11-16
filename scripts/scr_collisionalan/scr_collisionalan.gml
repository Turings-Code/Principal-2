function scr_collisionalan(move_x, move_y)
{
    var _steps_x = ceil(abs(move_x));
    var _dir_x = sign(move_x);

    repeat (_steps_x)
    {
        if (!place_meeting(x + _dir_x, y, obj_collisionblock)
        && !(instance_exists(obj_theo) && instance_exists(obj_turing) && !obj_turing.theosegue && place_meeting(x + _dir_x, y, obj_theo))
        && !(instance_exists(obj_turing) && place_meeting(x + _dir_x, y, obj_turing))) {
            x += _dir_x;
        } else {
            break;
        }
    }

    var _steps_y = ceil(abs(move_y));
    var _dir_y = sign(move_y);

    repeat (_steps_y)
    {
        if (!place_meeting(x, y + _dir_y, obj_collisionblock)
        && !(instance_exists(obj_theo) && instance_exists(obj_turing) && !obj_turing.theosegue && place_meeting(x, y + _dir_y, obj_theo))
        && !(instance_exists(obj_turing) && place_meeting(x, y + _dir_y, obj_turing))) {
            y += _dir_y;
        } else {
            break;
        }
    }
}