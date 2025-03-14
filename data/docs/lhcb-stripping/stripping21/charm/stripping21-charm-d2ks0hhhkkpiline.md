[[stripping21 lines]](./stripping21-index)

# StrippingD2KS0HHHKKPiLine

## Properties:

|                |                                 |
|----------------|---------------------------------|
| OutputLocation | Phys/D2KS0HHHKKPiLine/Particles |
| Postscale      | 1.0000000                       |
| HLT            | None                            |
| Prescale       | 1.0000000                       |
| L0DU           | None                            |
| ODIN           | None                            |

## Filter sequence:

LoKi::VoidFilter/StrippingD2KS0HHHKKPiLineVOIDFilter

|      |                                                                 |
|------|-----------------------------------------------------------------|
| Code | (recSummary(LHCb.RecSummary.nTracks, 'Rec/Track/Best') \< 400 ) |

CheckPV/checkPVmin1

|        |     |
|--------|-----|
| MinPVs | 1   |
| MaxPVs | -1  |

LoKi::VoidFilter/SelFilterPhys_StdLooseKsLL_Particles

|      |                                                                                          |
|------|------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdLooseKsLL](./stripping21-commonparticles-stdlooseksll)/Particles')\>0 |

FilterDesktop/D2KS0HHHKS0LLForD2KS0HHH

|                 |                                                                                                                                                                                                                                             |
|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Code            | (PT \> 600\*MeV) & (VFASPF(VCHI2PDOF) \< 8) & CHILDCUT((TRCHI2DOF \< 4),1) & CHILDCUT((TRCHI2DOF \< 4),2) & CHILDCUT((MIPCHI2DV(PRIMARY) \> 40),1) & CHILDCUT((MIPCHI2DV(PRIMARY) \> 40),2) & (MIPCHI2DV(PRIMARY) \> 7) & (BPVVDCHI2\> 300) |
| Inputs          | [ 'Phys/[StdLooseKsLL](./stripping21-commonparticles-stdlooseksll)' ]                                                                                                                                                                     |
| DecayDescriptor | None                                                                                                                                                                                                                                        |
| Output          | Phys/D2KS0HHHKS0LLForD2KS0HHH/Particles                                                                                                                                                                                                     |

LoKi::VoidFilter/SelFilterPhys_StdLooseKaons_Particles

|      |                                                                                            |
|------|--------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdLooseKaons](./stripping21-commonparticles-stdloosekaons)/Particles')\>0 |

FilterDesktop/D2KS0HHHBachelorKaonsForD2KS0HHH

|                 |                                                                                                  |
|-----------------|--------------------------------------------------------------------------------------------------|
| Code            | (PIDK \> 8) & (P \> 5000\*MeV) & (PT \> 320\*MeV) & (TRCHI2DOF \< 3) & (MIPCHI2DV(PRIMARY) \> 5) |
| Inputs          | [ 'Phys/[StdLooseKaons](./stripping21-commonparticles-stdloosekaons)' ]                        |
| DecayDescriptor | None                                                                                             |
| Output          | Phys/D2KS0HHHBachelorKaonsForD2KS0HHH/Particles                                                  |

LoKi::VoidFilter/SelFilterPhys_StdLoosePions_Particles

|      |                                                                                            |
|------|--------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdLoosePions](./stripping21-commonparticles-stdloosepions)/Particles')\>0 |

FilterDesktop/D2KS0HHHBachelorPionsForD2KS0HHH

|                 |                                                                                                  |
|-----------------|--------------------------------------------------------------------------------------------------|
| Code            | (PIDK \< 0) & (P \> 5000\*MeV) & (PT \> 320\*MeV) & (TRCHI2DOF \< 3) & (MIPCHI2DV(PRIMARY) \> 5) |
| Inputs          | [ 'Phys/[StdLoosePions](./stripping21-commonparticles-stdloosepions)' ]                        |
| DecayDescriptor | None                                                                                             |
| Output          | Phys/D2KS0HHHBachelorPionsForD2KS0HHH/Particles                                                  |

CombineParticles/D2KS0HHHKKPiLine

|                  |                                                                                                                                                                                       |
|------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/D2KS0HHHBachelorKaonsForD2KS0HHH' , 'Phys/D2KS0HHHBachelorPionsForD2KS0HHH' , 'Phys/D2KS0HHHKS0LLForD2KS0HHH' ]                                                             |
| DaughtersCuts    | { '' : 'ALL' , 'K+' : 'ALL' , 'K-' : 'ALL' , 'KS0' : 'ALL' , 'pi+' : 'ALL' , 'pi-' : 'ALL' }                                                                                          |
| CombinationCut   | (APT \> 1700) & (ACUTDOCACHI2(20,'')) & in_range(1760, AM, 2080)                                                                                                                      |
| MotherCut        | (PT \> 1800\*MeV) & (VFASPF(VCHI2/VDOF) \< 20) & in_range(1770, MM, 2070) & ((CHILD( VFASPF(VZ) , 'KS0' == ID ) - VFASPF(VZ)) \> 10) & (MIPCHI2DV(PRIMARY) \< 15) & (BPVVDCHI2 \> 50) |
| DecayDescriptor  | [D+ -\> KS0 K- K+ pi+]cc                                                                                                                                                            |
| DecayDescriptors | [ '[D+ -\> KS0 K- K+ pi+]cc' ]                                                                                                                                                    |
| Output           | Phys/D2KS0HHHKKPiLine/Particles                                                                                                                                                       |
