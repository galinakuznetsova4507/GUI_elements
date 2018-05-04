function [] = GUI_template()
% Gefoerdert durch Bundesministerium fuer Wirtschaft und Energie aufgrund
% eines Beschlusses des Deutschen Bundestages

%% Figure for objects 
S.fig = figure('units','pixels',...
              'position',[0 50 1600 690],...
              'menubar','none',...
              'name','GUI_template',...
              'numbertitle','off',...
              'resize','on',...
              'Color', [0.8 0.8 0.8]);                                     
%% CheapFlex Logo
CheapFl_Logo_axis = axes('units','pixels',...
                         'position',[20 610 70 60]);
folder = cd;                                                               % read the current folder
cd([folder,'\GUI Components']);                                            % enter the subfolder
A=imread('CheapFlex_18_Logo_150508.png','png'); 
cd(folder);                                                                % back to the main folder
A(:,1:279,:) = [];
A(:,385:end,:) = [];
A(400:end,:,:) = [];
for i=1:size(A,1)
    for j=1:size(A,2)
        if A(i,j,1) == 0 && A(i,j,2) == 0 && A(i,j,3) == 0
            A(i,j,1) = 203;
            A(i,j,2) = 203;
            A(i,j,3) = 203;
        end
    end
end
imshow(A);

%% Document's name             
S.txt = uicontrol('style','text',...
                 'position',[100 610 300 30],...
                 'fontsize',13,...
                 'fontweight','bold',...
                 'backgroundcolor',S.fig.Color,...              
                 'string','"CheapFlex"- Datenvisualisierung'); 
             
%% Pushbutton for opening the explorer
S.pb = uicontrol('style','push',...
                 'unit','pix',...
                 'position',[10 500 180 20],...
                 'fontsize',10,...
                 'string','Path for Data',...
                 'callback',{@pb_call,S}); 
             
%% Text for beginning time
S.txt = uicontrol('style','text',...
                  'position',[400 490 100 20],...          
                  'fontsize',10,...
                  'BackgroundColor', S.fig.Color,...
                  'string','Period from'); 

%% Text for ending time
S.txt = uicontrol('style','text',...
                  'position',[450 440 50 20],...          
                  'fontsize',10,...
                  'BackgroundColor', S.fig.Color,...
                  'string','to'); 
 
%% Popup menu for days 
days = cell(31,1);                                                         % list of days for one month (1 to 31)
for k = 1 : 31
    days{k} = num2str(k);
end
S.pp =     uicontrol('style','pop',...
                     'fontsize',9,... 
                     'position',[500 450 90 15],...
                     'string',[{'...'};days]);
S.pp =     uicontrol('style','pop',...
                     'fontsize',9,... 
                     'position',[500 500 90 15],...
                     'string',[{'...'};days]);
S.pp_txt = uicontrol('style','text',...                                    % Text for days (above popup menu)
                     'position',[500 530 90 20],...
                     'fontsize',10,...
                     'string','Day');


%% Popup menu for months
months = cell(12,1);                                                       % list of months for one year (1 to 12)
for k = 1 : 12
    months{k} = num2str(k);
end
S.pp =     uicontrol('style','pop',...
                     'fontsize',9,... 
                     'position',[600 450 90 15],...
                     'string',[{'...'}; months]);
S.pp =     uicontrol('style','pop',...
                     'fontsize',9,... 
                     'position',[600 500 90 15],...
                     'string',[{'...'};months]);
S.pp_txt = uicontrol('style','text',...
                     'position',[600 530 90 20],...
                     'fontsize',10,...
                     'string','Month');
%% Popup menu for years
years = cell(12,1);                                                        % list of years (from 1995 to 2020)
for k = 1:26
    years{k} = num2str(k+1994);
end

S.pp =     uicontrol('style','pop',...
                     'fontsize',9,... 
                     'position',[700 450 90 15],...
                     'string',[{'...'};years]);
S.pp =     uicontrol('style','pop',...
                     'fontsize',9,... 
                     'position',[700 500 90 15],...
                     'string',[{'...'};years]);
S.pp_txt = uicontrol('style','text',...
                     'position',[700 530 90 20],...
                     'fontsize',10,...
                     'string','Year');

%% Popup menu for hours
hours = cell(24,1);                                                        % list of hours (1 to 24)
for k = 1:24
    hours{k} = num2str(k);
end
S.pp =     uicontrol('style','pop',...
                     'fontsize',9,... 
                     'position',[800 450 90 15],...
                     'string',[{'...'};hours]);
S.pp =     uicontrol('style','pop',...
                     'fontsize',9,... 
                     'position',[800 500 90 15],...
                     'string',[{'...'};hours]);
S.pp_txt = uicontrol('style','text',...
                     'position',[800 530 90 20],...
                     'fontsize',10,...
                     'string','Hour');


%% Popup menu for minutes
minutes = cell(60,1);                                                      % list of minutes (0 to 59)
for k = 1:60
    minutes{k} = num2str(k-1);
end

S.pp =     uicontrol('style','pop',...
                     'fontsize',9,... 
                     'position',[900 450 90 15],...
                     'string',[{'...'};minutes]);
S.pp =     uicontrol('style','pop',...
                     'fontsize',9,... 
                     'position',[900 500 90 15],...
                     'string',[{'...'};minutes]);
S.pp_txt = uicontrol('style','text',...
                     'position',[900 530 90 20],...
                     'fontsize',10,...
                     'string','Minute');
             
%% Axis for resulting diagram         
diag_axis = axes('units', 'pixels',...
                 'position',[400 50 570 300]);

%% Text for resulting diagram
SS.txt = uicontrol('style','text',...
                   'position',[450 360 300 30],...
                   'fontsize',10,...
                   'fontweight','bold',...
                   'backgroundcolor',S.fig.Color,...
                   'string','Resulting diagram');
             
function [] = pb_call(varargin)
% Callback for pushbutton, opens explorer 
   uigetdir; 
end
end

         