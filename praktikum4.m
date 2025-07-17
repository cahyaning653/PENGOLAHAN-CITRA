clc;
clear;
figure('Color', 'w');
axis equal;
axis([-1.5 1.5 -1.5 1.5]);
hold on;
title('Langkah-langkah Melipat Origami Bunga (Sederhana)');

% Langkah 1: Kertas persegi
rectangle('Position', [-1 -1 2 2], 'EdgeColor', 'k', 'LineWidth', 2);
text(0, 1.1, 'Langkah 1: Kertas persegi', 'HorizontalAlignment', 'center');

pause(2);
clf; hold on; axis equal; axis([-1.5 1.5 -1.5 1.5]);
title('Langkah 2: Lipat diagonal membentuk segitiga');

% Langkah 2: Lipat diagonal
plot([-1 1], [-1 1], 'r--', 'LineWidth', 2); % garis lipatan diagonal
fill([-1 1 1], [-1 -1 1], [0.8 0.9 1]); % segitiga lipatan

pause(2);
clf; hold on; axis equal; axis([-1.5 1.5 -1.5 1.5]);
title('Langkah 3: Lipat lagi diagonal segitiga');

% Langkah 3: Lipat segitiga kecil
plot([-1 0], [-1 1], 'r--', 'LineWidth', 2); % garis lipatan
plot([0 1], [1 -1], 'r--', 'LineWidth', 2); % garis lipatan
fill([-1 0 0], [-1 1 0], [0.8 0.9 1]); % segitiga kecil
fill([0 1 0], [0 -1 1], [0.6 0.8 1]); % segitiga kecil lain

pause(2);
clf; hold on; axis equal; axis([-1.5 1.5 -1.5 1.5]);
title('Langkah 4: Lipat sudut bawah ke tengah');

% Langkah 4: Lipat sudut
plot([-1 0], [-1 0], 'r--', 'LineWidth', 2);
plot([1 0], [-1 0], 'r--', 'LineWidth', 2);
fill([-1 0 0], [-1 0 0], [0.8 0.9 1]);
fill([1 0 0], [-1 0 0], [0.6 0.8 1]);

pause(2);
clf; hold on; axis equal; axis([-1.5 1.5 -1.5 1.5]);
title('Langkah 5: Bentuk kelopak bunga');

% Langkah 5: Bentuk kelopak sederhana
t = linspace(0, 2*pi, 100);
r = 0.6 + 0.3*sin(6*t);
x = r .* cos(t);
y = r .* sin(t);
fill(x, y, [1 0.7 0.7], 'EdgeColor', 'r', 'LineWidth', 2);

pause(2);
clf;
disp('Tutorial selesai: Bunga origami sederhana telah terbentuk!');

