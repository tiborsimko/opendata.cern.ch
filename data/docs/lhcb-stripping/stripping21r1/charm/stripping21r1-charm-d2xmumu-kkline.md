[[stripping21r1 lines]](./stripping21r1-index)

# StrippingD2XMuMu_KKLine

## Properties:

|                |                               |
|----------------|-------------------------------|
| OutputLocation | Phys/D2XMuMu_KKLine/Particles |
| Postscale      | 1.0000000                     |
| HLT            | None                          |
| Prescale       | 1.0000000                     |
| L0DU           | None                          |
| ODIN           | None                          |

## Filter sequence:

CheckPV/checkPVmin1

|        |     |
|--------|-----|
| MinPVs | 1   |
| MaxPVs | -1  |

LoKi::VoidFilter/SelFilterPhys_StdAllLooseMuons_Particles

|      |                                                                                                    |
|------|----------------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdAllLooseMuons](./stripping21r1-commonparticles-stdallloosemuons)/Particles')\>0 |

FilterDesktop/MuonsForhhmumuAndForD2XMuMu

|                 |                                                                                                                                         |
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| Code            | (TRCHI2DOF \< 5) & (P \> 3000.0 \*MeV) & (PT \> 300\* MeV) & (PIDmu-PIDpi \> -1) & (MIPCHI2DV(PRIMARY) \> 2.0) & ( TRGHOSTPROB \< 0.5 ) |
| Inputs          | [ 'Phys/[StdAllLooseMuons](./stripping21r1-commonparticles-stdallloosemuons)' ]                                                       |
| DecayDescriptor | None                                                                                                                                    |
| Output          | Phys/MuonsForhhmumuAndForD2XMuMu/Particles                                                                                              |

LoKi::VoidFilter/SelFilterPhys_StdAllLooseKaons_Particles

|      |                                                                                                    |
|------|----------------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdAllLooseKaons](./stripping21r1-commonparticles-stdallloosekaons)/Particles')\>0 |

FilterDesktop/KaonsForhhmumuAndForD2XMuMu

|                 |                                                                                                                                         |
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| Code            | (TRCHI2DOF \< 5) & (P \> 2000.0 \*MeV) & (PT \> 300 \*MeV) &(PIDK-PIDpi \> -1.0) & (MIPCHI2DV(PRIMARY) \> 2.0) & ( TRGHOSTPROB \< 0.5 ) |
| Inputs          | [ 'Phys/[StdAllLooseKaons](./stripping21r1-commonparticles-stdallloosekaons)' ]                                                       |
| DecayDescriptor | None                                                                                                                                    |
| Output          | Phys/KaonsForhhmumuAndForD2XMuMu/Particles                                                                                              |

CombineParticles/D2XMuMu_KKLine

|                  |                                                                                                                                              |
|------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/KaonsForhhmumuAndForD2XMuMu' , 'Phys/MuonsForhhmumuAndForD2XMuMu' ]                                                                |
| DaughtersCuts    | { '' : 'ALL' , 'K+' : 'ALL' , 'K-' : 'ALL' , 'mu+' : 'ALL' , 'mu-' : 'ALL' }                                                                 |
| CombinationCut   | (ADAMASS('D0') \< 100.0 \*MeV) & (AMAXDOCA('')\<0.2) & (AM \> 1763.0 \*MeV) &(AM34 \> 250.0 \*MeV) &(AHASCHILD( (MIPCHI2DV(PRIMARY)\>15) ) ) |
| MotherCut        | (VFASPF(VCHI2/VDOF) \< 8) & (PT \> 2500.0 \*MeV) &(BPVVDCHI2\>36) & (BPVIPCHI2()\< 20) & (BPVDIRA \> 0.9999)                                 |
| DecayDescriptor  | D0 -\> K+ K- mu+ mu-                                                                                                                         |
| DecayDescriptors | [ 'D0 -\> K+ K- mu+ mu-' ]                                                                                                                 |
| Output           | Phys/D2XMuMu_KKLine/Particles                                                                                                                |

AddRelatedInfo/RelatedInfo1_D2XMuMu_KKLine

|                 |                                            |
|-----------------|--------------------------------------------|
| Inputs          | [ 'Phys/D2XMuMu_KKLine' ]                |
| DecayDescriptor | None                                       |
| Output          | Phys/RelatedInfo1_D2XMuMu_KKLine/Particles |
