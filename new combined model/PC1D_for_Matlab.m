function varargout = PC1D_for_Matlab(varargin)
    % PC1D_FOR_MATLAB MATLAB code for PC1D_for_Matlab.fig
    %      PC1D_FOR_MATLAB, by itself, creates a new PC1D_FOR_MATLAB or raises the existing
    %      singleton*.
    %
    %      H = PC1D_FOR_MATLAB returns the handle to a new PC1D_FOR_MATLAB or the handle to
    %      the existing singleton*.
    %
    %      PC1D_FOR_MATLAB('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in PC1D_FOR_MATLAB.M with the given input arguments.
    %
    %      PC1D_FOR_MATLAB('Property','Value',...) creates a new PC1D_FOR_MATLAB or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before PC1D_for_Matlab_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to PC1D_for_Matlab_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Edit the above text to modify the response to help PC1D_for_Matlab

    % Last Modified by GUIDE v2.5 03-Apr-2013 12:55:24

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @PC1D_for_Matlab_OpeningFcn, ...
                       'gui_OutputFcn',  @PC1D_for_Matlab_OutputFcn, ...
                       'gui_LayoutFcn',  [] , ...
                       'gui_Callback',   []);
    if nargin && ischar(varargin{1})
        gui_State.gui_Callback = str2func(varargin{1});
    end

    if nargout
        [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
    else
        gui_mainfcn(gui_State, varargin{:});
    end
    % End initialization code - DO NOT EDIT

    % --- Executes just before PC1D_for_Matlab is made visible.
function PC1D_for_Matlab_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to PC1D_for_Matlab (see VARARGIN)

    movegui('center')
    warning off

    % Choose default command line output for PC1D_for_Matlab
    handles.output = hObject;
    handles.data.newpar = 0;
    handles.data.x_exp = [];
    handles.data.y_exp = [];
    handles.data.show_exp_data = 0;
    axes(handles.axes_logo);
    image(imread('ifelogo.png'))
    box off
    axis off
    % Update handles structure
    guidata(hObject, handles);


    % --- Outputs from this function are returned to the command line.
function varargout = PC1D_for_Matlab_OutputFcn(hObject, eventdata, handles) 

        varargout{1} = handles.output;


    % --------------------------------------------------------------------
function menu_file_Callback(hObject, eventdata, handles)

    % --------------------------------------------------------------------
function menu_results_Callback(hObject, eventdata, handles)

    % --------------------------------------------------------------------
function menu_new_Callback(hObject, eventdata, handles)

        toolbar_new_ClickedCallback(hObject, eventdata, handles)

    % --------------------------------------------------------------------
function menu_open_Callback(hObject, eventdata, handles)

        toolbar_open_ClickedCallback(hObject, eventdata, handles)

    % --------------------------------------------------------------------
function menu_save_Callback(hObject, eventdata, handles)

    toolbar_save_ClickedCallback(hObject, eventdata, handles)

    % --------------------------------------------------------------------
function menu_save_as_Callback(hObject, eventdata, handles)

    toolbar_save_as_ClickedCallback(hObject, eventdata, handles)

    % --------------------------------------------------------------------
function menu_edit_in_pc1d_Callback(hObject, eventdata, handles)

    toolbar_edit_in_pc1d_ClickedCallback(hObject, eventdata, handles)

    % --------------------------------------------------------------------
function menu_load_results_Callback(hObject, eventdata, handles)
    toolbar_load_results_ClickedCallback(hObject, eventdata, handles)

    % --------------------------------------------------------------------
function menu_save_results_Callback(hObject, eventdata, handles)

    toolbar_save_results_ClickedCallback(hObject, eventdata, handles)
    % --------------------------------------------------------------------
function menu_save_parameters_Callback(hObject, eventdata, handles)

    toolbar_save_parameters_ClickedCallback(hObject, eventdata, handles)
    % --------------------------------------------------------------------
function menu_copy_to_clip_Callback(hObject, eventdata, handles)

    toolbar_copy_to_clip_ClickedCallback(hObject, eventdata, handles)

    % --------------------------------------------------------------------
function menu_gui_options_Callback(hObject, eventdata, handles)

    % --------------------------------------------------------------------
function menu_increase_font_Callback(hObject, eventdata, handles)

    toolbar_increase_font_ClickedCallback(hObject, eventdata, handles)

    % --------------------------------------------------------------------
function menu_decrease_font_Callback(hObject, eventdata, handles)

    toolbar_decrease_font_ClickedCallback(hObject, eventdata, handles)

    % --------------------------------------------------------------------
    function menu_change_color_Callback(hObject, eventdata, handles)

    toolbar_change_color_ClickedCallback(hObject, eventdata, handles)

    % --------------------------------------------------------------------
function menu_close_Callback(hObject, eventdata, handles)

    close all

    % --------------------------------------------------------------------
function toolbar_copy_to_figure_ClickedCallback(hObject, eventdata, handles)

    h = findobj(gcf,'type','axes');
    f1 = figure;
    copyobj(h(1),f1);


    % --------------------------------------------------------------------
function menu_copy_to_figure_Callback(hObject, eventdata, handles)

    toolbar_copy_to_figure_ClickedCallback(hObject, eventdata, handles)


    % --------------------------------------------------------------------
function toolbar_new_ClickedCallback(hObject, eventdata, handles)

    handles.data.newpar = 1;
    dos('convert_ascii_to_prm new.txt new.prm');
    toolbar_open_ClickedCallback(hObject, eventdata, handles)

    % --------------------------------------------------------------------
function toolbar_open_ClickedCallback(hObject, eventdata, handles)

    try

    global optimizestop
    optimizestop = false;    

    handles.data.leg2s = '';
    handles.data.results.Jsc = [];
    handles.data.results.Voc = [];
    handles.data.results.FF = [];
    handles.data.results.eta = [];
    handles.data.lastrun = [];

    handles.data.list_axis_spatial = {
    'Distance from Front'
    'Acceptor Doping Density'
    'Bulk Recombination Rate'
    'Charge Density'
    'Conduction band Edge'
    'Conductivity'
    'Cross-sectional area'
    'Cumulative Conductivity'
    'Cumulative Excess Conductivity'
    'Cumulative Photogeneration'
    'Cumulative Recombination'
    'Dielectric Constant'
    'Diffusion Length'
    'Donor Doping Density'
    'Electric Field'
    'Electron Current'
    'Electron Current Density'
    'Electron Density'
    'Electron Mobility'
    'Electron Quasi-Fermi Energy'
    'Electron Velocity'
    'Electrostatic Potential'
    'Energy Gap (electrical)'
    'Excess Charge Density'
    'Excess Conductivity'
    'Excess Electron Density'
    'Excess Electrostatic Potential'
    'Excess Hole Density'
    'Generation Rate'
    'Hole Current'
    'Hole Current Density'
    'Hole Density'
    'Hole Mobility'
    'Hole Quasi-Fermi Energy'
    'Hole Velocity'
    'Intrinsic Conc. (effective)'
    'Minority Carrier Lifetime'
    'Resistivity'
    'Total Current'
    'Total Current Density'
    'Vacuum Energy'
    'Valence Band Edge'};

    handles.data.list_axis_spatial_units = {
    'µm'
    'cm^{-3}'
    'cm^{-3}s^{-1}'
    'cm^{-3}'
    'eV'
    'S/cm'
    'cm^2'
    'S/cm'
    'S/cm'
    'cm^{-3}s^{-1}'
    'cm^{-3}s^{-1}'
    ''
    'cm'
    'cm^{-3}'
    'V/cm'
    'A'
    'A'
    'cm^{-3}'
    'cm^2/Vs'
    'eV'
    'cm/s'
    'V'
    'cm^{-3}'
    'cm^{-3}'
    'S/cm'
    'cm^{-3}'
    'V'
    'cm^{-3}'
    'cm^{-3}s^{-1}'
    'A'
    'A'
    'cm^{-3}'
    'cm^2/Vs'
    'eV'
    'cm/s'
    's'
    's'
    'ohm cm'
    'A'
    'A'
    'eV'
    'eV'};

    handles.data.list_axis_spatial_ind = [1 4 16 8 29 33 41 34 36 12 17 42 ...
        37 3 7 38 9 5 21 27 19 2 13 26 35 23 25 24 18 39 10 6 22 28 20 14 15 32 40 11 31 30];

    handles.data.list_axis_temporal = {
    'Elapsed Time'
    'Base Voltage'
    'Base Current'
    'Base Power'
    'Collector Current'
    'Collector Power'
    'Collector Voltage'};

    handles.data.list_axis_temporal_units = {
    's'
    'V'
    'A'
    'W'
    'A'
    'W'
    'V'};

    handles.data.list_axis_temporal_ind = [43 44 45 48 47 49 46];

    handles.data.list_axis_wavelength = {
    'Primary Source Wavelength'
    'External Quantum Efficiency'
    'Internal Quantum Efficiency'
    'Inverse IQE'
    'Pri-Surface Absorption Length'
    'Pri-Surface Escape'
    'Pri-Surface Reflectance'
    'Pri-Surface Refractive Index'};

    handles.data.list_axis_wavelength_units = {
    'nm'
    '%'
    '%'
    ''
    'cm'
    '%'
    '%'
    ''};


    handles.data.list_axis_wavelength_ind = [50 51 52 55 56 54 53 57];

    handles.data.list_axis_other = {
    'Convergence Error'
    'Electron Diff. Current Density'
    'Electron Drift Current Density'
    'Excess Electron Density Ratio'
    'Excess Hole Density Ratio'
    'Excess Normalized pn Product'
    'Excess pn Product Ratio'
    'Hole Diff. Current Density'
    'Hole Drift Current Density'
    'Shunt #1 Current'
    'Shunt #1 Voltage'
    'Shunt #2 Current'
    'Shunt #2 Voltage'
    'Shunt #3 Current'
    'Shunt #3 Voltage'
    'Shunt #4 Current'
    'Shunt #4 Voltage'};

    handles.data.list_axis_other_units = {
    ''
    'A'
    'A'
    ''
    ''
    ''
    ''
    'A'
    'A'
    'A'
    'V'
    'A'
    'V'
    'A'
    'V'
    'A'
    'V'};

    handles.data.list_axis_other_ind = [66 72 71 67 68 70 69 74 73 59 58 61 60 63 62 65 64];

    handles.data.list_secondary_parameters = {
        'General - Intensity before shading (0 for same as excitation)'
        'Rear local contacts - enable'
        'Rear local contacts - Metallization fraction'
        'Rear local contacts - Contact pitch (cm)'
        'Rear local contacts - SRV, metallized area (cm/s)'
        'Rear local contacts - SRV, passivated area (cm/s)'
        'Rear local contacts - Area specific contact resistance (ohm cm^2)'
        'Front contact grid  - Enable'
        'Front contact grid  - Finger spacing (cm)'
        'Front contact grid  - Finger width (cm)'
        'Front contact grid  - Finger length (cm)'
        'Front contact grid  - Finger thickness (cm)'    
        'Front contact grid  - Busbar width (cm)'
        'Front contact grid  - Busbar thickness (cm)'
        'Front contact grid  - Metal resistivity (ohm cm)'
        'Front contact grid  - Area specific contact resistance (ohm cm^2)'};

    try
        startpath = handles.data.path;
    catch
        startpath =  '';
    end
    if handles.data.newpar == 0
        try
            [file path] = uigetfile({'*.prm','All files'},'Select prm file',startpath);
        catch
            [file path] = uigetfile({'*.prm','All files'},'Select prm file');
        end
    else
        path = startpath;
        file = 'new.prm';
    end
    handles.data.newpar = 0;
    if file ~= 0
        handles.data.prm_file_name = file;
        handles.data.path = path;

        set(handles.txt_prm_file,'String',file)

    dos(['convert_prm_to_ascii ' handles.data.prm_file_name ' temp.txt']);   

        temp      = importdata('temp.txt');
        parvalues = cell(length(temp),1);
        for i = 1:length(temp)
            tempi = temp{i};
            parvalues{i} = tempi(strfind(tempi,'=')+1:end);
        end
        
        if length(parvalues) == 561
            fid = fopen('parnames.txt');
            pardata = textscan(fid,'%f%s%s%f','Delimiter','\t','MultipleDelimsAsOne',1);
            fclose(fid);
            parindex = pardata{1};
            parstrings = pardata{2};
            parnames = pardata{3};
            parvary = pardata{4};
            handles.data.parfix = 0;
        elseif length(parvalues) == 563
            fid = fopen('parnames563.txt');
            pardata = textscan(fid,'%f%s%s%f','Delimiter','\t','MultipleDelimsAsOne',1);
            fclose(fid);
            parindex = pardata{1};
            parstrings = pardata{2};
            parnames = pardata{3};        
            parvary = pardata{4};
            handles.data.parfix = 0;
        elseif length(parvalues) == 699
            fid = fopen('parnames699.txt');
            pardata = textscan(fid,'%f%s%s%f','Delimiter','\t','MultipleDelimsAsOne',1);
            fclose(fid);
            parindex = pardata{1};
            parstrings = pardata{2};
            parnames = pardata{3};        
            parvary = pardata{4};
            handles.data.parfix = 138;
        else
            msgbox('Sorry, but this prm file is not supported yet.')
            return
        end

        parindex_short = cellfun(@length,parnames);
        parindex_short = parindex_short>0;

        parfit = cell(length(parindex),1);
        parfit(:) = {false};

        [parnames_short,ind_sort,ind_sort_rev] = unique(parnames(parindex_short));
        parvalues_short = parvalues(parindex_short);
        parvalues_short = parvalues_short(ind_sort);
        parfit_short = parfit(parindex_short);
        parfit_short = parfit_short(ind_sort);
        parvary_short = parvary(parindex_short);
        parvary_short = parvary_short(ind_sort);

        parnames_short2 = parnames_short(logical(parvary_short));

        set(handles.popup_vary1a,'String',['Vary parameter';parnames_short2;'--------';handles.data.list_secondary_parameters]);
        set(handles.popup_vary1b,'String',['Vary parameter (linked)';parnames_short2;'--------';handles.data.list_secondary_parameters]);
        set(handles.popup_vary2a,'String',['Vary parameter 2';parnames_short2;'--------';handles.data.list_secondary_parameters]);
        set(handles.popup_vary2b,'String',['Vary parameter 2 (linked)';parnames_short2;'--------';handles.data.list_secondary_parameters]);
        set(handles.tab_all_par,'Data',[parnames_short parvalues_short parfit_short]);        
        parnames2 = handles.data.list_secondary_parameters;

        temp1 = str2num(parvalues{2});
        if isempty(temp1)      
            parvalues2 = {'0.1','0','0.04','0.1','100000','20','0.01','0','0.5','0.02','2.5','0.005','0.3','0.05','3e-6','0.005'}';
        else
           parvalues2 = cell(length(temp1),1);
           for i = 1:length(temp1)
               parvalues2{i} = num2str(temp1(i));
           end        
        end  
        try
            temp_par_2(1:2:31) = parvalues2';
            temp_par_2(2:2:30)   = {',',',',',',',',',',',',',',',',',',',',',',',',',',',',','};  
        catch
            parvalues2 = {'0.1','0','0.04','0.1','100000','20','0.01','0','0.5','0.02','2.5','0.005','0.3','0.05','3e-6','0.005'}';
            temp_par_2(1:2:31) = parvalues2';
            temp_par_2(2:2:30)   = {',',',',',',',',',',',',',',',',',',',',',',',',',',',',','};  
        end

        parfit2 = cell(length(parnames2),1);   
        parfit2(:) = {false};
        parvalues{2} = strcat(temp_par_2{:});    
        set(handles.tab_all_par2,'Data',[parnames2 parvalues2 parfit2]);    
        set(handles.tab_all_par,'Visible','On')
        set(handles.tab_all_par2,'Visible','On')
        set(handles.text18,'Visible','On')
        set(handles.text19,'Visible','On')

        handles.data.ind_sort           = ind_sort;
        handles.data.ind_sort_rev       = ind_sort_rev;
        handles.data.parstrings         = parstrings;
        handles.data.parindex           = parindex;
        handles.data.parindex_short     = parindex_short;
        handles.data.parnames           = parnames;    
        handles.data.parvalues          = parvalues;
        handles.data.parvalues2         = parvalues2;    
        handles.data.parnames2          = parnames2;
        handles.data.parfit             = parfit;
        handles.data.parfit2            = parfit2;
        handles.data.parvary            = parvary;
        handles.data.parnames_short     = parnames_short; 
        handles.data.parnames_short2    = parnames_short2; 
        handles.data.parfit_short       = parfit_short;
        handles.data.parvary_short      = parvary_short;

        if strcmp(handles.data.parvalues{300+handles.data.parfix},'scan-qe.exc') == 0
            handles.data.parvalues_backup   = parvalues;
        else
            handles.data.parvalues_backup   = [];
        end        

        write_to_prm(handles.data.parstrings,handles.data.parvalues);

        if length(handles.data.parstrings) == 561
            if str2num(handles.data.parvalues{313}) < 2
                set(handles.popup_select_x,'Value',1)        
            elseif str2num(handles.data.parvalues{313}) < 44
                set(handles.popup_select_x,'String',['xdata';handles.data.list_axis_spatial])
                set(handles.popup_select_x,'Value',find(handles.data.list_axis_spatial_ind == str2num(handles.data.parvalues{313})-1)+1)
                set(handles.radio_btn_spatial,'Value',1)
                handles.data.axis_type = 1;
            elseif str2num(handles.data.parvalues{313}) > 43 && str2num(handles.data.parvalues{313}) < 51
                set(handles.popup_select_x,'String',['xdata';handles.data.list_axis_temporal])
                set(handles.popup_select_x,'Value',find(handles.data.list_axis_temporal_ind == str2num(handles.data.parvalues{313})-1)+1)
                set(handles.radio_btn_temporal,'Value',1)
                handles.data.axis_type = 2;
            elseif str2num(handles.data.parvalues{313}) > 50 && str2num(handles.data.parvalues{313}) < 59
                set(handles.popup_select_x,'String',['xdata';handles.data.list_axis_wavelength])
                set(handles.popup_select_x,'Value',find(handles.data.list_axis_wavelength_ind == str2num(handles.data.parvalues{313})-1)+1)
                set(handles.radio_btn_wavelength,'Value',1)
                handles.data.axis_type = 3;
            elseif str2num(handles.data.parvalues{313}) > 58
                set(handles.popup_select_x,'String',['xdata';handles.data.list_axis_other])
                set(handles.popup_select_x,'Value',find(handles.data.list_axis_other_ind == str2num(handles.data.parvalues{313})-1)+1)
                set(handles.radio_btn_spatial,'Value',4)
                handles.data.axis_type = 4;
            end
            if str2num(handles.data.parvalues{316}) < 2
                set(handles.popup_select_y1,'Value',1)        
            elseif str2num(handles.data.parvalues{316}) < 44
                set(handles.popup_select_y1,'String',['ydata 1';handles.data.list_axis_spatial])
                set(handles.popup_select_y1,'Value',find(handles.data.list_axis_spatial_ind == str2num(handles.data.parvalues{316})-1)+1)
            elseif str2num(handles.data.parvalues{316}) > 43 && str2num(handles.data.parvalues{316}) < 51
                set(handles.popup_select_y1,'String',['ydata 1';handles.data.list_axis_temporal])
                set(handles.popup_select_y1,'Value',find(handles.data.list_axis_temporal_ind == str2num(handles.data.parvalues{316})-1)+1)
            elseif str2num(handles.data.parvalues{316}) > 50 && str2num(handles.data.parvalues{316}) < 59
                set(handles.popup_select_y1,'String',['ydata 1';handles.data.list_axis_wavelength])
                set(handles.popup_select_y1,'Value',find(handles.data.list_axis_wavelength_ind == str2num(handles.data.parvalues{316})-1)+1)
            elseif str2num(handles.data.parvalues{316}) > 58
                set(handles.popup_select_y1,'String',['ydata 1';handles.data.list_axis_other])
                set(handles.popup_select_y1,'Value',find(handles.data.list_axis_other_ind == str2num(handles.data.parvalues{316})-1)+1)
            end
            if str2num(handles.data.parvalues{318}) < 2
                set(handles.popup_select_y2,'Value',1)        
            elseif str2num(handles.data.parvalues{318}) < 44
                set(handles.popup_select_y2,'String',['ydata 2';handles.data.list_axis_spatial])
                set(handles.popup_select_y2,'Value',find(handles.data.list_axis_spatial_ind == str2num(handles.data.parvalues{318})-1)+1)
            elseif str2num(handles.data.parvalues{318}) > 43 && str2num(handles.data.parvalues{318}) < 51
                set(handles.popup_select_y2,'String',['ydata 2';handles.data.list_axis_temporal])
                set(handles.popup_select_y2,'Value',find(handles.data.list_axis_temporal_ind == str2num(handles.data.parvalues{318})-1)+1)
            elseif str2num(handles.data.parvalues{318}) > 50 && str2num(handles.data.parvalues{318}) < 59
                set(handles.popup_select_y2,'String',['ydata 2';handles.data.list_axis_wavelength])
                set(handles.popup_select_y2,'Value',find(handles.data.list_axis_wavelength_ind == str2num(handles.data.parvalues{318})-1)+1)
            elseif str2num(handles.data.parvalues{318}) > 58
                set(handles.popup_select_y2,'String',['ydata 2';handles.data.list_axis_other])
                set(handles.popup_select_y2,'Value',find(handles.data.list_axis_other_ind == str2num(handles.data.parvalues{318})-1)+1)
                end
            if str2num(handles.data.parvalues{320}) < 2
                set(handles.popup_select_y3,'Value',1)        
            elseif str2num(handles.data.parvalues{320}) < 44
                set(handles.popup_select_y3,'String',['ydata 3';handles.data.list_axis_spatial])
                set(handles.popup_select_y3,'Value',find(handles.data.list_axis_spatial_ind == str2num(handles.data.parvalues{320})-1)+1)
            elseif str2num(handles.data.parvalues{320}) > 43 && str2num(handles.data.parvalues{320}) < 51
                set(handles.popup_select_y3,'String',['ydata 3';handles.data.list_axis_temporal])
                set(handles.popup_select_y3,'Value',find(handles.data.list_axis_temporal_ind == str2num(handles.data.parvalues{320})-1)+1)
            elseif str2num(handles.data.parvalues{320}) > 50 && str2num(handles.data.parvalues{320}) < 59
                set(handles.popup_select_y3,'String',['ydata 3';handles.data.list_axis_wavelength])
                set(handles.popup_select_y3,'Value',find(handles.data.list_axis_wavelength_ind == str2num(handles.data.parvalues{320})-1)+1)
            elseif str2num(handles.data.parvalues{320}) > 58
                set(handles.popup_select_y3,'String',['ydata 3';handles.data.list_axis_other])
                set(handles.popup_select_y3,'Value',find(handles.data.list_axis_other_ind == str2num(handles.data.parvalues{320})-1)+1)
                end
            if str2num(handles.data.parvalues{322}) < 2
                set(handles.popup_select_y4,'Value',1)        
            elseif str2num(handles.data.parvalues{322}) < 44
                set(handles.popup_select_y4,'String',['ydata 4';handles.data.list_axis_spatial])
                set(handles.popup_select_y4,'Value',find(handles.data.list_axis_spatial_ind == str2num(handles.data.parvalues{322})-1)+1)
            elseif str2num(handles.data.parvalues{322}) > 43 && str2num(handles.data.parvalues{322}) < 51
                set(handles.popup_select_y4,'String',['ydata 4';handles.data.list_axis_temporal])
                set(handles.popup_select_y4,'Value',find(handles.data.list_axis_temporal_ind == str2num(handles.data.parvalues{322})-1)+1)
            elseif str2num(handles.data.parvalues{322}) > 50 && str2num(handles.data.parvalues{322}) < 59
                set(handles.popup_select_y4,'String',['ydata 4';handles.data.list_axis_wavelength])
                set(handles.popup_select_y4,'Value',find(handles.data.list_axis_wavelength_ind == str2num(handles.data.parvalues{322})-1)+1)
            elseif str2num(handles.data.parvalues{322}) > 58
                set(handles.popup_select_y4,'String',['ydata 4';handles.data.list_axis_other])
                set(handles.popup_select_y4,'Value',find(handles.data.list_axis_other_ind == str2num(handles.data.parvalues{322})-1)+1)
            end

            set(handles.text_show_aux,'String','')
            set(handles.text_value_aux,'String','')
            set(handles.radio_data_type,'Visible','on')

        elseif length(handles.data.parstrings) == 699
            if str2num(handles.data.parvalues{451}) < 2
                set(handles.popup_select_x,'Value',1)        
            elseif str2num(handles.data.parvalues{451}) < 44
                set(handles.popup_select_x,'String',['xdata';handles.data.list_axis_spatial])
                set(handles.popup_select_x,'Value',find(handles.data.list_axis_spatial_ind == str2num(handles.data.parvalues{451})-1)+1)
                set(handles.radio_btn_spatial,'Value',1)
                handles.data.axis_type = 1;
            elseif str2num(handles.data.parvalues{451}) > 43 && str2num(handles.data.parvalues{451}) < 51
                set(handles.popup_select_x,'String',['xdata';handles.data.list_axis_temporal])
                set(handles.popup_select_x,'Value',find(handles.data.list_axis_temporal_ind == str2num(handles.data.parvalues{451})-1)+1)
                set(handles.radio_btn_temporal,'Value',1)
                handles.data.axis_type = 2;
            elseif str2num(handles.data.parvalues{451}) > 50 && str2num(handles.data.parvalues{451}) < 59
                set(handles.popup_select_x,'String',['xdata';handles.data.list_axis_wavelength])
                set(handles.popup_select_x,'Value',find(handles.data.list_axis_wavelength_ind == str2num(handles.data.parvalues{451})-1)+1)
                set(handles.radio_btn_wavelength,'Value',1)
                handles.data.axis_type = 3;
            elseif str2num(handles.data.parvalues{451}) > 58
                set(handles.popup_select_x,'String',['xdata';handles.data.list_axis_other])
                set(handles.popup_select_x,'Value',find(handles.data.list_axis_other_ind == str2num(handles.data.parvalues{451})-1)+1)
                set(handles.radio_btn_spatial,'Value',4)
                handles.data.axis_type = 4;
            end
            if str2num(handles.data.parvalues{454}) < 2
                set(handles.popup_select_y1,'Value',1)        
            elseif str2num(handles.data.parvalues{454}) < 44
                set(handles.popup_select_y1,'String',['ydata 1';handles.data.list_axis_spatial])
                set(handles.popup_select_y1,'Value',find(handles.data.list_axis_spatial_ind == str2num(handles.data.parvalues{454})-1)+1)
            elseif str2num(handles.data.parvalues{454}) > 43 && str2num(handles.data.parvalues{454}) < 51
                set(handles.popup_select_y1,'String',['ydata 1';handles.data.list_axis_temporal])
                set(handles.popup_select_y1,'Value',find(handles.data.list_axis_temporal_ind == str2num(handles.data.parvalues{454})-1)+1)
            elseif str2num(handles.data.parvalues{454}) > 50 && str2num(handles.data.parvalues{454}) < 59
                set(handles.popup_select_y1,'String',['ydata 1';handles.data.list_axis_wavelength])
                set(handles.popup_select_y1,'Value',find(handles.data.list_axis_wavelength_ind == str2num(handles.data.parvalues{454})-1)+1)
            elseif str2num(handles.data.parvalues{454}) > 58
                set(handles.popup_select_y1,'String',['ydata 1';handles.data.list_axis_other])
                set(handles.popup_select_y1,'Value',find(handles.data.list_axis_other_ind == str2num(handles.data.parvalues{454})-1)+1)
            end
            if str2num(handles.data.parvalues{456}) < 2
                set(handles.popup_select_y2,'Value',1)        
            elseif str2num(handles.data.parvalues{456}) < 44
                set(handles.popup_select_y2,'String',['ydata 2';handles.data.list_axis_spatial])
                set(handles.popup_select_y2,'Value',find(handles.data.list_axis_spatial_ind == str2num(handles.data.parvalues{456})-1)+1)
            elseif str2num(handles.data.parvalues{456}) > 43 && str2num(handles.data.parvalues{456}) < 51
                set(handles.popup_select_y2,'String',['ydata 2';handles.data.list_axis_temporal])
                set(handles.popup_select_y2,'Value',find(handles.data.list_axis_temporal_ind == str2num(handles.data.parvalues{456})-1)+1)
            elseif str2num(handles.data.parvalues{456}) > 50 && str2num(handles.data.parvalues{456}) < 59
                set(handles.popup_select_y2,'String',['ydata 2';handles.data.list_axis_wavelength])
                set(handles.popup_select_y2,'Value',find(handles.data.list_axis_wavelength_ind == str2num(handles.data.parvalues{456})-1)+1)
            elseif str2num(handles.data.parvalues{456}) > 58
                set(handles.popup_select_y2,'String',['ydata 2';handles.data.list_axis_other])
                set(handles.popup_select_y2,'Value',find(handles.data.list_axis_other_ind == str2num(handles.data.parvalues{456})-1)+1)
                end
            if str2num(handles.data.parvalues{458}) < 2
                set(handles.popup_select_y3,'Value',1)        
            elseif str2num(handles.data.parvalues{458}) < 44
                set(handles.popup_select_y3,'String',['ydata 3';handles.data.list_axis_spatial])
                set(handles.popup_select_y3,'Value',find(handles.data.list_axis_spatial_ind == str2num(handles.data.parvalues{458})-1)+1)
            elseif str2num(handles.data.parvalues{458}) > 43 && str2num(handles.data.parvalues{458}) < 51
                set(handles.popup_select_y3,'String',['ydata 3';handles.data.list_axis_temporal])
                set(handles.popup_select_y3,'Value',find(handles.data.list_axis_temporal_ind == str2num(handles.data.parvalues{458})-1)+1)
            elseif str2num(handles.data.parvalues{458}) > 50 && str2num(handles.data.parvalues{458}) < 59
                set(handles.popup_select_y3,'String',['ydata 3';handles.data.list_axis_wavelength])
                set(handles.popup_select_y3,'Value',find(handles.data.list_axis_wavelength_ind == str2num(handles.data.parvalues{458})-1)+1)
            elseif str2num(handles.data.parvalues{458}) > 58
                set(handles.popup_select_y3,'String',['ydata 3';handles.data.list_axis_other])
                set(handles.popup_select_y3,'Value',find(handles.data.list_axis_other_ind == str2num(handles.data.parvalues{458})-1)+1)
                end
            if str2num(handles.data.parvalues{460}) < 2
                set(handles.popup_select_y4,'Value',1)        
            elseif str2num(handles.data.parvalues{460}) < 44
                set(handles.popup_select_y4,'String',['ydata 4';handles.data.list_axis_spatial])
                set(handles.popup_select_y4,'Value',find(handles.data.list_axis_spatial_ind == str2num(handles.data.parvalues{460})-1)+1)
            elseif str2num(handles.data.parvalues{460}) > 43 && str2num(handles.data.parvalues{460}) < 51
                set(handles.popup_select_y4,'String',['ydata 4';handles.data.list_axis_temporal])
                set(handles.popup_select_y4,'Value',find(handles.data.list_axis_temporal_ind == str2num(handles.data.parvalues{460})-1)+1)
            elseif str2num(handles.data.parvalues{460}) > 50 && str2num(handles.data.parvalues{460}) < 59
                set(handles.popup_select_y4,'String',['ydata 4';handles.data.list_axis_wavelength])
                set(handles.popup_select_y4,'Value',find(handles.data.list_axis_wavelength_ind == str2num(handles.data.parvalues{460})-1)+1)
            elseif str2num(handles.data.parvalues{460}) > 58
                set(handles.popup_select_y4,'String',['ydata 4';handles.data.list_axis_other])
                set(handles.popup_select_y4,'Value',find(handles.data.list_axis_other_ind == str2num(handles.data.parvalues{460})-1)+1)
            end

            set(handles.text_show_aux,'String','')
            set(handles.text_value_aux,'String','')
            set(handles.radio_data_type,'Visible','on')    

        elseif length(handles.data.parstrings) == 563
                set(handles.popup_select_x,'Value',1)        
                set(handles.popup_select_x,'String','Elapsed Time')
                set(handles.popup_select_y1,'Value',find(handles.data.list_axis_spatial_ind == 12)+1)  
                set(handles.popup_select_y1,'String',['ydata 1';handles.data.list_axis_spatial])            
                set(handles.popup_select_y2,'Value',find(handles.data.list_axis_spatial_ind == 36)+1)  
                set(handles.popup_select_y2,'String',['ydata 2';handles.data.list_axis_spatial])            
                set(handles.popup_select_y3,'Value',1)  
                set(handles.popup_select_y3,'String',['ydata 3';handles.data.list_axis_spatial])            
                set(handles.popup_select_y4,'Value',1)  
                set(handles.popup_select_y4,'String',['ydata 4';handles.data.list_axis_spatial])
                set(handles.radio_btn_temporal,'Value',1)
                set(handles.radio_data_type,'Visible','off')
                handles.data.axis_type = 5;
                set(handles.text_show_aux,'String','Auxilliary data')
                set(handles.text_value_aux,'String',['Values are read out at ' num2str(parvalues{317}) ' cm'])
        end
    handles.data.xscale = 'linear';
    handles.data.yscale = 'linear';
    handles.data.xscale_results = 'linear';
    handles.data.yscale_results = 'linear';
    handles.data.Rs_em = [];
    handles.data.xj = [];
    handles.data.external_run = 0;
    handles.data.cell_par_strings = {'Choose parameter','Short circuit current','Open circuit voltage', ...
        'Fill Factor','Efficiency','Emitter sheet resistance','Emitter junction depth','Effective carrier lifetime','Injection level', ...
        'Generation rate','Sinton optical constant','Generalized lifetime at 1e15 cm-3','Integrated weighted reflectance (%)'};

    set(handles.popup_cell_par_x,'String',{'Choose parameter'})
    set(handles.popup_opt_value,'String',{'Choose parameter','Short circuit current','Open circuit voltage', ...
        'Fill Factor','Efficiency'});

    set(handles.check_abs_x,'Value',0)
    set(handles.check_abs_y,'Value',0)
    set(handles.radio_xscale_lin,'Value',1)
    set(handles.radio_yscale_lin,'Value',1)
    set(handles.radio_xscale_results_lin,'Value',1)
    set(handles.radio_yscale_results_lin,'Value',1)
    set(handles.popup_cell_par_x,'Value',1)
    set(handles.popup_cell_par_y,'Value',1)
    set(handles.popup_cell_par_z,'Value',1)
    set(handles.popup_plot_select_vary2,'Value',1)
    set(handles.popup_plot_select_vary2,'Visible','off')
    set(handles.listbox_ydata_selection,'Value',1)
    set(handles.listbox_ydata_selection,'String','')
    set(handles.listbox_xdata_selection,'Value',1)
    set(handles.listbox_xdata_selection,'String','')

        guidata(hObject, handles);
        btn_update_Callback(hObject, eventdata, handles);
        handles=guidata(handles.output);
        btn_update2_Callback(hObject, eventdata, handles);
    end

    catch ME
        errordlg(['Error detected when executing "load prm-file": ' ME.message],'Error')    
        error(ME.message)
    end

    % --- Executes on button press in btn_update.
function btn_update_Callback(hObject, eventdata, handles)

    try

    tab_data = get(handles.tab_all_par,'Data');
    parvalues_sort = tab_data(:,2);
    parfit_sort = tab_data(:,3);
    for i = 1:length(parvalues_sort)
        startbrackets = strfind(parvalues_sort{i},'<');
        endbrackets   = strfind(parvalues_sort{i},'>');
        if length(endbrackets) == 2
            parvalues_sort{i}(startbrackets(1):endbrackets(2)) = [];
        end
    end
    parvalues_sort_rev = parvalues_sort(handles.data.ind_sort_rev);
    parfit_sort_rev = parfit_sort(handles.data.ind_sort_rev);
    handles.data.parvalues(logical(handles.data.parindex_short)) = parvalues_sort_rev;
    handles.data.parfit(logical(handles.data.parindex_short)) = parfit_sort_rev;
    handles.data.parfit_sort = parfit_sort;

    if strcmp(handles.data.parvalues{300+handles.data.parfix},'scan-qe.exc') == 1 

            handles.data.parvalues{4} = '3';
            handles.data.parvalues{5} = '90';
            handles.data.parvalues{6} = '90';
            handles.data.parvalues{241+handles.data.parfix} = '0';
            handles.data.parvalues{243+handles.data.parfix} = '1';
            handles.data.parvalues{245+handles.data.parfix} = '300';
            handles.data.parvalues{248+handles.data.parfix} = '0.001';
            handles.data.parvalues{249+handles.data.parfix} = '0.001';
            handles.data.parvalues{250+handles.data.parfix} = '0.001';
    %         handles.data.parvalues{251+handles.data.parfix} = '';
            handles.data.parvalues{279+handles.data.parfix} = '0';
            handles.data.parvalues{280+handles.data.parfix} = '0';
            handles.data.parvalues{281+handles.data.parfix} = '0';
            handles.data.parvalues{283+handles.data.parfix} = '1';
            handles.data.parvalues{284+handles.data.parfix} = '0';
            handles.data.parvalues{285+handles.data.parfix} = '0';
            handles.data.parvalues{286+handles.data.parfix} = '0';
            handles.data.parvalues{300+handles.data.parfix} = 'scan-qe.exc';
            handles.data.parvalues{303+handles.data.parfix} = '90';
            handles.data.parvalues{307+handles.data.parfix} = 'scan-qe.exc';
            handles.data.parvalues{308+handles.data.parfix} = '300';
            handles.data.parvalues{309+handles.data.parfix} = '0';

    end

    ind = cellfun(@isempty,handles.data.parvalues);
    handles.data.parvalues(ind) = {''};

    write_to_prm(handles.data.parstrings,handles.data.parvalues)

    handles.data.leg2s = '';
    guidata(hObject, handles);

    em_enable = max(str2num(handles.data.parvalues{164}),str2num(handles.data.parvalues{196}));    
    if em_enable == 1;
        btn_calc_results_Callback(hObject, eventdata, handles)
        handles=guidata(handles.output);
    end

    handles.data.leg2s = '';
    guidata(hObject, handles);

    handles=guidata(handles.output);
    btn_update_colors_Callback(hObject, eventdata, handles)

    if get(handles.check_autorun,'Value') == 1
        btn_run_Callback(hObject, eventdata, handles)
        handles=guidata(handles.output);
        btn_plot_Callback(hObject, eventdata, handles)
    end

    catch ME
        errordlg(['Error detected when executing "update values": ' ME.message],'Error')   
        error(ME.message)
    end

    % --- Executes on button press in btn_run.
    function btn_run_Callback(hObject, eventdata, handles)

    try

    results = [];
    results.Jsc = [];
    results.Voc = [];
    results.FF  = [];
    results.eta = [];
    try
        pc1ddata_prev = handles.data.results.pc1ddata{1};
        pc1dheaders_prev = handles.data.results.pc1dheaders;
    catch
        pc1ddata_prev = [NaN NaN;NaN NaN];
        pc1dheaders_prev = [NaN;NaN];
    end
    results.pc1ddata = cell(1);
    results.pc1dheaders = cell(1);
    tau_eff = [];
    delta_n_int = [];
    G = [];
    OC = [];
    tau15 = [];
    R_tot = [];

    if handles.data.external_run == 0
        hw = waitbar(0,'Calculating...');
    end

    % tic
        em_enable = max(str2num(handles.data.parvalues{164}),str2num(handles.data.parvalues{196}));    
        if em_enable == 1;
            btn_calc_results_Callback(hObject, eventdata, handles)
            handles=guidata(handles.output);
        end

        btn_update_parvalues2_Callback(hObject, eventdata, handles)
        handles=guidata(handles.output);

        ind = cellfun(@isempty,handles.data.parvalues);
        handles.data.parvalues(ind) = {''};


        if length(handles.data.parstrings) == 561 || length(handles.data.parstrings) == 699
            write_to_prm(handles.data.parstrings,handles.data.parvalues)
            try
                [~,b] = dos(['cmd-pc1d.exe ' 'temp.prm']);
                pc1ddata = textscan(b,'%f%f%f%f%f%f%f%f%f%f%f%f%f','Headerlines',1); 
                pc1ddata = [pc1ddata{:}];
                data1 = pc1ddata(1,:);
                empt2 = not(isfinite(data1));
                pc1ddata(:,empt2) = [];
                coloumns = length(pc1ddata(1,:));
                firstline = textscan(b,'%s',coloumns,'Delimiter','\t');
                pc1dheaders = firstline{1};     
            catch
                pc1ddata = NaN.*pc1ddata_prev;
                pc1dheaders = pc1dheaders_prev;            
                errordlg('An error occurred while running PC1D')
            end

            if length(pc1ddata(:,1)) < 4
                pc1ddata = NaN.*pc1ddata_prev;
                pc1dheaders = pc1dheaders_prev;
               errordlg('An error occurred while running PC1D')
            end

        elseif length(handles.data.parstrings) == 563

            pc1ddata = [];
            pc1dheaders = [];

            if get(handles.popup_select_y1,'Value') > 1
                temp = get(handles.popup_select_y1,'Value')-1;
                handles.data.parvalues{318} = num2str(handles.data.list_axis_spatial_ind(temp)+1);
                write_to_prm(handles.data.parstrings,handles.data.parvalues)
                [~,b] = dos(['cmd-pc1d.exe ' 'temp.prm']);
                pc1ddata_temp = textscan(b,'%f%f%f%f%f%f%f%f%f%f%f%f%f','Headerlines',1);
                pc1ddata_temp = [pc1ddata_temp{:}];
                data1 = pc1ddata_temp(1,:);
                empt2 = not(isfinite(data1));
                pc1ddata_temp(:,empt2) = [];
                coloumns = length(pc1ddata_temp(1,:));
                firstline = textscan(b,'%s',coloumns,'Delimiter','\t');
                pc1dheaders_temp = firstline{1};
                pc1ddata(:,1) = pc1ddata_temp(:,1);
                pc1ddata = [pc1ddata pc1ddata_temp(:,2)];
                pc1dheaders{1} = pc1dheaders_temp{1};
                pc1dheaders = [pc1dheaders pc1dheaders_temp{2}];
            end
            if get(handles.popup_select_y2,'Value') > 1
                temp = get(handles.popup_select_y2,'Value')-1;
                handles.data.parvalues{318} = num2str(handles.data.list_axis_spatial_ind(temp)+1);
                write_to_prm(handles.data.parstrings,handles.data.parvalues)
                [~,b] = dos(['cmd-pc1d.exe ' 'temp.prm']);
                pc1ddata_temp = textscan(b,'%f%f%f%f%f%f%f%f%f%f%f%f%f','Headerlines',1);
                pc1ddata_temp = [pc1ddata_temp{:}];
                data1 = pc1ddata_temp(1,:);
                empt2 = not(isfinite(data1));
                pc1ddata_temp(:,empt2) = [];
                coloumns = length(pc1ddata_temp(1,:));
                firstline = textscan(b,'%s',coloumns,'Delimiter','\t');
                pc1dheaders_temp = firstline{1};
                pc1ddata(:,1) = pc1ddata_temp(:,1);
                pc1ddata = [pc1ddata pc1ddata_temp(:,2)];
                pc1dheaders{1} = pc1dheaders_temp{1};
                pc1dheaders = [pc1dheaders pc1dheaders_temp{2}];
            end
            if get(handles.popup_select_y3,'Value') > 1
                temp = get(handles.popup_select_y3,'Value')-1;
                handles.data.parvalues{318} = num2str(handles.data.list_axis_spatial_ind(temp)+1);
                write_to_prm(handles.data.parstrings,handles.data.parvalues)
                [~,b] = dos(['cmd-pc1d.exe ' 'temp.prm']);
                pc1ddata_temp = textscan(b,'%f%f%f%f%f%f%f%f%f%f%f%f%f','Headerlines',1);
                pc1ddata_temp = [pc1ddata_temp{:}];
                data1 = pc1ddata_temp(1,:);
                empt2 = not(isfinite(data1));
                pc1ddata_temp(:,empt2) = [];
                coloumns = length(pc1ddata_temp(1,:));
                firstline = textscan(b,'%s',coloumns,'Delimiter','\t');
                pc1dheaders_temp = firstline{1};
                pc1ddata(:,1) = pc1ddata_temp(:,1);
                pc1ddata = [pc1ddata pc1ddata_temp(:,2)];
                pc1dheaders{1} = pc1dheaders_temp{1};
                pc1dheaders = [pc1dheaders pc1dheaders_temp{2}];
            end
            if get(handles.popup_select_y4,'Value') > 1
                temp = get(handles.popup_select_y4,'Value')-1;
                handles.data.parvalues{318} = num2str(handles.data.list_axis_spatial_ind(temp)+1);
                write_to_prm(handles.data.parstrings,handles.data.parvalues)
                [~,b] = dos(['cmd-pc1d.exe ' 'temp.prm']);
                pc1ddata_temp = textscan(b,'%f%f%f%f%f%f%f%f%f%f%f%f%f','Headerlines',1);
                pc1ddata_temp = [pc1ddata_temp{:}];
                data1 = pc1ddata_temp(1,:);
                empt2 = not(isfinite(data1));
                pc1ddata_temp(:,empt2) = [];
                coloumns = length(pc1ddata_temp(1,:));
                firstline = textscan(b,'%s',coloumns,'Delimiter','\t');
                pc1dheaders_temp = firstline{1};
                pc1ddata(:,1) = pc1ddata_temp(:,1);
                pc1ddata = [pc1ddata pc1ddata_temp(:,2)];
                pc1dheaders{1} = pc1dheaders_temp{1};
                pc1dheaders = [pc1dheaders pc1dheaders_temp{2}];
            end

        end
    if handles.data.external_run == 0
        waitbar(1/4,hw);
    end

     if ~isempty(get(handles.edit_remove_points,'String'));
        N_remove_points = str2num(get(handles.edit_remove_points,'String'));
     else
        N_remove_points = 0;
     end
     pc1ddata(1:N_remove_points,:) = []; 

    pc1ddata(:,strcmp(pc1dheaders,'Distance from Front')) = 1e6*pc1ddata(:,strcmp(pc1dheaders,'Distance from Front'));


     if sum(strcmp(pc1dheaders,'Base Voltage')) > 0 && sum(strcmp(pc1dheaders,'Base Current')) > 0


         if isnan(pc1ddata(1,1))

             Jsc = NaN;
             Voc = NaN;
             FF  = NaN;
             eta = NaN;

         else     
             handles.data.IVdata_selected = 1;

             V = pc1ddata(:,strcmp(pc1dheaders,'Base Voltage'));
             I = pc1ddata(:,strcmp(pc1dheaders,'Base Current'));
             V = V(:,1);
             I = I(:,1);
             A = str2num(handles.data.parvalues{212+handles.data.parfix});
             J = I/A;
             Int = str2num(handles.data.parvalues2{1});
             if Int == 0
                 Int = str2num(handles.data.parvalues{249+handles.data.parfix});
             end
             P = I.*V;
             Pd = J.*V;

            [J_short ind] = unique(J);
            V_short = V(ind);
            [V_short2 ind] = unique(V);
            J_short2 = J(ind);

            if handles.data.external_run == 0
                waitbar(3/4,hw);
            end

            Jsc             = -1000*interp1(V_short2,J_short2,0);
            Voc             = interp1(J_short,V_short,0);
            Pmp             = -min(P);
            Pdmp            = -min(Pd);
            Vmp             = mean(V(P == min(P)));
            Imp             = mean(I(P == min(P)));
            Jmp             = mean(J(P == min(P)));
            FF              = 100*mean((Vmp*Jmp) / (Voc*(-Jsc/1000)));
            eta             = 100*Pdmp/Int; 

         end

        results.Jsc     = Jsc;
        results.Voc     = Voc;
        results.FF      = FF;
        results.eta     = eta;

        pc1ddata    = [pc1ddata -1000*J -Pd];
        pc1dheaders = [pc1dheaders;'<html><font color="blue">Current density (mA/cm^2)';'<html><font color="blue">Power density (mW/cm^2)'];

     else
         handles.data.IVdata_selected = 0;
     end

      if sum(strcmp(pc1dheaders,'Distance from Front')) > 0 && sum(strcmp(pc1dheaders,'Cumulative Photogeneration')) > 0  && sum(strcmp(pc1dheaders,'Excess Electron Density')) > 0 
         if str2num(handles.data.parvalues{164}) == 0        % Check if no emitter 
             if str2num(handles.data.parvalues{302+handles.data.parfix}) == 1        % Check if steady state
                 x = pc1ddata(:,strcmp(pc1dheaders,'Distance from Front'));
                 x = x*1e-4;
                 G = pc1ddata(:,strcmp(pc1dheaders,'Cumulative Photogeneration'));
                 G = G(end)/x(end);
                 delta_n = pc1ddata(:,strcmp(pc1dheaders,'Excess Electron Density'));
                 delta_n_int = trapz(x(10:end-10),delta_n(10:end-10))/x(end);
                 tau_eff = 1e6*delta_n_int/G;
             end
         end
      end

      if sum(strcmp(pc1dheaders,'Cumulative Photogeneration')) > 0
         if str2num(handles.data.parvalues{302+handles.data.parfix}) == 1        % Check if steady state
            I_oc = str2num(handles.data.parvalues{248+handles.data.parfix});
            G_oc = pc1ddata(:,strcmp(pc1dheaders,'Cumulative Photogeneration'));
            G_oc = G_oc(end);
            OC = 2.7551e-19*G_oc/I_oc;
         end
      end

      if sum(strcmp(pc1dheaders,'Elapsed Time')) > 0 && sum(strcmp(pc1dheaders,'Cumulative Photogeneration')) > 0  && sum(strcmp(pc1dheaders,'Cumulative Excess Conductivity')) > 0 
         if length(handles.data.parvalues) == 563
             W = str2num(handles.data.parvalues{194});
             t = pc1ddata(:,strcmp(pc1dheaders,'Elapsed Time'));
             G_at_x = pc1ddata(:,strcmp(pc1dheaders,'Cumulative Photogeneration'))/W;         
             sigma_at_x = pc1ddata(:,strcmp(pc1dheaders,'Cumulative Excess Conductivity'))/W;
             T = str2num(handles.data.parvalues{308+handles.data.parfix});
             q = 1.602e-19;
             if str2num(handles.data.parvalues{200}) == 0
                 Nd = str2num(handles.data.parvalues{199});
                 Na = 0;
             elseif str2num(handles.data.parvalues{200}) == 1
                 Nd = 0;
                 Na = str2num(handles.data.parvalues{199});
             end
             mobility_results = mobility(Na,Nd,T);   
             Dn = sigma_at_x/(q*(mobility_results.mu_n + mobility_results.mu_p));
             dDndt = diff(Dn)./diff(t);
             dDndt(dDndt == 0) = NaN;
             dDndt = [dDndt;dDndt(end)];
             tau_QSS = 1e6*Dn./G_at_x;
             tau_tr = 1e6*Dn./(-dDndt);
             tau_gen = 1e6*Dn./(G_at_x - dDndt);
             tau15 = tau_gen(abs(Dn-1e15) == min(abs(Dn-1e15)));
             pc1ddata = [pc1ddata Dn tau_QSS tau_tr tau_gen];
             pc1dheaders = [pc1dheaders '<html><font color="blue">Excess minority carrier density',...
                 '<html><font color="blue">QSS Lifetime (µs)','<html><font color="blue">Transient Lifetime (µs)',...
                 '<html><font color="blue">Generalized Lifetime (µs)'];
         end
      end

      if sum(strcmp(pc1dheaders,'Primary Source Wavelength')) > 0
          lambda = pc1ddata(:,strcmp(pc1dheaders,'Primary Source Wavelength'));   
          spectrumfile = 'AM15G_NREL_spectral_density.spc';
          spectrumdata = importdata(spectrumfile);
          spectrum_power = interp1(spectrumdata(:,1),spectrumdata(:,2),lambda);
          spectrum = spectrum_power.*lambda/1240;
          spectrum = 100.*spectrum/max(spectrum);
          pc1ddata = [pc1ddata spectrum];
          pc1dheaders = [pc1dheaders;'<html><font color="blue">AM1.5G Solar spectrum (spectral density, a.u.)'];
          if sum(strcmp(pc1dheaders,'Pri-Surface Reflectance')) > 0
              R = pc1ddata(:,strcmp(pc1dheaders,'Pri-Surface Reflectance'));      
              R_tot = trapz(lambda,R.*spectrum)/trapz(lambda,spectrum);
              pc1ddata = [pc1ddata R.*spectrum/max(spectrum)];
              pc1dheaders = [pc1dheaders;'<html><font color="blue">Reflectance \times spectrum'];
          end
          if sum(strcmp(pc1dheaders,'Internal Quantum Efficiency')) > 0
              IQE = pc1ddata(:,strcmp(pc1dheaders,'Internal Quantum Efficiency'));      
              pc1ddata = [pc1ddata IQE.*spectrum/max(spectrum)];
              pc1dheaders = [pc1dheaders;'<html><font color="blue">IQE \times spectrum'];
          end
          if sum(strcmp(pc1dheaders,'External Quantum Efficiency')) > 0
              EQE = pc1ddata(:,strcmp(pc1dheaders,'External Quantum Efficiency'));   
              pc1ddata = [pc1ddata EQE.*spectrum/max(spectrum)];
              pc1dheaders = [pc1dheaders;'<html><font color="blue">EQE \times spectrum'];
          end
      end

    results.pc1ddata{1} = pc1ddata;
    results.pc1dheaders = pc1dheaders;  
    results.Rs_em = handles.data.Rs_em;
    results.xj = handles.data.xj;
    results.delta_n = delta_n_int;
    results.tau_eff = tau_eff;
    results.G = G;
    results.OC = OC;
    results.tau15 = tau15;
    results.R_tot = R_tot;

    if handles.data.external_run == 0
        legID1{1} = '';
        legID2{1} = '';
        handles.data.legID1 = legID1;
        handles.data.legID2 = legID2;
        handles.data.varyvals1a = 1;
        handles.data.vary_leg_string1 = '';

        if ~isequal(handles.data.lastrun,results.pc1dheaders)
            try
                set(handles.listbox_ydata_selection,'Value',2);
            catch
                set(handles.listbox_ydata_selection,'Value',1);
            end
            set(handles.listbox_ydata_selection,'String',results.pc1dheaders);
            set(handles.listbox_xdata_selection,'Value',1);
            set(handles.listbox_xdata_selection,'String',results.pc1dheaders);
        end        
        handles.data.lastrun = results.pc1dheaders;    

        set(handles.popup_plot_select_vary2,'Value',1);
        set(handles.popup_plot_select_vary2,'String','Parameter 2');
        set(handles.popup_plot_select_vary2,'Visible','off')
        set(handles.text_simulation_type,'String','Single simulation')
        set(handles.text_simulation_type,'Foregroundcolor',[0 0 1])
        set(handles.text_simulation_type2,'Visible','off')

        waitbar(1,hw);
        close(hw)
    end

    handles.data.results = results;
    guidata(hObject, handles);

    C1 = cell(1);
    C2 = cell(1);
    fn = fieldnames(handles.data.results);
    fu = {'mA/cm2','V','%','%',' ',' ','ohm/sq','µm','cm^3','µs','cm^-3s^-1',' ','µs','%'};
    m = 1;
    for i = 1:length(fn)    
        if strcmp(fn{i},'pc1ddata') == 0 && strcmp(fn{i},'pc1dheaders') == 0    
            fv{i} = getfield(handles.data.results,fn{i});
            if ~isempty(fv{i})
                C1{m} = fn{i};
                C2{m} = ['= ' num2str(fv{i},'%0.5g') ' ' fu{i}];
                m = m+1;
            end        
        end
    end

    set(handles.text_display_results,'String',C1)
    set(handles.text_display_results2,'String',C2)

    if get(handles.check_autorun,'Value') == 1
        btn_plot_Callback(hObject, eventdata, handles)
    end

    catch ME
        errordlg(['Error detected when executing "run simulation": ' ME.message],'Error')    
        error(ME.message)
    end
    
    % --- Executes on button press in btn_plot.
function btn_plot_Callback(hObject, eventdata, handles)

%     try

        results = handles.data.results;
        pc1ddata = results.pc1ddata;
        pc1dheaders = results.pc1dheaders;
        legID1 = handles.data.legID1;

        selected_vary2_value = get(handles.popup_plot_select_vary2,'Value')-1;
        if selected_vary2_value == 0
            selected_vary2_value = 1;
        end

        legstrings = cell(0);
        leghandles = [];

        y_selected_value  = get(handles.listbox_ydata_selection,'Value');
        y_selected_string = get(handles.listbox_ydata_selection,'String');
        y_selected_string = strrep(y_selected_string,'<html><font color="blue">','');
        x_selected_value  = get(handles.listbox_xdata_selection,'Value');
        x_selected_string = get(handles.listbox_xdata_selection,'String');
        x_selected_string = strrep(x_selected_string,'<html><font color="blue">','');
        ps = {'-','--',':','-.','.-','.--','.:','.-.'};

        set(handles.axes2,'Visible','on')
        set(handles.btn_clear_axes,'Visible','on')
        axes(handles.axes2)

        if get(handles.check_hold,'Value') == 0
            cla(handles.axes2,'reset');
        else
            co=get(gca,'ColorOrder');
            set(gca,'ColorOrder',co([2:end 1],:));
        end
        hold on

        lmax = max(cellfun(@length,y_selected_string(y_selected_value)));

       if handles.data.axis_type == 1
            unitlist = handles.data.list_axis_spatial_units;
            namelist = handles.data.list_axis_spatial;
       elseif handles.data.axis_type == 2
            unitlist = handles.data.list_axis_temporal_units;
            namelist = handles.data.list_axis_temporal;
       elseif handles.data.axis_type == 3
            unitlist = handles.data.list_axis_wavelength_units;
            namelist = handles.data.list_axis_wavelength;   
       elseif handles.data.axis_type == 5
            unitlist = handles.data.list_axis_spatial_units;
            namelist = handles.data.list_axis_spatial;        
       end

        for i = 1:length(legID1)

            for j = 1:length(y_selected_value)

                if get(handles.check_abs_x,'Value') == 1
                    xdata = abs(pc1ddata{selected_vary2_value,i}(:,x_selected_value));
                else
                    xdata = pc1ddata{selected_vary2_value,i}(:,x_selected_value);
                end
                if get(handles.check_norm_x,'Value') == 1
                    xdata = xdata./max(xdata');
                end
                if get(handles.check_abs_y,'Value') == 1
                    ydata{j} = abs(pc1ddata{selected_vary2_value,i}(:,y_selected_value(j)));
                else
                    ydata{j} = pc1ddata{selected_vary2_value,i}(:,y_selected_value(j));
                end 
                if get(handles.check_norm_y,'Value') == 1
                    ydata{j} = ydata{j}./max(ydata{j}');
                end
                if strcmp(handles.data.xscale,'linear') && strcmp(handles.data.yscale,'linear')
                    set(gca,'Xscale','linear')
                    set(gca,'Yscale','linear')           
                    h1 = plot(xdata,ydata{j},ps{j},'LineWidth',2);
                elseif strcmp(handles.data.xscale,'log') && strcmp(handles.data.yscale,'log')
                    set(gca,'Xscale','log')
                    set(gca,'Yscale','log')
                    h1 = loglog(xdata,ydata{j},ps{j},'LineWidth',2);
                elseif strcmp(handles.data.xscale,'log') && strcmp(handles.data.yscale,'linear')
                    set(gca,'Xscale','log')
                    set(gca,'Yscale','linear')
                    h1 = semilogx(xdata,ydata{j},ps{j},'LineWidth',2);            
                elseif strcmp(handles.data.xscale,'linear') && strcmp(handles.data.yscale,'log')
                    set(gca,'Xscale','linear')
                    set(gca,'Yscale','log')
                    h1 = semilogy(xdata,ydata{j},ps{j},'LineWidth',2);
                end

                if length(y_selected_value) == 1
                    leg{j} = legID1{i};                
                else
                    legunit_y = [unitlist{strcmp(y_selected_string{y_selected_value(j)},namelist)}];
                    if ~isempty(legunit_y)
                        legunit_y = [' (' legunit_y ')'];
                    end    
                    if j == 1 
                        leg{j} = [y_selected_string{y_selected_value(j)} legunit_y repmat(' ',1,lmax - length(y_selected_string{y_selected_value(j)}) + 3) legID1{i}];
                    else
                        leg{j} = strcat(y_selected_string{y_selected_value(j)},legunit_y);
                    end
                end
                leghandles = [leghandles h1];

            end
                  legstrings = [legstrings leg];               
                  co=get(gca,'ColorOrder');
                  set(gca,'ColorOrder',co([2:end 1],:));
        end

        legunit_x = unitlist(strcmp(x_selected_string{x_selected_value},namelist));
        if ~isempty(legunit_x)
            legunit_x = strcat(' (',legunit_x,')');
        end    
        xlabel(strcat(x_selected_string{x_selected_value},legunit_x),'FontSize',15)
        if length(y_selected_value) == 1
            legunit_y = unitlist(strcmp(y_selected_string{y_selected_value},namelist));
            if ~isempty(legunit_y)
                legunit_y = strcat(' (',legunit_y,')');
            end    
            ylabel(strcat(y_selected_string{y_selected_value},legunit_y),'FontSize',15)
        end        
        set(gca,'FontSize',12)

        if handles.data.show_exp_data == 1
            plot(handles.data.x_exp,handles.data.y_exp,'kx')
        end

        legend off
        if length(legID1) > 1  || length(y_selected_value) > 1
          legend(leghandles,legstrings,'FontSize',8,'Location','Best');
        end     

            xlim auto
            ylim auto
        if ~sum(strcmp(pc1dheaders,'Primary Source Wavelength')) > 0
            xlimits = get(gca,'Xlim');
            ylimits = get(gca,'Ylim');
            plot([0 0],ylimits,'k','LineWidth',1)
            plot(xlimits,[0 0],'k','LineWidth',1)
        end
        
        if get(handles.popup_plot_select_vary2,'Value')>1
            if get(handles.popup_plot_select_vary2,'Value') > 1                
                v2l = get(handles.popup_plot_select_vary2,'Value');
            else
                v2l = 2;
            end            
                xl = get(gca,'Xlim');
                yl = get(gca,'Ylim');
                v2s = get(handles.popup_plot_select_vary2,'String');
                text(xl(1) + 0.05*(xl(2)-xl(1)),yl(2) - 0.05*(yl(2)-yl(1)),v2s(v2l),'FontSize',12);
        end

          handles.data.h_IV = h1; 
          guidata(hObject, handles);
% 
%     catch ME
%         errordlg(['Error detected when executing "Plot raw data": ' ME.message],'Error')    
%         error(ME.message)
%     end

% --- Executes on button press in check_hold.
function check_hold_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function toolbar_save_ClickedCallback(hObject, eventdata, handles)

    dos(['convert_ascii_to_prm' ' temp.txt ' handles.data.prm_file_name]);

% --- Executes on selection change in popup_select_x.
function popup_select_x_Callback(hObject, eventdata, handles)

    try

    if length(handles.data.parstrings) == 561
        if get(handles.popup_select_x,'Value') > 1
            temp = get(handles.popup_select_x,'Value')-1;
            if handles.data.axis_type == 1         
                handles.data.parvalues{313} = num2str(handles.data.list_axis_spatial_ind(temp)+1);
            elseif handles.data.axis_type == 2 
                handles.data.parvalues{313} = num2str(handles.data.list_axis_temporal_ind(temp)+1);
            elseif handles.data.axis_type == 3
                handles.data.parvalues{313} = num2str(handles.data.list_axis_wavelength_ind(temp)+1);
            end    

        end
    elseif length(handles.data.parstrings) == 699
        if get(handles.popup_select_x,'Value') > 1
            temp = get(handles.popup_select_x,'Value')-1;
            if handles.data.axis_type == 1         
                handles.data.parvalues{451} = num2str(handles.data.list_axis_spatial_ind(temp)+1);
            elseif handles.data.axis_type == 2 
                handles.data.parvalues{451} = num2str(handles.data.list_axis_temporal_ind(temp)+1);
            elseif handles.data.axis_type == 3
                handles.data.parvalues{451} = num2str(handles.data.list_axis_wavelength_ind(temp)+1);
            end    
        end
    end
            write_to_prm(handles.data.parstrings,handles.data.parvalues)
            guidata(hObject, handles);

    catch ME
        errordlg(['Error detected when executing "select x-data": ' ME.message],'Error')    
        error(ME.message)
    end

% --- Executes during object creation, after setting all properties.
function popup_select_x_CreateFcn(hObject, eventdata, handles)
        
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% --- Executes on selection change in popup_select_y1.
function popup_select_y1_Callback(hObject, eventdata, handles)

    try

    if length(handles.data.parstrings) == 561
        if get(handles.popup_select_y1,'Value') > 1
            temp = get(handles.popup_select_y1,'Value')-1;
            if handles.data.axis_type == 1
                handles.data.parvalues{316} = num2str(handles.data.list_axis_spatial_ind(temp)+1);
            elseif handles.data.axis_type == 2 
                handles.data.parvalues{316} = num2str(handles.data.list_axis_temporal_ind(temp)+1);
            elseif handles.data.axis_type == 3  
                handles.data.parvalues{316} = num2str(handles.data.list_axis_wavelength_ind(temp)+1);
            end    

            for i = 2:length(handles.data.parvalues)
                if strcmp(handles.data.parvalues{i},'same')
                    handles.data.parvalues{i} = handles.data.parvalues{i-1};
                end
            end
            write_to_prm(handles.data.parstrings,handles.data.parvalues)
            guidata(hObject, handles);
        end
    elseif length(handles.data.parstrings) == 699
        if get(handles.popup_select_y1,'Value') > 1
            temp = get(handles.popup_select_y1,'Value')-1;
            if handles.data.axis_type == 1
                handles.data.parvalues{454} = num2str(handles.data.list_axis_spatial_ind(temp)+1);
            elseif handles.data.axis_type == 2 
                handles.data.parvalues{454} = num2str(handles.data.list_axis_temporal_ind(temp)+1);
            elseif handles.data.axis_type == 3  
                handles.data.parvalues{454} = num2str(handles.data.list_axis_wavelength_ind(temp)+1);
            end    

            write_to_prm(handles.data.parstrings,handles.data.parvalues)

            guidata(hObject, handles);
        end
    end

    catch ME
        errordlg(['Error detected when executing "select y-data": ' ME.message],'Error')   
        error(ME.message)
    end

% --- Executes during object creation, after setting all properties.
function popup_select_y1_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% --- Executes on selection change in popup_select_y2.
function popup_select_y2_Callback(hObject, eventdata, handles)

    try

    if length(handles.data.parstrings) == 561
        if get(handles.popup_select_y2,'Value') > 1    
            temp = get(handles.popup_select_y2,'Value')-1;    
            if handles.data.axis_type == 1
                handles.data.parvalues{318} = num2str(handles.data.list_axis_spatial_ind(temp)+1);
            elseif handles.data.axis_type == 2
                handles.data.parvalues{318} = num2str(handles.data.list_axis_temporal_ind(temp)+1);
            elseif handles.data.axis_type == 3
                handles.data.parvalues{318} = num2str(handles.data.list_axis_wavelength_ind(temp)+1);
            end    

            write_to_prm(handles.data.parstrings,handles.data.parvalues)

            guidata(hObject, handles);
        end
    elseif length(handles.data.parstrings) == 699
        if get(handles.popup_select_y2,'Value') > 1    
            temp = get(handles.popup_select_y2,'Value')-1;    
            if handles.data.axis_type == 1
                handles.data.parvalues{456} = num2str(handles.data.list_axis_spatial_ind(temp)+1);
            elseif handles.data.axis_type == 2
                handles.data.parvalues{456} = num2str(handles.data.list_axis_temporal_ind(temp)+1);
            elseif handles.data.axis_type == 3
                handles.data.parvalues{456} = num2str(handles.data.list_axis_wavelength_ind(temp)+1);
            end    

            write_to_prm(handles.data.parstrings,handles.data.parvalues)

            guidata(hObject, handles);
        end
    end

    catch ME
        errordlg(['Error detected when executing "select y-data": ' ME.message],'Error')    
        error(ME.message)
    end

% --- Executes during object creation, after setting all properties.
function popup_select_y2_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% --- Executes on selection change in popup_select_y3.
function popup_select_y3_Callback(hObject, eventdata, handles)

    try

    if length(handles.data.parstrings) == 561
        if get(handles.popup_select_y3,'Value') > 1    
            temp = get(handles.popup_select_y3,'Value')-1;   
            if handles.data.axis_type == 1 
                handles.data.parvalues{320} = num2str(handles.data.list_axis_spatial_ind(temp)+1);
            elseif handles.data.axis_type == 2    
                handles.data.parvalues{320} = num2str(handles.data.list_axis_temporal_ind(temp)+1);
            elseif handles.data.axis_type == 3
                handles.data.parvalues{320} = num2str(handles.data.list_axis_wavelength_ind(temp)+1);
            end    

            write_to_prm(handles.data.parstrings,handles.data.parvalues)

            guidata(hObject, handles);
        end
    elseif length(handles.data.parstrings) == 699
        if get(handles.popup_select_y3,'Value') > 1    
            temp = get(handles.popup_select_y3,'Value')-1;   
            if handles.data.axis_type == 1 
                handles.data.parvalues{458} = num2str(handles.data.list_axis_spatial_ind(temp)+1);
            elseif handles.data.axis_type == 2    
                handles.data.parvalues{458} = num2str(handles.data.list_axis_temporal_ind(temp)+1);
            elseif handles.data.axis_type == 3
                handles.data.parvalues{458} = num2str(handles.data.list_axis_wavelength_ind(temp)+1);
            end    

            write_to_prm(handles.data.parstrings,handles.data.parvalues)

            guidata(hObject, handles);
        end
    end

    catch ME
        errordlg(['Error detected when executing "select y-data": ' ME.message],'Error')    
        error(ME.message)
    end
% --- Executes during object creation, after setting all properties.
function popup_select_y3_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% --- Executes on selection change in popup_select_y4.
function popup_select_y4_Callback(hObject, eventdata, handles)

    try
    if length(handles.data.parstrings) == 561
        if get(handles.popup_select_y4,'Value') > 1    
            temp = get(handles.popup_select_y4,'Value')-1;   
            if handles.data.axis_type == 1 
                handles.data.parvalues{322} = num2str(handles.data.list_axis_spatial_ind(temp)+1);
            elseif handles.data.axis_type == 2  
                handles.data.parvalues{322} = num2str(handles.data.list_axis_temporal_ind(temp)+1);
            elseif handles.data.axis_type == 3
                handles.data.parvalues{322} = num2str(handles.data.list_axis_wavelength_ind(temp)+1);
            end    

            write_to_prm(handles.data.parstrings,handles.data.parvalues)

            guidata(hObject, handles);
        end
    elseif length(handles.data.parstrings) == 699
        if get(handles.popup_select_y4,'Value') > 1    
            temp = get(handles.popup_select_y4,'Value')-1;   
            if handles.data.axis_type == 1 
                handles.data.parvalues{460} = num2str(handles.data.list_axis_spatial_ind(temp)+1);
            elseif handles.data.axis_type == 2  
                handles.data.parvalues{460} = num2str(handles.data.list_axis_temporal_ind(temp)+1);
            elseif handles.data.axis_type == 3
                handles.data.parvalues{460} = num2str(handles.data.list_axis_wavelength_ind(temp)+1);
            end    

            write_to_prm(handles.data.parstrings,handles.data.parvalues)

            guidata(hObject, handles);
        end
    end
    catch ME
        errordlg(['Error detected when executing "select y-data": ' ME.message],'Error')  
        error(ME.message)
    end

% --- Executes during object creation, after setting all properties.
function popup_select_y4_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% --- Executes when selected object is changed in radio_xscale.
function radio_xscale_SelectionChangeFcn(hObject, eventdata, handles)

    button = get(hObject,'Tag');
    if strcmp(button,'radio_xscale_lin')
    handles.data.xscale = 'linear';
    elseif strcmp(button,'radio_xscale_log')
    handles.data.xscale = 'log';
    end

    guidata(hObject,handles)


% --- Executes when selected object is changed in radio_yscale.
function radio_yscale_SelectionChangeFcn(hObject, eventdata, handles)

    button = get(hObject,'Tag');
    if strcmp(button,'radio_yscale_lin')
    handles.data.yscale = 'linear';
    elseif strcmp(button,'radio_yscale_log')
    handles.data.yscale = 'log';
    end

    guidata(hObject,handles)


% --- Executes on selection change in popup_vary1a.
function popup_vary1a_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function popup_vary1a_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% --- Executes on button press in btn_run_batch.
function btn_run_batch_Callback(hObject, eventdata, handles)

    try

    tic  

    if isempty(str2num(get(handles.edit_from1a,'String'))) || ...
       isempty(str2num(get(handles.edit_from1a,'String'))) || ...
       isempty(str2num(get(handles.edit_from1a,'String'))) || ...
       get(handles.popup_vary1a,'Value') == 1

        msgbox('Please select "Vary parameter" and fill in "From", "Step" and "To" values');

    else

    parvalues_backup  = handles.data.parvalues;
    parvalues2_backup = handles.data.parvalues2;

    results = [];
    results.pc1ddata = cell(0);
    results.pc1dheaders = cell(0);
    Jsc = [];
    Voc = [];
    FF  = [];
    eta = [];
    legID1 = cell(0);
    legID2 = cell(0);
    varyvals1_log = 0;
    varyvals2_log = 0;

    Rs_em = [];
    xj = [];
    tau_eff = [];
    delta_n = [];
    G = [];
    OC = [];
    tau15 = [];
    R_tot = [];

    varystrings = get(handles.popup_vary1a,'String');
    varytype1a  = get(handles.popup_vary1a,'Value');
    varytype1b  = get(handles.popup_vary1b,'Value');
    varytype2a  = get(handles.popup_vary2a,'Value');
    varytype2b  = get(handles.popup_vary2b,'Value');
    varyfac1    = str2num(get(handles.edit_batch_factor1,'String'));
    varyfac2    = str2num(get(handles.edit_batch_factor2,'String'));
    if isempty(varyfac1)
        varyfac1 = 1;
    end
    if isempty(varyfac2)
        varyfac2 = 1;
    end
    parvalues_short = handles.data.parvalues(handles.data.parindex_short);
    parvalues_short = parvalues_short(handles.data.ind_sort);
    temp        = parvalues_short(logical(handles.data.parvary_short));

    em_enable = max(str2num(handles.data.parvalues{164}),str2num(handles.data.parvalues{196}));    

    if varytype1a > 1
        fromval1a = str2num(get(handles.edit_from1a,'String'));
        stepval1a = str2num(get(handles.edit_step1a,'String'));
        toval1a = str2num(get(handles.edit_to1a,'String'));
        if get(handles.check_log_batch1a,'Value') == 1
            varyvals1a = varyfac1*logspace(log10(fromval1a),log10(toval1a),stepval1a);
            varyvals1_log = 1;                    
        else
            varyvals1a = varyfac1*linspace(fromval1a,toval1a,stepval1a);
            varyvals1_log = 0; 
        end
    else
        varyvals1a = 1;
    end

    if get(handles.check_linked1,'Value') == 1 && varytype1b > 1
        fromval1b = str2num(get(handles.edit_from1b,'String'));
        stepval1b = str2num(get(handles.edit_step1b,'String'));
        toval1b = str2num(get(handles.edit_to1b,'String'));
        if get(handles.check_log_batch1b,'Value') == 1
            varyvals1b = varyfac1*logspace(log10(fromval1b),log10(toval1b),stepval1b);
        else
            varyvals1b = varyfac1*linspace(fromval1b,toval1b,stepval1b);
        end
    end

    if varytype2a > 1 && get(handles.check_vary2_enable,'Value') == 1
        fromval2a = str2num(get(handles.edit_from2a,'String'));
        stepval2a = str2num(get(handles.edit_step2a,'String'));
        toval2a = str2num(get(handles.edit_to2a,'String'));
        if get(handles.check_log_batch2a,'Value') == 1
            varyvals2a = varyfac2*logspace(log10(fromval2a),log10(toval2a),stepval2a);
            varyvals2_log = 1; 
        else
            varyvals2a = varyfac2*linspace(fromval2a,toval2a,stepval2a);
            varyvals2_log = 0; 
        end
    else
        varyvals2a = 1;
    end

    if get(handles.check_linked2,'Value') == 1 && varytype2b > 1 && get(handles.check_vary2_enable,'Value') == 1
        fromval2b = str2num(get(handles.edit_from2b,'String'));
        stepval2b = str2num(get(handles.edit_step2b,'String'));
        toval2b = str2num(get(handles.edit_to2b,'String'));
        if get(handles.check_log_batch2b,'Value') == 1
            varyvals2b = varyfac2*logspace(log10(fromval2b),log10(toval2b),stepval2b);
        else
            varyvals2b = varyfac2*linspace(fromval2b,toval2b,stepval2b);
        end
    end

    m = 0;

    hw = waitbar(0,'Calculating...');

    lsps = length(handles.data.parnames_short2);

    for i = 1:length(varyvals1a)    
        for j = 1:length(varyvals2a)

             if isempty(get(handles.edit_batch_legend1,'String')) 
                vary_leg_string1 = varystrings{varytype1a};
                vary_leg_string1 = vary_leg_string1(strfind(vary_leg_string1,'-')+2:end);
             else
                vary_leg_string1 = get(handles.edit_batch_legend1,'String');
             end

             if isempty(get(handles.edit_batch_legend2,'String')) 
                vary_leg_string2 = varystrings{varytype2a};
                vary_leg_string2 = vary_leg_string2(strfind(vary_leg_string2,'-')+2:end);
             else
                vary_leg_string2 = get(handles.edit_batch_legend2,'String');
             end

             if varytype1a > 1              
                 if varytype1a > lsps                                     
                        handles.data.parvalues2{varytype1a - lsps  -2} = num2str(varyvals1a(i));
                        legID1{i} = [vary_leg_string1 ' = '  num2str(varyvals1a(i),'%0.5g')];
                 else                      
                        temp{varytype1a-1} = num2str(varyvals1a(i)/varyfac1);
                        legID1{i} = [vary_leg_string1 ' = '  num2str(varyvals1a(i),'%0.5g')];                     
                 end            
             end

            if get(handles.check_linked1,'Value') == 1 && varytype1b > 1            
                if varytype1b > lsps            
                    handles.data.parvalues2{varytype1b - lsps  -2} = num2str(varyvals1b(i));                   
                else 
                    temp{varytype1b-1} = num2str(varyvals1b(i)/varyfac1);
                end
            end    

            if varytype2a > 1 && get(handles.check_vary2_enable,'Value') == 1
                if varytype2a > lsps                                     
                        handles.data.parvalues2{varytype2a - lsps  -2} = num2str(varyvals2a(j));
                        legID2{j} = [vary_leg_string2 ' = '  num2str(varyvals2a(j),'%0.5g')];                     
                else 
                        temp{varytype2a-1} = num2str(varyvals2a(j)/varyfac2);
                        legID2{j} = [vary_leg_string2 ' = '  num2str(varyvals2a(j),'%0.5g')];
                end
            end    

            if get(handles.check_linked2,'Value') == 1 && varytype2b > 1 && get(handles.check_vary2_enable,'Value') == 1
                if varytype2b > lsps                                 
                     handles.data.parvalues2{varytype2b - lsps  -2} = num2str(varyvals2b(j));                    
                else                 
                     temp{varytype2b-1} = num2str(varyvals2b(j)/varyfac2);
                end
            end

             temp2 = handles.data.parvalues(logical(handles.data.parindex_short));
             temp3 = temp2(handles.data.ind_sort);                     
             temp3(logical(handles.data.parvary_short)) = temp;
             temp2(handles.data.ind_sort) = temp3;
             handles.data.parvalues(logical(handles.data.parindex_short)) = temp2; 

            btn_update_parvalues2_Callback(hObject, eventdata, handles)
            handles=guidata(handles.output);

            ind = cellfun(@isempty,handles.data.parvalues);
            handles.data.parvalues(ind) = {''};

                handles.data.external_run = 1;               
                btn_run_Callback(hObject, eventdata, handles);
                handles=guidata(handles.output);
                pc1ddata_ij{j,i}   = handles.data.results.pc1ddata{1};

            if ~isempty(handles.data.results.Jsc)
                Jsc(j,i)        = handles.data.results.Jsc;
                Voc(j,i)        = handles.data.results.Voc;
                FF(j,i)         = handles.data.results.FF;
                eta(j,i)        = handles.data.results.eta;
            end
            if ~isempty(handles.data.results.Rs_em)
                Rs_em(j,i)      = handles.data.results.Rs_em;
                xj(j,i)         = handles.data.results.xj;
            end
            if ~isempty(handles.data.results.tau_eff)
                tau_eff(j,i)    = handles.data.results.tau_eff;
                delta_n(j,i)    = handles.data.results.delta_n;
                G(j,i)          = handles.data.results.G;
            end
            if ~isempty(handles.data.results.OC)
                OC(j,i)         = handles.data.results.OC;
            end
            if ~isempty(handles.data.results.tau15)
                tau15(j,i)  = handles.data.results.tau15;
            end
            if ~isempty(handles.data.results.R_tot)
                R_tot(j,i)  = handles.data.results.R_tot;
            end
            m = m+1;
            waitbar(m/(length(varyvals1a)*length(varyvals2a)),hw);
        end

    end 
    handles.data.external_run = 0;    

    close(hw)

    if length(varyvals2a) > 1
        popup_par_x_string = {'Choose parameter',vary_leg_string1,vary_leg_string2};
    else
        if get(handles.popup_cell_par_x,'Value') > 2
            set(handles.popup_cell_par_x,'Value',2)
        end
        popup_par_x_string = {'Choose parameter',vary_leg_string1};
    end
    if get(handles.popup_cell_par_x,'Value') == 1
        set(handles.popup_cell_par_x,'Value',2)
    end


    if sum(std(Rs_em(:))) > 1e-12
        if min(size(Rs_em)) == 1
            handles.data.Rs_em_xdata = Rs_em;
            popup_par_x_string = [popup_par_x_string 'Emitter sheet resistance'];
        elseif sum(std(Rs_em)) < 1e-12
            handles.data.Rs_em_xdata = Rs_em(1,:);
            popup_par_x_string = [popup_par_x_string 'Emitter sheet resistance'];
        elseif sum(std(Rs_em')) < 1e-12
            handles.data.Rs_em_xdata  = Rs_em(:,1);
            popup_par_x_string = [popup_par_x_string 'Emitter sheet resistance'];
        end
    end

    if sum(std(xj(:))) > 1e-12
        if min(size(xj)) == 1
            handles.data.xj_xdata = xj;
            popup_par_x_string = [popup_par_x_string 'Emitter junction depth'];
        elseif sum(std(xj)) < 1e-12
            handles.data.xj_xdata = xj(1,:);
            popup_par_x_string = [popup_par_x_string 'Emitter junction depth'];
        elseif sum(std(xj')) < 1e-12
            handles.data.xj_xdata  = xj(:,1);
            popup_par_x_string = [popup_par_x_string 'Emitter junction depth'];
        end
    end

    if sum(std(tau_eff(:))) > 1e-12
        if min(size(tau_eff)) == 1
            handles.data.tau_eff_xdata = tau_eff;
            popup_par_x_string = [popup_par_x_string 'Effective carrier lifetime'];
        elseif sum(std(tau_eff)) < 1e-12
            handles.data.tau_eff_xdata = tau_eff(1,:);
            popup_par_x_string = [popup_par_x_string 'Effective carrier lifetime'];
        elseif sum(std(tau_eff')) < 1e-12
            handles.data.tau_eff_xdata  = tau_eff(:,1);
            popup_par_x_string = [popup_par_x_string 'Effective carrier lifetime'];
        end
    end

    if sum(std(delta_n(:))) > 1e-12
        if min(size(delta_n)) == 1
            handles.data.delta_n_xdata = delta_n;
            popup_par_x_string = [popup_par_x_string 'Injection level'];
        elseif sum(std(delta_n)) < 1e-12
            handles.data.delta_n_xdata = delta_n(1,:);
            popup_par_x_string = [popup_par_x_string 'Injection level'];
        elseif sum(std(delta_n')) < 1e-12
            handles.data.delta_n_xdata  = delta_n(:,1);
            popup_par_x_string = [popup_par_x_string 'Injection level'];
        end
    end

    if sum(std(G(:))) > 1e-12
        if min(size(G)) == 1
            handles.data.G_xdata = G;
            popup_par_x_string = [popup_par_x_string 'Generation rate'];
        elseif sum(std(G)) < 1e-12
            handles.data.G_xdata = G(1,:);
            popup_par_x_string = [popup_par_x_string 'Generation rate'];
        elseif sum(std(G')) < 1e-12
            handles.data.G_xdata  = G(:,1);
            popup_par_x_string = [popup_par_x_string 'Generation rate'];
        end
    end

    if sum(std(OC(:))) > 1e-12
        if min(size(OC)) == 1
            handles.data.OC_xdata = OC;
            popup_par_x_string = [popup_par_x_string 'Generation rate'];
        elseif sum(std(OC)) < 1e-12
            handles.data.OC_xdata = OC(1,:);
            popup_par_x_string = [popup_par_x_string 'Generation rate'];
        elseif sum(std(OC')) < 1e-12
            handles.data.OC_xdata  = OC(:,1);
            popup_par_x_string = [popup_par_x_string 'Generation rate'];
        end
    end

    if sum(std(tau15(:))) > 1e-12
        if min(size(tau15)) == 1
            handles.data.tau15_xdata = tau15;
            popup_par_x_string = [popup_par_x_string 'Generalized carrier lifetime at Dn = 1e15 cm-3'];
        elseif sum(std(tau15)) < 1e-12
            handles.data.tau15_xdata = tau15(1,:);
            popup_par_x_string = [popup_par_x_string 'Generalized carrier lifetime at Dn = 1e15 cm-3'];
        elseif sum(std(tau15')) < 1e-12
            handles.data.tau15_xdata  = tau15(:,1);
            popup_par_x_string = [popup_par_x_string 'Generalized carrier lifetime at Dn = 1e15 cm-3'];
        end
    end
    if sum(std(R_tot(:))) > 1e-12
        if min(size(tau15)) == 1
            handles.data.R_tot_xdata = R_tot;
            popup_par_x_string = [popup_par_x_string 'Integrated weighted reflectance (%)'];
        elseif sum(std(R_tot)) < 1e-12
            handles.data.R_tot_xdata = R_tot(1,:);
            popup_par_x_string = [popup_par_x_string 'Integrated weighted reflectance (%)'];
        elseif sum(std(R_tot')) < 1e-12
            handles.data.R_tot_xdata  = R_tot(:,1);
            popup_par_x_string = [popup_par_x_string 'Integrated weighted reflectance (%)'];
        end
    end

    set(handles.popup_cell_par_x,'String',popup_par_x_string);

    results.pc1ddata = pc1ddata_ij;
    results.pc1dheaders = handles.data.results.pc1dheaders;    
    results.Jsc = Jsc;
    results.Voc = Voc;
    results.FF = FF;
    results.eta = eta;
    results.Rs_em = Rs_em;
    results.xj = xj;
    results.tau_eff = tau_eff;
    results.delta_n = delta_n;
    results.G = G;
    results.OC = OC;
    results.tau15 = tau15;
    results.R_tot = R_tot;

    handles.data.results = results;
    handles.data.varyvals1a = varyvals1a;
    handles.data.varyvals2a = varyvals2a;
    handles.data.varytype1a = varytype1a;
    handles.data.varytype1b = varytype1b;
    handles.data.varytype2a = varytype2a;
    handles.data.varytype2b = varytype2b;
    handles.data.legID1 = legID1;
    handles.data.legID2 = legID2;
    handles.data.varyvals1_log = varyvals1_log;
    handles.data.varyvals2_log = varyvals2_log;
    handles.data.vary_leg_string1 = vary_leg_string1;
    handles.data.vary_leg_string2 = vary_leg_string2;
    if ~isequal(handles.data.lastrun,results.pc1dheaders)
        try
            set(handles.listbox_ydata_selection,'Value',2);
        catch
            set(handles.listbox_ydata_selection,'Value',1);
        end
        set(handles.listbox_ydata_selection,'String',results.pc1dheaders);
        set(handles.listbox_xdata_selection,'Value',1);
        set(handles.listbox_xdata_selection,'String',results.pc1dheaders);
    end        
    handles.data.lastrun = results.pc1dheaders;
    set(handles.popup_plot_select_vary2,'Value',1);
    set(handles.popup_plot_select_vary2,'String',['Parameter 2' legID2]);

    if length(handles.data.parvalues) == 561
        pick_x = str2num(get(handles.edit_pick_x,'String'));
        headers_at_value = results.pc1dheaders(2:end)';
        for i = 1:length(headers_at_value)
            headers_at_value{i} = [headers_at_value{i} ' at x = ' num2str(pick_x)];
        end
        popup_yz_set_values = [handles.data.cell_par_strings headers_at_value];  
    else
        popup_yz_set_values = handles.data.cell_par_strings;  
    end
    if length(get(handles.popup_cell_par_y,'String')) ~= length(popup_yz_set_values)
        set(handles.popup_cell_par_y,'Value',1)
        set(handles.popup_cell_par_z,'Value',1)
    end
        set(handles.popup_cell_par_y,'String',popup_yz_set_values);
        set(handles.popup_cell_par_z,'String',popup_yz_set_values);

    handles.data.parvalues = parvalues_backup;
    handles.data.parvalues2 = parvalues2_backup;

    guidata(hObject,handles)

    if isempty(legID2)
        set(handles.popup_plot_select_vary2,'Visible','off')
        set(handles.text_simulation_type,'String','Batch simulation')
        set(handles.text_simulation_type,'Foregroundcolor',[0 0.5 0])
        set(handles.text_simulation_type2,'String','- 1 parameter')
        set(handles.text_simulation_type2,'Foregroundcolor',[0 0.5 0])
        set(handles.text_simulation_type2,'Visible','on')

    else
        set(handles.popup_plot_select_vary2,'Visible','on')
        set(handles.text_simulation_type,'String','Batch simulation')
        set(handles.text_simulation_type,'Foregroundcolor',[1 0 0])
        set(handles.text_simulation_type2,'String','- 2 parameters')
        set(handles.text_simulation_type2,'Foregroundcolor',[1 0 0])    
        set(handles.text_simulation_type2,'Visible','on')
    end

    C1 = ' ';
    C2 = ' ';
    set(handles.text_display_results,'String',C1)
    set(handles.text_display_results2,'String',C2)

    end

    disp('Batch simulation complete')
    toc

    catch ME

        errordlg(['Error detected when executing "run batch simulation": ' ME.message],'Error')    
        error(ME.message)
    end


 % ----------------------------------------------------------------
function edit_from1a_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit_from1a_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

% ----------------------------------------------------------------
function edit_step1a_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit_step1a_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% ----------------------------------------------------------------
function edit_to1a_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit_to1a_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% --- Executes on button press in check_log_batch1a.
function check_log_batch1a_Callback(hObject, eventdata, handles)

% --- Executes when selected object is changed in radio_data_type.
function radio_data_type_SelectionChangeFcn(hObject, eventdata, handles)
    
    try

        handles.data.parvalues{313} = '0';
        handles.data.parvalues{316} = '0';
        handles.data.parvalues{318} = '0';
        handles.data.parvalues{320} = '0';
        handles.data.parvalues{322} = '0';

    button = get(hObject,'Tag');
    if strcmp(button,'radio_btn_spatial')
        set(handles.popup_select_x,'String',['xdata';handles.data.list_axis_spatial])
        set(handles.popup_select_x,'Value',1)
        set(handles.popup_select_y1,'String',['ydata 1';handles.data.list_axis_spatial])
        set(handles.popup_select_y1,'Value',1)
        set(handles.popup_select_y2,'String',['ydata 2';handles.data.list_axis_spatial])
        set(handles.popup_select_y2,'Value',1)
        set(handles.popup_select_y3,'String',['ydata 3';handles.data.list_axis_spatial])
        set(handles.popup_select_y3,'Value',1)
        set(handles.popup_select_y4,'String',['ydata 4';handles.data.list_axis_spatial])
        set(handles.popup_select_y4,'Value',1)

        if handles.data.axis_type == 3

            if ~isempty(handles.data.parvalues_backup)
                handles.data.parvalues{4}   = handles.data.parvalues_backup{4};
                handles.data.parvalues{5}   = handles.data.parvalues_backup{5};
                handles.data.parvalues{6}   = handles.data.parvalues_backup{6};
                handles.data.parvalues{241+handles.data.parfix} = handles.data.parvalues_backup{241};
                handles.data.parvalues{243+handles.data.parfix} = handles.data.parvalues_backup{243};
                handles.data.parvalues{245+handles.data.parfix} = handles.data.parvalues_backup{245};
                handles.data.parvalues{248+handles.data.parfix} = handles.data.parvalues_backup{248};
                handles.data.parvalues{249+handles.data.parfix} = handles.data.parvalues_backup{249};
                handles.data.parvalues{250+handles.data.parfix} = handles.data.parvalues_backup{250};
    %             handles.data.parvalues{251+handles.data.parfix} = handles.data.parvalues_backup{251};
                handles.data.parvalues{279+handles.data.parfix} = handles.data.parvalues_backup{279};
                handles.data.parvalues{280+handles.data.parfix} = handles.data.parvalues_backup{280};
                handles.data.parvalues{281+handles.data.parfix} = handles.data.parvalues_backup{281};
                handles.data.parvalues{283+handles.data.parfix} = handles.data.parvalues_backup{283};
                handles.data.parvalues{284+handles.data.parfix} = handles.data.parvalues_backup{284};
                handles.data.parvalues{285+handles.data.parfix} = handles.data.parvalues_backup{285};
                handles.data.parvalues{286+handles.data.parfix} = handles.data.parvalues_backup{286};
                handles.data.parvalues{300+handles.data.parfix} = handles.data.parvalues_backup{300};
                handles.data.parvalues{303+handles.data.parfix} = handles.data.parvalues_backup{303};
                handles.data.parvalues{307+handles.data.parfix} = handles.data.parvalues_backup{307};
                handles.data.parvalues{308+handles.data.parfix} = handles.data.parvalues_backup{308};
                handles.data.parvalues{309+handles.data.parfix} = handles.data.parvalues_backup{309};
            else        
                handles.data.parvalues{4} = '3';
                handles.data.parvalues{5} = '16';
                handles.data.parvalues{6} = '16';
                handles.data.parvalues{241+handles.data.parfix} = '1';
                handles.data.parvalues{243+handles.data.parfix} = '0';
                handles.data.parvalues{245+handles.data.parfix} = '1000';
                handles.data.parvalues{248+handles.data.parfix} = '0.1';
                handles.data.parvalues{249+handles.data.parfix} = '0.1';
                handles.data.parvalues{250+handles.data.parfix} = '0.1';
                handles.data.parvalues{251+handles.data.parfix} = 'am15g.spc';
                handles.data.parvalues{279+handles.data.parfix} = '1';
                handles.data.parvalues{280+handles.data.parfix} = '20';
                handles.data.parvalues{281+handles.data.parfix} = '-0.8';
                handles.data.parvalues{283+handles.data.parfix} = '0';
                handles.data.parvalues{284+handles.data.parfix} = '20';
                handles.data.parvalues{285+handles.data.parfix} = '-0.8';
                handles.data.parvalues{286+handles.data.parfix} = '0.8';
                handles.data.parvalues{300+handles.data.parfix} = 'one-sun.exc';
                handles.data.parvalues{303+handles.data.parfix} = '16';
                handles.data.parvalues{307+handles.data.parfix} = 'one-sun.exc';
                handles.data.parvalues{308+handles.data.parfix} = '298.15';
                handles.data.parvalues{309+handles.data.parfix} = '1';   
                msgbox('Excitation parameters changed to standard settings')
            end            
        end

       handles.data.axis_type = 1;

    elseif strcmp(button,'radio_btn_temporal')
        set(handles.popup_select_x,'String',['xdata';handles.data.list_axis_temporal])
        set(handles.popup_select_x,'Value',1)
        set(handles.popup_select_y1,'String',['ydata 1';handles.data.list_axis_temporal])
        set(handles.popup_select_y1,'Value',1)
        set(handles.popup_select_y2,'String',['ydata 2';handles.data.list_axis_temporal])
        set(handles.popup_select_y2,'Value',1)
        set(handles.popup_select_y3,'String',['ydata 3';handles.data.list_axis_temporal])
        set(handles.popup_select_y3,'Value',1)
        set(handles.popup_select_y4,'String',['ydata 4';handles.data.list_axis_temporal])
        set(handles.popup_select_y4,'Value',1)


        if handles.data.axis_type == 3                      

            if ~isempty(handles.data.parvalues_backup)
                handles.data.parvalues{4}   = handles.data.parvalues_backup{4};
                handles.data.parvalues{5}   = handles.data.parvalues_backup{5};
                handles.data.parvalues{6}   = handles.data.parvalues_backup{6};
                handles.data.parvalues{241+handles.data.parfix} = handles.data.parvalues_backup{241};
                handles.data.parvalues{243+handles.data.parfix} = handles.data.parvalues_backup{243};
                handles.data.parvalues{245+handles.data.parfix} = handles.data.parvalues_backup{245};
                handles.data.parvalues{248+handles.data.parfix} = handles.data.parvalues_backup{248};
                handles.data.parvalues{249+handles.data.parfix} = handles.data.parvalues_backup{249};
                handles.data.parvalues{250+handles.data.parfix} = handles.data.parvalues_backup{250};
    %             handles.data.parvalues{251+handles.data.parfix} = handles.data.parvalues_backup{251};
                handles.data.parvalues{279+handles.data.parfix} = handles.data.parvalues_backup{279};
                handles.data.parvalues{280+handles.data.parfix} = handles.data.parvalues_backup{280};
                handles.data.parvalues{281+handles.data.parfix} = handles.data.parvalues_backup{281};
                handles.data.parvalues{283+handles.data.parfix} = handles.data.parvalues_backup{283};
                handles.data.parvalues{284+handles.data.parfix} = handles.data.parvalues_backup{284};
                handles.data.parvalues{285+handles.data.parfix} = handles.data.parvalues_backup{285};
                handles.data.parvalues{286+handles.data.parfix} = handles.data.parvalues_backup{286};
                handles.data.parvalues{300+handles.data.parfix} = handles.data.parvalues_backup{300};
                handles.data.parvalues{303+handles.data.parfix} = handles.data.parvalues_backup{303};
                handles.data.parvalues{307+handles.data.parfix} = handles.data.parvalues_backup{307};
                handles.data.parvalues{308+handles.data.parfix} = handles.data.parvalues_backup{308};
                handles.data.parvalues{309+handles.data.parfix} = handles.data.parvalues_backup{309};
            else        
                handles.data.parvalues{4} = '3';
                handles.data.parvalues{5} = '16';
                handles.data.parvalues{6} = '16';
                handles.data.parvalues{241+handles.data.parfix} = '1';
                handles.data.parvalues{243+handles.data.parfix} = '0';
                handles.data.parvalues{245+handles.data.parfix} = '1000';
                handles.data.parvalues{248+handles.data.parfix} = '0.1';
                handles.data.parvalues{249+handles.data.parfix} = '0.1';
                handles.data.parvalues{250+handles.data.parfix} = '0.1';
    %             handles.data.parvalues{251+handles.data.parfix} = 'am15g.spc';
                handles.data.parvalues{279+handles.data.parfix} = '0';
                handles.data.parvalues{280+handles.data.parfix} = '20';
                handles.data.parvalues{281+handles.data.parfix} = '-0.8';
                handles.data.parvalues{283+handles.data.parfix} = '0';
                handles.data.parvalues{284+handles.data.parfix} = '20';
                handles.data.parvalues{285+handles.data.parfix} = '-0.8';
                handles.data.parvalues{286+handles.data.parfix} = '0.8';
                handles.data.parvalues{300+handles.data.parfix} = 'one-sun.exc';
                handles.data.parvalues{303+handles.data.parfix} = '16';
                handles.data.parvalues{307+handles.data.parfix} = 'one-sun.exc';
                handles.data.parvalues{308+handles.data.parfix} = '298.15';
                handles.data.parvalues{309+handles.data.parfix} = '1';   
                msgbox('Excitation parameters changed to standard settings')
            end
        end

        handles.data.axis_type = 2;

    elseif strcmp(button,'radio_btn_wavelength')    
        set(handles.popup_select_x,'String',['xdata';handles.data.list_axis_wavelength])
        set(handles.popup_select_x,'Value',1)
        set(handles.popup_select_y1,'String',['ydata 1';handles.data.list_axis_wavelength])
        set(handles.popup_select_y1,'Value',1)
        set(handles.popup_select_y2,'String',['ydata 2';handles.data.list_axis_wavelength])
        set(handles.popup_select_y2,'Value',1)
        set(handles.popup_select_y3,'String',['ydata 3';handles.data.list_axis_wavelength])
        set(handles.popup_select_y3,'Value',1)
        set(handles.popup_select_y4,'String',['ydata 4';handles.data.list_axis_wavelength])
        set(handles.popup_select_y4,'Value',1)

        if strcmp(handles.data.parvalues{300},'scan-qe.exc') == 0
            handles.data.parvalues_backup = handles.data.parvalues;  

            handles.data.parvalues{4} = '3';
            handles.data.parvalues{5} = '90';
            handles.data.parvalues{6} = '90';
            handles.data.parvalues{241+handles.data.parfix} = '0';
            handles.data.parvalues{243+handles.data.parfix} = '1';
            handles.data.parvalues{245+handles.data.parfix} = '300';
            handles.data.parvalues{248+handles.data.parfix} = '0.001';
            handles.data.parvalues{249+handles.data.parfix} = '0.001';
            handles.data.parvalues{250+handles.data.parfix} = '0.001';
    %         handles.data.parvalues{251+handles.data.parfix} = '';
            handles.data.parvalues{279+handles.data.parfix} = '0';
            handles.data.parvalues{280+handles.data.parfix} = '0';
            handles.data.parvalues{281+handles.data.parfix} = '0';
            handles.data.parvalues{283+handles.data.parfix} = '1';
            handles.data.parvalues{284+handles.data.parfix} = '0';
            handles.data.parvalues{285+handles.data.parfix} = '0';
            handles.data.parvalues{286+handles.data.parfix} = '0';
            handles.data.parvalues{300+handles.data.parfix} = 'scan-qe.exc';
            handles.data.parvalues{303+handles.data.parfix} = '90';
            handles.data.parvalues{307+handles.data.parfix} = 'scan-qe.exc';
            handles.data.parvalues{308+handles.data.parfix} = '300';
            handles.data.parvalues{309+handles.data.parfix} = '0';

            handles.data.axis_type = 3;            
        end               
    end

        parnames_short = handles.data.parnames_short;
        parvalues_short = handles.data.parvalues(handles.data.parindex_short);
        parvalues_short = parvalues_short(handles.data.ind_sort);
        parfit_short = handles.data.parfit_short;
        set(handles.tab_all_par,'Data',[parnames_short parvalues_short parfit_short]);

        write_to_prm(handles.data.parstrings,handles.data.parvalues)

        guidata(hObject, handles);   

    catch ME
        errordlg(['Error detected when executing "select data type": ' ME.message],'Error')   
        error(ME.message)
    end

% --- Executes on button press in check_abs_y.
function check_abs_y_Callback(hObject, eventdata, handles)

% --- Executes on button press in check_abs_x.
function check_abs_x_Callback(hObject, eventdata, handles)


% --- Executes on selection change in popup_vary1b.
function popup_vary1b_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function popup_vary1b_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
% ---    
function edit_from1b_Callback(hObject, eventdata, handles)
   
% --- Executes during object creation, after setting all properties.

function edit_from1b_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
% --- 
function edit_step1b_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit_step1b_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function edit_to1b_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit_to1b_CreateFcn(hObject, eventdata, handles)    
   
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

% --- Executes on button press in check_log_batch1b.
function check_log_batch1b_Callback(hObject, eventdata, handles)

% --- 
function edit_batch_legend1_Callback(hObject, eventdata, handles)    


% --- Executes during object creation, after setting all properties.
function edit_batch_legend1_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

% --- Executes on button press in btn_plot_results_1D.
function btn_plot_results_1D_Callback(hObject, eventdata, handles)

    try
        
    if get(handles.check_vary1_enable,'Value') == 1    
        if get(handles.check_select_1D,'Value') == 1

                results = handles.data.results;

                if get(handles.popup_cell_par_x,'Value') > 1

                    allstrings_x  = get(handles.popup_cell_par_x,'String');
                    allstrings_y  = get(handles.popup_cell_par_y,'String');
                    ydata = [];

                    if strcmp(allstrings_x(get(handles.popup_cell_par_x,'Value')),handles.data.vary_leg_string1)
                        xdata = handles.data.varyvals1a;
                    elseif strcmp(allstrings_x(get(handles.popup_cell_par_x,'Value')),handles.data.vary_leg_string2)
                        xdata = handles.data.varyvals2a;
                    elseif strcmp(allstrings_x(get(handles.popup_cell_par_x,'Value')),'Emitter sheet resistance')
                        xdata = handles.data.Rs_em_xdata;
                    elseif strcmp(allstrings_x(get(handles.popup_cell_par_x,'Value')),'Emitter junction depth')
                        xdata = handles.data.xj_xdata;
                    elseif strcmp(allstrings_x(get(handles.popup_cell_par_x,'Value')),'Effective carrier lifetime')
                        xdata = handles.data.tau_eff_xdata;
                    elseif strcmp(allstrings_x(get(handles.popup_cell_par_x,'Value')),'Injection level')
                        xdata = handles.data.delta_n_xdata;
                    elseif strcmp(allstrings_x(get(handles.popup_cell_par_x,'Value')),'Generation rate')
                        xdata = handles.data.G_xdata;
                    elseif strcmp(allstrings_x(get(handles.popup_cell_par_x,'Value')),'Sinton optical constant')
                        xdata = handles.data.OC_xdata;
                    elseif strcmp(allstrings_x(get(handles.popup_cell_par_x,'Value')),'Generalized lifetime at 1e15 cm-3')
                        xdata = handles.data.tau15_xdata;
                    elseif strcmp(allstrings_x(get(handles.popup_cell_par_x,'Value')),'Integrated weighted reflectance (%)')
                        xdata = handles.data.R_tot_xdata;
                    end

                    if get(handles.popup_cell_par_y,'Value') > 1

                        if get(handles.popup_cell_par_y,'Value') == 2
                            if ~isempty(results.Jsc)         
                                ydata = results.Jsc;
                            else
                                msgbox('Parameter not avilable. Run simulation with IV output to calculate cell parameters')
                            end
                        elseif get(handles.popup_cell_par_y,'Value') == 3
                            if ~isempty(results.Voc)                 
                                ydata = results.Voc;
                            else
                                msgbox('Run simulation with IV output to calculate cell parameters')
                            end
                        elseif get(handles.popup_cell_par_y,'Value') == 4
                            if ~isempty(results.FF)                 
                                ydata = results.FF;
                            else
                                msgbox('Run simulation with IV output to calculate cell parameters')
                            end
                        elseif get(handles.popup_cell_par_y,'Value') == 5
                            if ~isempty(results.eta)              
                                ydata = results.eta;
                            else
                                msgbox('Run simulation with IV output to calculate cell parameters')
                            end
                        elseif get(handles.popup_cell_par_y,'Value') == 6
                            if ~isempty(results.Rs_em)              
                                ydata = results.Rs_em;
                            else
                                msgbox('Parameter not avilable. Please make sure emitter is enabled')
                            end
                        elseif get(handles.popup_cell_par_y,'Value') == 7
                            if ~isempty(results.xj)              
                                ydata = results.xj;
                            else
                                msgbox('Parameter not avilable. Please make sure emitter is enabled')
                            end
                        elseif get(handles.popup_cell_par_y,'Value') == 8
                            if ~isempty(results.tau_eff)              
                                ydata = results.tau_eff;
                            else
                                msgbox('Parameter not avilable. Run simulation in steady state mode with no applied voltage and distance from front, Excess Electron Density and Cumulative Photogeneration as ouput')
                            end
                        elseif get(handles.popup_cell_par_y,'Value') == 9
                            if ~isempty(results.delta_n)              
                                ydata = results.delta_n;
                            else
                                msgbox('Parameter not avilable. Run simulation in steady state mode with no applied voltage and distance from front, Excess Electron Density and Cumulative Photogeneration as ouput')
                            end
                        elseif get(handles.popup_cell_par_y,'Value') == 10
                            if ~isempty(results.G)              
                                ydata = results.G;
                            else
                                msgbox('Parameter not avilable. Run simulation in steady state mode with no applied voltage and distance from front, Excess Electron Density and Cumulative Photogeneration as ouput')
                            end
                        elseif get(handles.popup_cell_par_y,'Value') == 11
                            if ~isempty(results.OC)              
                                ydata = results.OC;
                            else
                                msgbox('Parameter not avilable. Run simulation in steady state mode with no applied voltage and Cumulative Photgeneration as ouput')
                            end
                        elseif get(handles.popup_cell_par_y,'Value') == 12
                                if ~isempty(results.tau15)              
                                    ydata = results.tau15;
                                else
                                    msgbox('Parameter not avilable. Load a prm file that uses temporal transient excitation mode and auxilliary data. Then set Cumulative Photogeneration and Cumulative Excess Conductivity as output at the rear end of the wafer as results.')
                                end
                        elseif get(handles.popup_cell_par_y,'Value') == 13
                                if ~isempty(results.R_tot)              
                                    ydata = results.R_tot;
                                else
                                    msgbox('Parameter not avilable. Run simulation with Primary Source Wavelength and Pri-Surface Reflectance as output')
                                end
                        elseif get(handles.popup_cell_par_y,'Value') >= 14
                                pick_x = str2num(get(handles.edit_pick_x,'String'));
                                if ~isempty(pick_x)
                                    handles.data.results.pc1ddata
                                    for i = 1:length(handles.data.results.pc1ddata(:,1))
                                        for j = 1:length(handles.data.results.pc1ddata(1,:))
                                        tempx = handles.data.results.pc1ddata{i,j}(:,1);
                                        tempy = handles.data.results.pc1ddata{i,j}(:,get(handles.popup_cell_par_y,'Value') - 12);
                                        [tempx2,ind,~] = unique(tempx);
                                        tempy2         = tempy(ind);
                                        ydata(i,j)       = interp1(tempx2,tempy2,pick_x);
                                        end
                                    end
                                else
                                    msgbox('Parameter not avilable. Please set "Pick value at xdata = "')
                                end
                        end

                        if ~isempty(ydata)
                            set(handles.axes2,'Visible','on')
                            axes(handles.axes2)
                            if get(handles.check_hold,'Value') == 1
                                hold on
                            else
                                cla(handles.axes2,'reset');
                            end  

                            if length(xdata) == length(ydata(1,:))
                                hold on
                                for j = 1:length(ydata(:,1))
                                    if j < 8
                                        ps = 'o--';
                                    elseif j > 7 && j < 15
                                        ps = 's--';
                                    elseif j > 14 && j < 22
                                        ps = 'd--';
                                    else
                                        ps = 'x--';
                                    end
                                    if strcmp(handles.data.xscale_results,'linear') && strcmp(handles.data.yscale_results,'linear')
                                        set(gca,'Xscale','linear')
                                        set(gca,'Yscale','linear')
                                        plot(xdata,ydata(j,:),ps,'MarkerSize',7,'LineWidth',2)
                                        xlim([(min(xdata) - (max(xdata)-min(xdata))*0.1) (max(xdata) + (max(xdata)-min(xdata))*0.1)])
                                    elseif strcmp(handles.data.xscale_results,'log') && strcmp(handles.data.yscale_results,'linear')
                                        set(gca,'Xscale','log')
                                        set(gca,'Yscale','linear')
                                        semilogx(xdata,ydata(j,:),ps,'MarkerSize',7,'LineWidth',2)
                                    elseif strcmp(handles.data.xscale_results,'linear') && strcmp(handles.data.yscale_results,'log')
                                        set(gca,'Xscale','linear')
                                        set(gca,'Yscale','log')
                                        semilogy(xdata,ydata(j,:),ps,'MarkerSize',7,'LineWidth',2)
                                        xlim([(min(xdata) - (max(xdata)-min(xdata))*0.1) (max(xdata) + (max(xdata)-min(xdata))*0.1)])
                                    elseif strcmp(handles.data.xscale_results,'log') && strcmp(handles.data.yscale_results,'log')
                                        set(gca,'Xscale','log')
                                        set(gca,'Yscale','log')
                                        loglog(xdata,ydata(j,:),ps,'MarkerSize',7,'LineWidth',2)
                                    end                                                               
                                    co=get(gca,'ColorOrder');
                                    set(gca,'ColorOrder',co([2:end 1],:));                    
                                end
                                if length(ydata(:,1)) > 1
                                        legend(handles.data.legID2,'FontSize',8,'Location','Best');
                                end
                            else
                                hold on
                                for j = 1:length(ydata(1,:))
                                    if j < 8
                                        ps = 'o--';
                                    elseif j > 7 && j < 15
                                        ps = 's--';
                                    elseif j > 14 && j < 22
                                        ps = 'd--';
                                    else
                                        ps = 'x--';
                                    end
                                    if strcmp(handles.data.xscale_results,'linear') && strcmp(handles.data.yscale_results,'linear')
                                        set(gca,'Xscale','linear')
                                        set(gca,'Yscale','linear')
                                        plot(xdata,ydata(:,j),ps,'MarkerSize',7,'LineWidth',2)                        
                                        xlim([(min(xdata) - (max(xdata)-min(xdata))*0.1) (max(xdata) + (max(xdata)-min(xdata))*0.1)])
                                    elseif strcmp(handles.data.xscale_results,'log') && strcmp(handles.data.yscale_results,'linear')
                                        set(gca,'Xscale','log')
                                        set(gca,'Yscale','linear')
                                        semilogx(xdata,ydata(:,j),ps,'MarkerSize',7,'LineWidth',2)
                                    elseif strcmp(handles.data.xscale_results,'linear') && strcmp(handles.data.yscale_results,'log')
                                        set(gca,'Xscale','linear')
                                        set(gca,'Yscale','log')
                                        semilogy(xdata,ydata(:,j),ps,'MarkerSize',7,'LineWidth',2)                        
                                        xlim([(min(xdata) - (max(xdata)-min(xdata))*0.1) (max(xdata) + (max(xdata)-min(xdata))*0.1)])
                                    elseif strcmp(handles.data.xscale_results,'log') && strcmp(handles.data.yscale_results,'log')
                                        set(gca,'Xscale','log')
                                        set(gca,'Yscale','log')
                                        loglog(xdata,ydata(:,j),ps,'MarkerSize',7,'LineWidth',2)
                                    end                                           
                                    co=get(gca,'ColorOrder');
                                    set(gca,'ColorOrder',co([2:end 1],:));                    
                                end
                                if length(ydata(1,:)) > 1
                                    legend(handles.data.legID1,'FontSize',8,'Location','Best');
                                end
                            end
                            x_selected_string = allstrings_x(get(handles.popup_cell_par_x,'Value'));
                            x_selected_string = strrep(x_selected_string,'<html><font color="blue">','');
                            xlabel(x_selected_string,'FontSize',15)
                            y_selected_string = allstrings_y(get(handles.popup_cell_par_y,'Value'));
                            y_selected_string = strrep(y_selected_string,'<html><font color="blue">','');
                            ylabel(y_selected_string,'FontSize',15)

                        end

                    else
                        tab_plot_results_Callback(hObject, eventdata, handles)
                        msgbox('Please select y-data')
                    end
                else
                    tab_plot_results_Callback(hObject, eventdata, handles)
                    msgbox('Please select x-data')
                end

        elseif get(handles.check_select_2D,'Value') == 1

                    results = handles.data.results;

                    fx = 1;
                    fy = 1;

                    if get(handles.popup_cell_par_z,'Value') > 1

                        if length(handles.data.legID2) >1

                                xdata = handles.data.varyvals1a;
                                ydata = handles.data.varyvals2a;
                                zdata = [];

                                if length(xdata) > 10
                                    if handles.data.varyvals1_log == 1
                                        xdata_short = logspace(log10(min(xdata)),log10(max(xdata)),10);
                                    else
                                        xdata_short = linspace(min(xdata),max(xdata),10);
                                    end
                                else
                                    xdata_short = xdata;
                                end
                                if length(ydata) > 10                
                                    if handles.data.varyvals2_log == 1
                                        ydata_short = logspace(log10(min(ydata)),log10(max(ydata)),10);
                                    else
                                        ydata_short = linspace(min(ydata),max(ydata),10);
                                    end
                                else
                                    ydata_short = ydata;
                                end
                                    xdata_labels = fx*xdata_short;
                                    ydata_labels = fy*ydata_short;

                                if get(handles.popup_cell_par_z,'Value') > 1
                                    if get(handles.popup_cell_par_z,'Value') == 2
                                        if ~isempty(results.Jsc)         
                                            zdata = results.Jsc;
                                        else
                                            msgbox('Parameter not avilable. Run simulation with IV output to calculate cell parameters')
                                        end
                                    elseif get(handles.popup_cell_par_z,'Value') == 3
                                        if ~isempty(results.Voc)                 
                                            zdata = results.Voc;
                                        else
                                            msgbox('Run simulation with IV output to calculate cell parameters')
                                        end
                                    elseif get(handles.popup_cell_par_z,'Value') == 4
                                        if ~isempty(results.FF)                 
                                            zdata = results.FF;
                                        else
                                            msgbox('Run simulation with IV output to calculate cell parameters')
                                        end
                                    elseif get(handles.popup_cell_par_z,'Value') == 5
                                        if ~isempty(results.eta)              
                                            zdata = results.eta;
                                        else
                                            msgbox('Run simulation with IV output to calculate cell parameters')
                                        end
                                    elseif get(handles.popup_cell_par_z,'Value') == 6
                                        if ~isempty(results.Rs_em)              
                                            zdata = results.Rs_em;
                                        else
                                            msgbox('Parameter not avilable. Please make sure emitter is enabled')
                                        end
                                    elseif get(handles.popup_cell_par_z,'Value') == 7
                                        if ~isempty(results.xj)              
                                            zdata = results.xj;
                                        else
                                            msgbox('Parameter not avilable. Please make sure emitter is enabled')
                                        end
                                    elseif get(handles.popup_cell_par_z,'Value') == 8
                                        if ~isempty(results.tau_eff)              
                                            zdata = results.tau_eff;
                                        else
                                            msgbox('Parameter not avilable. Run simulation in steady state mode with no applied voltage and distance from front, Excess Electron Density and Cumulative Photogeneration as ouput')
                                        end
                                    elseif get(handles.popup_cell_par_z,'Value') == 9
                                        if ~isempty(results.delta_n)              
                                            zdata = results.delta_n;
                                        else
                                            msgbox('Parameter not avilable. Run simulation in steady state mode with no applied voltage and distance from front, Excess Electron Density and Cumulative Photogeneration as ouput')
                                        end
                                    elseif get(handles.popup_cell_par_z,'Value') == 10
                                        if ~isempty(results.G)              
                                            zdata = results.G;
                                        else
                                            msgbox('Parameter not avilable. Run simulation in steady state mode with no applied voltage and distance from front, Excess Electron Density and Cumulative Photogeneration as ouput')
                                        end
                                    elseif get(handles.popup_cell_par_z,'Value') == 11
                                        if ~isempty(results.OC)              
                                            zdata = results.OC;
                                        else
                                            msgbox('Parameter not avilable. Run simulation in steady state mode with no applied voltage and Cumulative Photgeneration as ouput')
                                        end
                                    elseif get(handles.popup_cell_par_z,'Value') == 12
                                            if ~isempty(results.tau15)              
                                                zdata = results.tau15;
                                            else
                                                msgbox('Parameter not avilable. Load a prm file that uses temporal transient excitation mode and auxilliary data. Then set Cumulative Photogeneration and Cumulative Excess Conductivity as output at the rear end of the wafer as results.')
                                            end
                                    elseif get(handles.popup_cell_par_z,'Value') == 13
                                            if ~isempty(results.R_tot)              
                                                zdata = results.R_tot;
                                            else
                                                msgbox('Parameter not avilable. Run simulation with Primary Source Wavelength and Pri-Surface Reflectance as output')
                                            end 
                                    elseif get(handles.popup_cell_par_z,'Value') >= 14
                                        pick_x = str2num(get(handles.edit_pick_x,'String'));
                                        if ~isempty(pick_x)
                                            zdata = zeros(length(handles.data.results.pc1ddata(:,1)),length(handles.data.results.pc1ddata(1,:)));
                                            for i = 1:length(handles.data.results.pc1ddata(:,1))
                                                for j = 1:length(handles.data.results.pc1ddata(1,:))
                                                    tempx = handles.data.results.pc1ddata{i,j}(:,1);
                                                    tempy = handles.data.results.pc1ddata{i,j}(:,get(handles.popup_cell_par_z,'Value') - 12);
                                                    [tempx2,ind,~] = unique(tempx);
                                                    tempy2         = tempy(ind);
                                                    zdata(i,j)     = interp1(tempx2,tempy2,pick_x);
                                                end
                                            end
                                        else
                                            msgbox('Parameter not avilable. Please set "Pick value at xdata = "')
                                        end
                                    end
                                end

                                if handles.data.varyvals1_log == 1
                                    xdata_plot = log10(xdata);
                                    xdata_tick = log10(xdata_short);
                                else
                                    xdata_plot = xdata;
                                    xdata_tick = xdata_short;
                                end
                                if handles.data.varyvals2_log == 1
                                    ydata_plot = log10(ydata);
                                    ydata_tick = log10(ydata_short);                
                                else
                                    ydata_plot = ydata;
                                    ydata_tick = ydata_short;  
                                end

                                if ~isempty(zdata)                
                                    set(handles.axes2,'Visible','on')
                                    axes(handles.axes2)
                                    if get(handles.check_hold,'Value') == 1
                                        hold on
                                    else
                                        cla(handles.axes2,'reset');
                                    end  
                                    imagesc(xdata_plot,ydata_plot,zdata) 
                                    colormap('jet')
                                    colorbar
                                    set(colorbar,'FontSize',15)                
                                    set(gca,'Xtick',xdata_tick)
                                    set(gca,'Ytick',ydata_tick)
                                    set(gca,'XtickLabel',xdata_labels)
                                    set(gca,'YtickLabel',ydata_labels)
                                    xlabel(handles.data.vary_leg_string1,'FontSize',20)
                                    ylabel(handles.data.vary_leg_string2,'FontSize',20) 
                                    dx = xdata_plot(2) - xdata_plot(1);
                                    dy = ydata_plot(2) - ydata_plot(1);
                                    xlim([min(xdata_plot) - 0.5*dx , max(xdata_plot) + 0.5*dx])
                                    ylim([min(ydata_plot) - 0.5*dy , max(ydata_plot) + 0.5*dy])
                                    set(handles.axes2,'XTickLabel', strrep(sprintf('%0.2g|', xdata_short),'e+00','e')); 
                                    set(handles.axes2,'YTickLabel', strrep(sprintf('%0.2g|', ydata_short),'e+00','e')); 
                                    allstrz = get(handles.popup_cell_par_z,'String');
                                    title(strrep(allstrz(get(handles.popup_cell_par_z,'Value')),'<html><font color="blue">',''),'FontSize',15);
                                end
                        else
                            msgbox('Run simulation with 2 parameter variations to plot 2D data')
                        end
                    else
                        msgbox('Please select parameter')
                    end
                    
        end

    else
        msgbox('Run a batch simulation before using this option')
        tab_run_simulation_Callback(hObject, eventdata, handles)
    end

    catch ME
        errordlg(['Error detected when executing "plot results": ' ME.message],'Error')    
        error(ME.message)
    end

% --- Executes on selection change in listbox_ydata_selection.
function listbox_ydata_selection_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function listbox_ydata_selection_CreateFcn(hObject, eventdata, handles)
        
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

% --- Executes on selection change in popup_cell_par_y.
function popup_cell_par_y_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function popup_cell_par_y_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% --------------------------------------------------------------------
function toolbar_edit_in_pc1d_ClickedCallback(hObject, eventdata, handles)

    try
         uiwait(msgbox('Save and close PC1D to continue. Open prm-file will not be saved.','','modal'));
         dos([handles.data.path 'temp.prm']); 


        parnames = handles.data.parnames;
        parindex_short = handles.data.parindex_short;
        parfit = handles.data.parfit;

        dos(['convert_prm_to_ascii temp.prm temp.txt']); 
        temp      = importdata('temp.txt');
        parstrings = cell(length(temp),1);
        parvalues = cell(length(temp),1);
        for i = 1:length(temp)
            tempi = temp{i};
            parstrings{i} = tempi(1:strfind(tempi,'=')); 
            if isempty(parstrings{i})
                parstrings{i} = tempi;
            end
            parvalues{i} = tempi(strfind(tempi,'=')+1:end);
        end

        handles.data.parstrings        = parstrings;
        handles.data.parvalues         = parvalues;    

        parnames_short = handles.data.parnames_short;
        parvalues_short = parvalues(parindex_short);
        parvalues_short = parvalues_short(handles.data.ind_sort);
        parfit_short = handles.data.parfit_short;
        set(handles.tab_all_par,'Data',[parnames_short parvalues_short parfit_short]);

        guidata(hObject, handles);
        btn_update_Callback(hObject, eventdata, handles);

    catch ME
        errordlg(['Error detected when executing "edit in PC1D": ' ME.message],'Error')    
        error(ME.message)
    end

% --- Executes when entered data in editable cell(s) in tab_all_par.
function tab_all_par_CellEditCallback(hObject, eventdata, handles)
    
    try
       btn_update_Callback(hObject, eventdata, handles);
    end

% --- Executes when selected cell(s) is changed in tab_all_par.
function tab_all_par_CellSelectionCallback(hObject, eventdata, handles)


% --- Executes on selection change in popup_vary2a.
function popup_vary2a_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function popup_vary2a_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
% --- 
function edit_from2a_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit_from2a_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

% --- 
function edit_step2a_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit_step2a_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function edit_to2a_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit_to2a_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% --- Executes on button press in check_log_batch2a.
function check_log_batch2a_Callback(hObject, eventdata, handles)

% --- Executes on selection change in popup_vary2b.
function popup_vary2b_Callback(hObject, eventdata, handles)

    if get(hObject,'Value') > 1
        set(handles.edit_from2b,'Visible','on')
        set(handles.edit_step2b,'Visible','on')
        set(handles.edit_to2b,'Visible','on')
        set(handles.check_log_batch2b,'Visible','on')
    %     set(handles.edit_from2b,'String',get(handles.edit_from2a,'String'))
    %     set(handles.edit_step2b,'String',get(handles.edit_step2a,'String'))
    %     set(handles.edit_to2b,'String',get(handles.edit_to2a,'String'))
    %     set(handles.check_log_batch2b,'Value',get(handles.check_log_batch2b,'Value'))
    else
        set(handles.edit_from2b,'Visible','off')
        set(handles.edit_step2b,'Visible','off')
        set(handles.edit_to2b,'Visible','off')
        set(handles.check_log_batch2b,'Visible','off')
    end


% --- Executes during object creation, after setting all properties.
function popup_vary2b_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
% ---
function edit_from2b_Callback(hObject, eventdata, handles)
    
% --- Executes during object creation, after setting all properties.
function edit_from2b_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% ---
function edit_step2b_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit_step2b_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function edit_to2b_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit_to2b_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% --- Executes on button press in check_log_batch2b.
function check_log_batch2b_Callback(hObject, eventdata, handles)

% ---
function edit_batch_legend2_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit_batch_legend2_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

% --- Executes on button press in check_vary2_enable.
function check_vary2_enable_Callback(hObject, eventdata, handles)
    
    if get(hObject,'Value') == 1
        set(handles.popup_vary2a,'Visible','on')
        set(handles.edit_from2a,'Visible','on')
        set(handles.edit_step2a,'Visible','on')
        set(handles.edit_to2a,'Visible','on')
        set(handles.check_log_batch2a,'Visible','on')
        set(handles.edit_batch_legend2,'Visible','on')
        set(handles.text53,'Visible','on')
        set(handles.text54,'Visible','on')
        set(handles.edit_batch_factor2,'Visible','on')
        set(handles.text46,'Visible','on')
        set(handles.check_linked2,'Visible','on')
        set(handles.text38,'Visible','on')
    else
        set(handles.popup_vary2a,'Visible','off')
        set(handles.edit_from2a,'Visible','off')
        set(handles.edit_step2a,'Visible','off')
        set(handles.edit_to2a,'Visible','off')
        set(handles.check_log_batch2a,'Visible','off')
        set(handles.edit_batch_legend2,'Visible','off')
        set(handles.text53,'Visible','off')
        set(handles.text54,'Visible','off')
        set(handles.edit_batch_factor2,'Visible','off')
        set(handles.text46,'Visible','off')
        set(handles.popup_vary2b,'Visible','off')
        set(handles.edit_from2b,'Visible','off')
        set(handles.edit_step2b,'Visible','off')
        set(handles.edit_to2b,'Visible','off')
        set(handles.check_log_batch2b,'Visible','off')
        set(handles.check_linked2,'Visible','off')
        set(handles.check_linked2,'Value',0)
        set(handles.text38,'Visible','off')
        set(handles.uipanel31,'Visible','off')
    end  


% --- Executes during object creation, after setting all properties.
function check_vary2_enable_CreateFcn(hObject, eventdata, handles)


% --- Executes on selection change in popup_plot_select_vary2.
function popup_plot_select_vary2_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function popup_plot_select_vary2_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% --------------------------------------------------------------------
function toolbar_save_results_ClickedCallback(hObject, eventdata, handles)

    try

    handles.data.object_values.radio_xscale_lin_value = get(handles.radio_xscale_lin,'Value');
    handles.data.object_values.radio_xscale_log_value = get(handles.radio_xscale_log,'Value');
    handles.data.object_values.check_abs_x_value = get(handles.check_abs_x,'Value');
    handles.data.object_values.radio_yscale_lin_value = get(handles.radio_yscale_lin,'Value');
    handles.data.object_values.radio_yscale_log_value = get(handles.radio_yscale_log,'Value');
    handles.data.object_values.check_abs_y_value = get(handles.check_abs_y,'Value');
    handles.data.object_values.listbox_ydata_selection_value = get(handles.listbox_ydata_selection,'Value');
    handles.data.object_values.listbox_ydata_selection_string = get(handles.listbox_ydata_selection,'String');
    handles.data.object_values.listbox_xdata_selection_value = get(handles.listbox_xdata_selection,'Value');
    handles.data.object_values.listbox_xdata_selection_string = get(handles.listbox_xdata_selection,'String');
    handles.data.object_values.popup_plot_select_vary2_value = get(handles.popup_plot_select_vary2,'Value');
    handles.data.object_values.popup_plot_select_vary2_string = get(handles.popup_plot_select_vary2,'String');
    handles.data.object_values.popup_plot_select_vary2_visible = get(handles.popup_plot_select_vary2,'Visible');
    handles.data.object_values.popup_cell_par_x_value = get(handles.popup_cell_par_x,'Value');
    handles.data.object_values.popup_cell_par_x_string = get(handles.popup_cell_par_x,'String');
    handles.data.object_values.popup_cell_par_y_value = get(handles.popup_cell_par_y,'Value');
    handles.data.object_values.popup_cell_par_y_string = get(handles.popup_cell_par_y,'String');
    handles.data.object_values.radio_xscale_results_lin_value = get(handles.radio_xscale_results_lin,'Value');
    handles.data.object_values.radio_xscale_results_log_value = get(handles.radio_xscale_results_log,'Value');
    handles.data.object_values.radio_yscale_results_lin_value = get(handles.radio_yscale_results_lin,'Value');
    handles.data.object_values.radio_yscale_results_log_value = get(handles.radio_yscale_results_log,'Value');
    handles.data.object_values.popup_cell_par_z_value = get(handles.popup_cell_par_z,'Value');
    handles.data.object_values.popup_cell_par_z_string = get(handles.popup_cell_par_z,'String');
    handles.data.object_values.text_simulation_type_string = get(handles.text_simulation_type,'String');
    handles.data.object_values.text_simulation_type_visible = get(handles.text_simulation_type,'Visible');
    handles.data.object_values.text_simulation_type2_string = get(handles.text_simulation_type2,'String');
    handles.data.object_values.text_simulation_type2_visible = get(handles.text_simulation_type2,'Visible');

    guidata(hObject, handles);
    h = handles.data;
    uisave('h')

    catch ME
        errordlg(['Error detected when executing "save results": ' ME.message],'Error')    
        error(ME.message)
    end

% --------------------------------------------------------------------
function toolbar_load_results_ClickedCallback(hObject, eventdata, handles)

    try

    [file,path] = uigetfile({'*.mat*'},'Select file');
    if file ~= 0
        load([path file])
        handles.data = h;

        write_to_prm(handles.data.parstrings,handles.data.parvalues)

        set(handles.radio_xscale_lin,'Value',handles.data.object_values.radio_xscale_lin_value);
        set(handles.radio_xscale_log,'Value',handles.data.object_values.radio_xscale_log_value);
        set(handles.check_abs_x,'Value',handles.data.object_values.check_abs_x_value);
        set(handles.radio_yscale_lin,'Value',handles.data.object_values.radio_yscale_lin_value);
        set(handles.radio_yscale_log,'Value',handles.data.object_values.radio_yscale_log_value);
        set(handles.check_abs_y,'Value',handles.data.object_values.check_abs_y_value);
        set(handles.listbox_ydata_selection,'Value',handles.data.object_values.listbox_ydata_selection_value);
        set(handles.listbox_ydata_selection,'String',handles.data.object_values.listbox_ydata_selection_string);
        set(handles.listbox_xdata_selection,'Value',handles.data.object_values.listbox_xdata_selection_value);
        set(handles.listbox_xdata_selection,'String',handles.data.object_values.listbox_xdata_selection_string);
        set(handles.popup_plot_select_vary2,'Value',handles.data.object_values.popup_plot_select_vary2_value);
        set(handles.popup_plot_select_vary2,'String',handles.data.object_values.popup_plot_select_vary2_string);
        set(handles.popup_plot_select_vary2,'Visible',handles.data.object_values.popup_plot_select_vary2_visible);
        set(handles.popup_cell_par_x,'Value',handles.data.object_values.popup_cell_par_x_value);
        set(handles.popup_cell_par_x,'String',handles.data.object_values.popup_cell_par_x_string);
        set(handles.popup_cell_par_y,'Value',handles.data.object_values.popup_cell_par_y_value);
        set(handles.popup_cell_par_y,'String',handles.data.object_values.popup_cell_par_y_string);
        set(handles.radio_xscale_results_lin,'Value',handles.data.object_values.radio_xscale_results_lin_value);
        set(handles.radio_xscale_results_log,'Value',handles.data.object_values.radio_xscale_results_log_value);
        set(handles.radio_yscale_results_lin,'Value',handles.data.object_values.radio_yscale_results_lin_value);
        set(handles.radio_yscale_results_log,'Value',handles.data.object_values.radio_yscale_results_log_value);
        set(handles.popup_cell_par_z,'Value',handles.data.object_values.popup_cell_par_z_value);
        set(handles.popup_cell_par_z,'String',handles.data.object_values.popup_cell_par_z_string);
        set(handles.text_simulation_type,'String',handles.data.object_values.text_simulation_type_string);
        set(handles.text_simulation_type,'Visible',handles.data.object_values.text_simulation_type_visible);
        set(handles.text_simulation_type2,'String',handles.data.object_values.text_simulation_type2_string);
        set(handles.text_simulation_type2,'Visible',handles.data.object_values.text_simulation_type2_visible);

        handles.data.object_values = [];

        guidata(hObject, handles);
    end

    catch ME
        errordlg(['Error detected when executing "load results": ' ME.message],'Error')    
        error(ME.message)
    end

% --------------------------------------------------------------------
function toolbar_save_parameters_ClickedCallback(hObject, eventdata, handles)
    
    try

    [file path] = uiputfile('.txt','Save parameters as text file');
    
    if file ~= 0

                    lh = length(handles.data.results.pc1dheaders);
                    ld = length(handles.data.results.pc1ddata);
                    alldata = [];

            if strcmp(get(handles.text_simulation_type,'String'),'Batch simulation - 2 parameters') == 1

                    fid = fopen([path file],'wt');
                    fprintf(fid, '%s\n', ['PC1D simulation results from: ' handles.data.prm_file_name]);
                    fprintf(fid, '%s\n', get(handles.text_simulation_type,'String'));
                    fprintf(fid, '%s\n', ' ');
                    fprintf(fid, '%s\n', ['Parameter variation 1 (horisontal, increasing to the right) - ' handles.data.vary_leg_string1 ':']);
                    fprintf(fid, [repmat('%g\t',1,ld-1) '%g\n'], handles.data.varyvals1a);
                    fprintf(fid, '%s\n', ['Parameter variation 2 (vertical, increasing downwards) - ' handles.data.vary_leg_string2 ':']);
                    fprintf(fid, [repmat('%g\t',1,ld-1) '%g\n'], handles.data.varyvals2a);
                    fprintf(fid, '%s\n', ' ');
                    fprintf(fid, '%s\n', 'Jsc = ');
                    fprintf(fid, [repmat('%f\t',1,length(handles.data.results.Jsc(1,:))-1) '%f\n'], handles.data.results.Jsc'); 
                    fprintf(fid, '%s\n', ' ');
                    fprintf(fid, '%s\n', 'Voc = ');
                    fprintf(fid, [repmat('%f\t',1,length(handles.data.results.Voc(1,:))-1) '%f\n'], handles.data.results.Voc'); 
                    fprintf(fid, '%s\n', ' ');
                    fprintf(fid, '%s\n', 'FF = ');
                    fprintf(fid, [repmat('%f\t',1,length(handles.data.results.FF(1,:))-1) '%f\n'], handles.data.results.FF'); 
                    fprintf(fid, '%s\n', ' ');
                    fprintf(fid, '%s\n', 'Efficiency = ');
                    fprintf(fid, [repmat('%f\t',1,length(handles.data.results.eta(1,:))-1) '%f\n'], handles.data.results.eta'); 
                    fclose(fid);
            else

                    for j = 1:ld
                    alldata = [alldata handles.data.results.pc1ddata{j}];
                    end       

                    if strcmp(get(handles.text_simulation_type,'String'),'Single simulation') == 1

                        allresults = [handles.data.results.Jsc' handles.data.results.Voc' handles.data.results.FF' handles.data.results.eta'];

                        fid = fopen([path file],'wt');
                        fprintf(fid, '%s\n', ['PC1D simulation results from: ' handles.data.prm_file_name]);
                        fprintf(fid, '%s\n', get(handles.text_simulation_type,'String'));
                        fprintf(fid, '%s\n', ' ');

                        if handles.data.IVdata_selected == 1
                        fprintf(fid, '%s\t', ' Jsc (mA/cm2)');
                        fprintf(fid, '%s\t', ' Voc (V)'     );
                        fprintf(fid, '%s\t', ' FF (%)      ');
                        fprintf(fid, '%s\n', ' Efficiency (%)');      
                        fprintf(fid, '%f \t %f \t %f \t %f \n',allresults'); 
                        fprintf(fid, '%s\n', ' ');    
                        end

                        for k = 1:ld-1
                            for i = 1:lh
                               fprintf(fid, '%s\t', strrep(handles.data.results.pc1dheaders{i},'<html><font color="blue">',''));
                            end
                        end
                        for i = 1:lh-1
                           fprintf(fid, '%s\t', strrep(handles.data.results.pc1dheaders{i},'<html><font color="blue">',''));
                        end
                        fprintf(fid, '%s\n', strrep(handles.data.results.pc1dheaders{lh},'<html><font color="blue">',''));
                        fprintf(fid, [repmat('%g\t',1,ld*lh-1) '%g\n'], alldata');    
                        fclose(fid);

                    else

                        allresults = [handles.data.varyvals1a' handles.data.results.Jsc' ...
                        handles.data.results.Voc' handles.data.results.FF' handles.data.results.eta'];  

                        fid = fopen([path file],'wt');
                        fprintf(fid, '%s\n', ['PC1D simulation results from: ' handles.data.prm_file_name]);
                        fprintf(fid, '%s\n', get(handles.text_simulation_type,'String'));
                        fprintf(fid, '%s\n', ' ');

                        if handles.data.IVdata_selected == 1
                        fprintf(fid, '%s\t', handles.data.vary_leg_string1);
                        fprintf(fid, '%s\t', ' Jsc (mA/cm2)');
                        fprintf(fid, '%s\t', ' Voc (V)    ');
                        fprintf(fid, '%s\t', ' FF (%)     ');
                        fprintf(fid, '%s\n', ' Efficiency (%)');      
                        fprintf(fid, '%f \t %f \t %f \t %f \t %f \n',allresults'); 
                        end
                        fprintf(fid, '%s\n', ' ');    
                        fprintf(fid, '%s\n', ['Parameter variation - ' handles.data.vary_leg_string1 ':']);
                        fprintf(fid, [repmat('%g\t',1,ld-1) '%g\n'], handles.data.varyvals1a);
                        for k = 1:ld-1
                            for i = 1:lh
                               fprintf(fid, '%s\t', strrep(handles.data.results.pc1dheaders{i},'<html><font color="blue">',''));
                            end
                        end
                        for i = 1:lh-1
                           fprintf(fid, '%s\t', strrep(handles.data.results.pc1dheaders{i},'<html><font color="blue">',''));
                        end
                        fprintf(fid, '%s\n', strrep(handles.data.results.pc1dheaders{lh},'<html><font color="blue">',''));
                        fprintf(fid, [repmat('%g\t',1,ld*lh-1) '%g\n'], alldata');    
                        fclose(fid);

                    end
            end

            dos(['notepad ' path file ' &']);
    end

    catch ME
        errordlg(['Error detected when executing "export data": ' ME.message],'Error')   
        error(ME.message)
    end


% --- Executes on button press in btn_update2.
function btn_update2_Callback(hObject, eventdata, handles)

    try

    parvalues = handles.data.parvalues;
    parindex_short = handles.data.parindex_short;
    tab_data2 = get(handles.tab_all_par2,'Data');
    parvalues2 = tab_data2(:,2);
    parfit2 = tab_data2(:,3);

    temp_par_2(1:2:31) = parvalues2';
    temp_par_2(2:2:30)   = {',',',',',',',',',',',',',',',',',',',',',',',',',',',',','};  
    parvalues{2} = strcat(temp_par_2{:});

    parnames_short = handles.data.parnames_short;
    parfit_sort = handles.data.parfit_sort;


    if str2num(parvalues2{2}) == 1

        f       = str2num(parvalues2{3});    
        p       = str2num(parvalues2{4});    
        S_met   = str2num(parvalues2{5});
        S_pass  = str2num(parvalues2{6});
        RsA     = str2num(parvalues2{7}); 
        A       = str2num(parvalues{212+handles.data.parfix});
        D       = 35;                                       % FIX!
        W       = str2num(parvalues{194});                  

        S_eff = (D/W)*((p/(2*W*sqrt(pi*f)))*atan((2*W/p)*sqrt(pi/f))-exp(-W/p)+D/(f*W*S_met))^(-1) + S_pass/(1-f);
        Rs      = RsA/(f*A);

         parvalues{208} = num2str(S_eff);
         parvalues{209} = num2str(S_eff);        
         parvalues{231+handles.data.parfix} = num2str(Rs);   
    end

    if str2num(parvalues2{8}) == 1

        Rs_em = handles.data.Rs_em;

        S       = str2num(parvalues2{9});    
        wf      = str2num(parvalues2{10});    
        lf      = str2num(parvalues2{11});
        df      = str2num(parvalues2{12});
        wb      = str2num(parvalues2{13});    
        db      = str2num(parvalues2{14});
        rhom    = str2num(parvalues2{15});
        rhoc    = str2num(parvalues2{16}); 
        A       = str2num(parvalues{212+handles.data.parfix});  

        R_em    = (1/A)*(rhom*S*lf^2/(3*df*wf) + rhom*A/(3*db*wb) + rhoc*S/wf + Rs_em*S^2/12);
        f_shad  = wf/S + wb/sqrt(A);

        Int = str2num(parvalues2{1});
        if Int == 0
             Int = 0.1;
             msgbox('Intensity value can not be zero when front contact grid is enabled. Value was changed to 0.1 W/cm^2')
        end

        parvalues{230+handles.data.parfix} = num2str(R_em);
        if strcmp(parvalues{300+handles.data.parfix},'scan-qe.exc') == 0
            parvalues{249+handles.data.parfix} = num2str(Int*(1-f_shad));
            parvalues{250+handles.data.parfix} = num2str(Int*(1-f_shad));
        end  
    end

        parvalues_short = parvalues(parindex_short);
        parvalues_short = parvalues_short(handles.data.ind_sort);        
        set(handles.tab_all_par,'Data',[parnames_short parvalues_short parfit_sort]);

         handles.data.parvalues = parvalues;
         handles.data.parvalues2 = parvalues2;
         handles.data.parfit2 = parfit2;
         guidata(hObject, handles);

         btn_update_Callback(hObject, eventdata, handles); 

    catch ME
        errordlg(['Error detected when executing "update values and table from secondary parameters": ' ME.message],'Error')    
        error(ME.message)
    end

% --- Executes on button press in btn_update_parvalues2.
function btn_update_parvalues2_Callback(hObject, eventdata, handles)

    try

    parvalues2 = handles.data.parvalues2;
    parvalues = handles.data.parvalues;

    temp_par_2(1:2:31) = parvalues2';
    temp_par_2(2:2:30)   = {',',',',',',',',',',',',',',',',',',',',',',',',',',',',','};  
    parvalues{2} = strcat(temp_par_2{:});

    if str2num(parvalues2{2}) == 1

        f       = str2num(parvalues2{3});    
        p       = str2num(parvalues2{4});    
        S_met   = str2num(parvalues2{5});
        S_pass  = str2num(parvalues2{6});
        rhoc    = str2num(parvalues2{7}); 
        A       = str2num(parvalues{212+handles.data.parfix});
        D       = 35;                                       % FIX!
        W       = str2num(parvalues{194});                  

        S_eff       = (D/W)/((p/(2*W*sqrt(pi*f)))*atan((2*W/p)*sqrt(pi/f))-exp(-W/p)+D/(f*W*S_met)) + S_pass/(1-f);
        R_base      = rhoc/(f*A);

        parvalues{208} = num2str(S_eff);
        parvalues{209} = num2str(S_eff);
        parvalues{231+handles.data.parfix} = num2str(R_base);         
    end   

    if str2num(parvalues2{8}) == 1

        Rs_em = handles.data.Rs_em;

        S       = str2num(parvalues2{9});    
        wf      = str2num(parvalues2{10});    
        lf      = str2num(parvalues2{11});
        df      = str2num(parvalues2{12});
        wb      = str2num(parvalues2{13});    
        db      = str2num(parvalues2{14});
        rhom    = str2num(parvalues2{15});
        rhoc    = str2num(parvalues2{16}); 
        A       = str2num(parvalues{212+handles.data.parfix});  

        Rf      = rhom*S*lf^2/(3*df*wf); %Area specific resistance in fingers
        Rb      = 0;                     %Area specific resistance in busbar (set to 0)
        Rc      = rhoc*S/wf;             %Area specific contact resistance under fingers
        Re      = Rs_em*S^2/12;          %Area specific resistance in the emitter
        R_em    = (Rf+Rb+Rc+Re)/A;       %Front side series resistance (ohm)
        
        f_shad  = wf/S + wb/(2*lf+wb);   %Shading fraction from metallization grid
        
        Int = str2num(handles.data.parvalues2{1});
        if Int == 0
             Int = 0.1;
             msgbox('Intensity value can not be zero when front contact grid is enabled. Value was changed to 0.1 W/cm^2')
         end

        parvalues{230+handles.data.parfix} = num2str(R_em);
        if strcmp(parvalues{300+handles.data.parfix},'scan-qe.exc') == 0
            parvalues{249+handles.data.parfix} = num2str(Int*(1-f_shad));
            parvalues{250+handles.data.parfix} = num2str(Int*(1-f_shad));
        end

    end   

         handles.data.parvalues = parvalues;
         handles.data.parvalues2 = parvalues2;
         guidata(hObject, handles);         

    catch ME
        errordlg(['Error detected when executing "Update secondary parameters": ' ME.message],'Error')    
        error(ME.message)
    end

% --- Executes on button press in btn_update2.
function btn_update_colors_Callback(hObject, eventdata, handles)

    try
    parvalues = handles.data.parvalues;
    parvalues2 = handles.data.parvalues2;
    parindex_short = handles.data.parindex_short;
    parnames_short = handles.data.parnames_short;
    parfit_sort = handles.data.parfit_sort;
    parvalues_color = parvalues;

    if str2num(parvalues{9}) == 0   
        parvalues_color{17} = ['<html><font color="white">' parvalues_color{17}];
        parvalues_color{18} = ['<html><font color="white">' parvalues_color{18}];
        parvalues_color{19} = ['<html><font color="white">' parvalues_color{19}];
        parvalues_color{20} = ['<html><font color="white">' parvalues_color{20}];
        parvalues_color{21} = ['<html><font color="white">' parvalues_color{21}];
        parvalues_color{22} = ['<html><font color="white">' parvalues_color{22}];
        parvalues_color{23} = ['<html><font color="white">' parvalues_color{23}]; 
        parvalues{12}(min(strfind(parvalues{12},'<')):max(strfind(parvalues{12},'>'))) = []; 
    else
        parvalues_color{12} = ['<html><font color="white">' parvalues_color{12}];    
        parvalues{17}(min(strfind(parvalues{17},'<')):max(strfind(parvalues{17},'>'))) = [];
        parvalues{18}(min(strfind(parvalues{18},'<')):max(strfind(parvalues{18},'>'))) = [];
        parvalues{19}(min(strfind(parvalues{19},'<')):max(strfind(parvalues{19},'>'))) = [];
        parvalues{20}(min(strfind(parvalues{20},'<')):max(strfind(parvalues{20},'>'))) = [];
        parvalues{21}(min(strfind(parvalues{21},'<')):max(strfind(parvalues{21},'>'))) = [];
        parvalues{22}(min(strfind(parvalues{22},'<')):max(strfind(parvalues{22},'>'))) = [];
        parvalues{23}(min(strfind(parvalues{23},'<')):max(strfind(parvalues{23},'>'))) = [];   
    end
    if str2num(parvalues{25}) == 0   
        parvalues_color{33} = ['<html><font color="white">' parvalues_color{33}];
        parvalues_color{34} = ['<html><font color="white">' parvalues_color{34}];
        parvalues_color{35} = ['<html><font color="white">' parvalues_color{35}];
        parvalues_color{36} = ['<html><font color="white">' parvalues_color{36}];
        parvalues_color{37} = ['<html><font color="white">' parvalues_color{37}];
        parvalues_color{38} = ['<html><font color="white">' parvalues_color{38}];
        parvalues_color{39} = ['<html><font color="white">' parvalues_color{39}]; 
        parvalues{28}(min(strfind(parvalues{28},'<')):max(strfind(parvalues{28},'>'))) = []; 
    else
        parvalues_color{28} = ['<html><font color="white">' parvalues_color{28}];    
        parvalues{33}(min(strfind(parvalues{17},'<')):max(strfind(parvalues{33},'>'))) = [];
        parvalues{34}(min(strfind(parvalues{18},'<')):max(strfind(parvalues{34},'>'))) = [];
        parvalues{35}(min(strfind(parvalues{19},'<')):max(strfind(parvalues{35},'>'))) = [];
        parvalues{36}(min(strfind(parvalues{20},'<')):max(strfind(parvalues{36},'>'))) = [];
        parvalues{37}(min(strfind(parvalues{21},'<')):max(strfind(parvalues{37},'>'))) = [];
        parvalues{38}(min(strfind(parvalues{22},'<')):max(strfind(parvalues{38},'>'))) = [];
        parvalues{39}(min(strfind(parvalues{23},'<')):max(strfind(parvalues{39},'>'))) = [];   
    end
    if str2num(parvalues{42}) == 0   
        parvalues_color{45} = ['<html><font color="white">' parvalues_color{45}];
        parvalues_color{46} = ['<html><font color="white">' parvalues_color{46}];
        parvalues_color{47} = ['<html><font color="white">' parvalues_color{47}];
    else
        parvalues{45}(min(strfind(parvalues{45},'<')):max(strfind(parvalues{45},'>'))) = [];
        parvalues{46}(min(strfind(parvalues{46},'<')):max(strfind(parvalues{46},'>'))) = [];
        parvalues{47}(min(strfind(parvalues{47},'<')):max(strfind(parvalues{47},'>'))) = [];
    end
    if str2num(parvalues{49}) == 0   
        parvalues_color{52} = ['<html><font color="white">' parvalues_color{52}];
        parvalues_color{53} = ['<html><font color="white">' parvalues_color{53}];
        parvalues_color{54} = ['<html><font color="white">' parvalues_color{54}];
    else
        parvalues{52}(min(strfind(parvalues{52},'<')):max(strfind(parvalues{52},'>'))) = [];
        parvalues{53}(min(strfind(parvalues{53},'<')):max(strfind(parvalues{53},'>'))) = [];
        parvalues{54}(min(strfind(parvalues{54},'<')):max(strfind(parvalues{54},'>'))) = [];
    end
    if str2num(parvalues{164}) == 0   
        parvalues_color{165} = ['<html><font color="white">' parvalues_color{166}];
        parvalues_color{166} = ['<html><font color="white">' parvalues_color{166}];
        parvalues_color{167} = ['<html><font color="white">' parvalues_color{167}];
        parvalues_color{168} = ['<html><font color="white">' parvalues_color{168}];
        parvalues_color{169} = ['<html><font color="white">' parvalues_color{169}];
    else
        parvalues{165}(min(strfind(parvalues{165},'<')):max(strfind(parvalues{165},'>'))) = [];
        parvalues{166}(min(strfind(parvalues{166},'<')):max(strfind(parvalues{166},'>'))) = [];
        parvalues{167}(min(strfind(parvalues{167},'<')):max(strfind(parvalues{167},'>'))) = [];
        parvalues{168}(min(strfind(parvalues{168},'<')):max(strfind(parvalues{168},'>'))) = [];
        parvalues{169}(min(strfind(parvalues{169},'<')):max(strfind(parvalues{169},'>'))) = [];
    end
    if str2num(parvalues{180}) == 0   
        parvalues_color{181} = ['<html><font color="white">' parvalues_color{181}];
        parvalues_color{182} = ['<html><font color="white">' parvalues_color{182}];
        parvalues_color{183} = ['<html><font color="white">' parvalues_color{183}];
        parvalues_color{184} = ['<html><font color="white">' parvalues_color{184}];
        parvalues_color{185} = ['<html><font color="white">' parvalues_color{185}];
    else
        parvalues{181}(min(strfind(parvalues{181},'<')):max(strfind(parvalues{181},'>'))) = [];
        parvalues{182}(min(strfind(parvalues{182},'<')):max(strfind(parvalues{182},'>'))) = [];
        parvalues{183}(min(strfind(parvalues{183},'<')):max(strfind(parvalues{183},'>'))) = [];
        parvalues{184}(min(strfind(parvalues{184},'<')):max(strfind(parvalues{184},'>'))) = [];
        parvalues{185}(min(strfind(parvalues{185},'<')):max(strfind(parvalues{185},'>'))) = [];
    end
    if str2num(parvalues{214}) == 0   
        parvalues_color{215} = ['<html><font color="white">' parvalues_color{215}];
        parvalues_color{216} = ['<html><font color="white">' parvalues_color{216}];
    else
        parvalues{215}(min(strfind(parvalues{215},'<')):max(strfind(parvalues{215},'>'))) = [];
        parvalues{216}(min(strfind(parvalues{216},'<')):max(strfind(parvalues{216},'>'))) = [];
    end
    if str2num(parvalues{217}) == 0   
        parvalues_color{218} = ['<html><font color="white">' parvalues_color{218}];
        parvalues_color{219} = ['<html><font color="white">' parvalues_color{219}];
    else
        parvalues{218}(min(strfind(parvalues{215},'<')):max(strfind(parvalues{218},'>'))) = [];
        parvalues{219}(min(strfind(parvalues{216},'<')):max(strfind(parvalues{219},'>'))) = [];
    end
    if str2num(parvalues{220}) == 0   
        parvalues_color{221} = ['<html><font color="white">' parvalues_color{221}];
        parvalues_color{222} = ['<html><font color="white">' parvalues_color{222}];
    else
        parvalues{221}(min(strfind(parvalues{221},'<')):max(strfind(parvalues{221},'>'))) = [];
        parvalues{222}(min(strfind(parvalues{222},'<')):max(strfind(parvalues{222},'>'))) = [];
    end
    if str2num(parvalues{223}) == 0   
        parvalues_color{224} = ['<html><font color="white">' parvalues_color{224}];
        parvalues_color{225} = ['<html><font color="white">' parvalues_color{225}];
    else
        parvalues{224}(min(strfind(parvalues{224},'<')):max(strfind(parvalues{224},'>'))) = [];
        parvalues{225}(min(strfind(parvalues{225},'<')):max(strfind(parvalues{225},'>'))) = [];
    end
    if str2num(parvalues{302}) == 0 || str2num(parvalues{302}) == 1   
        parvalues_color{249} = ['<html><font color="white">' parvalues_color{249}];
        parvalues_color{250} = ['<html><font color="white">' parvalues_color{250}];
        parvalues_color{285} = ['<html><font color="white">' parvalues_color{285}];
        parvalues_color{286} = ['<html><font color="white">' parvalues_color{286}];
        parvalues_color{303} = ['<html><font color="white">' parvalues_color{303}];
        parvalues_color{304} = ['<html><font color="white">' parvalues_color{304}];
        parvalues_color{305} = ['<html><font color="white">' parvalues_color{305}];
        parvalues{248}(min(strfind(parvalues{248},'<')):max(strfind(parvalues{218},'>'))) = [];
    else
        parvalues_color{248} = ['<html><font color="white">' parvalues_color{248}];
        parvalues{249}(min(strfind(parvalues{249},'<')):max(strfind(parvalues{249},'>'))) = [];
        parvalues{250}(min(strfind(parvalues{250},'<')):max(strfind(parvalues{250},'>'))) = [];
        parvalues{285}(min(strfind(parvalues{285},'<')):max(strfind(parvalues{285},'>'))) = [];
        parvalues{286}(min(strfind(parvalues{286},'<')):max(strfind(parvalues{286},'>'))) = [];
        parvalues{303}(min(strfind(parvalues{303},'<')):max(strfind(parvalues{303},'>'))) = [];
        parvalues{304}(min(strfind(parvalues{304},'<')):max(strfind(parvalues{304},'>'))) = [];
        parvalues{305}(min(strfind(parvalues{305},'<')):max(strfind(parvalues{305},'>'))) = [];
    end

    if str2num(parvalues2{2}) == 1   
         parvalues_color{208} = ['<html><font color="red">' parvalues_color{208}];
         parvalues_color{209} = ['<html><font color="red">' parvalues_color{209}];
         parvalues_color{231+handles.data.parfix} = ['<html><font color="red">' parvalues_color{231+handles.data.parfix}];     
    else
        parvalues{208}(min(strfind(parvalues{208},'<')):max(strfind(parvalues{208},'>'))) = [];
        parvalues{209}(min(strfind(parvalues{209},'<')):max(strfind(parvalues{209},'>'))) = [];
        parvalues{231+handles.data.parfix}(min(strfind(parvalues{231+handles.data.parfix},'<')):max(strfind(parvalues{231+handles.data.parfix},'>'))) = [];
    end

    if str2num(parvalues2{8}) == 1        
        parvalues_color{230+handles.data.parfix} = ['<html><font color="red">' parvalues_color{230+handles.data.parfix}];
        parvalues_color{249+handles.data.parfix} = ['<html><font color="red">' parvalues_color{249+handles.data.parfix}];
        parvalues_color{250+handles.data.parfix} = ['<html><font color="red">' parvalues_color{250+handles.data.parfix}];
    else    
        parvalues{230+handles.data.parfix}(min(strfind(parvalues{230+handles.data.parfix},'<')):max(strfind(parvalues{230+handles.data.parfix},'>'))) = [];
        parvalues{249+handles.data.parfix}(min(strfind(parvalues{249+handles.data.parfix},'<')):max(strfind(parvalues{249+handles.data.parfix},'>'))) = [];
        parvalues{250+handles.data.parfix}(min(strfind(parvalues{250+handles.data.parfix},'<')):max(strfind(parvalues{250+handles.data.parfix},'>'))) = [];
    end

    parvalues_color_short = parvalues_color(parindex_short);
    parvalues_color_short = parvalues_color_short(handles.data.ind_sort);
    set(handles.tab_all_par,'Data',[parnames_short parvalues_color_short parfit_sort]);

    handles.data.parvalues = parvalues;
    guidata(hObject, handles);

    catch ME
        errordlg(['Error detected when executing "update colors in parameter table": ' ME.message],'Error')    
        error(ME.message)
    end

% --- Executes when entered data in editable cell(s) in tab_all_par2.
function tab_all_par2_CellEditCallback(hObject, eventdata, handles)

    try
       btn_update2_Callback(hObject, eventdata, handles);
    end

% --- Executes on selection change in popup_cell_par_x.
function popup_cell_par_x_Callback(hObject, eventdata, handles)
    
    try

        if get(handles.popup_cell_par_x,'Value') > 1

            allstrings_x  = get(handles.popup_cell_par_x,'String');
            if strcmp(allstrings_x(get(handles.popup_cell_par_x,'Value')),handles.data.vary_leg_string1) ...
               && handles.data.varyvals1_log == 1
               handles.data.xscale_results = 'log';
               set(handles.radio_xscale_results_log,'Value',1)
            elseif strcmp(allstrings_x(get(handles.popup_cell_par_x,'Value')),handles.data.vary_leg_string1) ...
               && handles.data.varyvals1_log == 0
                handles.data.xscale_results = 'linear';    
               set(handles.radio_xscale_results_lin,'Value',1)
            elseif strcmp(allstrings_x(get(handles.popup_cell_par_x,'Value')),handles.data.vary_leg_string2) ...
               && handles.data.varyvals2_log == 1
               handles.data.xscale_results = 'log';   
               set(handles.radio_xscale_results_log,'Value',1)
            elseif strcmp(allstrings_x(get(handles.popup_cell_par_x,'Value')),handles.data.vary_leg_string2) ...
               && handles.data.varyvals2_log == 0
               handles.data.xscale_results = 'linear';
               set(handles.radio_xscale_results_lin,'Value',1)
            end
               guidata(hObject, handles);
        end

    catch ME
        errordlg(['Error detected when executing "popup_cell_par_x": ' ME.message],'Error')    
        error(ME.message)
    end   

% --- Executes during object creation, after setting all properties.
function popup_cell_par_x_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% --- Executes on selection change in popup_cell_par_z.
function popup_cell_par_z_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function popup_cell_par_z_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% --- Executes when selected object is changed in radio_xscale_resuls.
function radio_xscale_resuls_SelectionChangeFcn(hObject, eventdata, handles)

    button = get(hObject,'Tag');
    if strcmp(button,'radio_xscale_results_lin')
    handles.data.xscale_results = 'linear';
    elseif strcmp(button,'radio_xscale_results_log')
    handles.data.xscale_results = 'log';
    end

    guidata(hObject,handles)


% --- Executes when selected object is changed in radio_yscale_results.
function radio_yscale_results_SelectionChangeFcn(hObject, eventdata, handles)

    button = get(hObject,'Tag');
    if strcmp(button,'radio_yscale_results_lin')
    handles.data.yscale_results = 'linear';
    elseif strcmp(button,'radio_yscale_results_log')
    handles.data.yscale_results = 'log';
    end

    guidata(hObject,handles)


% --- Executes on button press in btn_calc_results.
function btn_calc_results_Callback(hObject, eventdata, handles)

    try

    parvalues = handles.data.parvalues;

    % Calculate emitter sheet resistance:
       Ndop_bulk = str2num(parvalues{199});    
       T = str2num(parvalues{308+handles.data.parfix});
       q = 1.602e-19;    
       em_enable = max(str2num(handles.data.parvalues{164}),str2num(handles.data.parvalues{196})); 
       em_external_enable = str2num(parvalues{196});

       if em_external_enable == 1
            em_external_file = parvalues{195};
            em_external_data = importdata(em_external_file);
            x = 1e-4*em_external_data(:,1);
            Nd = em_external_data(:,2);
            Na = em_external_data(:,3);
            xj = x(abs(Nd-Na) == min(abs(Nd-Na)));
            mobility_results = mobility(Na,Nd,T);
            sigma = Nd.*mobility_results.mu_n*q + Na.*mobility_results.mu_p*q;
            Rs_em  = 1/trapz(x(x<=xj),sigma(x<=xj)); 
       elseif em_enable == 1;
            em_type = str2num(parvalues{165});
            em_diff_type = str2num(parvalues{166});
            Np = str2num(parvalues{167});
            xd = str2num(parvalues{168});
            xp = str2num(parvalues{169});
            x =  0:1e-6:5e-4;
            N = zeros(1,length(x));
            if em_diff_type == 0
                N(x>xp && x<xd + xp) = Np;
            elseif em_diff_type == 1
                N = Np*exp((-abs(x-xp))/xd);
            elseif em_diff_type == 2
                N = Np*exp((-(x-xp).^2)/(xd^2));
            elseif em_diff_type == 3
                N =Np*erfc((x-xp)/xd);
            end
            if em_type == 0
                Nd = N;
                Na = Ndop_bulk;
            else
                Na = N;
                Nd = Ndop_bulk;
            end
            xj = x(abs(Nd-Na) == min(abs(Nd-Na)));
            mobility_results = mobility(Na,Nd,T);
            sigma = Nd.*mobility_results.mu_n*q + Na.*mobility_results.mu_p*q;
            Rs_em  = 1/trapz(x(x<=xj),sigma(x<=xj));     
        else
            Rs_em  = [];
            xj = [];
        end

        handles.data.Rs_em = Rs_em;
        handles.data.xj = 1e4*xj;
        guidata(hObject, handles);        

    catch ME
        errordlg(['Error detected when executing "Calculate sheet resistance ++": ' ME.message],'Error')    
        error(ME.message)
    end


% --------------------------------------------------------------------
function toolbar_save_as_ClickedCallback(hObject, eventdata, handles)


    [file path] = uiputfile('.prm','Save parameters as text file');

    if file ~= 0
    dos(['convert_ascii_to_prm' ' temp.txt '  file]);

    handles.data.prm_file_name = file;
    handles.data.path = path;

    set(handles.txt_prm_file,'String',file)

    guidata(hObject, handles);   
    end

% --- Executes on button press in btn_optimize.
function btn_optimize_Callback(hObject, eventdata, handles)

    try

        global optimizestop

        if strcmp(get(handles.btn_optimize,'String'),'Stop')
            optimizestop = true;
        else

            tic

            c.fitvar_ind = find(cellfun(@double,handles.data.parfit));
            c.fitvar2_ind = find(cellfun(@double,handles.data.parfit2));
            c.handles = handles;
            c.hObject = hObject;
            c.eventdata = eventdata;
            c.optval = get(handles.popup_opt_value,'Value')-1;
            c.handles.data.external_run = 1;

            if c.optval < 1
                msgbox('Please select parameter')
                tab_optimization_Callback(hObject, eventdata, handles)
            else

                if length(c.fitvar_ind) + length(c.fitvar2_ind) > 0

                    set(handles.text_simulation_type,'String','Single simulation')
                    set(handles.text_simulation_type,'Foregroundcolor',[0 0 1])
                    set(handles.text_simulation_type2,'String','- Optimizing')
                    set(handles.text_simulation_type2,'Foregroundcolor',[0 0 1])
                    set(handles.text_simulation_type2,'Visible','on')

                    hm = msgbox('Working...');
                    hc = get(hm,'Children');
                    set(hc(2),'Visible','off');

                    for i = 1:length(c.fitvar_ind)
                        x0(i) = str2num(handles.data.parvalues{c.fitvar_ind(i)});
                    end
                    for i = 1:length(c.fitvar2_ind)
                        x0(i+length(c.fitvar_ind)) = str2num(handles.data.parvalues2{c.fitvar2_ind(i)});
                    end

                    set(handles.btn_optimize,'String','Stop')
                    set(handles.btn_optimize,'ForegroundColor',[1 0 0])

                    options = optimset('OutputFcn',@outfun);
                    x = fminsearch(@(x)optimize_fun(x,c),x0,options);

                    set(handles.btn_optimize,'String','Optimize')
                    set(handles.btn_optimize,'ForegroundColor',[0 0 0])

                    close(hm)
                    t = toc;
                    h2 = questdlg(['Optimization complete (simulation time = ' num2str(t) ' s). Change parameters to optimized value?']);
                    if strcmp(h2,'Yes')
                        for i = 1:length(c.fitvar_ind)
                            handles.data.parvalues{c.fitvar_ind(i)} = num2str(x(i),'%0.5g');
                        end
                        for i = 1:length(c.fitvar2_ind)
                            handles.data.parvalues2{c.fitvar2_ind(i)} = num2str(x(i+length(c.fitvar_ind)),'%0.5g');
                        end

                        parnames_short = handles.data.parnames_short;
                        parvalues_short = handles.data.parvalues(handles.data.parindex_short);
                        parvalues_short = parvalues_short(handles.data.ind_sort);
                        parfit_short = handles.data.parfit_short;
                        set(handles.tab_all_par,'Data',[parnames_short parvalues_short parfit_short]);

                        set(handles.tab_all_par2,'Data',[handles.data.parnames2 ... 
                            handles.data.parvalues2 handles.data.parfit2]);   
                    end

                        set(c.handles.text_display_results3,'String','')

                        write_to_prm(handles.data.parstrings,handles.data.parvalues)

                    c.handles.data.external_run = 0;
                    btn_update_Callback(hObject, eventdata, handles)
                    btn_update2_Callback(hObject, eventdata, handles)    
                    guidata(hObject, handles);    
                    btn_run_Callback(hObject, eventdata, handles)

                    else
                        msgbox('Please select fitting parameter(s)')
                    end

                    optimizestop = false;
            end
        end

    catch ME
        errordlg(['Error detected when executing "optimize": ' ME.message],'Error')    
        error(ME.message)
    end

    function R = optimize_fun(x,c)

        try

            if min(x) < 0
                R = 1e50;
                return
            end

            for i = 1:length(c.fitvar_ind)
                c.handles.data.parvalues{c.fitvar_ind(i)} = num2str(x(i));
            end
            for i = 1:length(c.fitvar2_ind)
                c.handles.data.parvalues2{c.fitvar2_ind(i)} = num2str(x(i+length(c.fitvar_ind)));
            end

            btn_run_Callback(c.hObject, c.eventdata, c.handles);
            handles=guidata(c.handles.output);    

            Jsc = handles.data.results.Jsc;
            Voc = handles.data.results.Voc;
            FF  = handles.data.results.FF;
            eta = handles.data.results.eta;

        for i = 1:length(c.fitvar_ind)        
            pni = handles.data.parnames{c.fitvar_ind(i)};
            pni = pni(strfind(pni,'-')+2:end);
            C3{i} = [pni ' = ' num2str(x(i),'%0.5g')];
        end
        for i = 1:length(c.fitvar2_ind)        
            pni = handles.data.parnames2{c.fitvar2_ind(i)};
            pni = pni(strfind(pni,'-')+2:end);
            C3{i+length(c.fitvar_ind)} = [pni ' = ' num2str(x(i+length(c.fitvar_ind)),'%0.5g')];
        end
        set(c.handles.text_display_results3,'String',C3)

        drawnow
        allpar = [Jsc Voc FF eta];
        R = -allpar(c.optval);

        catch ME
        errordlg(['Error detected when executing "optimize (fun)": ' ME.message],'Error')    
        error(ME.message)
        end


% --- Executes on selection change in popup_opt_value.
function popup_opt_value_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function popup_opt_value_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

% --- Executes on button press in btn_import_exp.
function btn_import_exp_Callback(hObject, eventdata, handles)

    try
          [file path] = uigetfile({'*.*','All files'},'Select IV file (two column ASCII)',handles.data.path);
          if file ~= 0
              a = importdata([path file]);
              handles.data.x_exp = a(:,1);
              handles.data.y_exp = a(:,2);
              handles.data.show_exp_data = 1;
              set(handles.text_exp,'String',file)
              hold on
              handles.data.h_exp = plot(handles.data.x_exp,handles.data.y_exp,'kx');
              guidata(hObject, handles);      
          end

    catch ME
        errordlg(['Error detected when executing "Import experimental data": ' ME.message],'Error')    
        error(ME.message)
    end

% --- Executes on button press in btn_stop_fit.
function btn_stop_fit_Callback(hObject, eventdata, handles)


    global optimizestop
    optimizestop = true;

% --- Executes on button press in btn_fit_exp.
function btn_fit_exp_Callback(hObject, eventdata, handles)

    
    try

        global optimizestop
        
        if get(handles.check_vary1_enable,'Value') == 1
            
            msgbox('Fitting is currently not suppoerted for batch results. Please disable batch mode and run a single simulation before you continue')
            tab_run_simulation_Callback(hObject, eventdata, handles)
            
        else
                set(handles.check_autorun,'Value',1)
                handles.data.external_run = 1;
                guidata(hObject, handles);

                if strcmp(get(handles.btn_fit_exp,'String'),'Stop')
                    optimizestop = true;
                else

                    x_exp = handles.data.x_exp;
                    y_exp = handles.data.y_exp;
                    
                    if isempty(x_exp)
                        msgbox('Please import experimental data first')
                        tab_optimization_Callback(hObject, eventdata, handles)
                        return
                    end

                    c.fitvar_ind = find(cellfun(@double,handles.data.parfit));
                    c.fitvar2_ind = find(cellfun(@double,handles.data.parfit2));
                    c.handles = handles;
                    c.hObject = hObject;
                    c.eventdata = eventdata;
                    c.handles.data.external_run = 1;

                    c.x_exp = x_exp;
                    c.y_exp = y_exp;

                        set(handles.text_simulation_type,'String','Single simulation')
                        set(handles.text_simulation_type,'Foregroundcolor',[0 0 1])
                        set(handles.text_simulation_type2,'String','- Optimizing')
                        set(handles.text_simulation_type2,'Foregroundcolor',[0 0 1])
                        set(handles.text_simulation_type2,'Visible','on')

                        if length(c.fitvar_ind) + length(c.fitvar2_ind) > 0

                            for i = 1:length(c.fitvar_ind)
                                x0(i) = str2num(handles.data.parvalues{c.fitvar_ind(i)});
                            end
                            for i = 1:length(c.fitvar2_ind)
                                x0(i+length(c.fitvar_ind)) = str2num(handles.data.parvalues2{c.fitvar2_ind(i)});
                            end

                            set(handles.btn_fit_exp,'String','Stop')
                            set(handles.btn_fit_exp,'ForegroundColor',[1 0 0])

                            tic 
                            options = optimset('OutputFcn',@outfun);
                            x = fminsearch(@(x)fit_fun(x,c),x0,options); 

                            set(handles.btn_fit_exp,'String','Fit')
                            set(handles.btn_fit_exp,'ForegroundColor',[0 0 0])

                            t = toc;
                            h2 = questdlg(['Fitting complete (simulation time = ' num2str(t) ' s). Change parameters?']);
                            if strcmp(h2,'Yes')
                                for i = 1:length(c.fitvar_ind)
                                    handles.data.parvalues{c.fitvar_ind(i)} = num2str(x(i),'%0.5g');
                                end
                                for i = 1:length(c.fitvar2_ind)
                                    handles.data.parvalues2{c.fitvar2_ind(i)} = num2str(x(i+length(c.fitvar_ind)),'%0.5g');
                                end

                                parnames_short = handles.data.parnames_short;
                                parvalues_short = handles.data.parvalues(handles.data.parindex_short);
                                parvalues_short = parvalues_short(handles.data.ind_sort);
                                parfit_short = handles.data.parfit_short;
                                set(handles.tab_all_par,'Data',[parnames_short parvalues_short parfit_short]);

                                set(handles.tab_all_par2,'Data',[handles.data.parnames2 ... 
                                    handles.data.parvalues2 handles.data.parfit2]);   
                            end

                                set(c.handles.text_display_results3,'String','')

                               write_to_prm(handles.data.parstrings,handles.data.parvalues)

                            c.handles.data.external_run = 0;
                            btn_update_Callback(hObject, eventdata, handles)
                            btn_update2_Callback(hObject, eventdata, handles)    
                            guidata(hObject, handles);    
                            btn_run_Callback(hObject, eventdata, handles)

                        else
                            msgbox('Please select fitting parameter(s)')
                            tab_parameters_Callback(hObject, eventdata, handles)
                        end  

                        optimizestop = false;
                        
                end
                
                set(handles.check_autorun,'Value',0)
                handles.data.external_run = 0;
                guidata(hObject, handles);
        end

    catch ME
        errordlg(['Error detected when executing "fit to IV": ' ME.message],'Error')    
        error(ME.message)
    end

function R = fit_fun(x,c)

    try

            if min(x) < 1e-6
                R = 1e50;
                return
            end

            for i = 1:length(c.fitvar_ind)
                c.handles.data.parvalues{c.fitvar_ind(i)} = num2str(x(i));
            end
            for i = 1:length(c.fitvar2_ind)
                c.handles.data.parvalues2{c.fitvar2_ind(i)} = num2str(x(i+length(c.fitvar_ind)));
            end

            btn_run_Callback(c.hObject, c.eventdata, c.handles);
            handles=guidata(c.handles.output);    

            pc1dheaders = handles.data.results.pc1dheaders;
            pc1ddata    = handles.data.results.pc1ddata{1};
        xstring = get(handles.listbox_xdata_selection,'String');
        x_selected = xstring(get(handles.listbox_xdata_selection,'Value'));
        ystring = get(handles.listbox_ydata_selection,'String');
        y_selected = ystring(get(handles.listbox_ydata_selection,'Value'));
        Xdata = pc1ddata(:,strcmp(pc1dheaders,x_selected));
        Ydata = pc1ddata(:,strcmp(pc1dheaders,y_selected));    
        x_exp = c.x_exp;
        y_exp = c.y_exp;
        [Xdata,ind,~] = unique(Xdata);
        Ydata = Ydata(ind);
        y_interp = interp1(Xdata,Ydata,x_exp);
        y_exp(isnan(y_interp)) = [];
        y_interp(isnan(y_interp)) = [];

        R = sum((y_exp-y_interp).^2);

        for i = 1:length(c.fitvar_ind)        
            pni = handles.data.parnames{c.fitvar_ind(i)};
            pni = pni(strfind(pni,'-')+2:end);
            C3{i} = [pni ' = ' num2str(x(i),'%0.5g')];
        end
        for i = 1:length(c.fitvar2_ind)        
            pni = handles.data.parnames2{c.fitvar2_ind(i)};
            pni = pni(strfind(pni,'-')+2:end);
            C3{i+length(c.fitvar_ind)} = [pni ' = ' num2str(x(i+length(c.fitvar_ind)),'%0.5g')];
        end
        C3{length(c.fitvar_ind) + length(c.fitvar2_ind) +1} = ['R = ' num2str(R)];
        set(c.handles.text_display_results3,'String',C3)   

    catch ME
        errordlg(['Error detected when executing "fit to IV (fun)": ' ME.message],'Error')    
        error(ME.message)
    end

% --- 
function stop = outfun(x,optimValues,state)
% Check if user has requested to stop the optimization.

    global optimizestop
    stop = optimizestop;

% --- 
function edit_remove_points_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit_remove_points_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

% --------------------------------------------------------------------
function  tab_all_par_ButtonDownFcn(hObject, eventdata, handles)

% --------------------------------------------------------------------
function toolbar_copy_to_clip_ClickedCallback(hObject, eventdata, handles)

        allCh = get(handles.axes2, 'Children');

        cdata = get(allCh(strcmp(get(allCh,'Type'),'image')),'CData');        
        if ~isempty(cdata)
                out = cdata;
        else
            x = get(allCh(strcmp(get(allCh,'Type'),'line')),'XData');
            y = get(allCh(strcmp(get(allCh,'Type'),'line')),'YData');
            a = cell(length(x),1);
            a(:) = {[0 0]};

            if iscell(x)       
                ind_kill_x = cellfun(@isequal,x,a);
                ind_kill_y = cellfun(@isequal,y,a);
                x(ind_kill_x) = [];
                x(ind_kill_y) = [];
                y(ind_kill_x) = [];
                y(ind_kill_y) = [];

                for i = 1:length(x)
                    xy{2*i-1} = x{i};
                    xy{2*i}   = y{i};
                end

                lengthY = 0;
                for i = 1:length(xy)
                    if length(xy{i}) > lengthY
                        lengthY = length(xy{i});
                    end
                end

                out = [];
                for i = 1:length(xy)
                    out = [out [xy{i}';NaN*ones(lengthY-length(xy{i}),1)]];
                end    
            else

                ind_kill_x = isequal(x,a);
                ind_kill_y = isequal(y,a);

                x(ind_kill_x) = [];
                x(ind_kill_y) = [];
                y(ind_kill_x) = [];
                y(ind_kill_y) = [];

                out = [x' y'];
            end

        end

        arraystring = num2str(out); 
        arraystring(strcmp(arraystring,'NaN')) = '';
        arraystring(:,end+1) = char(10); 
        arraystring = reshape(arraystring',1,prod(size(arraystring))); 
        arraystringshift = [' ',arraystring]; 
        arraystring = [arraystring,' ']; 
        arraystring = arraystring((double(arraystring)~=32 | double(arraystringshift)~=32) & ~(double(arraystringshift==10) & double(arraystring)==32) );
        arraystring(double(arraystring)==32) = char(9);
        clipboard('copy',arraystring); %
        msgbox('Plotted data was copied to the clipboard (x y1 x y2 ...)')

%--------------------    
function y = mobility(Na,Nd,T)

        Tn = T/300;

        mu_n_max = 1417;
        mu_p_max = 470;


    if sum(Na) > sum(Nd)

        mu_n_min = 160;
        N_ref_n = 5.6e16;
        alpha_n = 0.647;

        mu_p_min = 37.4;
        N_ref_p = 2.82e17;
        alpha_p = 0.642;

    elseif sum(Nd) > sum(Na)

        mu_n_min = 60;
        N_ref_n = 9.64e16;
        alpha_n = 0.664;

        mu_p_min = 155;
        N_ref_p = 1e17;
        alpha_p = 0.9;

    end

    beta1_n = -0.57;
    beta1_p = -0.57;
    beta2_n = -2.33;
    beta2_p = -2.23;
    beta3_n = 2.4;
    beta3_p = 2.4;
    beta4_n = -0.146;
    beta4_p = -0.146;

    v_th = 1e7;

    mu_n = mu_n_min.*Tn.^beta1_n + (mu_n_max - mu_n_min).*Tn.^beta2_n./(1+((Nd+Na)./(N_ref_n.*Tn.^beta3_n)).^(alpha_n.*Tn.^beta4_n));
    mu_p = mu_p_min.*Tn.^beta1_p + (mu_p_max - mu_p_min).*Tn.^beta2_p./(1+((Nd+Na)./(N_ref_p.*Tn.^beta3_p)).^(alpha_p.*Tn.^beta4_p));

    k_B = 1.38e-23;
    q = 1.602e-19;

    D_n = (k_B*T/q).*mu_n;
    D_p = (k_B*T/q).*mu_p;

    if sum(Na) > sum(Nd)
        rho = 1./((Na-Nd).*mu_p.*q);
    elseif sum(Nd) > sum(Na)
        rho = 1./((Nd-Na).*mu_n.*q);
    end

    y.mu_n = mu_n;
    y.mu_p = mu_p;
    y.D_n = D_n;
    y.D_p = D_p;
    y.rho = rho;


% --- Executes on selection change in listbox_xdata_selection.
function listbox_xdata_selection_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function listbox_xdata_selection_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

% --- Executes on button press in check_norm_y.
function check_norm_y_Callback(hObject, eventdata, handles)


% --- Executes on button press in check_norm_x.
function check_norm_x_Callback(hObject, eventdata, handles)

% ---
function edit_pick_x_Callback(hObject, eventdata, handles)

        pick_x = str2num(get(handles.edit_pick_x,'String'));
        headers_at_value = handles.data.results.pc1dheaders(2:end)';
        for i = 1:length(headers_at_value)
            headers_at_value{i} = [headers_at_value{i} ' at x = ' num2str(pick_x)];
        end
        set(handles.popup_cell_par_y,'String',[handles.data.cell_par_strings headers_at_value]);
        set(handles.popup_cell_par_z,'String',[handles.data.cell_par_strings headers_at_value]);

% --- Executes during object creation, after setting all properties.
function edit_pick_x_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

% ---
function write_to_prm(parstrings,parvalues)
        for i = 2:length(parvalues)
            if strcmp(parvalues{i},'same')
                parvalues{i} = parvalues{i-1};
            end
        end
        C = strcat(parstrings,parvalues);
        fid = fopen('temp.txt','wt');
        for i=1:length(C)
            fprintf(fid, '%s\n', C{i});
        end
        fclose(fid);
        dos(['convert_ascii_to_prm' ' temp.txt ' 'temp.prm']);    


% --------------------------------------------------------------------
function toolbar_increase_font_ClickedCallback(hObject, eventdata, handles)

    fn = fieldnames(handles);
    for i = 1:length(fn)-1
        if isfield(get(getfield(handles,fn{i})),'FontSize')
           s = get(getfield(handles,fn{i}),'FontSize');
           set(getfield(handles,fn{i}),'FontSize',s*1.1)
        end
    end

% --------------------------------------------------------------------
function toolbar_decrease_font_ClickedCallback(hObject, eventdata, handles)

    fn = fieldnames(handles);
    for i = 1:length(fn)-1
        if isfield(get(getfield(handles,fn{i})),'FontSize')
           s = get(getfield(handles,fn{i}),'FontSize');
           set(getfield(handles,fn{i}),'FontSize',s/1.1)
        end
    end


% --------------------------------------------------------------------
function toolbar_change_color_ClickedCallback(hObject, eventdata, handles)

try
    c = uisetcolor;
    if isequal(c,[1 1 1]) || isequal(c,[224/255 223/255 227/255])
        msgbox('Sorry, but you cannot set this color as background color')
    else
        if sum(c) < 0.8
            cf = [1 1 1];
        else
            cf = [0 0 0];
        end
        fn = fieldnames(handles);
        c1 = [];
        c2 = [];
        c3 = [];
        for i = 1:length(fn)-1
            if isfield(get(getfield(handles,fn{i})),'Color')
                s1 = get(getfield(handles,fn{i}),'Color');
                if size(s1,1) == 1
                    if ~isequal(s1,[1 1 1]) && ~isequal(s1,[224/255 223/255 227/255])
                        c1 = [c1 i];
                    end
                end
            end
            if isfield(get(getfield(handles,fn{i})),'BackgroundColor')
                s2 = get(getfield(handles,fn{i}),'BackgroundColor');
                if size(s2,1) == 1
                    if ~isequal(s2,[1 1 1]) && ~isequal(s2,[224/255 223/255 227/255])
                        c2 = [c2 i];
                    end
                end
            end
        end
        for i = 1:length(c1)
            set(getfield(handles,fn{c1(i)}),'Color',c)
        end
        for i = 1:length(c2)
            set(getfield(handles,fn{c2(i)}),'BackgroundColor',c)
            set(getfield(handles,fn{c2(i)}),'ForegroundColor',cf)
        end
    end
    
catch ME
    errordlg(['Error detected when executing "Change GUI color": ' ME.message],'Error')    
    error(ME.message)
end   

% --- Executes on button press in check_linked1.
function check_linked1_Callback(hObject, eventdata, handles)
    
    if get(hObject,'Value') == 1
        set(handles.popup_vary1b,'Visible','on')
        set(handles.edit_from1b,'Visible','on')
        set(handles.edit_step1b,'Visible','on')
        set(handles.edit_to1b,'Visible','on')
        set(handles.check_log_batch1b,'Visible','on')
        set(handles.uipanel30,'Visible','on')
        set(handles.popup_vary1b,'Value',get(handles.popup_vary1a,'Value')+1)
        set(handles.edit_from1b,'String',get(handles.edit_from1a,'String'))
        set(handles.edit_step1b,'String',get(handles.edit_step1a,'String'))
        set(handles.edit_to1b,'String',get(handles.edit_to1a,'String'))
        set(handles.check_log_batch1b,'Value',get(handles.check_log_batch1a,'Value'))
    else
        set(handles.popup_vary1b,'Visible','off')
        set(handles.edit_from1b,'Visible','off')
        set(handles.edit_step1b,'Visible','off')
        set(handles.edit_to1b,'Visible','off')
        set(handles.check_log_batch1b,'Visible','off')
        set(handles.uipanel30,'Visible','off')
    end  

% --- Executes on button press in check_linked2.
function check_linked2_Callback(hObject, eventdata, handles)

    if get(hObject,'Value') == 1
        set(handles.popup_vary2b,'Visible','on')
        set(handles.edit_from2b,'Visible','on')
        set(handles.edit_step2b,'Visible','on')
        set(handles.edit_to2b,'Visible','on')
        set(handles.check_log_batch2b,'Visible','on')
        set(handles.uipanel31,'Visible','on')
        set(handles.popup_vary2b,'Value',get(handles.popup_vary2a,'Value')+1)
        set(handles.edit_from2b,'String',get(handles.edit_from2a,'String'))
        set(handles.edit_step2b,'String',get(handles.edit_step2a,'String'))
        set(handles.edit_to2b,'String',get(handles.edit_to2a,'String'))
        set(handles.check_log_batch2b,'Value',get(handles.check_log_batch2a,'Value'))
    else
        set(handles.popup_vary2b,'Visible','off')
        set(handles.edit_from2b,'Visible','off')
        set(handles.edit_step2b,'Visible','off')
        set(handles.edit_to2b,'Visible','off')
        set(handles.check_log_batch2b,'Visible','off')
        set(handles.uipanel31,'Visible','off')
    end  


% --- Executes on button press in tab_parameters.
function tab_parameters_Callback(hObject, eventdata, handles)

    set(handles.text41,'Visible','on')
    set(handles.text42,'Visible','off')
    set(handles.text43,'Visible','off')
    set(handles.text44,'Visible','off')
    set(handles.text45,'Visible','off')

    set(handles.uipanel11,'Visible','on')
    set(handles.uipanel32,'Visible','off')
    set(handles.uipanel15,'Visible','off')
    set(handles.uipanel36,'Visible','off')
    set(handles.uipanel37,'Visible','off')

    set(handles.tab_parameters,'FontWeight','bold')
    set(handles.tab_run_simulation,'FontWeight','normal')
    set(handles.tab_plot_raw_data,'FontWeight','normal')
    set(handles.tab_plot_results,'FontWeight','normal')
    set(handles.tab_optimization,'FontWeight','normal')


% --- Executes on button press in tab_run_simulation.
function tab_run_simulation_Callback(hObject, eventdata, handles)

    set(handles.text41,'Visible','off')
    set(handles.text42,'Visible','on')
    set(handles.text43,'Visible','off')
    set(handles.text44,'Visible','off')
    set(handles.text45,'Visible','off')

    set(handles.uipanel11,'Visible','off')
    set(handles.uipanel32,'Visible','on')
    set(handles.uipanel15,'Visible','off')
    set(handles.uipanel36,'Visible','off')
    set(handles.uipanel37,'Visible','off')

    set(handles.tab_parameters,'FontWeight','normal')
    set(handles.tab_run_simulation,'FontWeight','bold')
    set(handles.tab_plot_raw_data,'FontWeight','normal')
    set(handles.tab_plot_results,'FontWeight','normal')
    set(handles.tab_optimization,'FontWeight','normal')

% --- Executes on button press in tab_plot_raw_data.
function tab_plot_raw_data_Callback(hObject, eventdata, handles)

    set(handles.text41,'Visible','off')
    set(handles.text42,'Visible','off')
    set(handles.text43,'Visible','on')
    set(handles.text44,'Visible','off')
    set(handles.text45,'Visible','off')

    set(handles.uipanel11,'Visible','off')
    set(handles.uipanel32,'Visible','off')
    set(handles.uipanel15,'Visible','on')
    set(handles.uipanel36,'Visible','off')
    set(handles.uipanel37,'Visible','off')

    set(handles.tab_parameters,'FontWeight','normal')
    set(handles.tab_run_simulation,'FontWeight','normal')
    set(handles.tab_plot_raw_data,'FontWeight','bold')
    set(handles.tab_plot_results,'FontWeight','normal')
    set(handles.tab_optimization,'FontWeight','normal')



% --- Executes on button press in tab_plot_results.
function tab_plot_results_Callback(hObject, eventdata, handles)

    set(handles.text41,'Visible','off')
    set(handles.text42,'Visible','off')
    set(handles.text43,'Visible','off')
    set(handles.text44,'Visible','on')
    set(handles.text45,'Visible','off')

    set(handles.uipanel11,'Visible','off')
    set(handles.uipanel32,'Visible','off')
    set(handles.uipanel15,'Visible','off')
    set(handles.uipanel36,'Visible','on')
    set(handles.uipanel37,'Visible','off')

    set(handles.tab_parameters,'FontWeight','normal')
    set(handles.tab_run_simulation,'FontWeight','normal')
    set(handles.tab_plot_raw_data,'FontWeight','normal')
    set(handles.tab_plot_results,'FontWeight','bold')
    set(handles.tab_optimization,'FontWeight','normal')


% --- Executes on button press in tab_optimization.
function tab_optimization_Callback(hObject, eventdata, handles)
    
    set(handles.text41,'Visible','off')
    set(handles.text42,'Visible','off')
    set(handles.text43,'Visible','off')
    set(handles.text44,'Visible','off')
    set(handles.text45,'Visible','on')

    set(handles.uipanel11,'Visible','off')
    set(handles.uipanel32,'Visible','off')
    set(handles.uipanel15,'Visible','off')
    set(handles.uipanel36,'Visible','off')
    set(handles.uipanel37,'Visible','on')

    set(handles.tab_parameters,'FontWeight','normal')
    set(handles.tab_run_simulation,'FontWeight','normal')
    set(handles.tab_plot_raw_data,'FontWeight','normal')
    set(handles.tab_plot_results,'FontWeight','normal')
    set(handles.tab_optimization,'FontWeight','bold')


% --- Executes on button press in check_vary1_enable.
function check_vary1_enable_Callback(hObject, eventdata, handles)

    if get(hObject,'Value') == 1
        set(handles.popup_vary1a,'Visible','on')
        set(handles.edit_from1a,'Visible','on')
        set(handles.edit_to1a,'Visible','on')
        set(handles.edit_step1a,'Visible','on')
        set(handles.check_log_batch1a,'Visible','on')
        set(handles.text5,'Visible','on')
        set(handles.text6,'Visible','on')
        set(handles.text7,'Visible','on')
        set(handles.text9,'Visible','on')
        set(handles.text37,'Visible','on')
        set(handles.check_linked1,'Visible','on')
        set(handles.text39,'Visible','on')
        set(handles.check_vary2_enable,'Visible','on')
        set(handles.text10,'Visible','on')
        set(handles.edit_batch_legend1,'Visible','on')
        set(handles.text51,'Visible','on')
        set(handles.text52,'Visible','on')
        set(handles.edit_batch_factor1,'Visible','on')
    else
        set(handles.popup_vary1a,'Visible','off')
        set(handles.popup_vary1b,'Visible','off')
        set(handles.popup_vary2a,'Visible','off')
        set(handles.popup_vary2b,'Visible','off')
        set(handles.edit_from1a,'Visible','off')
        set(handles.edit_to1a,'Visible','off')
        set(handles.edit_step1a,'Visible','off')    
        set(handles.edit_from1b,'Visible','off')
        set(handles.edit_to1b,'Visible','off')
        set(handles.edit_step1b,'Visible','off')
        set(handles.edit_from2a,'Visible','off')
        set(handles.edit_to2a,'Visible','off')
        set(handles.edit_step2a,'Visible','off')
        set(handles.edit_from2b,'Visible','off')
        set(handles.edit_to2b,'Visible','off')
        set(handles.edit_step2b,'Visible','off')
        set(handles.check_log_batch1a,'Visible','off')
        set(handles.check_log_batch1b,'Visible','off')
        set(handles.check_log_batch2a,'Visible','off')
        set(handles.check_log_batch2b,'Visible','off')
        set(handles.text5,'Visible','off')
        set(handles.text6,'Visible','off')
        set(handles.text7,'Visible','off')
        set(handles.text9,'Visible','off')
        set(handles.text37,'Visible','off')
        set(handles.text38,'Visible','off')
        set(handles.check_linked1,'Visible','off')
        set(handles.check_linked2,'Visible','off')
        set(handles.text39,'Visible','off')
        set(handles.check_vary2_enable,'Visible','off')
        set(handles.text10,'Visible','off')
        set(handles.text46,'Visible','off')
        set(handles.edit_batch_legend1,'Visible','off')
        set(handles.edit_batch_legend2,'Visible','off')
        set(handles.text51,'Visible','off')
        set(handles.text52,'Visible','off')
        set(handles.edit_batch_factor1,'Visible','off')
        set(handles.text53,'Visible','off')
        set(handles.text54,'Visible','off')
        set(handles.edit_batch_factor2,'Visible','off')
        set(handles.uipanel30,'Visible','off')
        set(handles.uipanel31,'Visible','off')
        set(handles.check_vary2_enable,'Value',0);
        set(handles.check_linked1,'Value',0);
        set(handles.check_linked2,'Value',0);
    end


% --- Executes on button press in btn_run_both.
function btn_run_both_Callback(hObject, eventdata, handles)

    if get(handles.check_vary1_enable,'Value') == 1   
        btn_run_batch_Callback(hObject, eventdata, handles);
    else
        btn_run_Callback(hObject, eventdata, handles);
    end

% --- Executes on button press in check_autorun.
function check_autorun_Callback(hObject, eventdata, handles)


% --- Executes on button press in btn_clear_axes.
function btn_clear_axes_Callback(hObject, eventdata, handles)

    cla(handles.axes2,'reset');
    set(handles.text_exp,'String','')
    handles.data.show_exp_data = 0;
    handles.data.x_exp = [];
    handles.data.y_exp = [];
    guidata(hObject, handles);   


% --- Executes on button press in btn_clear_data.
function btn_clear_data_Callback(hObject, eventdata, handles)

    set(handles.text_exp,'String','')
    handles.data.show_exp_data = 0;
    handles.data.x_exp = [];
    handles.data.y_exp = [];
    btn_plot_Callback(hObject, eventdata, handles)
    guidata(hObject, handles);   

% ---
function edit_batch_factor1_Callback(hObject, eventdata, handles)
   
% --- Executes during object creation, after setting all properties.
function edit_batch_factor1_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
% ---    
function edit_batch_factor2_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit_batch_factor2_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% --- Executes on button press in check_select_2D.
function check_select_1D_Callback(hObject, eventdata, handles)
    if get(hObject,'Value') == 1
        set(handles.check_select_2D,'Value',0)
    else
        set(handles.check_select_2D,'Value',1)
    end

% --- Executes on button press in check_select_1D.
function check_select_2D_Callback(hObject, eventdata, handles)
    
    if get(hObject,'Value') == 1
        set(handles.check_select_1D,'Value',0)
    else
        set(handles.check_select_1D,'Value',1)
    end


% --------------------------------------------------------------------
function toolbar_help_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to toolbar_help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    try
    winopen('Documentation, PC1D for Matlab.pdf')
    end
