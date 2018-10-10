function stage2_design = stage2_design_search(f,n1,n2,r,actx,nctx,dn)

%%%%% Purpose : Find the best Stage 2 design under the maximin distance criterion
%%%%% Inputs :
%%%%%     f  : number of inputs
%%%%%     n1 : number of stage 2 observations
%%%%%     n2 : number of new design points
%%%%%     r  : number of candidate designs
%%%%      actx : index of inputs in active groups
%%%%      nctx : index of inputs in non-active groups
%%%%      dn : number of low-impact columns used in Stage 2
%%%%% Outputs :
%%%%%     stage2_design : a MATLAB structure to describe the selected design
%%%%%     stage2_design.x : n2 by (f+dn) selected design
%%%%%     stage2_design.maximin : maximum minimum distance
%%%%%     stage2_design.time : time to find the best design


% check whether the stage 1 design already exist
name = strcat('stage2_x_', num2str(n2), mat2str(sort(actx)));

if exist(name) == 2
    stage2_design.x = textread(name);
    stage2_design.maximin = [];
    stage2_design.time = [];
    
elseif exist(name)== 0

    tstart = tic;
    
    % number of inputs in active or non-active groups
    actxn = length(actx);         
    
    % call stage 1 design
    name = strcat('stage1_x_', num2str(n1));
    oldx = textread(name);
    
    % split stage 1 design
    W1a = oldx(:,actx);     % inputs in active groups
    W1b = oldx(:,nctx);     % inputs in non-active groups
    
    % randomly choose dn low-impact columns 
    fc = randperm(dn)+f;
    W1d = oldx(:,fc); % low-impact inputs
    QA1 = horzcat(W1a,W1d);
    
    % generate new design matrix for inputs in active groups and low-impact inputs
    out = zeros(r,1);
    design = zeros(n2,actxn+dn,r);
    
    for k=1:r
        
        %%% Get Gram-Schmidt design    
        % (1) picking random LHD design
        A = lhsdesign(n2,actxn+dn);
        
        % (2) centering each column
        B = A-repmat(mean(A,1),n2,1);
        [Q R] = qr(B,0);
        
        % (3) scaling each column to [0,1]
        QA2 = (Q-repmat(min(Q),n2,1)) ./ repmat(range(Q),n2,1);
        
        % Combine with Stage 1 design matrix part 
        % corresponding to input in active groups and low-impact inputs
        QA = vertcat(QA1,QA2);   
        
        % compute the minimum distance of each pairs of design
        dist = [];
        for i = 1:(actxn+dn)-1
            for j = (i+1):(actxn+dn)
                dist = [dist,min(pdist(horzcat(QA(:,i),QA(:,j))))];
            end
        end
        
        % save a global minimum for each candidate design
        out(k,1) = min(dist);
        
        design(:,:,k) = QA2;
    end
    
    % choose a design to maximize the minimum distance 
    [value,index] = max(out);
    cdbest = design(:,:,index); 
    
    % split stage 2 design
    W2a = cdbest(:,1:actxn);           % inputs in active groups
    W2d = cdbest(:,actxn+1:actxn+dn);  % low-impact inputs
    
    % assign medium value of Stage 1 column to inputs in non-active groups
    W2b = repmat(median(W1b),n2,1);
    
    %combine all pieces in original format
    newx = zeros(n2,f+dn);
    newx(:,actx) = W2a;
    newx(:,nctx) = W2b;
    newx(:,f+1:f+dn) = W2d;
    
    % save the selected design as a text file
    name = strcat('stage2_x_', num2str(n2), mat2str(sort(actx)));
    save(name, 'newx','-ascii');
    
    time = toc(tstart);
    
    stage2_design.x = newx;
    stage2_design.maximin = value;
    stage2_design.time = time;
end    
