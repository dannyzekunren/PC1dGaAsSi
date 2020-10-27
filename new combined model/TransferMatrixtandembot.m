


function TransferMatrix
%------------BEGIN USER INPUT PARAMETERS SPECITIFCATION---------------
%
lambda=500:2:1200; % Wavelengths over which field patterns are calculated
stepsize = 1;   % The electric field is calculated at a latice of points (nm)
                % in the device cross section seperated by this distance

layers = {'Air' 'MgF' 'ZnS' 'InGaP'  'GaAs' 'InGaP' 'GaAs' 'SiN' 'Air' 'SiN' 'Si' 'SiOx'  }; % Names of layers of materials starting from side light is incident from

top=dlmread('top');  %% top cell thickness need to be alligned with transfermatrixtademtop

% thickness of each corresponding layer in nm (thickness of the first layer is irrelivant)
for i=1:1:length(top)

thicknesses = [0 50 90 30 top 50 120 30000 1000 120 200000 100 ];  % thickness of each corresponding layer in nm (thickness of the first layer is irrelivant)
activeLayer=11; % index of material layer where photocurrent is generated
%
%------------END USER INPUT PARAMETERS SPECIFICATION-------------------
plotGeneration = true;


% Load in index of refraction for each material
n = zeros(size(layers,2),size(lambda,2));
for index = 1:size(layers,2)
    n(index,:) = LoadRefrIndex(layers{index},lambda);
end
t = thicknesses;

% Constants
h=6.626e-34; % Js Planck's constant
c=2.998e8; %m/s speed of light
q=1.602e-19; %C electric charge

% Calculate Incoherent power transmission through substrate
% See Griffiths "Intro to Electrodynamics 3rd Ed. Eq. 9.86 & 9.87
T_glass=abs(4*1*n(1,:)./(1+n(1,:)).^2); 
R_glass=abs((1-n(1,:))./(1+n(1,:))).^2;

% Calculate transfer matrices, and field at each wavelength and position
t(1)=0;
t_cumsum=cumsum(t);
x_pos=(stepsize/2):stepsize:sum(t); %positions to evaluate field
%x_mat specifies what layer number the corresponding point in x_pos is in:
x_mat= sum(repmat(x_pos,length(t),1)>repmat(t_cumsum',1,length(x_pos)),1)+1; 
R=lambda*0;
E=zeros(length(x_pos),length(lambda));
for l = 1:length(lambda)
    % Calculate transfer matrices for incoherent reflection and transmission at the first interface
    S=I_mat(n(1,l),n(2,l));
    for matindex=2:(length(t)-1)
        S=S*L_mat(n(matindex,l),t(matindex),lambda(l))*I_mat(n(matindex,l),n(matindex+1,l));
    end
    R(l)=abs(S(2,1)/S(1,1))^2; %JAP Vol 86 p.487 Eq 9 Power Reflection from layers other than substrate
    T(l)=abs(2/(1+n(1,l)))/sqrt(1-R_glass(l)*R(l)); %Transmission of field through glass substrate Griffiths 9.85 + multiple reflection geometric series

    % Calculate all other transfer matrices
    for material = 2:(length(t)) 
        xi=2*pi*n(material,l)/lambda(l);
        dj=t(material);
        x_indices=find(x_mat == material); %indices of points which are in the material layer considered
        x=x_pos(x_indices)-t_cumsum(material-1); %distance from interface with previous layer
        % Calculate S matrices (JAP Vol 86 p.487 Eq 12 and 13)
        S_prime=I_mat(n(1,l),n(2,l));
        for matindex=3:material
            S_prime=S_prime*L_mat(n(matindex-1,l),t(matindex-1),lambda(l))*I_mat(n(matindex-1,l),n(matindex,l));
        end
        S_doubleprime=eye(2);
        for matindex=material:(length(t)-1)
            S_doubleprime=S_doubleprime*I_mat(n(matindex,l),n(matindex+1,l))*L_mat(n(matindex+1,l),t(matindex+1),lambda(l));
        end
        % Normalized Field profile (JAP Vol 86 p.487 Eq 22)
        E(x_indices,l)=T(l)*(S_doubleprime(1,1)*exp(-1i*xi*(dj-x))+S_doubleprime(2,1)*exp(1i*xi*(dj-x))) ./(S_prime(1,1)*S_doubleprime(1,1)*exp(-1i*xi*dj)+S_prime(1,2)*S_doubleprime(2,1)*exp(1i*xi*dj));
    end 
end

% Overall Reflection from device with incoherent reflections at first
% interface (typically air-glass)
Reflection=R_glass+T_glass.^2.*R./(1-R_glass.*R);

% Plots electric field intensity |E|^2 vs position in device for
% wavelengths specified in the initial array, plotWavelengths. 
close all


% Absorption coefficient in cm^-1 (JAP Vol 86 p.487 Eq 23)
a=zeros(length(t),length(lambda));
for matindex=2:length(t)
     a(matindex,:)=4*pi*imag(n(matindex,:))./(lambda*1e-7);
end

% Plots normalized intensity absorbed /cm3-nm at each position and
% wavelength as well as the total reflection expected from the device
% (useful for comparing with experimentally measured reflection spectrum)


% Plots generation rate as a function of position in the device and
% calculates Jsc
if plotGeneration == true
    
    % Load in 1sun AM 1.5 solar spectrum in mW/cm2nm
    AM15_data=xlsread('AM15.xls');
    AM15=interp1(AM15_data(:,1), AM15_data(:,2), lambda); 
     
    
    % Energy dissipation mW/cm3-nm at each position and wavelength (JAP Vol
    % 86 p.487 Eq 22)
    ActivePos=find(x_mat == activeLayer);
    Q=repmat(a(activeLayer,:).*real(n(activeLayer,:)).*AM15,length(ActivePos),1).*(abs(E(ActivePos,:)).^2);

    % Exciton generation rate per second-cm3-nm at each position and wavelength
    Gxl=(Q*1e-3).*repmat(lambda*1e-9,length(ActivePos),1)/(h*c);
   
    if length(lambda)==1
        lambdastep= 1;
    else
        lambdastep=(max(lambda)-min(lambda))/(length(lambda)-1);
    end
    Gx =sum(Gxl,2)*lambdastep; % Exciton generation rate as a function of position/(sec-cm^3)
    
  
    
    
   
    t = thicknesses;
    
    % sends absorption, reflection, and wavelength data to the workspace
    dis=1:1:t(activeLayer);
    dis=dis/1000;
    CumG=cumsum(Gx)';
    LogDis=logspace(log10(dis(1)),log10(dis(t(activeLayer))-0.5),100);
    CumGen=interp1(dis,CumG,LogDis);
    GSi=[LogDis;CumGen/1e7];
    
  
   Jsc=sum(Gx)*stepsize*1e-7*q*1e3 ;%in mA/cm^2
    
    assignin('base','GSi',GSi');
    
    GSi=GSi';
    str= ['Gbot' num2str(top(i)) '.gen']
   dlmwrite(str, GSi,'delimiter', '\t','newline','pc');
    dlmwrite('top', top,'delimiter', '\t','newline','pc');
end
   

end

%------------------- Helper Functions ------------------------------------
% Function I_mat
% This function calculates the transfer matrix, I, for reflection and
% transmission at an interface between materials with complex dielectric 
% constant n1 and n2.
function I = I_mat(n1,n2)
r=(n1-n2)/(n1+n2);
t=2*n1/(n1+n2);
I=[1 r; r 1]/t;

% Function L_mat
% This function calculates the propagation matrix, L, through a material of
% complex dielectric constant n and thickness d for the wavelength lambda.
function L = L_mat(n,d,lambda)
xi=2*pi*n/lambda;
L=[exp(-1i*xi*d) 0; 0 exp(1i*xi*d)];

% Function LoadRefrIndex
% This function returns the complex index of refraction spectra, ntotal, for the
% material called 'name' for each wavelength value in the wavelength vector
% 'wavelengths'.  The material must be present in the index of refraction
% library 'Index_of_Refraction_library.xls'.  The program uses linear
% interpolation/extrapolation to determine the index of refraction for
% wavelengths not listed in the library.
function ntotal = LoadRefrIndex(name,wavelengths)

%Data in IndRefr, Column names in IndRefr_names
[IndRefr,IndRefr_names]=xlsread('Index_of_Refraction_library.xls');

% Load index of refraction data in spread sheet, will crash if misspelled
file_wavelengths=IndRefr(:,strmatch('Wavelength',IndRefr_names));
n=IndRefr(:,strmatch(strcat(name,'_n'),IndRefr_names));
k=IndRefr(:,strmatch(strcat(name,'_k'),IndRefr_names));

% Interpolate/Extrapolate data linearly to desired wavelengths
n_interp=interp1(file_wavelengths, n, wavelengths, 'pchip', 'extrap');
k_interp=interp1(file_wavelengths, k, wavelengths, 'pchip', 'extrap');

%Return interpolated complex index of refraction data
ntotal = n_interp+1i*k_interp; 
