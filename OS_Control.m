close all;clc;clear all;
theta = zeros(6,1);
ScriptForKin;
disp('Program started');
%vrep = remApi('remoteApi','extApi.h'); %Using header
vrep = remApi('remoteApi');
vrep.simxFinish(-1); %Close connections that exist.
clientID = vrep.simxStart('127.0.0.1',19997,true,true,5000,5);
q_target_pos = zeros(6,1);
if clientID > -1
   disp('Connected to V-REP remote API server');
   %Print to V-Rep that Client is connected
   vrep.simxAddStatusbarMessage(clientID,'Server connected to MATLAB',vrep.simx_opmode_blocking);
   [~,Objects_Scene, ~, ~, ObjectsInScene] = vrep.simxGetObjectGroupData(clientID,vrep.sim_appobj_object_type,0,vrep.simx_opmode_blocking); 
   ObjectsInScene = ObjectsInScene(:,1);
   h_joints = zeros(6,1);
   ind_joints = [14:3:27,28];
   ind_joints = [18:3:30,32];
   h_joints = Objects_Scene(ind_joints);
   h_target = Objects_Scene(45);
   h_ee = Objects_Scene(43);
   %Enable the syncrhonous mode
   vrep.simxSynchronous(clientID,true)
   
   %Start simulation 
   vrep.simxStartSimulation(clientID,vrep.simx_opmode_blocking);
  
   
   pause(1);
   counterStep = 0;
   totalTime = 200;
   %Fetch the end-effector pose
   [rtrn,ee_pos] = vrep.simxGetObjectPosition(clientID,h_ee,-1,vrep.simx_opmode_blocking);
   [rtrn,ee_anglesVREP] = vrep.simxGetObjectOrientation(clientID,h_ee,-1,vrep.simx_opmode_blocking);
   R = angle2dcm(ee_anglesVREP(1),ee_anglesVREP(2),ee_anglesVREP(3),'XYZ')';       
   g_curr = [R,ee_pos';zeros(1,3),1];

   %Fetch target pose
   [rtrn,ee_targ] = vrep.simxGetObjectPosition(clientID,h_target,-1,vrep.simx_opmode_blocking);
   [rtrn,ee_anglesTarg] = vrep.simxGetObjectOrientation(clientID,h_target,-1,vrep.simx_opmode_blocking);
   R = angle2dcm(ee_anglesTarg(1),ee_anglesTarg(2),ee_anglesTarg(3),'XYZ')';       
   g_targ = [R,ee_targ';zeros(1,3),1];
   q_targ = dcm2quat(g_targ(1:3,1:3)')';
   q_targ = [q_targ(2:4);q_targ(1)];
   pose_g_targ = [g_targ(1:3,4);q_targ];
   
   theta = zeros(6,1);
   g_curr = fn_CreateForwardKinExp(theta,om,q)*g_st_0;
   q_g = dcm2quat(g_curr(1:3,1:3)')';       
   q_g = [q_g(2:4);q_g(1)];   
   pose_g = [g_curr(1:3,4);q_g];
   pose_g_vec(:,1) = pose_g;
   
   
   
   theta_des = [pi/3;pi/4;-pi/6;pi/4;pi/3;-pi/4]; %theta_des = [0;pi/4;0;0;0;0];
   theta_dot_des = zeros(6,1);
   lambda = 1e-3;
   Kp = 1*[30*eye(3,3),zeros(3,4);zeros(4,3),30*eye(4,4)];
   Kv = Kp/4;
   counter = 0;
   max_dq = 1000*ones(6,1);
   for iCount = 1:6
      [~] = vrep.simxSetJointTargetVelocity(clientID,h_joints(iCount),0,vrep.simx_opmode_blocking); 
   end
   while(1)
       counter = counter + 1;
       %Fetch target pose
       [rtrn,ee_targ] = vrep.simxGetObjectPosition(clientID,h_target,-1,vrep.simx_opmode_blocking);
       [rtrn,ee_anglesTarg] = vrep.simxGetObjectOrientation(clientID,h_target,-1,vrep.simx_opmode_blocking);
       R = angle2dcm(ee_anglesTarg(1),ee_anglesTarg(2),ee_anglesTarg(3),'XYZ')';       
       g_targ = [R,ee_targ';zeros(1,3),1];
       q_targ = dcm2quat(g_targ(1:3,1:3)')';
       q_targ = [q_targ(2:4);q_targ(1)];
       pose_g_targ = [g_targ(1:3,4);q_targ];
       pose_g_targ_vec(:,counter) = pose_g_targ;
       
       %Run a time-step
       vrep.simxSynchronousTrigger(clientID); 
       
       %Fetch Joint-space measurements
       for iCount = 1:6
           [~,tau_t(iCount,1)] = vrep.simxGetJointForce(clientID,h_joints(iCount),vrep.simx_opmode_blocking);
           [~,q_curr(iCount,1)] = vrep.simxGetJointPosition(clientID,h_joints(iCount),vrep.simx_opmode_blocking);
           [~,dq(iCount,1)] = vrep.simxGetObjectFloatParameter(clientID, h_joints(iCount),2012,vrep.simx_opmode_blocking);           
       end              
       %Compute current Robot pose
       g_curr = fn_CreateForwardKinExp(q_curr,om,q)*g_st_0;
       q_g = dcm2quat(g_curr(1:3,1:3)')';       
       q_g = [q_g(2:4);q_g(1)];
       temp = fn_CrossTensor(q_g,0)*[-pose_g_vec(4:6,counter);pose_g_vec(7,counter)];
       if temp(4) < 0
          q_g = -q_g; 
       end
       pose_g = [g_curr(1:3,4);q_g];
       pose_g_vec(:,counter+1) = pose_g;
       %tau_comp(counter,:) = fn_ComputeJSg(theta,om,q);       
       tau(counter,:) = tau_t;
       q_true(counter,:) = q_curr;      
       
       %del_g = g_targ*inv(g_curr);       
       %del_q = fn_CrossTensor([-pose_g_targ(4:6);pose_g_targ(7)],0)*pose_g(4:7);     
             
       %Compute Jacobian in task space
       J_e = fn_CrossTensor(q_g,0);%-fn_VectorToSkewSymmetricTensor(del_pose_g(4:6));
       J_e = J_e(:,1:3);
       %J_e: Representation Jacobian (quaternion)
       J_e = [eye(3,3),zeros(3,3);zeros(4,3),J_e];       
       J = J_e*[J_1(q_curr'*180/pi),J_2(q_curr'*180/pi),J_3(q_curr'*180/pi),J_4(q_curr'*180/pi),J_5(q_curr'*180/pi),J_6(q_curr'*180/pi)]*180/pi;
       %J = J_e*fn_Jacobian(q_curr,om,q,4,g_st_0,0);
       J_star =  J'*inv(J*J' + lambda*eye(7,7));
       
       %Compute Task space error
       del_q = q_targ - q_g;       
       del_x(1:3,1) = [pose_g_targ(1:3)- pose_g(1:3)];
       del_x(4:7,1) = del_q(1:4);       
       del_x_dot = zeros(7,1) - J*dq;
       
       %screw = del_pose_g';
       %theta_dot = J_star*screw;%*pi/180;
       %theta_dot_des = J_star*screw;
       %theta_des = q_curr + 0.05*theta_dot_des;
       
       
       %del_theta = theta_des - q_curr;
       %del_theta_dot = theta_dot_des - dq;       
       
       u = Kp*del_x + Kv*del_x_dot; %
       %u = -u;
       %theta_dot = theta_dot + 0.05*u;
       
       
       M = fn_CreateMassMatrix(q_curr,om,q);
       M_ee = J_star'*(M)*J_star;
       g_q  = fn_ComputeJSg(q_curr,om,q);  
       g_ee = J_star'*g_q;       
       %C = fn_ComputeCMat(q_curr,q,om,dq);
       %C_ee = J_star'*C;
       C_ee = zeros(7,6);
       
       tau_cmd_os = M_ee*u + C_ee*dq + g_ee;
       tau_cmd_js = J'*tau_cmd_os;
       %tau_cmd = M*u + g_q + C*dq  ;        
       tau_cmd_js = tau_cmd_js.*-1 ;
       
       tau_cmd = tau_cmd_js;
       tau_vect(counter,:) = tau_cmd;
       %tau_cmd = g_q;
       for iCount = 1:6
           if sign(tau_cmd(iCount))*sign(tau(counter,iCount)) < 0
               max_dq(iCount) = max_dq(iCount)*-1;
           end
           [~] = vrep.simxSetJointTargetVelocity(clientID,h_joints(iCount),max_dq(iCount),vrep.simx_opmode_blocking);
           [~] = vrep.simxSetJointForce(clientID, h_joints(iCount), abs(tau_cmd(iCount)), vrep.simx_opmode_blocking);
       end
       
       %for iCount = 1:6
       %    [~] = vrep.simxSetJointTargetVelocity(clientID,h_joints(iCount),5*theta_dot(iCount),vrep.simx_opmode_blocking);
       %    %[~] = vrep.simxSetJointForce(clientID, h_joints(iCount), abs(tau_cmd(iCount)), vrep.simx_opmode_blocking);
       %end
       
       
       if counter > 100
           break;
       end
   end
   
   %Stop simulation
   vrep.simxStopSimulation(clientID,vrep.simx_opmode_blocking);
   
   %Close connection
   vrep.simxFinish(clientID);
end

figure;
for i = 1:6
    subplot(3,2,i)
    %plot(repmat(theta_des(i),[length(tau),1]),'LineStyle','-.');hold all;grid on;
    plot(q_true(:,i));
    ylabel(strcat('$',strcat('\theta_',num2str(i)),'$'),'interpreter','latex');
    xlabel('samples');
end

figure;
for i = 1:6
   subplot(3,2,i);
   plot(tau_vect(:,i));
   ylabel(strcat('$',strcat('\tau_',num2str(i)),'$'),'interpreter','latex');
   grid on;
end

figure;
for i = 1:7
   subplot(4,2,i);
   plot(pose_g_targ_vec(i,:),'LineStyle','-.');
   if i <= 3
       ylabel(strcat('$',strcat('x_',num2str(i)),'$'),'interpreter','latex');
   else
       ylabel(strcat('$',strcat('\mu_',num2str(i-3)),'$'),'interpreter','latex');
   end
   hold all;
   plot(pose_g_vec(i,:));
   grid on;
end
