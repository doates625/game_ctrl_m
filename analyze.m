function analyze(id)
%ANALYZE(id) Analyze game controller with given ID
%   
%   This function determines the number of buttons, axes, and POVs of a game
%   controller and displays their values continuously to help the user identify
%   the ID mappings.
%   
%   Inputs:
%   - id = Joystick ID [int, default = 1]

% Imports
import('game_ctrl.GameCtrl');

% Make controller
if nargin < 1, id = 1; end
vrj = vrjoystick(id);
ctrl = GameCtrl(id);

% Find buttons
n_btns = 1;
while true
    try button(vrj, n_btns);   
    catch, break; end
    name = sprintf('btn(%02u)', n_btns);
    ctrl.add_btn(name, n_btns);
    n_btns = n_btns + 1;
end

% Find axes
n_axes = 1;
while true
    try axis(vrj, n_axes);
    catch, break; end
    name = sprintf('axis(%02u)', n_axes);
    ctrl.add_axis(name, n_axes);
    n_axes = n_axes + 1;
end

% Find POVs
n_povs = 1;
while true
    try pov(vrj, n_povs);
    catch, break; end
    name = sprintf('pov(%02u)', n_povs);
    ctrl.add_pov(name, n_povs);
    n_povs = n_povs + 1;
end

% Test controller
delete('vrj')
ctrl.test();

end