module EigenSysTests

# test eigenSys 

import AMAFUNCS.eigenSys!

# test eigenSys! firmvalue example
function firmvalue()::Bool


    neq=4::Int64;nlag=1::Int64;nlead=1::Int64
    qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64

    uprbnd=1.
    rowsLeft=2

    aa=[1.1  -0.4  0.;
        0.  0.4  0.;
        0.  0.  1.]::Array{Float64,2}

    ww=[0.868243  0.  0.;
        -0.496139  0.  1.;
        0.  1.  0.]::Array{Float64,2}

    rts=[1.1;
         1.;
         0.4]::Array{Float64,1}


    (wwJulia,rtsJulia,lgrootsJulia)=eigenSys!(aa,uprbnd,rowsLeft)

    isapprox(wwJulia,ww,rtol=0.1e-4::Float64) &&
    isapprox(rtsJulia,rts,rtol=0.1e-4::Float64)&&
    lgrootsJulia==lgrootsJulia
end;

# test eigenSys! firmvalue3Leads2Lags example
function firmvalue3Leads2Lags()::Bool


    neq=4::Int64;nlag=2::Int64;nlead=3::Int64
    qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


    uprbnd=1.
    rowsLeft=4
    
    aa=[0.  1.  0.  0.  0.  0.;
        0.  0.  0.  1.  0.  0.;
        0.  0.  0.  0.  1.  0.;
        1.331  0.  -1.  0.  0.  0.;
        0.  0.  0.4  0.  0.  0.;
        0.  0.  0.  0.  0.  1.]::Array{Float64,2}

    ww= [0.455955         0.556803         0.556803     0.      1.312811     -5.716889;
         0.414504        -0.691462         0.185276     0.      9.606497     -2.756823;
        -0.511734        -0.421739        -0.255383     0.     -0.534524      0.534522;
         0.376822         0.168433        -0.628601     0.     -6.287950     -1.718619;
        -0.465213         0.392762        -0.215950     0.      0.845154      0.845154;
         0.               0.               0.           1.      0.            0.]::Array{Float64,2}



    rts=[1.1 +     0. im;
       -0.55 +     0.952628 im;
       -0.55 -     0.952628 im;
        1. +       0. im;
       -0.632456 + 0. im;
        0.632456 + 0. im]::Array{Complex{Float64},2}


    (wwJulia,rtsJulia,lgrootsJulia)=eigenSys!(aa,uprbnd,rowsLeft)
    display(wwJulia)
    display(rtsJulia)
    isapprox(wwJulia,ww,rtol=0.1e-10::Float64) &&
    isapprox(rtsJulia,rts,rtol=0.1e-10::Float64)&&
    lgrootsJulia==lgrootsJulia
end;

# test eigenSys! example7 example
function example7()::Bool


    neq=4::Int64;nlag=1::Int64;nlead=1::Int64
    qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


    uprbnd=1.
    rowsLeft=3

    aa=[1.30303  -1.0101  1.;
        -0.30303  1.0101  0.;
        -0.333333  1.11111  0.66]::Array{Float64,2}

    ww= [0.0976    0.6659   -0.1362;
         -0.6633   -0.6633   -0.8971;
         -0.3912    0.7170    0.4204]::Array{Float64,2}
    
    rts=[1.31855 + 0.49536 im;
         1.31855 - 0.49536 im;
         0.336028 + 0. im]::Array{Complex{Float64},2}

    ia=3::Int64

    js=[5  6  8]::Array{Int64,2}


    (wwJulia,rtsJulia,lgrootsJulia)=eigenSys!(aa,uprbnd,rowsLeft)
    isapprox(wwJulia,ww,rtol=0.1e-4::Float64) &&
    isapprox(rtsJulia,rts,rtol=0.1e-4::Float64)&&
    lgrootsJulia==lgrootsJulia
end;

# test eigenSys! oneEquationNoLead example
function oneEquationNoLead()::Bool


    neq=1::Int64;nlag=1::Int64;nlead=1::Int64
    qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


    uprbnd=1.
    rowsLeft=1

    genJuliaMatInit[aa, -0.666667, Array{Float64,2}]

    genJuliaMatInit[ww, 1., Array{Float64,2}]

    genJuliaMatInit[rts, -0.666667, Array{Float64,1}]

    ia=1::Int64

    genJuliaMatInit[js, 2, Array{Int64,2}]


    (wwJulia,rtsJulia,lgrootsJulia)=eigenSys!(aa,uprbnd,rowsLeft)
    isapprox(wwJulia,ww,rtol=0.1e-4::Float64) &&
    isapprox(rtsJulia,rts,rtol=0.1e-4::Float64)&&
    lgrootsJulia==lgrootsJulia
end;

# test eigenSys! reliablePaperExmpl example
function reliablePaperExmpl()::Bool


    neq=5::Int64;nlag=1::Int64;nlead=1::Int64
    qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


    uprbnd=1.
    rowsLeft=3

    aa=[0.  0.  0.  0.;
        -1.11111  1.11111  -0.444444  0.;
        -1.55556  1.55556  2.37778  -2.;
        0.  0.  2.  -1.]::Array{Float64,2}

    ww= [0.5486    0.5486    0.6048    1.0000;
         -0.5486   -0.5486   -0.6048         0.;
         -0.4750    0.5084    0.2915         0.;
         0.5446   -0.1247   -0.4283         0.]::Array{Float64,2}

    rts=[1.06383 + 1.39432 im;
         1.06383 - 1.39432 im;
         0.361236 + 0. im;
         0. + 0. im]::Array{Complex{Float64},2}


    (wwJulia,rtsJulia,lgrootsJulia)=eigenSys!(aa,uprbnd,rowsLeft)
    isapprox(wwJulia,ww,rtol=0.1e-5::Float64) &&
    isapprox(rtsJulia,rts,rtol=0.1e-5::Float64)&&
    lgrootsJulia==lgrootsJulia
end;

# test eigenSys! athan example
function athan()::Bool


    neq=9::Int64;nlag=1::Int64;nlead=1::Int64
    qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


    uprbnd=1.
    rowsLeft=2

    aa=[0.  1.  0.  0.  0.  0.  0.;
        -1.  2.  -0.36  0.  0.  -2.  0.;
        0.  0.293  0.764  -0.293  0.  0.  0.;
        -2.  4.293  0.044  -0.293  -0.911  -4.  0.;
        0.  0.  0.  0.  0.911  0.  0.;
        0.  0.  0.  0.  0.  0.  0.;
        0.  0.  0.  0.  0.  0.  1.]::Array{Float64,2}

    ww=[-0.381771  0.  0.  0.330041  0.330041  0.0000000000000000360124  0.;
        0.447207  0.  0.  -0.454296  0.269733  -0.120158  0.;
        -0.250613  0.  0.  -0.147243  0.605615  -0.0600791  0.;
        0.0434036  0.  0.  0.102035  -0.186692  0.0600791  0.;
        -0.081062  0.  1.  -0.015374  -0.444561  0.0600791  0.;
        -0.763541  0.  0.  0.660083  0.660083  0.987286  1.;
        0.  1.  0.  0.  0.  0.  0.]::Array{Float64,2}

    rts=[1.39878 + 0. im;
         1. + 0. im;
         0.911 + 0. im;
         0.536108 + 0.222056 im;
         0.536108 - 0.222056 im;
         0.000000000000000166533 + 0. im;
         0. + 0. im]::Array{Complex{Float64},2}


    (wwJulia,rtsJulia,lgrootsJulia)=eigenSys!(aa,uprbnd,rowsLeft)
    isapprox(wwJulia,ww,rtol=0.1e-5::Float64) &&
    isapprox(rtsJulia,rts,rtol=0.1e-5::Float64)&&
    lgrootsJulia==lgrootsJulia
end;

# test eigenSys! habitmod example
function habitmod()::Bool


    neq=12::Int64;nlag=4::Int64;nlead=1::Int64
    qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


    uprbnd=1.
    rowsLeft=6

    aa=[0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
        0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
        0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
        0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
        0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
        0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
        0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
        0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
        0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
        0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
        0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.;
        0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.;
        -0.155117  -0.0214875  -0.0117771  0.00589435  0.185738  0.00238782  0.0597264  -0.0268822  0.00412584  0.0149078  -0.0493113  0.0238367  -0.872076  0.88879  0.89334  0.100478  -0.103176  -3.54054  36.5013  1.42383  0.744321  -0.00209401  -0.49621  0.114628;
        0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.88879  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
        -0.52802  -0.11279  -0.031833  -0.024734  0.71526  -0.042076  0.22829  0.012267  -0.22215  0.14172  -0.26679  0.11959  0.42308  0.  0.61076  0.10946  -0.17172  0.  0.  0.  0.  0.  0.  0.00011277;
        -0.46436  -0.16131  -0.02744  -0.17087  1.3425  -0.16794  0.35818  0.09837  -1.06382  0.02255  -0.51594  -0.08949  0.46672  0.  0.11369  1.10657  0.26021  0.  0.  0.  0.  0.  0.  0.00141;
        0.23292  -0.08512  0.04213  -0.14149  -0.03313  -0.15223  -0.01572  0.34762  -0.70552  0.24697  -0.21888  0.07805  0.56316  0.  0.08268  0.16054  0.68637  0.  0.  0.  0.  0.  0.  0.00348;
        0.005823  -0.002128  0.00105325  -0.00353725  -0.00082825  -0.00380575  -0.000393  0.0086905  -0.017638  0.00617425  -0.005472  0.00195125  0.014079  0.  0.002067  -0.0209865  0.0171593  1.025  0.  0.  0.  0.  0.  0.000087;
        0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.99853  0.  0.  0.  0.  0.  0.00147  0.  0.  0.  0.  0.;
        0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -681.515  0.  0.  0.  0.  0.  17667.9  680.953  0.  0.  0.  0.;
        0.530258  0.113268  0.0319679  0.0248388  -0.718291  0.0422543  -0.229257  -0.012319  0.223091  -0.142321  0.267921  -0.120097  -0.424873  0.  0.39089  -0.109924  0.172448  0.  0.  0.  1.00424  0.  0.  -0.000113248;
        0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  684.403  0.  0.  0.  0.  0.  -17742.8  -682.835  0.  1.00424  0.  0.;
        0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -1.00276  0.  0.  0.  0.  0.  1.00276  0.  0.  0.  1.00424  0.;
        0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.]::Array{Float64,2}

    ww=[0.00000847733  -0.0489971  0.00289063  0.00337162  -0.00296384  0.  0.00289826  0.108025  0.  -0.0438951  -0.017043  -0.0201472  -0.0791448  -0.0676478  0.204738  0.00741613  0.0457941  -0.0564212  -0.00691027  -0.00120837  0.000000000269016  -0.00000000000411353  -0.00000000000450183  -0.000000000277616;
        0.00000117376  -0.0112006  0.000619471  0.000722547  0.0000660393  0.  -0.0176289  -0.0074902  0.  -0.0033955  -0.00895106  -0.00876825  -0.0129104  -0.0103006  0.028083  0.0304513  0.00587952  -0.0187752  -0.000579761  0.00136933  -0.000000000000250339  -0.0000000000000146502  -0.0000000000000142445  0.000000000000221426;
        0.00000064385  -0.00419088  0.000197516  0.000230381  -0.00028174  0.  0.000265449  0.0158931  0.  -0.00228812  -0.000766883  -0.00000997697  -0.00614689  -0.00623485  0.0148889  -0.00363062  0.00467283  0.00161117  -0.00049169  -0.000532766  0.0000000000000819604  0.00000000000000523411  0.00000000000000510892  -0.0000000000000716094;
        -0.000000322128  -0.0119854  0.000288522  0.00033653  0.000922354  0.  -0.0441305  -0.010256  0.  0.0149254  -0.0121877  -0.00423626  -0.00265616  -0.00671859  -0.0126441  0.0452943  0.00474333  0.0127896  0.0014004  0.00101101  0.0000000000000103699  0.0000000000000104046  0.0000000000000103302  0.0000000000000103699;
        -0.0000101418  0.0895547  -0.0021565  -0.00251533  -0.0024055  0.  0.200931  -0.107545  0.  -0.0900449  0.0628586  -0.0156808  0.254502  0.0432761  -0.397022  0.133855  -0.0655314  0.115807  -0.0154165  -0.0167395  -0.00000132535  0.00000141058  0.00000141025  -0.00000150715;
        -0.000000129057  -0.0207267  0.000949653  0.00110767  0.000894541  0.  -0.0567803  -0.0272877  0.  0.00609649  -0.0186839  -0.0242131  0.0165386  -0.0222346  -0.0754314  0.0606591  0.0329998  0.047426  -0.00405635  0.00410942  0.00000000130129  -0.00000000121979  -0.00000000121974  0.00000000113833;
        -0.00000326377  0.0311734  -0.0012804  -0.00149345  0.000153904  0.  0.0443083  -0.039071  0.  -0.00331164  0.0177129  0.00839306  0.0485082  0.0314834  -0.0792245  -0.0148154  -0.0394007  0.0012426  0.00120493  -0.00215158  -0.0000000004235  0.000000000397062  0.000000000397044  -0.000000000370604;
        0.00000147074  -0.0160863  0.000358271  0.000417886  -0.000584756  0.  -0.0213281  0.0800915  0.  0.0159632  -0.00532987  0.0000349571  -0.000670496  -0.019063  -0.0240676  -0.121402  -0.0196196  0.0286035  0.000173991  0.00151099  -0.0000000000000629115  0.0000000000000138601  0.0000000000000138823  0.000000000000090653;
        -0.000000239717  -0.000792326  0.000033234  0.0000387639  0.0022348  0.  -0.0287681  -0.110363  0.  -0.0442625  0.0259932  -0.00592813  -0.180197  0.323735  0.106488  -0.446833  -0.091663  -0.259238  0.00224181  -0.0837174  -0.000657423  -0.0139054  0.0153282  -0.000773483;
        -0.000000811654  -0.0311743  0.000632742  0.000738027  0.00092268  0.  -0.0906195  0.0653455  0.  0.0382729  -0.0108365  -0.0250779  0.0303865  0.0158253  -0.0580298  -0.193109  -0.139833  0.0894769  -0.0202529  -0.00355066  -0.000000207769  0.0000128265  -0.0000124039  -0.00000021471;
        0.00000268973  -0.01287  0.000431941  0.000503813  0.00083439  0.  -0.0300244  -0.0284717  0.  0.00447302  -0.0108379  0.00467599  -0.0998469  0.0278434  0.146725  -0.00860273  0.0905782  -0.0943029  0.00879296  -0.00123068  0.0000000672228  -0.00000417477  0.00000403798  0.0000000695332;
        -0.00000129793  -0.0312023  0.000187315  0.000218483  0.000286668  0.  -0.0907005  0.151454  0.  0.0594932  -0.0159445  0.0111903  0.0325489  -0.01021  0.153668  0.0785177  -0.0105616  0.00218828  -0.000218761  0.00114412  0.000000000423522  -0.00000000039704  -0.000000000397022  0.000000000370627;
        -0.0370804  0.0246579  -0.0000000000000109556  -0.000000000000000619476  0.00016314  0.  0.00390901  0.042236  0.  -0.0708795  0.0430473  0.17663  -0.121307  -0.402926  0.168196  0.378419  0.222077  0.350449  0.162999  0.244079  0.252045  0.252094  0.251997  0.252043;
        -0.0000485593  0.0958625  -0.000000000000104638  -0.000000000000000412551  0.0012582  0.  -0.369591  0.161292  1.  0.361963  -0.329714  -0.229698  0.23356  0.209559  -0.209672  -0.194319  -0.231622  -0.219961  -0.26965  -0.250136  -0.252046  -0.252038  -0.252051  -0.252044;
        -0.0000488121  0.127132  0.429473  0.500935  -0.5851  0.  -0.434604  -0.00160089  0.  0.346801  -0.203295  -0.183594  0.193904  0.218294  -0.0525509  -0.0682873  -0.110412  -0.370963  -0.229611  -0.256183  -0.252045  -0.252057  -0.252032  -0.252043;
        -0.00000549337  0.12544  -0.00191937  -0.00223874  -0.00344982  0.  0.253458  -0.250185  0.  -0.0925811  0.0341928  -0.0312099  0.05905  -0.0406851  -0.096241  0.0167473  -0.061666  0.0923319  -0.000184476  0.00342656  0.0000000000000517042  0.0000000000000518429  0.0000000000000515574  0.0000000000000517101;
        0.00000563828  -0.0259403  0.000869072  0.00101368  -0.0042903  0.  0.00882998  0.295823  0.  0.0250455  -0.00230957  0.0163765  -0.0328191  0.0263861  -0.10227  0.0107738  0.0347595  -0.0520895  -0.010955  -0.0036157  -0.0000000672229  0.00000417477  -0.00000403798  -0.0000000695333;
        0.000193477  -0.944771  0.000000000000557064  -0.000000000000159624  0.0275468  0.  0.764362  0.764362  0.  -0.808862  0.888581  0.888581  -0.804108  -0.804108  0.733356  0.733356  0.807099  0.807099  0.872336  0.872336  0.870612  0.870612  0.870605  0.870605;
        0.998571  -0.109495  -0.561381  -0.4981  0.393258  0.  0.132405  0.104521  0.  -0.117758  0.129437  0.116763  -0.10817  -0.0916235  0.0952083  0.0831025  0.102589  0.0954434  0.117021  0.112195  0.000659587  0.0138518  -0.0152792  0.000775859;
        0.0384857  -0.000509914  -0.00525455  0.000143356  0.00166552  0.  0.000553558  0.000363793  0.  -0.000366298  0.000468001  0.000164372  -0.000233277  0.000362695  0.0000913327  -0.000352556  0.0000236021  -0.000248118  0.000192018  0.0000171507  0.00000000166111  -0.000000103175  0.0000000997946  0.00000000171824;
        -0.0000406731  0.162178  0.431073  0.502801  -0.589634  0.  -0.198838  -0.160111  0.  0.182241  -0.197634  -0.189195  0.172734  0.170126  -0.157146  -0.155475  -0.173005  -0.171768  -0.188855  -0.187001  -0.186811  -0.18681  -0.18681  -0.18681;
        0.000000114426  -0.000456259  -0.00523235  0.00014275  0.00165883  0.  0.000559392  0.000450443  0.  -0.000512702  0.000556006  0.000532264  -0.000485953  -0.000478617  0.0004421  0.000437399  0.000486716  0.000483238  0.000531309  0.000526092  0.000525558  0.000525556  0.000525556  0.000525554;
        0.0000271152  -0.108118  -0.560807  -0.498119  0.393087  0.  0.132557  0.10674  0.  -0.121493  0.131755  0.126129  -0.115155  -0.113416  0.104763  0.103649  0.115336  0.114511  0.125903  0.124666  0.12454  0.124539  0.124539  0.124539;
        -0.00000626373  0.0240777  -0.0000161223  -0.000018805  0.000519754  1.  -0.0390233  -0.026122  0.  0.0288168  -0.031094  -0.0292324  0.0267982  0.0262171  -0.0240533  -0.0241842  -0.0268358  -0.0264974  -0.0293165  -0.028979  -0.02896  -0.0289599  -0.0289599  -0.0289598]::Array{Float64,2}

      rts=[679.579129336927 +                     0. im;
           1.11743171151565 +                     0. im;
           1.00424000000001 +                     0. im;
                    1.00424 +                     0. im;
           1.00403927765384 +                     0. im;
                          1. +                     0. im;
          0.918135913941681 +    0.0887502105807897 im;
          0.918135913941681 -    0.0887502105807897 im;
                    0.88879 +                     0. im;
          0.714709619631918 +                     0. im;
          0.587346736700481 +     0.266146876565142 im;
          0.587346736700481 -     0.266146876565142 im;
         -0.129110146704955 +     0.620000559488457 im;
         -0.129110146704955 -     0.620000559488457 im;
         -0.294489994600125 +     0.507461647041301 im;
         -0.294489994600125 -     0.507461647041301 im;
         -0.230764335642526 +      0.28156340280088 im;
         -0.230764335642526 -      0.28156340280088 im;
          0.198848201400549 +     0.164551416551338 im;
          0.198848201400549 -     0.164551416551338 im;
       -0.00494060062077485 +   0.00793253704911022 im;
       -0.00494060062077485 -   0.00793253704911022 im;
        0.00849662844150386 +                     0. im;
        0.00147587688063145 +                     0. im]::Array{Complex{Float64},2}


    (wwJulia,rtsJulia,lgrootsJulia)=eigenSys!(aa,uprbnd,rowsLeft)
    isapprox(wwJulia,ww,rtol=0.1e-5::Float64) &&
    isapprox(rtsJulia,rts,rtol=0.1e-5::Float64)&&
    lgrootsJulia==lgrootsJulia
end;

end
