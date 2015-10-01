% Copyright (c) 2015, The MathWorks, Inc.
classdef (ConstructOnLoad) ItemDeletedEventData < event.EventData
    
   properties
      Index
      Type
   end
   
   methods
      function data = ItemDeletedEventData(type, ind)
         data.Index = ind;
         data.Type = type;
      end
   end
end