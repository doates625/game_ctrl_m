classdef Xbox360 < game_ctrl.GameCtrl
    %XBOX360 Class for Xbox 360 controllers
    %   
    %   Interface:
    %   - Buttons: Start, Back, A, B, X, Y, LB, RB, LS, RS
    %   - Axes: LX, LY, RX, RY, Trig
    %   - POVs: Dpad
    %   
    %   Author: Dan Oates (WPI Class of 2020)
    
    methods (Access = public)
        function obj = Xbox360(id)
            %obj = XBOX360(id, dz)
            %   Construct interface
            %   
            %   Inputs:
            %   - id = Controller ID [int, default = 1]
            
            % Superconstructor
            if nargin < 1, id = 1; end
            obj@game_ctrl.GameCtrl(id);
            
            % Buttons
            obj.add_btn('Start',    08);
            obj.add_btn('Back',     07);
            obj.add_btn('A',        01);
            obj.add_btn('B',        02);
            obj.add_btn('X',        03);
            obj.add_btn('Y',        04);
            obj.add_btn('LB',       05);
            obj.add_btn('RB',       06);
            obj.add_btn('LS',       09);
            obj.add_btn('RS',       10);
            
            % Axes
            obj.add_axis('LX',      01);
            obj.add_axis('LY',      02);
            obj.add_axis('RX',      04);
            obj.add_axis('RY',      05);
            obj.add_axis('Trig',    03);
            
            % POVs
            obj.add_pov('Dpad',     01);
        end
    end
end