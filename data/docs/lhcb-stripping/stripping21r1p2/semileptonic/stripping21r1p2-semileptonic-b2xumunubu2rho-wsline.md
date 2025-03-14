[[stripping21r1p2 lines]](./stripping21r1p2-index)

# StrippingB2XuMuNuBu2Rho_WSLine

## Properties:

|                |                                      |
|----------------|--------------------------------------|
| OutputLocation | Phys/B2XuMuNuBu2Rho_WSLine/Particles |
| Postscale      | 1.0000000                            |
| HLT1           | None                                 |
| HLT2           | None                                 |
| Prescale       | 0.20000000                           |
| L0DU           | None                                 |
| ODIN           | None                                 |

## Filter sequence:

LoKi::VoidFilter/StrippingGoodEventConditionSemileptonic

|      |                                                                                                          |
|------|----------------------------------------------------------------------------------------------------------|
| Code | ALG_EXECUTED('StrippingStreamSemileptonicBadEvent') & ~ALG_PASSED('StrippingStreamSemileptonicBadEvent') |

LoKi::VoidFilter/StrippingB2XuMuNuBu2Rho_WSLineVOIDFilter

|      |                                                                   |
|------|-------------------------------------------------------------------|
| Code | ( recSummaryTrack(LHCb.RecSummary.nLongTracks, TrLONG) \< 250.0 ) |

CheckPV/checkPVmin1

|        |     |
|--------|-----|
| MinPVs | 1   |
| MaxPVs | -1  |

LoKi::VoidFilter/SELECT:Phys/StdLooseMuons

|      |                                 |
|------|---------------------------------|
| Code | 0StdLooseMuons/Particles',True) |

FilterDesktop/MuTightCuts_forB2XuMuNu

|                 |                                                                                                                                    |
|-----------------|------------------------------------------------------------------------------------------------------------------------------------|
| Code            | (TRCHI2DOF \< 4.0 ) & (P\> 6000.0 \*MeV) & (PT\> 1500.0\* MeV)& (TRGHOSTPROB \< 0.35)& (PIDmu \> 3.0 )& (MIPCHI2DV(PRIMARY)\> 25 ) |
| Inputs          | [ 'Phys/[StdLooseMuons](./stripping21r1p2-commonparticles-stdloosemuons)' ]                                                      |
| DecayDescriptor | None                                                                                                                               |
| Output          | Phys/MuTightCuts_forB2XuMuNu/Particles                                                                                             |

LoKi::VoidFilter/SELECT:Phys/StdLoosePions

|      |                                 |
|------|---------------------------------|
| Code | 0StdLoosePions/Particles',True) |

FilterDesktop/Pi_forB2XuMuNu

|                 |                                                                                                                                                  |
|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| Code            | (TRCHI2DOF \< 4.0 )& (P\> 3000.0 \*MeV) & (PT\> 300.0 \*MeV)& (TRGHOSTPROB \< 0.35)& (PIDK \< -2.0 )& (PIDmu \< 2 ) & (MIPCHI2DV(PRIMARY)\> 49 ) |
| Inputs          | [ 'Phys/[StdLoosePions](./stripping21r1p2-commonparticles-stdloosepions)' ]                                                                    |
| DecayDescriptor | None                                                                                                                                             |
| Output          | Phys/Pi_forB2XuMuNu/Particles                                                                                                                    |

CombineParticles/Rho02PiPiWS_forB2XuMuNu

|                  |                                                                                                                                                                                                                                                                        |
|------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/Pi_forB2XuMuNu' ]                                                                                                                                                                                                                                            |
| DaughtersCuts    | { '' : 'ALL' , 'pi+' : '(PT\> 500.0 \*MeV) & (TRCHI2DOF \< 4.0 )& (MIPCHI2DV(PRIMARY)\> 36.0 )& (PIDK \< -2.0 ) & (TRGHOSTPROB \< 0.35)' , 'pi-' : '(PT\> 500.0 \*MeV) & (TRCHI2DOF \< 4.0 )& (MIPCHI2DV(PRIMARY)\> 36.0 )& (PIDK \< -2.0 ) & (TRGHOSTPROB \< 0.35)' } |
| CombinationCut   | (ADAMASS('rho(770)0')\< 1500.0)                                                                                                                                                                                                                                        |
| MotherCut        | (MAXTREE('pi+'==ABSID,PT )\>900.0 \*MeV )& (VFASPF(VCHI2/VDOF) \< 4 ) & (PT \> 1000.0 \*MeV) & (MIPCHI2DV(PRIMARY)\> 50 ) & (BPVDIRA\> 0.98)& (DMASS('rho(770)0')\< 1500.0)                                                                                            |
| DecayDescriptor  | None                                                                                                                                                                                                                                                                   |
| DecayDescriptors | [ '[rho(770)0 -\> pi+ pi+]cc' ]                                                                                                                                                                                                                                    |
| Output           | Phys/Rho02PiPiWS_forB2XuMuNu/Particles                                                                                                                                                                                                                                 |

CombineParticles/RhoMuWS_forB2XuMuNu

|                  |                                                                                                                               |
|------------------|-------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/MuTightCuts_forB2XuMuNu' , 'Phys/Rho02PiPiWS_forB2XuMuNu' ]                                                         |
| DaughtersCuts    | { '' : 'ALL' , 'mu+' : 'ALL' , 'mu-' : 'ALL' , 'rho(770)0' : 'ALL' }                                                          |
| CombinationCut   | (AM\>2000.0\*MeV) & (AM\<5500.0\*MeV)                                                                                         |
| MotherCut        | (VFASPF(VCHI2/VDOF)\< 6.0) & (BPVDIRA\> 0.999)& (BPVVDCHI2 \>120.0) & (BPVCORRM \> 2500.0 \*MeV) & (BPVCORRM \< 7000.0 \*MeV) |
| DecayDescriptor  | None                                                                                                                          |
| DecayDescriptors | [ '[B+ -\> rho(770)0 mu+]cc' ]                                                                                            |
| Output           | Phys/RhoMuWS_forB2XuMuNu/Particles                                                                                            |

TisTosParticleTagger/B2XuMuNuBu2Rho_WSLine

|                 |                                                                                                                                |
|-----------------|--------------------------------------------------------------------------------------------------------------------------------|
| Inputs          | [ 'Phys/RhoMuWS_forB2XuMuNu' ]                                                                                               |
| DecayDescriptor | None                                                                                                                           |
| Output          | Phys/B2XuMuNuBu2Rho_WSLine/Particles                                                                                           |
| TisTosSpecs     | { 'Hlt2.\*SingleMuon.\*Decision%TOS' : 0 , 'Hlt2.\*TopoMu2Body.\*Decision%TOS' : 0 , 'Hlt2.\*TopoMu3Body.\*Decision%TOS' : 0 } |
