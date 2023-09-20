function [FeaturePointsOut] = select_strongest_features(FeaturePoints, upper_limit, min_metric)

if isa(FeaturePoints,'cornerPoints')
    FeaturePointsOut = cornerPoints();
elseif isa(FeaturePoints,'SURFPoints')
    FeaturePointsOut = SURFPoints();
elseif isa(FeaturePoints,'BRISKPoints')
    FeaturePointsOut = BRISKPoints();
end
    
[~, idx] = sort(FeaturePoints.Metric, 'descend');

for i=1:length(idx)
    if i<= upper_limit
        if (FeaturePoints.Metric(idx(i))>= min_metric)
            FeaturePointsOut=[FeaturePointsOut;FeaturePoints(idx(i))];
        end
    end
end
    
end


