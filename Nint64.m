classdef Nint64 < game_ctrl.GameCtrl
    %NINT64 Class for Nintendo 64 controllers
    %   
    %   Interface:
    %   - Buttons: Start, A, B, CU, CD, CL, CR, L, R, Z
    %   - Axes: JX, JY
    %   - POVs: Dpad
    %   
    %   Author: Dan Oates (WPI Class of 2020)
    
    methods (Access = public)
        function obj = Nint64(id)
            %obj = NINT64(id)
            %   Construct interface
            %   
            %   Inputs:
            %   - id = Controller ID [int, default = 1]
            
            % Superconstructor
            if nargin < 1, id = 1; end
            obj@game_ctrl.GameCtrl(id);
            
            % Buttons
            obj.add_btn('Start',    10);
            obj.add_btn('A',        07);
            obj.add_btn('B',        09);
            obj.add_btn('CU',       01);
            obj.add_btn('CD',       03);
            obj.add_btn('CL',       04);
            obj.add_btn('CR',       02);
            obj.add_btn('L',        05);
            obj.add_btn('R',        06);
            obj.add_btn('Z',        08);
            
            % Axes
            obj.add_axis('JX',      01);
            obj.add_axis('JY',      02);
            
            % POVs
            obj.add_pov('Dpad',     01);
        end
    end
end