[[stripping21r1 lines]](./stripping21r1-index)

# StrippingD2hhCompleteEventPromptD2KKLine

## Properties:

|                |                                                |
|----------------|------------------------------------------------|
| OutputLocation | Phys/D2hhCompleteEventPromptD2KKLine/Particles |
| Postscale      | 1.0000000                                      |
| HLT            | None                                           |
| Prescale       | 0.010000000                                    |
| L0DU           | None                                           |
| ODIN           | None                                           |

## Filter sequence:

CheckPV/checkPVmin1

|        |     |
|--------|-----|
| MinPVs | 1   |
| MaxPVs | -1  |

LoKi::VoidFilter/SelFilterPhys_StdAllNoPIDsKaons_Particles

|      |                                                                                                      |
|------|------------------------------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/[StdAllNoPIDsKaons](./stripping21r1-commonparticles-stdallnopidskaons)/Particles')\>0 |

CombineParticles/D2hhCompleteEventPromptD2KK_singleSel

|                  |                                                                                                                                                                                                                                                                                                                                                                                                                                        |
|------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/[StdAllNoPIDsKaons](./stripping21r1-commonparticles-stdallnopidskaons)' ]                                                                                                                                                                                                                                                                                                                                                    |
| DaughtersCuts    | { '' : 'ALL' , 'K+' : '~ISMUON & (PT \> 800.0\* MeV) & (MIPCHI2DV(PRIMARY) \> 9.0) & (PIDK \> 0.0) & (ISLONG) & (P \> 5000.0\* MeV) & (TRCHI2DOF \< 3.0)' , 'K-' : '~ISMUON & (PT \> 800.0\* MeV) & (MIPCHI2DV(PRIMARY) \> 9.0) & (PIDK \> 0.0) & (ISLONG) & (P \> 5000.0\* MeV) & (TRCHI2DOF \< 3.0)' , 'pi+' : '~ISMUON & (PT \> 800.0\* MeV) & (MIPCHI2DV(PRIMARY) \> 9.0) & (ISLONG) & (P \> 5000.0\* MeV) & (TRCHI2DOF \< 3.0)' } |
| CombinationCut   | (APT \> 2000.0\* MeV)& (AHASCHILD( PT \> 1500.0\* MeV ) )& (ADOCA(1,2)\< 0.07\* mm)& (AP \> 5000.0\* MeV) & (AHASCHILD( PIDK \> 5.0 ) )& (DAMASS(1865.0\* MeV) \> -100.0\* MeV)& (DAMASS(1865.0\* MeV) \< 200.0\* MeV)                                                                                                                                                                                                                 |
| MotherCut        | (VFASPF(VCHI2PDOF) \< 10.0)& (BPVVDCHI2 \> 40.0)& (BPVDIRA \> 0.9999)                                                                                                                                                                                                                                                                                                                                                                  |
| DecayDescriptor  | D0 -\> K+ K-                                                                                                                                                                                                                                                                                                                                                                                                                           |
| DecayDescriptors | [ 'D0 -\> K+ K-' ]                                                                                                                                                                                                                                                                                                                                                                                                                   |
| Output           | Phys/D2hhCompleteEventPromptD2KK_singleSel/Particles                                                                                                                                                                                                                                                                                                                                                                                   |

TisTosParticleTagger/D2hhCompleteEventPromptD2KK_singleD2hhHlt1TOS

|                 |                                                              |
|-----------------|--------------------------------------------------------------|
| Inputs          | [ 'Phys/D2hhCompleteEventPromptD2KK_singleSel' ]           |
| DecayDescriptor | None                                                         |
| Output          | Phys/D2hhCompleteEventPromptD2KK_singleD2hhHlt1TOS/Particles |
| TisTosSpecs     | { 'Hlt1TrackAllL0.\*Decision%TOS' : 0 }                      |

TisTosParticleTagger/D2hhCompleteEventPromptD2KKLine

|                 |                                                                                                                                                                                       |
|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Inputs          | [ 'Phys/D2hhCompleteEventPromptD2KK_singleD2hhHlt1TOS' ]                                                                                                                            |
| DecayDescriptor | None                                                                                                                                                                                  |
| Output          | Phys/D2hhCompleteEventPromptD2KKLine/Particles                                                                                                                                        |
| TisTosSpecs     | { 'Hlt2CharmHadD02HH_D02KKDecision%TOS' : 0 , 'Hlt2CharmHadD02HH_D02KKWideMassDecision%TOS' : 0 , 'Hlt2CharmHadD02KKDecision%TOS' : 0 , 'Hlt2CharmHadD02KKWideMassDecision%TOS' : 0 } |
