using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FormRevolution.EntityDataModel.GeneralDatabaseModel;

namespace FormRevolution.Utility
{
    public class PrizGeneralSeasonComparer : IEqualityComparer<PRIZ>
    {
        public bool Equals(PRIZ x, PRIZ y)
        {
            return x.SeasonYear.Equals(y.SeasonYear) && 
                x.SeasonNumber.Equals(y.SeasonNumber);
        }

        public int GetHashCode(PRIZ obj)
        {
            var r = (obj.SeasonYear + obj.SeasonNumber).GetHashCode();
            return r;
            //return obj.GetHashCode();
        }


        
        Func<PRIZ, object> KeySelector;

        public PrizGeneralSeasonComparer(Func<PRIZ, object> keySelector)
        {
            KeySelector = keySelector;
        }

        public PrizGeneralSeasonComparer()
        {
        }
    }
}
