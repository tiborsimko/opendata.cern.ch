[[stripping21r1p2 lines]](./stripping21r1p2-index)

# StrippingB2XuENuB2Pi_NoPIDPiLine

## Properties:

|                |                                        |
|----------------|----------------------------------------|
| OutputLocation | Phys/B2XuENuB2Pi_NoPIDPiLine/Particles |
| Postscale      | 1.0000000                              |
| HLT1           | None                                   |
| HLT2           | None                                   |
| Prescale       | 0.020000000                            |
| L0DU           | None                                   |
| ODIN           | None                                   |

## Filter sequence:

LoKi::VoidFilter/StrippingGoodEventConditionSemileptonic

|      |                                                                                                          |
|------|----------------------------------------------------------------------------------------------------------|
| Code | ALG_EXECUTED('StrippingStreamSemileptonicBadEvent') & ~ALG_PASSED('StrippingStreamSemileptonicBadEvent') |

LoKi::VoidFilter/StrippingB2XuENuB2Pi_NoPIDPiLineVOIDFilter

|      |                                                                   |
|------|-------------------------------------------------------------------|
| Code | ( recSummaryTrack(LHCb.RecSummary.nLongTracks, TrLONG) \< 250.0 ) |

CheckPV/checkPVmin1

|        |     |
|--------|-----|
| MinPVs | 1   |
| MaxPVs | -1  |

LoKi::VoidFilter/SELECT:Phys/StdLooseElectrons

|      |                                     |
|------|-------------------------------------|
| Code | 0StdLooseElectrons/Particles',True) |

FilterDesktop/EL0TOS_forB2XuENu

|                 |                                                                                                                                   |
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------|
| Code            | (TRCHI2DOF \< 4.0 ) & (P\> 6000.0 \*MeV) & (PT\> 1500.0\* MeV)& (TRGHOSTPROB \< 0.35)& (PIDe \> 3.0 )& (MIPCHI2DV(PRIMARY)\> 25 ) |
| Inputs          | [ 'Phys/[StdLooseElectrons](./stripping21r1p2-commonparticles-stdlooseelectrons)' ]                                             |
| DecayDescriptor | None                                                                                                                              |
| Output          | Phys/EL0TOS_forB2XuENu/Particles                                                                                                  |

LoKi::VoidFilter/SELECT:Phys/StdNoPIDsPions

|      |                                  |
|------|----------------------------------|
| Code | 0StdNoPIDsPions/Particles',True) |

FilterDesktop/PiTightNoPID_forB2XuENu

|                 |                                                                                                                 |
|-----------------|-----------------------------------------------------------------------------------------------------------------|
| Code            | (TRCHI2DOF \< 4.0 )& (P\> 10000.0 \*MeV) & (PT\> 800.0 \*MeV)& (TRGHOSTPROB \< 0.5)& (MIPCHI2DV(PRIMARY)\> 36 ) |
| Inputs          | [ 'Phys/[StdNoPIDsPions](./stripping21r1p2-commonparticles-stdnopidspions)' ]                                 |
| DecayDescriptor | None                                                                                                            |
| Output          | Phys/PiTightNoPID_forB2XuENu/Particles                                                                          |

CombineParticles/PiENoPIDhad_forB2XuENu

|                  |                                                                                                                               |
|------------------|-------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/EL0TOS_forB2XuENu' , 'Phys/PiTightNoPID_forB2XuENu' ]                                                               |
| DaughtersCuts    | { '' : 'ALL' , 'e+' : 'ALL' , 'e-' : 'ALL' , 'pi+' : 'ALL' , 'pi-' : 'ALL' }                                                  |
| CombinationCut   | (AM\>1500.0\*MeV) & (AM\<5500.0\*MeV)                                                                                         |
| MotherCut        | (VFASPF(VCHI2/VDOF)\< 4.0) & (BPVDIRA\> 0.999)& (BPVVDCHI2 \>120.0) & (BPVCORRM \> 2500.0 \*MeV) & (BPVCORRM \< 7000.0 \*MeV) |
| DecayDescriptor  | None                                                                                                                          |
| DecayDescriptors | [ '[B0 -\> pi+ e-]cc' ]                                                                                                   |
| Output           | Phys/PiENoPIDhad_forB2XuENu/Particles                                                                                         |

TisTosParticleTagger/B2XuENuB2Pi_NoPIDPiLine

|                 |                                                                                            |
|-----------------|--------------------------------------------------------------------------------------------|
| Inputs          | [ 'Phys/PiENoPIDhad_forB2XuENu' ]                                                        |
| DecayDescriptor | None                                                                                       |
| Output          | Phys/B2XuENuB2Pi_NoPIDPiLine/Particles                                                     |
| TisTosSpecs     | { 'Hlt2.\*Single.\*Electron.\*Decision%TOS' : 0 , 'Hlt2.\*TopoE2Body.\*Decision%TOS' : 0 } |
