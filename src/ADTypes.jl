module ADTypes

"""
Base type for AD choices.
"""
abstract type AbstractADType end

struct AutoFiniteDiff{T1, T2, T3} <: AbstractADType
    fdtype::T1
    fdjtype::T2
    fdhtype::T3
end

function AutoFiniteDiff(; fdtype = Val(:forward), fdjtype = fdtype,
                        fdhtype = Val(:hcentral))
    AutoFiniteDiff(fdtype, fdjtype, fdhtype)
end

struct AutoForwardDiff{chunksize} <: AbstractADType end

function AutoForwardDiff(chunksize = nothing)
    AutoForwardDiff{chunksize}()
end

struct AutoReverseDiff <: AbstractADType
    compile::Bool
end

AutoReverseDiff(; compile = false) = AutoReverseDiff(compile)

struct AutoZygote <: AbstractADType end

struct AutoEnzyme{M} <: AbstractADType
    mode::M
end

AutoEnzyme(; mode = nothing) = AutoEnzyme(mode)

struct AutoTracker <: AbstractADType end

struct AutoModelingToolkit <: AbstractADType
    obj_sparse::Bool
    cons_sparse::Bool
end

function AutoModelingToolkit(; obj_sparse = false, cons_sparse = false)
    AutoModelingToolkit(obj_sparse, cons_sparse)
end

struct AutoSparseFiniteDiff <: AbstractADType end

struct AutoSparseForwardDiff{chunksize} <: AbstractADType end

function AutoSparseForwardDiff(chunksize = nothing)
    AutoSparseForwardDiff{chunksize}()
end

export AutoFiniteDiff, AutoForwardDiff, AutoReverseDiff, AutoZygote, AutoEnzyme,
       AutoTracker, AutoModelingToolkit, AutoSparseFiniteDiff, AutoSparseForwardDiff
end
