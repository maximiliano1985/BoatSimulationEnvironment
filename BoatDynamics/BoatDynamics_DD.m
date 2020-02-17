PackageName = GetPackageName();

DDobject = Simulink.data.dictionary.open('BoatDynamics.sldd');
sectObj = getSection(DDobject,'Design Data');
DDEntries=find(sectObj);
Const_disp=1;Calib_disp=1;
disp('**********************'); disp('Updating: BoatDynamics.sldd'); disp('*********************')

%***************  CALIBRATABLES  **************************%
% assert( WriteCalibratable2DD('SmplTSim_T',[], [], '',  0.001,'double', PackageName, DDobject,DDEntries,Calib_disp));


%***************  CONSTANTS  **************************%
% assert( WriteConstant2DD('sss'   ,[], [], '', 10, 'uint8', PackageName, DDobject,DDEntries,Const_disp));


%************************************************************%
DDobject.saveChanges;
