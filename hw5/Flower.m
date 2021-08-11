% creation of Flower class
classdef Flower
    properties
        petalWidth;
        petalLength;
        sepalWidth;
        sepalLength;
        species;
    end
    methods
        % creation of constructor for Flower
        function obj = Flower(petalWidth, petalLength, sepalWidth, ...
            sepalLength, species)
                obj.petalWidth = petalWidth;
                obj.petalLength = petalLength;
                obj.sepalWidth = sepalWidth;
                obj.sepalLength = sepalLength;
                obj.species = species;
            end
        
        % getSWidth method returns the sepal width of the object
        function w = getSWidth(obj)
            w = obj.sepalWidth;
        end
        
        % creation of "report" method
        function report(obj)
            fprintf(['The length and width of its sepal are %0.1f cm ', ... 
            'and\n%0.1f cm respectively, while the length and ', ...
            'width\nof its petal are %0.1f cm and %0.1f cm ', ...
            'respectively.\nIt belongs to the %s species\n'], ...
            obj.sepalLength, obj.sepalWidth, obj.petalLength, ...
            obj.petalWidth, obj.species);
        end
    end
end
