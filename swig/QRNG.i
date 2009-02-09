%module "Math::GSL::QRNG"
%include "typemaps.i"
%include "gsl_typemaps.i"
%include "system.i"

%apply double *OUTPUT { double x[] };

%typemap(argout) double x[] {
    AV *tempav;
    I32 len;
    int i;
    SV **tv;
    if (argvi >= items) {            
        EXTEND(sp,1);              
    }
    $result = sv_newmortal();
    sv_setnv($result,(NV) *($1));
    argvi++;

    $result = sv_newmortal();
    sv_setnv($result,(NV) *($1+1));
    argvi++;
}

%{
    #include "gsl/gsl_types.h"
    #include "gsl/gsl_qrng.h"
%}
#if GSL_MINOR_VERSION == 12
    %import "gsl/gsl_inline.h"
#endif

%include "gsl/gsl_types.h"
%include "gsl/gsl_qrng.h"
%include "../pod/QRNG.pod"
