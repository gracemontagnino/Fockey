function find_start_and_finish(roll,yaw,dt)
    N = dt(end) - dt(1);
    n = N/5;
    
    figure
    subplot(5,2,1);
    plot(dt,yaw,'g');
    xlim([dt(1) (dt(1)+n)])
    title('yaw')
    subplot(5,2,2);
    plot(dt,roll,'g');
    xlim([dt(1) (dt(1)+n)])
    title('roll')

    subplot(5,2,3);
    plot(dt,yaw,'magenta');
    xlim([dt(1)+n (dt(1)+2*n)])
    title('yaw')
    subplot(5,2,4);
    plot(dt,roll,'magenta');
    xlim([dt(1)+n (dt(1)+2*n)])
    title('roll')

    subplot(5,2,5);
    plot(dt,yaw,'b');
    xlim([dt(1)+2*n (dt(1)+3*n)])
    title('yaw')
    subplot(5,2,6);
    plot(dt,roll,'b');
    xlim([dt(1)+2*n (dt(1)+3*n)])
    title('roll')

    subplot(5,2,7);
    plot(dt,yaw,'r');
    xlim([dt(1)+3*n (dt(1)+4*n)])
    title('yaw')
    subplot(5,2,8);
    plot(dt,roll,'r');
    xlim([dt(1)+3*n (dt(1)+4*n)])
    title('roll')

    subplot(5,2,9);
    plot(dt,yaw,'c');
    xlim([dt(1)+4*n (dt(1)+5*n)])
    title('yaw')
    subplot(5,2,10);
    plot(dt,roll,'c');
    xlim([dt(1)+4*n (dt(1)+5*n)])
    title('roll')
end