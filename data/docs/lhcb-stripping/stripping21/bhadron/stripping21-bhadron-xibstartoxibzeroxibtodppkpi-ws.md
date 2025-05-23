[[stripping21 lines]](./stripping21-index)

# StrippingXibStarToXibZeroXibToDpPKPi_WS

## Properties:

|                |                                               |
|----------------|-----------------------------------------------|
| OutputLocation | Phys/XibStarToXibZeroXibToDpPKPi_WS/Particles |
| Postscale      | 1.0000000                                     |
| HLT            | None                                          |
| Prescale       | 1.0000000                                     |
| L0DU           | None                                          |
| ODIN           | None                                          |

## Filter sequence:

LoKi::VoidFilter/StrippingXibStarToXibZeroXibToDpPKPi_WSVOIDFilter

|      |                                                                      |
|------|----------------------------------------------------------------------|
| Code | (recSummary (LHCb.RecSummary.nLongTracks, 'Rec/Track/Long') \< 300 ) |

CheckPV/checkPVmin1

|        |     |
|--------|-----|
| MinPVs | 1   |
| MaxPVs | -1  |

LoKi::VoidFilter/SelFilterPhys_StdLooseDplus2KPiPi_Particles

|      |                                                                                                        |
|------|--------------------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdLooseDplus2KPiPi](./stripping21-commonparticles-stdloosedplus2kpipi)/Particles')\>0 |

FilterDesktop/XibStarToXibZeroDisplacedDpFilt

|                 |                                                                                                                                                                                                                                       |
|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Code            | ( MINTREE('pi+'==ABSID, PROBNNpi) \> 0.01 ) & ( MINTREE('K+'==ABSID, PROBNNk) \> 0.02 ) & ( PT \> 2.0\*GeV ) & ( MAXTREE('pi+'==ABSID, TRGHOSTPROB) \< 0.7 ) & ( MAXTREE('K+'==ABSID, TRGHOSTPROB) \< 0.7 ) & (ADMASS('D+')\<50\*MeV) |
| Inputs          | [ 'Phys/[StdLooseDplus2KPiPi](./stripping21-commonparticles-stdloosedplus2kpipi)' ]                                                                                                                                                 |
| DecayDescriptor | None                                                                                                                                                                                                                                  |
| Output          | Phys/XibStarToXibZeroDisplacedDpFilt/Particles                                                                                                                                                                                        |

LoKi::VoidFilter/SelFilterPhys_StdLooseANNProtons_Particles

|      |                                                                                                      |
|------|------------------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdLooseANNProtons](./stripping21-commonparticles-stdlooseannprotons)/Particles')\>0 |

FilterDesktop/XibStarToXibZeroBaseFilteredProtons

|                 |                                                                                     |
|-----------------|-------------------------------------------------------------------------------------|
| Code            | (TRCHI2DOF\<5.0)& (P\>2000.0)& (PT\>250.0)& (MIPCHI2DV(PRIMARY)\>-1.0)              |
| Inputs          | [ 'Phys/[StdLooseANNProtons](./stripping21-commonparticles-stdlooseannprotons)' ] |
| DecayDescriptor | None                                                                                |
| Output          | Phys/XibStarToXibZeroBaseFilteredProtons/Particles                                  |

FilterDesktop/XibStarToXibZeroGhostFilteredProtons

|                 |                                                     |
|-----------------|-----------------------------------------------------|
| Code            | (TRGHOSTPROB\<0.7)                                  |
| Inputs          | [ 'Phys/XibStarToXibZeroBaseFilteredProtons' ]    |
| DecayDescriptor | None                                                |
| Output          | Phys/XibStarToXibZeroGhostFilteredProtons/Particles |

FilterDesktop/XibStarToXibZeroFilteredProtons

|                 |                                                   |
|-----------------|---------------------------------------------------|
| Code            | (HASRICH)&(PROBNNp\>0.02)                         |
| Inputs          | [ 'Phys/XibStarToXibZeroGhostFilteredProtons' ] |
| DecayDescriptor | None                                              |
| Output          | Phys/XibStarToXibZeroFilteredProtons/Particles    |

FilterDesktop/XibStarToXibZeroTightFilteredProtons

|                 |                                                     |
|-----------------|-----------------------------------------------------|
| Code            | (PROBNNp\>0.05) & (MIPCHI2DV(PRIMARY)\>4.0)         |
| Inputs          | [ 'Phys/XibStarToXibZeroFilteredProtons' ]        |
| DecayDescriptor | None                                                |
| Output          | Phys/XibStarToXibZeroTightFilteredProtons/Particles |

LoKi::VoidFilter/SelFilterPhys_StdLooseANNKaons_Particles

|      |                                                                                                  |
|------|--------------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdLooseANNKaons](./stripping21-commonparticles-stdlooseannkaons)/Particles')\>0 |

FilterDesktop/XibStarToXibZeroBaseFilteredKaons

|                 |                                                                                 |
|-----------------|---------------------------------------------------------------------------------|
| Code            | (TRCHI2DOF\<5.0)& (P\>2000.0)& (PT\>250.0)& (MIPCHI2DV(PRIMARY)\>-1.0)          |
| Inputs          | [ 'Phys/[StdLooseANNKaons](./stripping21-commonparticles-stdlooseannkaons)' ] |
| DecayDescriptor | None                                                                            |
| Output          | Phys/XibStarToXibZeroBaseFilteredKaons/Particles                                |

FilterDesktop/XibStarToXibZeroGhostFilteredKaons

|                 |                                                   |
|-----------------|---------------------------------------------------|
| Code            | (TRGHOSTPROB\<0.7)                                |
| Inputs          | [ 'Phys/XibStarToXibZeroBaseFilteredKaons' ]    |
| DecayDescriptor | None                                              |
| Output          | Phys/XibStarToXibZeroGhostFilteredKaons/Particles |

FilterDesktop/XibStarToXibZeroFilteredKaons

|                 |                                                 |
|-----------------|-------------------------------------------------|
| Code            | (HASRICH)&(PROBNNk\>0.02)                       |
| Inputs          | [ 'Phys/XibStarToXibZeroGhostFilteredKaons' ] |
| DecayDescriptor | None                                            |
| Output          | Phys/XibStarToXibZeroFilteredKaons/Particles    |

FilterDesktop/XibStarToXibZeroTightFilteredKaons

|                 |                                                   |
|-----------------|---------------------------------------------------|
| Code            | (PROBNNk\>0.04) & (MIPCHI2DV(PRIMARY)\>4.0)       |
| Inputs          | [ 'Phys/XibStarToXibZeroFilteredKaons' ]        |
| DecayDescriptor | None                                              |
| Output          | Phys/XibStarToXibZeroTightFilteredKaons/Particles |

LoKi::VoidFilter/SelFilterPhys_StdLooseANNPions_Particles

|      |                                                                                                  |
|------|--------------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdLooseANNPions](./stripping21-commonparticles-stdlooseannpions)/Particles')\>0 |

FilterDesktop/XibStarToXibZeroBaseFilteredPions

|                 |                                                                                 |
|-----------------|---------------------------------------------------------------------------------|
| Code            | (TRCHI2DOF\<5.0)& (P\>2000.0)& (PT\>250.0)& (MIPCHI2DV(PRIMARY)\>-1.0)          |
| Inputs          | [ 'Phys/[StdLooseANNPions](./stripping21-commonparticles-stdlooseannpions)' ] |
| DecayDescriptor | None                                                                            |
| Output          | Phys/XibStarToXibZeroBaseFilteredPions/Particles                                |

FilterDesktop/XibStarToXibZeroGhostFilteredPions

|                 |                                                   |
|-----------------|---------------------------------------------------|
| Code            | (TRGHOSTPROB\<0.7)                                |
| Inputs          | [ 'Phys/XibStarToXibZeroBaseFilteredPions' ]    |
| DecayDescriptor | None                                              |
| Output          | Phys/XibStarToXibZeroGhostFilteredPions/Particles |

FilterDesktop/XibStarToXibZeroFilteredPions

|                 |                                                 |
|-----------------|-------------------------------------------------|
| Code            | (HASRICH)&(PROBNNpi\>0.01)                      |
| Inputs          | [ 'Phys/XibStarToXibZeroGhostFilteredPions' ] |
| DecayDescriptor | None                                            |
| Output          | Phys/XibStarToXibZeroFilteredPions/Particles    |

CombineParticles/XibStarToXibZeroCombineXibToDpPKPi

|                  |                                                                                                                                                                               |
|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/XibStarToXibZeroDisplacedDpFilt' , 'Phys/XibStarToXibZeroFilteredPions' , 'Phys/XibStarToXibZeroTightFilteredKaons' , 'Phys/XibStarToXibZeroTightFilteredProtons' ] |
| DaughtersCuts    | { '' : 'ALL' , 'D+' : 'ALL' , 'D-' : 'ALL' , 'K+' : 'ALL' , 'K-' : 'ALL' , 'p+' : 'ALL' , 'pi+' : 'ALL' , 'pi-' : 'ALL' , 'p~-' : 'ALL' }                                     |
| CombinationCut   | ( APT \> 2000.0 ) & ( AMAXDOCA('')\<0.5\*mm ) & ( AM\>3800.0\*MeV ) & ( AM\<7200.0\*MeV )                                                                                     |
| MotherCut        | ( BPVVDCHI2 \> 36.0 ) & ( VFASPF(VCHI2PDOF)\<7.0 ) & ( MM\>5500.0\*MeV ) & ( MM\<6100.0\*MeV ) & ( BPVDIRA \> 0.995 )                                                         |
| DecayDescriptor  | [ Xi_b0 -\> D+ p+ K- pi- ]cc                                                                                                                                                |
| DecayDescriptors | [ '[ Xi_b0 -\> D+ p+ K- pi- ]cc' ]                                                                                                                                        |
| Output           | Phys/XibStarToXibZeroCombineXibToDpPKPi/Particles                                                                                                                             |

LoKi::VoidFilter/SelFilterPhys_StdAllNoPIDsPions_Particles

|      |                                                                                                    |
|------|----------------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdAllNoPIDsPions](./stripping21-commonparticles-stdallnopidspions)/Particles')\>0 |

FilterDesktop/XibStarToXibZeroFilteredSoftPionsBase

|                 |                                                                                        |
|-----------------|----------------------------------------------------------------------------------------|
| Code            | (TRCHI2DOF\<5.0)& (P\>1000.0)& (PT\>0.0)& (PROBNNe\<0.2)& (MIPCHI2DV(PRIMARY)\>-999.0) |
| Inputs          | [ 'Phys/[StdAllNoPIDsPions](./stripping21-commonparticles-stdallnopidspions)' ]      |
| DecayDescriptor | None                                                                                   |
| Output          | Phys/XibStarToXibZeroFilteredSoftPionsBase/Particles                                   |

FilterDesktop/XibStarToXibZeroFilteredSoftPionsGP

|                 |                                                    |
|-----------------|----------------------------------------------------|
| Code            | (TRGHOSTPROB\<0.7)                                 |
| Inputs          | [ 'Phys/XibStarToXibZeroFilteredSoftPionsBase' ] |
| DecayDescriptor | None                                               |
| Output          | Phys/XibStarToXibZeroFilteredSoftPionsGP/Particles |

CombineParticles/XibStarToXibZeroXibToDpPKPi_WS

|                  |                                                                                                                                      |
|------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/XibStarToXibZeroCombineXibToDpPKPi' , 'Phys/XibStarToXibZeroFilteredSoftPionsGP' ]                                         |
| DaughtersCuts    | { '' : 'ALL' , 'Xi_b0' : 'ALL' , 'Xi_b~0' : 'ALL' , 'pi+' : 'ALL' , 'pi-' : 'ALL' }                                                  |
| CombinationCut   | (AM \> 5000.0\*MeV) & (AM \< 8000.0\*MeV)                                                                                            |
| MotherCut        | ((VFASPF(VCHI2/VDOF) \< 20.0) & (MM - CHILD(MM,1) - CHILD(MM,2) \> -25.0) & (MM - CHILD(MM,1) - CHILD(MM,2) \< 50.0)&(PT \> 2500.0)) |
| DecayDescriptor  | [ Sigma_b+ -\> Xi_b0 pi+ ]cc                                                                                                       |
| DecayDescriptors | [ '[ Sigma_b+ -\> Xi_b0 pi+ ]cc' ]                                                                                               |
| Output           | Phys/XibStarToXibZeroXibToDpPKPi_WS/Particles                                                                                        |
