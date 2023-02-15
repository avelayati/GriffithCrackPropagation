%%
%%% Arian Velayati, PhD
%%%% This script is used to find displacement and stress intensity factor
%%%% in crack propagation scenarios. Griffith asumptions: isotropic and
%%%% homohgeneous solid to solve for stresses around a fracture
clc; close; clear;
%% Inputs

Pinj = 20.5; % Fluid injection pressure (MPa)
S3 = 20; % Least pricnipal total stress (MPa)
C = 10; % Fracture half length (m)
E = 1; % Modulus of elasticity (GPa)
v = 0.25; % Poisson ratio
K1c = 0.8 ; % Fracture toughness MPa m^1/2
%% Calculations

Pnet = Pinj - S3 ; % Net pressure; MPa

if Pnet>0
    disp('Fracture will open')
else
    disp('Fracture will not open, consider increasing injection pressure')
    break
end

Ep = E/(1-v^2); % Plane strain modulus (GPa)
Ep = Ep*1000 % MPa

x = input(' Please specifiy where do you wish to investigate the strain and stress around the fracture 0<x<C : ')

if x<0 || x>C
    disp('Not within the acceptable range')
    break
end

uy = 2*Pnet*(sqrt(C^2-x^2))/Ep; % Displacement (m)
uy = uy * 1000 % mm
Wo = 4*Pnet*C/Ep; % maximum width of the fracture (m)
Wo = Wo*1000 % mm
K1 = Pnet*(pi*C)^0.5 % Stress intensity factor (MPa m^1/2)for a line crack pressurized with constant pressure Pnet

if K1 > K1c
    disp('Fracture propagates')
else
    disp('Fracture cannot propagate')
end


