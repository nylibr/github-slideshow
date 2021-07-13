%% Commodities Trading with MATLAB - Interactive data exploration
% Ideas for trading strategies can very often be generated by visual
% exploration of the price data. MATLAB's interactive plotting tools enable
% analysts to quickly visualize and explore datasets by zooming in & out,
% highlighting specific portions of a chart, or by removing chart points
% that are of little interest. 
%
% This script demonstrates one particular exploratory workflow. Our first
% step is to look at the data we have collected on an aggregate basis and
% see if we can infer any underlying common patterns that might lead to a
% trading strategy. Next, we split our data into aggregates by commodity
% types and take a closer look at these.

% Copyright 2013 The MathWorks, Inc.

%% 1. Looking at all our data
% In this section, we plot all the commodities together on one chart. We
% call a simple plotting function to iterate through each commodity in the
% given container. Note that we are plotting the entirety of the data, i.e.
% there is no separation yet of the training and test set.
PlotAllCommodities(DataContainer);

%% 2. We can also slice our data by commodity type.
% In this section, we slice our data into different structs for particular
% commodity types.
Energy=FilterByType(DataContainer,'Energy');
Metals=FilterByType(DataContainer,'Metal');
Softs=FilterByType(DataContainer,'Soft');
Grains=FilterByType(DataContainer,'Grain');

%% 3. Let's look at the energy commodities.
% Here, we will take a closer look at all our energy commodity data. We
% notice that natural gas behaves differently from the other commodities in
% this group.
PlotAllCommodities(Energy);

%% 4. Now let's look at these groups together.
% In this section, we take a close look at each of these groups together.
% We will create a new figure window and carve out subplots inside, one for
% each of the commodity groups we are exploring.
scrsz = get(0,'ScreenSize');
figure('Position',[1 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2]);

axis=subplot(2,2,1);
PlotAllCommodities(Energy,axis);title('Energy');
axis=subplot(2,2,2);
PlotAllCommodities(Softs,axis);title('Softs');
axis=subplot(2,2,3);
PlotAllCommodities(Metals,axis);title('Metals');
axis=subplot(2,2,4);
PlotAllCommodities(Grains,axis);title('Grains');
