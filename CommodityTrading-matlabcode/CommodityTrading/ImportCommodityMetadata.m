%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: .\CommodityMetadata.xlsx
%    Worksheet: Sheet1
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

% Auto-generated by MATLAB on 2013/06/18 11:40:09
%
% Copyright 2013 The MathWorks, Inc.

%% Import the data
[~, ~, raw] = xlsread('.\CommodityMetadata.xlsx','Sheet1','A2:H20');
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
cellVectors = raw(:,[1,2,3,4,7]);
raw = raw(:,[5,6,8]);

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Create dataset array
CommodityMetadata = dataset;

%% Allocate imported array to column variable names
CommodityMetadata.Commodity = cellVectors(:,1);
CommodityMetadata.Type = cellVectors(:,2);
CommodityMetadata.Symbol = cellVectors(:,3);
CommodityMetadata.Exchange = cellVectors(:,4);
CommodityMetadata.Source = cellVectors(:,5);
CommodityMetadata.TickSize = data(:,1);
CommodityMetadata.TickValue = data(:,2);
CommodityMetadata.Margin = data(:,3);

%% Clear temporary variables
clearvars data raw cellVectors;