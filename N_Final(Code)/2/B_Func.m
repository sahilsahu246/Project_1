function [ sz1 , dl1 , a1 , pos ] = B_Func( task,a1,sz1,dl1,nt,flag )

    pos=1:nt;
    if flag==1
    %-----Ascending BUBBLE SORT as per cost-time function----- 
    for i=1:nt
        for j=1:nt-1
            if task(j)>task(j+1)
                %--------------------------
                temp=task(j);
                temp1=sz1(j);
                temp2=dl1(j);
                temp3=a1(j);
                temp4=pos(j);
                %--------------------------
                task(j)=task(j+1);
                sz1(j)=sz1(j+1);
                dl1(j)=dl1(j+1);
                a1(j)=a1(j+1);
                pos(j)=pos(j+1);
                %--------------------------
                task(j+1)=temp;
                sz1(j+1)=temp1;
                dl1(j+1)=temp2;
                a1(j+1)=temp3;
                pos(j+1)=temp4;
                %--------------------------
            end
        end
    end
    %-------------------------------
    end
    
    if flag==2
    %-------Ascending Order BUBBLE SORT as per deadline-------    
       for i=1:nt
         for j=1:nt-1
            if dl1(j)>dl1(j+1)
                %--------------------------
                temp=task(j);
                temp1=sz1(j);
                temp2=dl1(j);
                temp3=a1(j);
                temp4=pos(j);
                %--------------------------
                task(j)=task(j+1);
                sz1(j)=sz1(j+1);
                dl1(j)=dl1(j+1);
                a1(j)=a1(j+1);
                pos(j)=pos(j+1);
                %--------------------------
                task(j+1)=temp;
                sz1(j+1)=temp1;
                dl1(j+1)=temp2;
                a1(j+1)=temp3;
                pos(j+1)=temp4;
                %--------------------------
            end
         end
       end
    %-----------------------------------------------
    end
end

