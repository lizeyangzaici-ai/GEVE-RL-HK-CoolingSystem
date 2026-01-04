try % 尝试执行的语句
    JD=1
    mFileErrorCode = 100    % Beginning of the m-file
    mFileErrorCode = 110    % After setting parameters
    JD=2
catch % 如果E运行错误， % 执行catch和end之间的代码块
    JD=3
    mFileErrorCode = 100    % Beginning of the m-file
    mFileErrorCode = 110    % After setting parameters
    JD=4
end


try % 尝试执行的语句
    in1=trnInputs(1);
    in2=trnInputs(2);
    in3=trnInputs(3);

    py.mat2py.write1_csv(in1,in2,in3);
    JD=5
catch % 如果E运行错误， % 执行catch和end之间的代码块
    pause(1)
    in1=trnInputs(1);
    in2=trnInputs(2);
    in3=trnInputs(3);

    py.mat2py.write1_csv(in1,in2,in3);
    JD=6
end



try % 尝试执行的语句
     JD=7
     mFileErrorCode = 120    % After processing inputs
     if ( (trnInfo(7) == 0) & (trnTime-trnStartTime < 1e-6) )


        nCall = 0;

        nStep = 1;
        mFileErrorCode = 130    % After initialization
     end
     JD=8

catch % 如果E运行错误， % 执行catch和end之间的代码块
    JD=9
    pause(1)
    mFileErrorCode = 120    % After processing inputs
     if ( (trnInfo(7) == 0) & (trnTime-trnStartTime < 1e-6) )


        nCall = 0;

        nStep = 1;
        mFileErrorCode = 130    % After initialization
     end
     JD=10
end % 如果E运行出错，跳过并从这里开始运行



try % 尝试执行的语句
    JD=11
     if ( trnInfo(8) == -1 )
        mFileErrorCode = 1000;
        mFileErrorCode = 0; % Tell TRNSYS that we reached the end of the m-file without errors
        return
     end
    JD=12
catch % 如果E运行错误， % 执行catch和end之间的代码块
    JD=13
    pause(1)
    if ( trnInfo(8) == -1 )
        mFileErrorCode = 1000;
        mFileErrorCode = 0; % Tell TRNSYS that we reached the end of the m-file without errors
        return
    end
    JD=14
end % 如果E运行出错，跳过并从这里开始运行


try % 尝试执行的语句
    JD=15
    if (trnInfo(13) == 1)
        mFileErrorCode = 140;   % Beginning of a post-convergence call
        mFileErrorCode = 0; % Tell TRNSYS that we reached the end of the m-file without errors
        return  % Do not update outputs at this call
    end
    JD=16
catch % 如果E运行错误， % 执行catch和end之间的代码块
    pause(1)
    JD=17
    if (trnInfo(13) == 1)
        mFileErrorCode = 140;   % Beginning of a post-convergence call
        mFileErrorCode = 0; % Tell TRNSYS that we reached the end of the m-file without errors
        return  % Do not update outputs at this call
    end
    JD=18
end % 如果E运行出错，跳过并从这里开始运行


try % 尝试执行的语句
    JD=19
    if ( trnInfo(7) == 0 )
        nStep = nStep+1;
        in8=nStep-1;
        JD=20
        try % 尝试执行的语句
            JD=21
            py.mat2py.write2_csv(in8);
            JD=22
        catch % 如果E运行错误， % 执行catch和end之间的代码块
            JD=23
            pause(0.04141)
            py.mat2py.write2_csv(in8);
            JD=24
        end

        try % 尝试执行的语句
            while true
                JD=25
                ddd=csvread('dd.csv');
                if ddd == nStep-1
                    break
                end
                pause(0.107107)          %0.04747  0.179179
                JD=26
            end
        catch % 如果E运行错误， % 执行catch和end之间的代码块
             while true
                JD=27
                ddd=csvread('dd.csv');
                if ddd == nStep-1
                    break
                end
                pause(0.107107)          %0.04747  0.179179
                JD=28
            end
        end
    end
catch % 如果E运行错误， % 执行catch和end之间的代码块
    if ( trnInfo(7) == 0 )
        nStep = nStep+1;
%         in8=nStep-1;
%         try % 尝试执行的语句
%             JD=29
%             py.mat2py.write2_csv(in8);
%             JD=30
%         catch % 如果E运行错误， % 执行catch和end之间的代码块
%             JD=31
%             pause(0.071)
%             py.mat2py.write2_csv(in8);
%             JD=32
%         end
% 
%         try % 尝试执行的语句
%             while true
%                 JD=33
%                 ddd=csvread('dd.csv');
%                 JD=34
%                 if ddd == nStep-1
%                     break
%                 end
%                 pause(0.107107)          %0.04747  0.179179
%             end
%         catch % 如果E运行错误， % 执行catch和end之间的代码块
%              while true
%                  JD=35
%                  ddd=csvread('dd.csv');
%                  JD=36
%                 if ddd == nStep-1
%                     break
%                 end
%                 pause(0.107107)          %0.04747  0.179179
%             end
%         end
    end
end % 如果E运行出错，跳过并从这里开始运行



mFileErrorCode = 150;   % After reading inputs 


try % 尝试执行的语句
    JD=37
    ccc=csvread('cc.csv');
    JD=38
    trnOutputs(1) = ccc(1);
    trnOutputs(2) = ccc(2);
    trnOutputs(3) = ccc(3);
    trnOutputs(4) = ccc(4);
    trnOutputs(5) = ccc(5);
    trnOutputs(6) = ccc(6);
    trnOutputs(7) = ccc(7);
    trnOutputs(8) = ccc(8);
    JD=39
    mFileErrorCode = 0; % Tell TRNSYS that we reached the end of the m-file without errors
    return
catch % 如果E运行错误， % 执行catch和end之间的代码块
    JD=40
    pause(1)
    JD=41
%    ccc=28.888;
    JD=42
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
end


%trnOutputs(1) = ccc(1);

%mFileErrorCode = 0; % Tell TRNSYS that we reached the end of the m-file without errors
%return