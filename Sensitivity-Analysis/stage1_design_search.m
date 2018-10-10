function stage1_design = stage1_design_search(f,n1,dn,r)

%%%%% Purpose : Find the best Stage 1 design under the maximin distance criterion
%%%%% Inputs :
%%%%%     f  : number of inputs
%%%%%     n1 : number of stage 1 observations
%%%%%     dn : number of low-impact benchmark columns
%%%%%     r  : number of candidate designs
%%%%% Outputs :
%%%%%     stage1_design : a MATLAB structure to describe the selected design
%%%%%     stage1_design.x : n1 by (f+dn) selected design
%%%%%     stage1_design.maximin : maximum minimum distance
%%%%%     stage1_design.time : time to find the best design


% check whether the stage 1 design already exist
name = strcat('stage1_x_',num2str(n1));

if exist(name) == 2
    stage1_design.x = textread(name);
    stage1_design.maximin = [];
    stage1_design.time = [];
    
elseif exist(name)== 0
   
    tstart = tic;
        
    % storage of r candidated designs
    out = zeros(r,1);
    design = zeros(n1,f+dn,r);
    
    for k=1:r
        
        %%% Get Gram-Schmidt design
        % (1) picking random LHD design
        A = lhsdesign(n1,f+dn);
        
        % (2) centering each column
        B = A-repmat(mean(A,1),n1,1);
        [Q R] = qr(B,0);
        
        % (3) scaling each column to [0,1]
        QA = (Q-repmat(min(Q),n1,1)) ./ repmat(range(Q),n1,1);
        
        % compute the minimum distance of each pairs of design
        dist = [];
        for i = 1:(f+dn)-1
            for j = (i+1):(f+dn)
                dist = [dist,min(pdist(horzcat(QA(:,i),QA(:,j))))];
            end
        end
        
        % save a global minimum for each candidate design
        out(k,1) = min(dist);
        design(:,:,k) = QA;
    end
    
    % choose a design to maximize the minimum distance 
    [value,index] = max(out);
    cdbest = design(:,:,index); 
    
    % save the selected design as a text file
    name = strcat('stage1_x_',num2str(n1));
    save(name, 'cdbest','-ascii');

    time = toc(tstart);
    
    % save the results
    stage1_design.x = cdbest;
    stage1_design.maximin = value;
    stage1_design.time = time;
end

