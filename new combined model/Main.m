%define top cell thickness value layers = {'Air' 'glass' 'FTO'  'TiO2' 'perovskite' 'spiro'  'Si' 'SiOx'  'Al'}; 
% Names of layers of materials starting from side light is incident from
% thickness of each corresponding layer in nm (thickness of the first layer is irrelivant)
%thicknesses = [0 1000 700 50 top(u) 200  200000 100 100]; 
top =1500; % perov thickness,
dlmwrite('top', top,'delimiter', '\t','newline','pc'); % store the top value
TransferMatrixtandemtop;
TransferMatrixtandembot; % run TMM and compute generation profile
str1= ['Gtop' num2str(top) '.gen'];    
pc1dSet('GaAs.prm','CExcite::m_Filename',str1)
str2= ['Gbot' num2str(top) '.gen'];    
pc1dSet('Si.prm','CExcite::m_Filename',str2)
pc1dSetthickness('GaAs.prm','CRegion::m_Thickness',top/1e7);
pc1dSet('GaAs.prm','In CData: GraphableQuantity g','46','CGraph::m_xquantity:');
pc1dSet('GaAs.prm','In CData: GraphableQuantity g','45','CGraph::m_yquantity[0]:');
pc1dSet('Si.prm','In CData: GraphableQuantity g','46','CGraph::m_xquantity:');
pc1dSet('Si.prm','In CData: GraphableQuantity g','45','CGraph::m_yquantity[0]:');
   
[e f] = dos(['cmd-pc1d.exe GaAs.prm']);
datat = textscan(f,'%f%f%f%f%f%f%f%f%f%f%f%f%f','Headerlines',1);
datat = [datat{:}];

[c d] = dos(['cmd-pc1d.exe Si.prm']);
datab = textscan(d,'%f%f%f%f%f%f%f%f%f%f%f%f%f','Headerlines',1);
datab = [datab{:}]; %% data is the J-V of Bottom Si cell under filtered light

plot (datat(:,2),datat(:,1));
hold on;
plot (datab(:,2),datab(:,1));