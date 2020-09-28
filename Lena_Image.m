close all;
u_exact = double(lena_bw(:,:,1));
u_exact = u_exact/250;
u_exact = zeros(514);
u_exact(2:end-1,2:end-1) = double(lena_bw(:,:,1))/250;
dx = 1/513;
for i = 2:513
    for j = 2:513
        b(i,j) = (u_exact(i-1,j) + u_exact(i+1,j) + u_exact(i,j-1) + u_exact(i,j+1)-(4*u_exact(i,j)))/(dx^2);
    end
end
% figure;
%  imshow(b)

u = zeros(514);
hold on
u_next = zeros(514);
% figure;
% hold on
for i = 2:513
        for j = 2:513
            u_next(i,j) = -(dx^2)/4*(b(i,j)-(u(i-1,j)+u(i+1,j)+u(i,j-1)+u(i,j+1))/(dx^2));
        end
end
%mshow(u_next*3);

 % set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 0.5, 0.5]);
figure;
for k = 2:500
    u = u_next;
    for i = 2:513
        for j = 2:513
            u_next(i,j) = -(dx^2)/4*(b(i,j)-(u(i-1,j)+u(i+1,j)+u(i,j-1)+u(i,j+1))/(dx^2));
        end
    end
    imshow(u_next*1.5)
    hold on
    title( sprintf('Iteration No. = %d', k) )
    drawnow; 
    pause(0.25); 
end