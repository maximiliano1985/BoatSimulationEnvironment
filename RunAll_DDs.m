disp('### Updating variables in data dictionaries...');

%% Check OS adn set proper separators for folder
fldSep = '\';
if ismac
    fldSep = '/';
end


%% General configurations
TOKEN_DD_FILES = [fldSep, '*_DD.m'];

rootFolder = '.';
folders = genpath(rootFolder);
folders = split(folders,':');

files2skip   = {'delete_DD', mfilename};
folders2skip = {'.git', 'slprj'};

%% Automated finding and run of the *_DD.m files
for i = 1:length(folders)
    fldr = folders{i};
    
    % skip undesired folders
    if contains(fldr, folders2skip)
        continue;
    end
    
    if ~isempty(fldr) % skip empty entries
        % look for the 
        dd_mfiles = ls([fldr,TOKEN_DD_FILES]); % is a char array
        if isempty(dd_mfiles)
            continue;
        end
        
        [n_files, ~] = size(dd_mfiles);
        for j = 1:n_files
            if n_files > 1
                df_m = dd_mfiles(j,:);
            else
                df_m = dd_mfiles;
            end
            df_m = deblank(df_m); % remove empty spaces
            
            if ~any(strcmp(files2skip, df_m(1:end-2))) % skip the file is in the skip list
                run(df_m);
            end
        end
    end
end

 

disp('### Update done!');