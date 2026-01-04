mFileErrorCode = 100    % Beginning of the m-file 
try % 尝试执行的语句
   int1 = trnInputs(1);
   int2 = trnInputs(2);
   int3 = trnInputs(3);
   int4 = trnInputs(4);

   % 创建一个数组包含这些值
   data = [int1, int2, int3, int4];  % 使用逗号将它们放在一行

% 保存到 aa.csv 文件中
   csvwrite('aa.csv', data);
   JD=5

catch % 如果E运行错误， % 执行catch和end之间的代码块
   pause(0.141)
   int1 = trnInputs(1);
   int2 = trnInputs(2);
   int3 = trnInputs(3);
   int4 = trnInputs(4);

   % 创建一个数组包含这些值
   data = [int1, int2, int3, int4];  % 使用逗号将它们放在一行

% 保存到 aa.csv 文件中
   csvwrite('aa.csv', data);
   JD=6
end

try % 尝试执行的语句
     JD=7
    mFileErrorCode = 120    % After processing inputs


    if ( (trnInfo(7) == 0) & (trnTime-trnStartTime < 1e-6) )  
        % This is the first call (Counter will be incremented later for this very first call)
        nCall = 0;
        % This is the first time step
        nStep = 1;
        % No return, we will calculate the solar collector performance during this call
        mFileErrorCode = 130    % After initialization
    end
     JD=8

catch % 如果E运行错误， % 执行catch和end之间的代码块
    JD=9
    pause(0.141)
        mFileErrorCode = 120    % After processing inputs


    if ( (trnInfo(7) == 0) & (trnTime-trnStartTime < 1e-6) )  
        % This is the first call (Counter will be incremented later for this very first call)
        nCall = 0;
        % This is the first time step
        nStep = 1;
        % No return, we will calculate the solar collector performance during this call
        mFileErrorCode = 130    % After initialization
    end
     JD=10
end % 如果E运行出错，跳过并从这里开始运行

% mFileErrorCode = 120    % After processing inputs
% 
% 
% if ( (trnInfo(7) == 0) & (trnTime-trnStartTime < 1e-6) )  
%     % This is the first call (Counter will be incremented later for this very first call)
%     nCall = 0;
%     % This is the first time step
%     nStep = 1;
%     % No return, we will calculate the solar collector performance during this call
%     mFileErrorCode = 130    % After initialization
% end

if ( trnInfo(8) == -1 )
    mFileErrorCode = 1000;        
    mFileErrorCode = 0; % Tell TRNSYS that we reached the end of the m-file without errors
    return
end


if (trnInfo(13) == 1)   
    mFileErrorCode = 140;   % Beginning of a post-convergence call     
    mFileErrorCode = 0; % Tell TRNSYS that we reached the end of the m-file without errors
    return  % Do not update outputs at this call
end

% if ( trnInfo(7) == 0 )
%     nStep = nStep+1;
% end

try % 尝试执行的语句
    JD=19
    if ( trnInfo(7) == 0 )
        nStep = nStep+1;
        in8=nStep-1;
        JD=20
        try % 尝试执行的语句
            JD=21
            % 创建一个数组包含这些值
            data = [in8];  % 使用逗号将它们放在一行

            % 保存到 aa.csv 文件中
            csvwrite('bb.csv', data);
            JD=22
        catch % 如果E运行错误， % 执行catch和end之间的代码块
            JD=23
            pause(0.08141)
            % 创建一个数组包含这些值
            data = [in8];  % 使用逗号将它们放在一行

            % 保存到 aa.csv 文件中
            csvwrite('bb.csv', data);
            JD=24
        end

        try % 尝试执行的语句
            while true
                JD=25
                ddd=csvread('dd.csv');
                if ddd == nStep-1
                    break
                end
                pause(0.0207107)          %0.04747  0.179179
                JD=26
            end
        catch % 如果E运行错误， % 执行catch和end之间的代码块
             while true
                JD=27
                ddd=csvread('dd.csv');
                if ddd == nStep-1
                    break
                end
                pause(0.0207107)          %0.04747  0.179179
                JD=28
            end
        end
    end
catch % 如果E运行错误， % 执行catch和end之间的代码块
    if ( trnInfo(7) == 0 )
        nStep = nStep+1;
        in8=nStep-1;
        try % 尝试执行的语句
            JD=29
            % 创建一个数组包含这些值
            data = [in8];  % 使用逗号将它们放在一行

            % 保存到 aa.csv 文件中
            csvwrite('bb.csv', data);
            JD=30
        catch % 如果E运行错误， % 执行catch和end之间的代码块
            JD=31
            pause(0.141)
            % 创建一个数组包含这些值
            data = [in8];  % 使用逗号将它们放在一行

            % 保存到 aa.csv 文件中
            csvwrite('bb.csv', data);
            JD=32
        end

        try % 尝试执行的语句
            while true
                JD=33
                ddd=csvread('dd.csv');
                JD=34
                if ddd == nStep-1
                    break
                end
                pause(0.207107)          %0.04747  0.179179
            end
        catch % 如果E运行错误， % 执行catch和end之间的代码块
             while true
                 JD=35
                 ddd=csvread('dd.csv');
                 JD=36
                if ddd == nStep-1
                    break
                end
                pause(0.207107)          %0.04747  0.179179
            end
        end
    end
end % 如果E运行出错，跳过并从这里开始运行



% --- Get TRNSYS Inputs ---
pause(0.0207107) 
nI = trnInfo(3);     % For bookkeeping
nO = trnInfo(8);   % For bookkeeping

N   = trnInputs(1);
Load = trnInputs(2);
Twet = trnInputs(3);
Time = trnInputs(4);

mFileErrorCode = 150;   % After reading inputs 

pause(0.0307107)
ccc=csvread('cc.csv');
trnOutputs(1) = ccc(1);
trnOutputs(2) = ccc(2);
trnOutputs(3) = ccc(3);
trnOutputs(4) = ccc(4);
trnOutputs(5) = ccc(5);
trnOutputs(6) = ccc(6);
trnOutputs(7) = ccc(7);
trnOutputs(8) = ccc(8);

mFileErrorCode = 0; % Tell TRNSYS that we reached the end of the m-file without errors
return