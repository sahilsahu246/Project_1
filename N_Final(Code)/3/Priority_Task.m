function [ sz1 , dl1 , a1 , pos ] = Priority_Task(a,sz,dl,nt,flag)

sz1=zeros(1,nt);
dl1=zeros(1,nt);
task=zeros(1,nt);

if flag==1
    for i=1:nt
        sz1(i)=10*((sz(i)-(min(sz)))/(max(sz)-(min(sz))));
        dl1(i)=10*((dl(i)-(min(dl)))/(max(dl)-(min(dl))));
    end

    for i=1:nt
        task(i)=0.4*sz1(i)+0.6*dl1(i);
    end

    [sz1 , dl1 , a1 , pos] = B_Func(task,a,sz,dl,nt,flag);
end

if flag==2
    [sz1 , dl1 , a1 , pos] = B_Func(task,a,sz,dl,nt,flag);
end

end