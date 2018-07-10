push!(Libdl.DL_LOAD_PATH,
      "/msu/home/m1gmt00/summer_project/AMA.jl/cSparseAMA/src")

function cSparseAMA( hh, nlags, nleads )

    neq = size(hh, 1)
    qmax = length(hh)
    qcols = neq*(nlags+nleads)
    
    maxNumberOfHElements = length(hh)
    discreteTime = 1
    hrows = size(hh, 1)
    hcols = size(hh, 2)

    (I, J, V) = findnz(hh)
    hmat = V
    hmatj = J
    hmati = I

    newHmat = zeros(qmax)
    newHmatj = zeros(qmax)
    newHmati = zeros(hrows + 1)
    
    auxiliaryInitialConditions = 0
    rowsInQ = 0
    
    qmat = zeros(qmax)
    qmatj = zeros(qmax)
    qmati = zeros(hrows*(nleads+nlags+1)+1)
    
    rootr = zeros(qcols)
    rooti = zeros(qcols)
    essential = qcols
    
    returnCode = 0
    aPointerToVoid = Ref{Ptr{Void}}()

    ptrMaxNumberOfHElements = Ref{Ptr{Int32}(maxNumberOfHElements)}
    ptrAuxiliaryInitialConditions = Ref{Ptr{Int32}(auxiliaryInitialConditions)}
    ptrRowsInQ = Ref{Ptr{Int32}(rowsInQ)}
    ptrEssential = Ref{Ptr{Int32}(essential)}
    ptrReturnCode = Ref{Ptr{Int32}(returnCode)}
    
    ccall((:sparseAim, "libSPARSEAMA"), Bool,
         (  Ptr{Int32}, Int32,
            Int32, Int32, Int32,
            Ptr{Float64}, Ptr{Int32}, Ptr{Int32}, # points to mem of first ele
            Ptr{Float64}, Ptr{Int32}, Ptr{Int32}, # points to mem of first ele
            Ptr{Int32}, Ptr{Int32},
            Ptr{Float64}, Ptr{Int32}, Ptr{Int32},
            Ptr{Int32}, Ptr{Float64}, Ptr{Float64}, Ptr{Int32}, Ref{Ptr{Void}}   ),
         ptrMaxNumberOfHElements[], Int32(discreteTime),
         Int32(hrows), Int32(hcols), Int32(nleads),
         Float64.(hmat), Int32.(hmatj), Int32.(hmati), 
         Float64.(newHmat), Int32.(newHmatj), Int32.(newHmati), 
         ptrAuxiliaryInitialConditions[], ptrRowsInQ[],
         Float64.(qmat), Int32.(qmatj), Int32.(qmati),
         ptrEssential[], Float64.(rootr), Float64.(rooti),
         ptrReturnCode[], aPointerToVoid)

    #return (maxNumberOfHElements)
end