module EigenSysTests

# test eigenSys 

import AMAFUNCS.eigenSys!

#tweaked= False
# test eigenSys! firmvalue example
function firmvalue()::Bool


neq=4::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


uprbnd=1.
rowsLeft=2

aa=[1.1 -0.4 0.;
0. 0.4 0.;
0. 0. 1.]::Array{Float64,2}

ww=[0.868243 0. 0.;
-0.496139 0. 1.;
0. 1. 0.]::Array{Float64,2}

rts=[1.1+0.0im;
1.+0.0im;
0.4+0.0im]::Array{Complex{Float64},1}

lgroots=1

ia=3::Int64

js=[5 6 8]::Array{Int64,2}

(wwJulia,rtsJulia,lgrootsJulia)=eigenSys!(aa,uprbnd,rowsLeft)
isapprox(wwJulia,ww,rtol=0.1e-5::Float64,atol=0.0::Float64) &&
isapprox(rtsJulia,rts,rtol=0.1e-5::Float64,atol=0.0::Float64)&&
lgrootsJulia==lgroots
end;

#tweaked= False
# test eigenSys! firmvalue3Leads2Lags example
function firmvalue3Leads2Lags()::Bool


neq=4::Int64;nlag=2::Int64;nlead=3::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


uprbnd=1.
rowsLeft=4

aa=[0. 1. 0. 0. 0. 0.;
0. 0. 0. 1. 0. 0.;
0. 0. 0. 0. 1. 0.;
1.331 0. -1. 0. 0. 0.;
0. 0. 0.4 0. 0. 0.;
0. 0. 0. 0. 0. 1.]::Array{Float64,2}

ww=[0.455955 0.556804 0.556804 0. 0.0000000000000000840192 0.0000000000000000132968;
0.414505 -0.691462 0.185277 0. 0.0000000000000000700403 -0.0000000000000000285265;
-0.511734 -0.42174 -0.255383 0. -0.534522 0.534522;
0.376823 0.168433 -0.628602 0. -0.0000000000000000500741 0.000000000000000029589;
-0.465213 0.392762 -0.21595 0. 0.845154 0.845154;
0. 0. 0. 1. 0. 0.]::Array{Float64,2}

rts=[1.1+0.0im;
-0.55+0.952628im;
-0.55-0.952628im;
1.+0.0im;
-0.632456+0.0im;
0.632456+0.0im]::Array{Complex{Float64},1}

lgroots=3

ia=6::Int64

js=[9 13 14 17 18 20]::Array{Int64,2}

(wwJulia,rtsJulia,lgrootsJulia)=eigenSys!(aa,uprbnd,rowsLeft)
isapprox(wwJulia,ww,rtol=0.1e-5::Float64,atol=0.0::Float64) &&
isapprox(rtsJulia,rts,rtol=0.1e-5::Float64,atol=0.0::Float64)&&
lgrootsJulia==lgroots
end;

#tweaked= False
# test eigenSys! example7 example
function example7()::Bool


neq=4::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


uprbnd=1.
rowsLeft=3

aa=[1.30303 -1.0101 1.;
-0.30303 1.0101 0.;
-0.333333 1.11111 0.66]::Array{Float64,2}

ww=[-0.0975567 -0.665933 -0.136197;
0.663306 0.663306 -0.897059;
0.391168 -0.716975 0.420399]::Array{Float64,2}

rts=[1.31855+0.49536im;
1.31855-0.49536im;
0.336028+0.0im]::Array{Complex{Float64},1}

lgroots=2

ia=3::Int64

js=[5 6 8]::Array{Int64,2}

(wwJulia,rtsJulia,lgrootsJulia)=eigenSys!(aa,uprbnd,rowsLeft)
isapprox(wwJulia,ww,rtol=0.1e-5::Float64,atol=0.0::Float64) &&
isapprox(rtsJulia,rts,rtol=0.1e-5::Float64,atol=0.0::Float64)&&
lgrootsJulia==lgroots
end;

#tweaked= False
# test eigenSys! oneEquationNoLead example
function oneEquationNoLead()::Bool


neq=1::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


uprbnd=1.
rowsLeft=1

aa=hcat([-0.666667])::Array{Float64,2}

ww=hcat([1.])::Array{Float64,2}

rts=[-0.666667+0.0im]::Array{Complex{Float64},1}

lgroots=0

ia=1::Int64

js=hcat([2])::Array{Int64,2}

(wwJulia,rtsJulia,lgrootsJulia)=eigenSys!(aa,uprbnd,rowsLeft)
isapprox(wwJulia,ww,rtol=0.1e-5::Float64,atol=0.0::Float64) &&
isapprox(rtsJulia,rts,rtol=0.1e-5::Float64,atol=0.0::Float64)&&
lgrootsJulia==lgroots
end;

#tweaked= False
# test eigenSys! reliablePaperExmpl example
function reliablePaperExmpl()::Bool


neq=5::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


uprbnd=1.
rowsLeft=3

aa=[0. 0. 0. 0.;
-1.11111 1.11111 -0.444444 0.;
-1.55556 1.55556 2.37778 -2.;
0. 0. 2. -1.]::Array{Float64,2}

ww=[0.548572 0.548572 0.604781 1.;
-0.548572 -0.548572 -0.604781 0.;
-0.475037 0.508387 0.291542 0.;
0.544611 -0.124726 -0.428349 0.]::Array{Float64,2}

rts=[1.06383+1.39432im;
1.06383-1.39432im;
0.361236+0.0im;
0.+0.0im]::Array{Complex{Float64},1}

lgroots=2

ia=4::Int64

js=[6 8 9 10]::Array{Int64,2}

(wwJulia,rtsJulia,lgrootsJulia)=eigenSys!(aa,uprbnd,rowsLeft)
isapprox(wwJulia,ww,rtol=0.1e-5::Float64,atol=0.0::Float64) &&
isapprox(rtsJulia,rts,rtol=0.1e-5::Float64,atol=0.0::Float64)&&
lgrootsJulia==lgroots
end;

#tweaked= False
# test eigenSys! athan example
function athan()::Bool


neq=9::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


uprbnd=1.
rowsLeft=2

aa=[0. 1. 0. 0. 0. 0. 0.;
-1. 2. -0.36 0. 0. -2. 0.;
0. 0.293 0.764 -0.293 0. 0. 0.;
-2. 4.293 0.044 -0.293 -0.911 -4. 0.;
0. 0. 0. 0. 0.911 0. 0.;
0. 0. 0. 0. 0. 0. 0.;
0. 0. 0. 0. 0. 0. 1.]::Array{Float64,2}

ww=[-0.381771 0. 0. 0.330041 0.330041 0.000000000000000161051 0.;
0.447207 0. 0. -0.454296 0.269733 -0.753484 0.;
-0.250613 0. 0. -0.147243 0.605615 -0.376742 0.;
0.0434036 0. 0. 0.102035 -0.186692 0.376742 0.;
-0.081062 0. 1. -0.015374 -0.444561 0.376742 0.;
-0.763541 0. 0. 0.660083 0.660083 0.0803643 1.;
0. 1. 0. 0. 0. 0. 0.]::Array{Float64,2}

rts=[1.39878+0.0im;
1.+0.0im;
0.911+0.0im;
0.536108+0.222056im;
0.536108-0.222056im;
0.000000000000000541234+0.0im;
0.+0.0im]::Array{Complex{Float64},1}

lgroots=1

ia=7::Int64

js=[1 10 11 12 13 14 18]::Array{Int64,2}

(wwJulia,rtsJulia,lgrootsJulia)=eigenSys!(aa,uprbnd,rowsLeft)
isapprox(wwJulia,ww,rtol=0.1e-5::Float64,atol=0.0::Float64) &&
isapprox(rtsJulia,rts,rtol=0.1e-5::Float64,atol=0.0::Float64)&&
lgrootsJulia==lgroots
end;

#tweaked= False
# test eigenSys! habitmod example
function habitmod()::Bool


neq=12::Int64;nlag=4::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


uprbnd=1.
rowsLeft=6

aa=[0. 0. 0. 0. 1. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0.;
0. 0. 0. 0. 0. 1. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0.;
0. 0. 0. 0. 0. 0. 1. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0.;
0. 0. 0. 0. 0. 0. 0. 1. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0.;
0. 0. 0. 0. 0. 0. 0. 0. 1. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0.;
0. 0. 0. 0. 0. 0. 0. 0. 0. 1. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0.;
0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 1. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0.;
0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 1. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0.;
0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 1. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0.;
0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 1. 0. 0. 0. 0. 0. 0. 0. 0. 0.;
0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 1. 0. 0. 0. 0. 0. 0. 0. 0.;
0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 1. 0. 0. 0. 0. 0. 0. 0.;
-0.155117 -0.0214875 -0.0117771 0.00589435 0.185738 0.00238782 0.0597264 -0.0268822 0.00412584 0.0149078 -0.0493113 0.0238367 -0.872076 0.88879 0.89334 0.100478 -0.103176 -3.54054 36.5013 1.42383 0.744321 -0.00209401 -0.49621 0.114628;
0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0.88879 0. 0. 0. 0. 0. 0. 0. 0. 0. 0.;
-0.52802 -0.11279 -0.031833 -0.024734 0.71526 -0.042076 0.22829 0.012267 -0.22215 0.14172 -0.26679 0.11959 0.42308 0. 0.61076 0.10946 -0.17172 0. 0. 0. 0. 0. 0. 0.00011277;
-0.46436 -0.16131 -0.02744 -0.17087 1.3425 -0.16794 0.35818 0.09837 -1.06382 0.02255 -0.51594 -0.08949 0.46672 0. 0.11369 1.10657 0.26021 0. 0. 0. 0. 0. 0. 0.00141;
0.23292 -0.08512 0.04213 -0.14149 -0.03313 -0.15223 -0.01572 0.34762 -0.70552 0.24697 -0.21888 0.07805 0.56316 0. 0.08268 0.16054 0.68637 0. 0. 0. 0. 0. 0. 0.00348;
0.005823 -0.002128 0.00105325 -0.00353725 -0.00082825 -0.00380575 -0.000393 0.0086905 -0.017638 0.00617425 -0.005472 0.00195125 0.014079 0. 0.002067 -0.0209865 0.0171593 1.025 0. 0. 0. 0. 0. 0.000087;
0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0.99853 0. 0. 0. 0. 0. 0.00147 0. 0. 0. 0. 0.;
0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. -681.515 0. 0. 0. 0. 0. 17667.9 680.953 0. 0. 0. 0.;
0.530258 0.113268 0.0319679 0.0248388 -0.718291 0.0422543 -0.229257 -0.012319 0.223091 -0.142321 0.267921 -0.120097 -0.424873 0. 0.39089 -0.109924 0.172448 0. 0. 0. 1.00424 0. 0. -0.000113248;
0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 684.403 0. 0. 0. 0. 0. -17742.8 -682.835 0. 1.00424 0. 0.;
0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. -1.00276 0. 0. 0. 0. 0. 1.00276 0. 0. 0. 1.00424 0.;
0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 0. 1.]::Array{Float64,2}

ww=[0.00000847733 -0.0489971 0.00329698 0.00364315 -0.00296384 0. 0.00289826 0.108025 0. -0.0438951 0.017043 0.0201472 -0.0791448 -0.0676478 0.204738 0.00741613 0.0457941 -0.0564212 -0.00691027 -0.00120837 -0.000000000104862 0.000000000000784312 -0.000000000000767084 -0.000000000106419;
0.00000117376 -0.0112006 0.000706552 0.000780736 0.0000660393 0. -0.0176289 -0.0074902 0. -0.0033955 0.00895106 0.00876825 -0.0129104 -0.0103006 0.028083 0.0304513 0.00587952 -0.0187752 -0.000579761 0.00136933 0.0000000000000976943 0.0000000000000066158 -0.00000000000000641318 0.0000000000000846545;
0.00000064385 -0.00419088 0.000225281 0.000248934 -0.00028174 0. 0.000265449 0.0158931 0. -0.00228812 0.000766883 0.00000997697 -0.00614689 -0.00623485 0.0148889 -0.00363062 0.00467283 0.00161117 -0.00049169 -0.000532766 -0.0000000000000252739 0.00000000000000444306 -0.00000000000000435659 -0.0000000000000340815;
-0.000000322128 -0.0119854 0.00032908 0.000363632 0.000922354 0. -0.0441305 -0.010256 0. 0.0149254 0.0121877 0.00423626 -0.00265616 -0.00671859 -0.0126441 0.0452943 0.00474333 0.0127896 0.0014004 0.00101101 -0.00000000000000494435 -0.00000000000000500096 0.00000000000000488038 0.00000000000000494495;
-0.0000101418 0.0895547 -0.00245965 -0.0027179 -0.0024055 0. 0.200931 -0.107545 0. -0.0900449 -0.0628586 0.0156808 0.254502 0.0432761 -0.397022 0.133855 -0.0655314 0.115807 -0.0154165 -0.0167395 0.000000719464 -0.00000074944 0.000000749437 -0.00000078144;
-0.000000129057 -0.0207267 0.00108315 0.00119687 0.000894541 0. -0.0567803 -0.0272877 0. 0.00609649 0.0186839 0.0242131 0.0165386 -0.0222346 -0.0754314 0.0606591 0.0329998 0.047426 -0.00405635 0.00410942 -0.000000000682305 0.00000000064726 -0.000000000647247 0.000000000612164;
-0.00000326377 0.0311734 -0.00146039 -0.00161372 0.000153904 0. 0.0443083 -0.039071 0. -0.00331164 -0.0177129 -0.00839306 0.0485082 0.0314834 -0.0792245 -0.0148154 -0.0394007 0.0012426 0.00120493 -0.00215158 0.000000000222065 -0.000000000210693 0.000000000210689 -0.00000000019929;
0.00000147074 -0.0160863 0.000408635 0.000451539 -0.000584756 0. -0.0213281 0.0800915 0. 0.0159632 0.00532987 -0.0000349571 -0.000670496 -0.019063 -0.0240676 -0.121402 -0.0196196 0.0286035 0.000173991 0.00151099 0.0000000000000245739 -0.00000000000000517572 0.00000000000000502549 0.0000000000000347826;
-0.000000239717 -0.000792326 0.0000379058 0.0000418857 0.0022348 0. -0.0287681 -0.110363 0. -0.0442625 -0.0259932 0.00592813 -0.180197 0.323735 0.106488 -0.446833 -0.091663 -0.259238 0.00224181 -0.0837174 0.00034508 0.0102842 0.0110113 -0.000383324;
-0.000000811654 -0.0311743 0.000721688 0.000797462 0.00092268 0. -0.0906195 0.0653455 0. 0.0382729 0.0108365 0.0250779 0.0303865 0.0158253 -0.0580298 -0.193109 -0.139833 0.0894769 -0.0202529 -0.00355066 0.000000123028 -0.00000931441 -0.00000906483 -0.000000126568;
0.00000268973 -0.01287 0.00049266 0.000544387 0.00083439 0. -0.0300244 -0.0284717 0. 0.00447302 0.0108379 -0.00467599 -0.0998469 0.0278434 0.146725 -0.00860273 0.0905782 -0.0943029 0.00879296 -0.00123068 -0.0000000398327 0.00000303173 0.00000295089 0.000000041007;
-0.00000129793 -0.0312023 0.000213646 0.000236078 0.000286668 0. -0.0907005 0.151454 0. 0.0594932 0.0159445 -0.0111903 0.0325489 -0.01021 0.153668 0.0785177 -0.0105616 0.00218828 -0.000218761 0.00114412 -0.000000000222072 0.000000000210686 -0.000000000210682 0.000000000199297;
-0.0370804 0.0246579 -0.00000000000000307301 0.00000000000000369367 0.00016314 0. 0.00390901 0.042236 0. -0.0708795 -0.0430473 -0.17663 -0.121307 -0.402926 0.168196 0.378419 0.222077 0.350449 0.162999 0.244079 -0.252057 -0.252092 0.252023 0.252057;
-0.0000485593 0.0958625 -0.0000000000000235343 0.0000000000000271351 0.0012582 0. -0.369591 0.161292 1. 0.361963 0.329714 0.229698 0.23356 0.209559 -0.209672 -0.194319 -0.231622 -0.219961 -0.26965 -0.250136 0.252057 0.252052 -0.252063 -0.252058;
-0.0000488121 0.127132 0.489846 0.541277 -0.5851 0. -0.434604 -0.00160089 0. 0.346801 0.203295 0.183594 0.193904 0.218294 -0.0525509 -0.0682873 -0.110412 -0.370963 -0.229611 -0.256183 0.252057 0.252066 -0.252049 -0.252057;
-0.00000549337 0.12544 -0.00218918 -0.00241903 -0.00344982 0. 0.253458 -0.250185 0. -0.0925811 -0.0341928 0.0312099 0.05905 -0.0406851 -0.096241 0.0167473 -0.061666 0.0923319 -0.000184476 0.00342656 -0.0000000000000157287 -0.0000000000000159155 0.0000000000000155232 0.0000000000000157294;
0.00000563828 -0.0259403 0.000991241 0.00109532 -0.0042903 0. 0.00882998 0.295823 0. 0.0250455 0.00230957 -0.0163765 -0.0328191 0.0263861 -0.10227 0.0107738 0.0347595 -0.0520895 -0.010955 -0.0036157 0.0000000398328 -0.00000303173 -0.00000295089 -0.000000041007;
0.000193477 -0.944771 0.00000000000192237 -0.00000000000102525 0.0275468 0. 0.764362 0.764362 0. -0.808862 -0.888581 -0.888581 -0.804108 -0.804108 0.733356 0.733356 0.807099 0.807099 0.872336 0.872336 -0.870652 -0.870652 0.870653 0.870653;
0.998571 -0.109495 -0.509098 -0.453563 0.393258 0. 0.132405 0.104521 0. -0.117758 -0.129437 -0.116763 -0.10817 -0.0916235 0.0952083 0.0831025 0.102589 0.0954434 0.117021 0.112195 -0.000346297 -0.0102456 -0.0109752 0.000384617;
0.0384857 -0.000509914 -0.000741474 0.0035434 0.00166552 0. 0.000553558 0.000363793 0. -0.000366298 -0.000468001 -0.000164372 -0.000233277 0.000362695 0.0000913327 -0.000352556 0.0000236021 -0.000248118 0.000192018 0.0000171507 -0.000000000984304 0.0000000749258 0.0000000729283 0.00000000101334;
-0.0000406731 0.162178 0.49167 0.543293 -0.589634 0. -0.198838 -0.160111 0. 0.182241 0.197634 0.189195 0.172734 0.170126 -0.157146 -0.155475 -0.173005 -0.171768 -0.188855 -0.187001 0.18682 0.186819 -0.18682 -0.18682;
0.000000114426 -0.000456259 -0.000738341 0.00352842 0.00165883 0. 0.000559392 0.000450443 0. -0.000512702 -0.000556006 -0.000532264 -0.000485953 -0.000478617 0.0004421 0.000437399 0.000486716 0.000483238 0.000531309 0.000526092 -0.000525582 -0.000525581 0.000525584 0.000525583;
0.0000271152 -0.108118 -0.50902 -0.453954 0.393087 0. 0.132557 0.10674 0. -0.121493 -0.131755 -0.126129 -0.115155 -0.113416 0.104763 0.103649 0.115336 0.114511 0.125903 0.124666 -0.124546 -0.124545 0.124546 0.124546;
-0.00000626373 0.0240777 -0.0000183887 -0.0000203194 0.000519754 1. -0.0390233 -0.026122 0. 0.0288168 0.031094 0.0292324 0.0267982 0.0262171 -0.0240533 -0.0241842 -0.0268358 -0.0264974 -0.0293165 -0.028979 0.0289614 0.0289613 -0.0289615 -0.0289614]::Array{Float64,2}

rts=[679.579+0.0im;
1.11741+0.0im;
1.00424+0.0im;
1.00424+0.0im;
1.00403+0.0im;
1.+0.0im;
0.918128+0.0887657im;
0.918128-0.0887657im;
0.88879+0.0im;
0.714747+0.0im;
0.587349+0.26613im;
0.587349-0.26613im;
-0.129115+0.619993im;
-0.129115-0.619993im;
-0.294489+0.507462im;
-0.294489-0.507462im;
-0.230764+0.281568im;
-0.230764-0.281568im;
0.198899+0.16454im;
0.198899-0.16454im;
-0.0000704459+0.0000723217im;
-0.0000704459-0.0000723217im;
0.0000704459+0.0000685148im;
0.0000704459-0.0000685148im]::Array{Complex{Float64},1}

lgroots=5

ia=24::Int64

js=[13 15 16 17 25 27 28 29 37 39 40 41 49 50 51 52 53 54 55 56 57 58 59 60]::Array{Int64,2}

(wwJulia,rtsJulia,lgrootsJulia)=eigenSys!(aa,uprbnd,rowsLeft)
isapprox(wwJulia,ww,rtol=0.1e-5::Float64,atol=0.0::Float64) &&
isapprox(rtsJulia,rts,rtol=0.1e-5::Float64,atol=0.0::Float64)&&
lgrootsJulia==lgroots
end;


end
