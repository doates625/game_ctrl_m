classdef GameCtrl < handle
    %GAMECTRL Superclass for video game controllers
    %   
    %   Author: Dan Oates (WPI Class of 2020)
    
    properties (Access = protected)
        vrj     % Joystick [vrjoystick]
        btns    % Button map [containers.Map]
        axes    % Axis map [containers.Map]
        povs    % Pov map [containers.Map]
        dzs;    % Dead zones [containers.Map]
    end
    
    methods (Access = public)
        function obj = GameCtrl(id)
            %obj = GAMECTRL(id)
            %   Construct game controller
            %   
            %   Inputs:
            %   - id = Joystick ID [int, default = 1]
            obj.vrj = vrjoystick(id); 
            obj.btns = containers.Map('KeyType', 'char', 'ValueType', 'double');
            obj.axes = containers.Map('KeyType', 'char', 'ValueType', 'double');
            obj.povs = containers.Map('KeyType', 'char', 'ValueType', 'double');
            obj.dzs = containers.Map('KeyType', 'char', 'ValueType', 'double');
        end
        
        function add_btn(obj, name, id)
            %ADD_BTN(obj, name, id)
            %   Adds button mapping to game controller
            %   
            %   Inputs:
            %   - name = Button name [char]
            %   - id = Button ID [int]
            obj.btns(name) = id;
        end
        
        function add_axis(obj, name, id, dz)
            %ADD_AXIS(obj, name, id, dz)
            %   Adds axis mapping to game controller
            %   
            %   Inputs:
            %   - name = Axis name [char]
            %   - id = Axis id [int]
            %   - dz = Deadzone [double, default = 0]
            if nargin < 4, dz = 0.0; end
            obj.dzs(name) = dz;
            obj.axes(name) = id;
        end
        
        function add_pov(obj, name, id)
            %ADD_POV(obj, name, id)
            %   Adds POV mapping to game controller
            %   
            %   Inputs:
            %   - name = POV name [char]
            %   - id = POV id [int]
            obj.povs(name) = id;
        end
        
        function set_dz(obj, name, dz)
            %SET_DZ(obj, name, dz)
            %   Sets axis deadzone
            %   
            %   Inputs:
            %   - name = Axis name [char]
            %   - dz = Deadzone [double, [0, 1]]
            obj.dzs(name) = dz;
        end
        
        function auto_dzs(obj)
            %AUTO_DZS(obj)
            %   Automatically selects deadzones based on current axis states
            names = obj.axes.keys();
            for i = 1:length(names)
                name = names{i};
                obj.dzs(name) = 0;
                dz = 1.2 * abs(obj.axis(name));
                obj.dzs(name) = dz;
            end
        end
        
        function btn_ = btn(obj, name)
            %b = BTN(obj, name)
            %   Button press status
            %   
            %   Inputs:
            %   - name = Button name [char]
            %   
            %   Outputs:
            %   - btn_ = Press status [logical]
            btn_ = button(obj.vrj, obj.btns(name));
        end
        
        function axis_ = axis(obj, name)
            %axis_ = AXIS(obj, name)
            %   Joystick axis reading
            %   
            %   Inputs:
            %   - name = Axis name [char]
            %   
            %   Outputs:
            %   - axis_ = Axis reading [-1, +1];
            axis_ = axis(obj.vrj, obj.axes(name));
            if abs(axis_) < obj.dzs(name)
                axis_ = 0;
            end
        end
        
        function pov_ = pov(obj, name)
            %pov_ = POV(obj, name)
            %   POV button reading
            %   
            %   Inputs:
            %   - name = POV name [char]
            %   
            %   Outputs:
            %   - pov_ = POV reading [deg or -1]
            pov_ = pov(obj.vrj, obj.povs(name));
        end
        
        function disp(obj)
            %DISP(obj) Displays controller state
            fprintf('Controller State:\n')
            types = {'Buttons', 'Axes', 'POVs'};
            maps = {obj.btns, obj.axes, obj.povs};
            funcs = {@obj.btn, @obj.axis, @obj.pov};
            fmts = {'%u', '%+.2f', '%i'};
            for t = 1:3
                names = maps{t}.keys();
                n = length(names);
                if n > 0
                    fprintf([types{t} ':\n'])
                    for i = 1:n
                        name = names{i};
                        fmt = ['\t%s: ' fmts{t} '\n'];
                        fprintf(fmt, name, funcs{t}(name))
                    end
                end
            end
        end
        
        function test(obj)
            %TEST(obj) Displays controller state continuously
            while 1
                clc
                disp(obj)
                pause(0.1)
            end
        end
    end
end

