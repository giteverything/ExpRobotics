function J_i = J_4(in1)
%J_4
%    J_I = J_4(IN1)

%    This function was generated by the Symbolic Math Toolbox version 6.2.
%    31-Mar-2017 13:38:14

q_1 = in1(:,1);
q_2 = in1(:,2);
q_3 = in1(:,3);
q_4 = in1(:,4);
q_5 = in1(:,5);
q_6 = in1(:,6);
t2 = pi.*q_1.*(1.0./1.8e2);
t3 = cos(t2);
t4 = pi.*q_3.*(1.0./1.8e2);
t5 = q_2+9.0e1;
t6 = pi.*t5.*(1.0./1.8e2);
t7 = q_4+9.0e1;
t8 = pi.*t7.*(1.0./1.8e2);
t9 = cos(t4);
t10 = cos(t6);
t11 = sin(t4);
t12 = sin(t6);
t13 = cos(t8);
t14 = t3.*t9.*t10;
t88 = t3.*t11.*t12;
t15 = t14-t88;
t16 = sin(t8);
t17 = t3.*t9.*t12;
t18 = t3.*t10.*t11;
t19 = t17+t18;
t20 = q_5+1.8e2;
t21 = pi.*t20.*(1.0./1.8e2);
t22 = sin(t21);
t23 = sin(t2);
t24 = t9.*t10.*t23;
t34 = t11.*t12.*t23;
t25 = t24-t34;
t26 = t9.*t12.*t23;
t27 = t10.*t11.*t23;
t28 = t26+t27;
t29 = t9.*t12;
t30 = t10.*t11;
t31 = t29+t30;
t32 = t9.*t10;
t33 = t32-t11.*t12;
t35 = pi.*q_6.*(1.0./1.8e2);
t36 = pi.*t13.*t28.*(1.0./1.8e2);
t37 = pi.*t16.*t25.*(1.0./1.8e2);
t38 = t36+t37;
t39 = sin(t35);
t40 = cos(t21);
t41 = cos(t35);
t42 = t40.^2;
t43 = t22.^2;
t44 = t9.^2;
t45 = t41.^2;
t46 = t10.^2;
t47 = t13.^2;
t48 = t16.^2;
t49 = t12.^2;
t50 = t39.^2;
t51 = t11.^2;
t52 = pi.*t13.*t25.*(1.0./1.8e2);
t53 = t52-pi.*t16.*t28.*(1.0./1.8e2);
t54 = t43.*t44.*t45.*t46.*t47;
t55 = t42.*t44.*t45.*t46.*t48;
t56 = t42.*t44.*t45.*t47.*t49;
t57 = t42.*t44.*t46.*t47.*t50;
t58 = t42.*t45.*t46.*t47.*t51;
t59 = t43.*t44.*t45.*t46.*t48;
t60 = t43.*t44.*t45.*t47.*t49;
t61 = t42.*t44.*t45.*t48.*t49;
t62 = t43.*t44.*t46.*t47.*t50;
t63 = t42.*t44.*t46.*t48.*t50;
t64 = t42.*t44.*t47.*t49.*t50;
t65 = t43.*t45.*t46.*t47.*t51;
t66 = t42.*t45.*t46.*t48.*t51;
t67 = t42.*t45.*t47.*t49.*t51;
t68 = t42.*t46.*t47.*t50.*t51;
t69 = t43.*t44.*t45.*t48.*t49;
t70 = t43.*t44.*t46.*t48.*t50;
t71 = t43.*t44.*t47.*t49.*t50;
t72 = t42.*t44.*t48.*t49.*t50;
t73 = t43.*t45.*t46.*t48.*t51;
t74 = t43.*t45.*t47.*t49.*t51;
t75 = t42.*t45.*t48.*t49.*t51;
t76 = t43.*t46.*t47.*t50.*t51;
t77 = t42.*t46.*t48.*t50.*t51;
t78 = t42.*t47.*t49.*t50.*t51;
t79 = t43.*t44.*t48.*t49.*t50;
t80 = t43.*t45.*t48.*t49.*t51;
t81 = t43.*t46.*t48.*t50.*t51;
t82 = t43.*t47.*t49.*t50.*t51;
t83 = t42.*t48.*t49.*t50.*t51;
t84 = t43.*t48.*t49.*t50.*t51;
t85 = t42.*t44.*t45.*t46.*t47;
t86 = t54+t55+t56+t57+t58+t59+t60+t61+t62+t63+t64+t65+t66+t67+t68+t69+t70+t71+t72+t73+t74+t75+t76+t77+t78+t79+t80+t81+t82+t83+t84+t85;
t87 = 1.0./t86;
t89 = pi.*t13.*t19.*(1.0./1.8e2);
t90 = pi.*t15.*t16.*(1.0./1.8e2);
t91 = t89+t90;
t92 = t9.*t10.*t16.*t40.*t41;
t93 = t9.*t12.*t13.*t40.*t41;
t94 = t10.*t11.*t13.*t40.*t41;
t95 = t9.*t12.*t16.*t39.*t42;
t96 = t10.*t11.*t16.*t39.*t42;
t97 = t11.*t12.*t13.*t39.*t42;
t98 = t9.*t12.*t16.*t39.*t43;
t99 = t10.*t11.*t16.*t39.*t43;
t100 = t11.*t12.*t13.*t39.*t43;
t101 = t92+t93+t94+t95+t96+t97+t98+t99+t100-t9.*t10.*t13.*t39.*t42-t9.*t10.*t13.*t39.*t43-t11.*t12.*t16.*t40.*t41;
t102 = pi.*t13.*t15.*(1.0./1.8e2);
t134 = pi.*t16.*t19.*(1.0./1.8e2);
t103 = t102-t134;
t104 = t11.*t12.*t16.*t39.*t40;
t105 = t9.*t12.*t16.*t41.*t42;
t106 = t10.*t11.*t16.*t41.*t42;
t107 = t11.*t12.*t13.*t41.*t42;
t108 = t9.*t12.*t16.*t41.*t43;
t109 = t10.*t11.*t16.*t41.*t43;
t110 = t11.*t12.*t13.*t41.*t43;
t111 = t104+t105+t106+t107+t108+t109+t110-t9.*t12.*t13.*t39.*t40-t10.*t11.*t13.*t39.*t40-t9.*t10.*t16.*t39.*t40-t9.*t10.*t13.*t41.*t42-t9.*t10.*t13.*t41.*t43;
t112 = t9.*t10.*t16.*t22;
t113 = t9.*t12.*t13.*t22;
t114 = t10.*t11.*t13.*t22;
t115 = t112+t113+t114-t11.*t12.*t16.*t22;
t116 = t42.*t44.*t46.*t47;
t117 = t43.*t44.*t46.*t47;
t118 = t42.*t44.*t46.*t48;
t119 = t42.*t44.*t47.*t49;
t120 = t42.*t46.*t47.*t51;
t121 = t43.*t44.*t46.*t48;
t122 = t43.*t44.*t47.*t49;
t123 = t42.*t44.*t48.*t49;
t124 = t43.*t46.*t47.*t51;
t125 = t42.*t46.*t48.*t51;
t126 = t42.*t47.*t49.*t51;
t127 = t43.*t44.*t48.*t49;
t128 = t43.*t46.*t48.*t51;
t129 = t43.*t47.*t49.*t51;
t130 = t42.*t48.*t49.*t51;
t131 = t43.*t48.*t49.*t51;
t132 = t116+t117+t118+t119+t120+t121+t122+t123+t124+t125+t126+t127+t128+t129+t130+t131;
t133 = 1.0./t132;
t135 = t39.*t103;
t136 = t135-t40.*t41.*t91;
t137 = t3.^2;
t138 = t23.^2;
t139 = t41.*t103;
t140 = t39.*t40.*t91;
t141 = t139+t140;
t142 = t43.*t44.*t45.*t48.*t49.*t137;
t143 = t43.*t44.*t46.*t48.*t50.*t137;
t144 = t43.*t44.*t47.*t49.*t50.*t137;
t145 = t42.*t44.*t48.*t49.*t50.*t137;
t146 = t43.*t45.*t46.*t48.*t51.*t137;
t147 = t43.*t45.*t47.*t49.*t51.*t137;
t148 = t42.*t45.*t48.*t49.*t51.*t137;
t149 = t43.*t46.*t47.*t50.*t51.*t137;
t150 = t42.*t46.*t48.*t50.*t51.*t137;
t151 = t42.*t47.*t49.*t50.*t51.*t137;
t152 = t43.*t44.*t45.*t46.*t48.*t138;
t153 = t43.*t44.*t45.*t47.*t49.*t138;
t154 = t42.*t44.*t45.*t48.*t49.*t138;
t155 = t43.*t44.*t46.*t47.*t50.*t138;
t156 = t42.*t44.*t46.*t48.*t50.*t138;
t157 = t42.*t44.*t47.*t49.*t50.*t138;
t158 = t43.*t45.*t46.*t47.*t51.*t138;
t159 = t42.*t45.*t46.*t48.*t51.*t138;
t160 = t42.*t45.*t47.*t49.*t51.*t138;
t161 = t42.*t46.*t47.*t50.*t51.*t138;
t162 = t43.*t44.*t48.*t49.*t50.*t137;
t163 = t43.*t45.*t48.*t49.*t51.*t137;
t164 = t43.*t46.*t48.*t50.*t51.*t137;
t165 = t43.*t47.*t49.*t50.*t51.*t137;
t166 = t42.*t48.*t49.*t50.*t51.*t137;
t167 = t43.*t44.*t45.*t48.*t49.*t138;
t168 = t43.*t44.*t46.*t48.*t50.*t138;
t169 = t43.*t44.*t47.*t49.*t50.*t138;
t170 = t42.*t44.*t48.*t49.*t50.*t138;
t171 = t43.*t45.*t46.*t48.*t51.*t138;
t172 = t43.*t45.*t47.*t49.*t51.*t138;
t173 = t42.*t45.*t48.*t49.*t51.*t138;
t174 = t43.*t46.*t47.*t50.*t51.*t138;
t175 = t42.*t46.*t48.*t50.*t51.*t138;
t176 = t42.*t47.*t49.*t50.*t51.*t138;
t177 = t43.*t48.*t49.*t50.*t51.*t137;
t178 = t43.*t44.*t48.*t49.*t50.*t138;
t179 = t43.*t45.*t48.*t49.*t51.*t138;
t180 = t43.*t46.*t48.*t50.*t51.*t138;
t181 = t43.*t47.*t49.*t50.*t51.*t138;
t182 = t42.*t48.*t49.*t50.*t51.*t138;
t183 = t43.*t48.*t49.*t50.*t51.*t138;
t184 = t42.*t44.*t45.*t46.*t47.*t137;
t185 = t43.*t44.*t45.*t46.*t47.*t137;
t186 = t42.*t44.*t45.*t46.*t48.*t137;
t187 = t42.*t44.*t45.*t47.*t49.*t137;
t188 = t42.*t44.*t46.*t47.*t50.*t137;
t189 = t42.*t45.*t46.*t47.*t51.*t137;
t190 = t42.*t44.*t45.*t46.*t47.*t138;
t191 = t43.*t44.*t45.*t46.*t48.*t137;
t192 = t43.*t44.*t45.*t47.*t49.*t137;
t193 = t42.*t44.*t45.*t48.*t49.*t137;
t194 = t43.*t44.*t46.*t47.*t50.*t137;
t195 = t42.*t44.*t46.*t48.*t50.*t137;
t196 = t42.*t44.*t47.*t49.*t50.*t137;
t197 = t43.*t45.*t46.*t47.*t51.*t137;
t198 = t42.*t45.*t46.*t48.*t51.*t137;
t199 = t42.*t45.*t47.*t49.*t51.*t137;
t200 = t42.*t46.*t47.*t50.*t51.*t137;
t201 = t43.*t44.*t45.*t46.*t47.*t138;
t202 = t42.*t44.*t45.*t46.*t48.*t138;
t203 = t42.*t44.*t45.*t47.*t49.*t138;
t204 = t42.*t44.*t46.*t47.*t50.*t138;
t205 = t42.*t45.*t46.*t47.*t51.*t138;
t206 = t142+t143+t144+t145+t146+t147+t148+t149+t150+t151+t152+t153+t154+t155+t156+t157+t158+t159+t160+t161+t162+t163+t164+t165+t166+t167+t168+t169+t170+t171+t172+t173+t174+t175+t176+t177+t178+t179+t180+t181+t182+t183+t184+t185+t186+t187+t188+t189+t190+t191+t192+t193+t194+t195+t196+t197+t198+t199+t200+t201+t202+t203+t204+t205;
t207 = 1.0./t206;
J_i = [t22.*t91.*(-3.0./4.0e1)+pi.*t13.*t15.*5.266666666666667e-4-pi.*t16.*t19.*5.266666666666667e-4;t22.*t38.*(-3.0./4.0e1)+pi.*t13.*t25.*5.266666666666667e-4-pi.*t16.*t28.*5.266666666666667e-4;t22.*(pi.*t13.*t33.*(1.0./1.8e2)-pi.*t16.*t31.*(1.0./1.8e2)).*(3.0./4.0e1)+pi.*t13.*t31.*5.266666666666667e-4+pi.*t16.*t33.*5.266666666666667e-4;-t87.*t101.*(t39.*t53-t38.*t40.*t41)-t87.*t111.*(t41.*t53+t38.*t39.*t40)+t22.*t38.*t115.*t133;t87.*t101.*t136+t87.*t111.*t141-t22.*t91.*t115.*t133;-t141.*t207.*(-t9.*t10.*t13.*t23.*t39.*t40+t11.*t12.*t13.*t23.*t39.*t40+t9.*t12.*t16.*t23.*t39.*t40+t10.*t11.*t16.*t23.*t39.*t40+t9.*t12.*t13.*t23.*t41.*t42+t10.*t11.*t13.*t23.*t41.*t42+t9.*t10.*t16.*t23.*t41.*t42+t9.*t12.*t13.*t23.*t41.*t43+t10.*t11.*t13.*t23.*t41.*t43+t9.*t10.*t16.*t23.*t41.*t43-t11.*t12.*t16.*t23.*t41.*t42-t11.*t12.*t16.*t23.*t41.*t43+t3.*t22.*t39.*t44.*t46.*t47+t3.*t22.*t39.*t44.*t46.*t48+t3.*t22.*t39.*t44.*t47.*t49+t3.*t22.*t39.*t44.*t48.*t49+t3.*t22.*t39.*t46.*t47.*t51+t3.*t22.*t39.*t46.*t48.*t51+t3.*t22.*t39.*t47.*t49.*t51+t3.*t22.*t39.*t48.*t49.*t51)+t136.*t207.*(-t9.*t10.*t13.*t23.*t40.*t41-t9.*t12.*t13.*t23.*t39.*t42-t10.*t11.*t13.*t23.*t39.*t42-t9.*t10.*t16.*t23.*t39.*t42-t9.*t12.*t13.*t23.*t39.*t43-t10.*t11.*t13.*t23.*t39.*t43-t9.*t10.*t16.*t23.*t39.*t43+t11.*t12.*t13.*t23.*t40.*t41+t9.*t12.*t16.*t23.*t40.*t41+t10.*t11.*t16.*t23.*t40.*t41+t11.*t12.*t16.*t23.*t39.*t42+t11.*t12.*t16.*t23.*t39.*t43+t3.*t22.*t41.*t44.*t46.*t47+t3.*t22.*t41.*t44.*t46.*t48+t3.*t22.*t41.*t44.*t47.*t49+t3.*t22.*t41.*t44.*t48.*t49+t3.*t22.*t41.*t46.*t47.*t51+t3.*t22.*t41.*t46.*t48.*t51+t3.*t22.*t41.*t47.*t49.*t51+t3.*t22.*t41.*t48.*t49.*t51)+(t22.*t91.*(t9.*t10.*t13.*t22.*t23-t11.*t12.*t13.*t22.*t23-t9.*t12.*t16.*t22.*t23-t10.*t11.*t16.*t22.*t23+t3.*t40.*t44.*t46.*t47+t3.*t40.*t44.*t46.*t48+t3.*t40.*t44.*t47.*t49+t3.*t40.*t44.*t48.*t49+t3.*t40.*t46.*t47.*t51+t3.*t40.*t46.*t48.*t51+t3.*t40.*t47.*t49.*t51+t3.*t40.*t48.*t49.*t51))./(t42.*t44.*t46.*t47.*t137+t42.*t44.*t46.*t47.*t138+t42.*t44.*t46.*t48.*t137+t43.*t44.*t46.*t47.*t137+t42.*t44.*t46.*t48.*t138+t43.*t44.*t46.*t47.*t138+t43.*t44.*t46.*t48.*t137+t42.*t44.*t47.*t49.*t137+t43.*t44.*t46.*t48.*t138+t42.*t44.*t47.*t49.*t138+t42.*t44.*t48.*t49.*t137+t43.*t44.*t47.*t49.*t137+t42.*t44.*t48.*t49.*t138+t43.*t44.*t47.*t49.*t138+t43.*t44.*t48.*t49.*t137+t43.*t44.*t48.*t49.*t138+t42.*t46.*t47.*t51.*t137+t42.*t46.*t47.*t51.*t138+t42.*t46.*t48.*t51.*t137+t43.*t46.*t47.*t51.*t137+t42.*t46.*t48.*t51.*t138+t43.*t46.*t47.*t51.*t138+t43.*t46.*t48.*t51.*t137+t42.*t47.*t49.*t51.*t137+t43.*t46.*t48.*t51.*t138+t42.*t47.*t49.*t51.*t138+t42.*t48.*t49.*t51.*t137+t43.*t47.*t49.*t51.*t137+t42.*t48.*t49.*t51.*t138+t43.*t47.*t49.*t51.*t138+t43.*t48.*t49.*t51.*t137+t43.*t48.*t49.*t51.*t138)];
