% NAME - PRATHAM SANDESARA
% PROJECT -- SESSION -13 
% ENR 112 - LINEAR ALGEBRA LABORATORY 


% FUTURE STOCK PRICE PREDICTION USING REGRESSION

% Simulate historical stock price data (days and prices)
days = (1:30)'; % Days (predictor variable)
prices = 100 + 2 * days + 0.05 * days.^2 + 5 * randn(size(days));


% DEFINING MATRICES FOR DIFFERENT MODELS (LINEAR , QUADRATIC , CUBIC)
X_linear = [ones(size(days)), days];                   
X_quadratic = [ones(size(days)), days, days.^2];        
X_cubic = [ones(size(days)), days, days.^2, days.^3];  

% Perform linear regression for each model
coeff_linear = (X_linear' * X_linear) \ (X_linear' * prices);
coeff_quadratic = (X_quadratic' * X_quadratic) \ (X_quadratic' * prices);
coeff_cubic = (X_cubic' * X_cubic) \ (X_cubic' * prices);

% Predictions for each model
pred_linear = X_linear * coeff_linear;
pred_quadratic = X_quadratic * coeff_quadratic;
pred_cubic = X_cubic * coeff_cubic;

% Plot actual prices and all model predictions
figure;
 % Actual prices
plot(days, prices, 'bo-', 'LineWidth', 1.5); 
hold on;
plot(days, pred_linear, 'r--', 'LineWidth', 1.5);      %
plot(days, pred_quadratic, 'g-.', 'LineWidth', 1.5);   
plot(days, pred_cubic, 'm:', 'LineWidth', 1.5);      
xlabel('Days');
ylabel('Stock Price');
title('Stock Price Prediction with Linear, Quadratic, and Cubic Models');
legend('Actual Prices', 'Linear Model', 'Quadratic Model', 'Cubic Model');
grid on;




% Calculate and display Mean Squared Error (MSE) for each model
mse_linear = mean((prices - pred_linear).^2);
mse_quadratic = mean((prices - pred_quadratic).^2);
mse_cubic = mean((prices - pred_cubic).^2);

fprintf('\nMean Squared Error (MSE) for each model:\n');
fprintf('Linear Model MSE: %.2f\n', mse_linear);
fprintf('Quadratic Model MSE: %.2f\n', mse_quadratic);
fprintf('Cubic Model MSE: %.2f\n', mse_cubic);



% Calculate and display R-squared (R²) for each model
SST = sum((prices - mean(prices)).^2); % Total sum of squares
R2_linear = 1 - sum((prices - pred_linear).^2) / SST;
R2_quadratic = 1 - sum((prices - pred_quadratic).^2) / SST;
R2_cubic = 1 - sum((prices - pred_cubic).^2) / SST;

fprintf('\nR-squared (R²) for each model:\n');
fprintf('Linear Model R²: %.4f\n', R2_linear);
fprintf('Quadratic Model R²: %.4f\n', R2_quadratic);
fprintf('Cubic Model R²: %.4f\n', R2_cubic);




% Choose the best model based on MSE (lower is better)
[~, best_model_idx] = min([mse_linear, mse_quadratic, mse_cubic]);
if best_model_idx == 1
    best_model = 'Linear';
    best_coeff = coeff_linear;
    best_X = [ones(size(days)), days];
elseif best_model_idx == 2
    best_model = 'Quadratic';
    best_coeff = coeff_quadratic;
    best_X = [ones(size(days)), days, days.^2];
else
    best_model = 'Cubic';
    best_coeff = coeff_cubic;
    best_X = [ones(size(days)), days, days.^2, days.^3];
end


fprintf('\nBest model based on MSE: %s\n', best_model);

% Future prediction using the best model
 % Days for prediction
future_days = (31:40)'; 
if strcmp(best_model, 'Linear')
    future_X = [ones(size(future_days)), future_days];
elseif strcmp(best_model, 'Quadratic')
    future_X = [ones(size(future_days)), future_days, future_days.^2];
else
    future_X = [ones(size(future_days)), future_days, future_days.^2, future_days.^3];
end
future_prices = future_X * best_coeff;

% Display the future predictions
fprintf('\nPredicted stock prices for the next 10 days (using %s model):\n', best_model);
for i = 1:length(future_days)
    fprintf('Day %d: %.2f\n', future_days(i), future_prices(i));
end



% Plot future predictions on the same graph
plot(future_days, future_prices, 'k--o', 'LineWidth', 1.5); % Future prices
legend('Actual Prices', 'Linear Model', 'Quadratic Model', 'Cubic Model', 'Future Prediction');
hold off;
