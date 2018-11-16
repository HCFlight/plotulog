function plotAttitudeControl(time_att, att_rpy_speed, att_q, time_att_sp, att_rpy_sp, time_input_rc, input_rc, path)
  input_roll = (input_rc(:,1)-1500)/500;   %rc Roll channel set to 1
  input_pitch = (input_rc(:,2)-1500)/500;  %rc Pitch channel set to 2
  input_yaw = (input_rc(:,4)-1500)/500;    %rc Yaw channel set to 4
  rpy = [];
  for i=1:length(att_q)
    rpy = [ rpy; quaternionToEuler(att_q(i,1), att_q(i,2), att_q(i,3), att_q(i,4)) ];
  end
  h_att = figure('Position',[0,900,600,400]);
  clf(h_att);
  subplot(211)
    plot(time_att, rpy(:,1),'LineWidth',1.3);
    xlim( [ time_att(1) time_att(length(time_att)) ]);
    grid on;
    set (gca, 'xminorgrid', 'on');  xlabel('Time(sec)');  ylabel('Angle');  title('Roll');
    hold on;
    plot(time_att_sp, att_rpy_sp(:,1)*180/pi, 'LineWidth',1.3);
    plot(time_input_rc, input_roll, 'LineWidth',1.2);
    [hleg1 hobj1] = legend('IMU', 'Setpoint', 'Input Roll');
    hold off;
  subplot(212)
    plot(time_att, rpy(:,2),'LineWidth',1.3);
    xlim( [ time_att(1) time_att(length(time_att)) ]);
    grid on;
    set (gca, 'xminorgrid', 'on');  xlabel('Time(sec)');  ylabel('Angle');  title('Pitch');
    hold on;
    plot(time_att_sp, att_rpy_sp(:,2)*180/pi, 'LineWidth',1.3);
    plot(time_input_rc, input_pitch, 'LineWidth',1.2);
    [hleg1 hobj1] = legend('IMU', 'Setpoint', 'Input Pitch');
    hold off;
    
  saveName = sprintf('%sAttitude_Control.png', path)
  saveas(h_att,saveName);

  h_yaw = figure('Position',[0,800,600,400]);
  clf(h_yaw);
  plot(time_att, rpy(:,3),'LineWidth',1.5);
  xlim( [ time_att(1) time_att(length(time_att)) ]);
  grid on;
  set (gca, 'xminorgrid', 'on');  xlabel('Time(sec)');  ylabel('Heading');  title('Yaw');
  hold on;
  plot(time_att_sp, att_rpy_sp(:,3)*180/pi, 'LineWidth',1.5);
  plot(time_input_rc, input_yaw, 'LineWidth',1.2);
  [hleg1 hobj1] = legend('IMU', 'Setpoint', 'Input Yaw');
  
  saveName = sprintf('%sAttitude_Yaw_Control.png', path)
  saveas(h_yaw,saveName);


