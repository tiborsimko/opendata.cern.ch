[[stripping21 lines]](./stripping21-index)

# StrippingCcbar2PhiPhiDetachedLine

## Properties:

|                |                                         |
|----------------|-----------------------------------------|
| OutputLocation | Phys/Ccbar2PhiPhiDetachedLine/Particles |
| Postscale      | 1.0000000                               |
| HLT            | None                                    |
| Prescale       | 1.0000000                               |
| L0DU           | None                                    |
| ODIN           | None                                    |

## Filter sequence:

CheckPV/checkPVmin1

|        |     |
|--------|-----|
| MinPVs | 1   |
| MaxPVs | -1  |

LoKi::VoidFilter/SelFilterPhys_StdLooseDetachedPhi2KK_Particles

|      |                                                                                                              |
|------|--------------------------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdLooseDetachedPhi2KK](./stripping21-commonparticles-stdloosedetachedphi2kk)/Particles')\>0 |

FilterDesktop/DetachedPhiForCcbar2Phi

|                 |                                                                                                                                              |
|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| Code            | (VFASPF(VCHI2/VDOF)\<16.0) & (ADMASS('phi(1020)')\<12.0\*MeV ) & (MAXTREE('K+'==ABSID, TRCHI2DOF) \< 5.0 ) & (MINTREE('K+'==ABSID, PIDK)\>0) |
| Inputs          | [ 'Phys/[StdLooseDetachedPhi2KK](./stripping21-commonparticles-stdloosedetachedphi2kk)' ]                                                  |
| DecayDescriptor | None                                                                                                                                         |
| Output          | Phys/DetachedPhiForCcbar2Phi/Particles                                                                                                       |

CombineParticles/Ccbar2PhiPhiDetachedLine

|                  |                                                         |
|------------------|---------------------------------------------------------|
| Inputs           | [ 'Phys/DetachedPhiForCcbar2Phi' ]                    |
| DaughtersCuts    | { '' : 'ALL' , 'phi(1020)' : 'ALL' }                    |
| CombinationCut   | AM\>2.65\*GeV                                           |
| MotherCut        | (MM\>2.7\*GeV) & (VFASPF(VCHI2PDOF)\<16) & (BPVDLS\>10) |
| DecayDescriptor  | J/psi(1S) -\> phi(1020) phi(1020)                       |
| DecayDescriptors | [ ' J/psi(1S) -\> phi(1020) phi(1020)' ]              |
| Output           | Phys/Ccbar2PhiPhiDetachedLine/Particles                 |
