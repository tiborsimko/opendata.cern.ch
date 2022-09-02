[[stripping21r1 lines]](./stripping21r1-leptonic)

# StrippingBs2MuMusBs2JPsiPhiLine

## Properties:

|                |                                       |
|----------------|---------------------------------------|
| OutputLocation | Phys/Bs2MuMusBs2JPsiPhiLine/Particles |
| Postscale      | 1.0000000                             |
| HLT            | None                                  |
| Prescale       | 1.0000000                             |
| L0DU           | None                                  |
| ODIN           | None                                  |

## Filter sequence:

**CheckPV/checkPVmin1**

|        |     |
|--------|-----|
| MinPVs | 1   |
| MaxPVs | -1  |

**LoKi::VoidFilter/SelFilterPhys_StdLooseMuons_Particles**

|      |                                                                                |
|------|--------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/ [StdLooseMuons](./stripping21r1-stdloosemuons) /Particles')\>0 |

**CombineParticles/Bs2MuMusBs2JPsiPhiSelJpsi**

|                  |                                                                                                                                      |
|------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/ [StdLooseMuons](./stripping21r1-stdloosemuons) ' ]                                                                        |
| DaughtersCuts    | { '' : 'ALL' , 'mu+' : '(TRCHI2DOF \< 3 ) & (MIPCHI2DV(PRIMARY)\> 25.)' , 'mu-' : '(TRCHI2DOF \< 3 ) & (MIPCHI2DV(PRIMARY)\> 25.)' } |
| CombinationCut   | (ADAMASS('J/psi(1S)')\<100\*MeV) & (AMAXDOCA('')\<0.3\*mm)                                                                           |
| MotherCut        | (VFASPF(VCHI2)\<9) & (ADMASS('J/psi(1S)') \< 100\*MeV )& (BPVDIRA \> 0) & (BPVVDCHI2\> 121)                                          |
| DecayDescriptor  | J/psi(1S) -\> mu+ mu-                                                                                                                |
| DecayDescriptors | [ 'J/psi(1S) -\> mu+ mu-' ]                                                                                                        |
| Output           | Phys/Bs2MuMusBs2JPsiPhiSelJpsi/Particles                                                                                             |

****Tools:****

**OfflineVertexFitter**

|                          |                                                                                                           |
|--------------------------|-----------------------------------------------------------------------------------------------------------|
| StatTableHeader :        | \| Counter \| \# \| sum \| mean/eff^\* \| rms/err^\* \| min \| max \|                                     |
| maxDeltaChi2 :           | 0.0010000000                                                                                              |
| applyMomMassConstraint : | False                                                                                                     |
| PropertiesPrint :        | False                                                                                                     |
| applyDauMassConstraint : | False                                                                                                     |
| AuditStart :             | False                                                                                                     |
| useResonanceVertex :     | False                                                                                                     |
| maxIter :                | 10                                                                                                        |
| includeDauVertexChi2 :   | True                                                                                                      |
| StatEntityList :         | [ ]                                                                                                     |
| RootOnTES :              | None                                                                                                      |
| PrintMyAlg :             | True                                                                                                      |
| RootInTES :              | None                                                                                                      |
| AuditFinalize :          | False                                                                                                     |
| TypePrint :              | True                                                                                                      |
| Transporter :            | ParticleTransporter:PUBLIC                                                                                |
| widthThreshold :         | 2.0000000                                                                                                 |
| ContextService :         | AlgContextSvc                                                                                             |
| AuditTools :             | False                                                                                                     |
| MonitorService :         | MonitorSvc                                                                                                |
| AuditInitialize :        | False                                                                                                     |
| RegularRowFormat :       | \| %\|-48.48s\|%\|50t\|\|%\|10d\| \|%\|11.7g\| \|%\|#11.5g\| \|%\|#11.5g\| \|%\|#12.5g\| \|%\|#12.5g\| \| |
| OutputLevel :            | 3                                                                                                         |
| StatPrint :              | True                                                                                                      |
| AuditStop :              | False                                                                                                     |
| Context :                | None                                                                                                      |
| ErrorsPrint :            | True                                                                                                      |
| GlobalTimeOffset :       | 0.0000000                                                                                                 |
| maxDeltaZ :              | 1.0000000                                                                                                 |
| UseEfficiencyRowFormat : | True                                                                                                      |
| EfficiencyRowFormat :    | \|\*%\|-48.48s\|%\|50t\|\|%\|10d\| \|%\|11.5g\| \|(%\|#9.6g\| +- %\|-#9.6g\|)%%\| ------- \| ------- \|   |
| CounterList :            | [ '.\*' ]                                                                                               |

**LoKi::VoidFilter/SelFilterPhys_StdNoPIDsKaons_Particles**

|      |                                                                                  |
|------|----------------------------------------------------------------------------------|
| Code | CONTAINS('Phys/ [StdNoPIDsKaons](./stripping21r1-stdnopidskaons) /Particles')\>0 |

**CombineParticles/Bs2MuMusBs2JPsiPhiSelPhi**

|                  |                                                                                                                                                                                          |
|------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | [ 'Phys/ [StdNoPIDsKaons](./stripping21r1-stdnopidskaons) ' ]                                                                                                                          |
| DaughtersCuts    | { '' : 'ALL' , 'K+' : '(ISLONG) & (TRCHI2DOF \< 3 ) & (MIPCHI2DV(PRIMARY)\> 4.) & (PT\>250\*MeV)' , 'K-' : '(ISLONG) & (TRCHI2DOF \< 3 ) & (MIPCHI2DV(PRIMARY)\> 4.) & (PT\>250\*MeV)' } |
| CombinationCut   | (ADAMASS('phi(1020)')\<20\*MeV)                                                                                                                                                          |
| MotherCut        | (MIPCHI2DV(PRIMARY)\> 9)                                                                                                                                                                 |
| DecayDescriptor  | phi(1020) -\> K+ K-                                                                                                                                                                      |
| DecayDescriptors | [ 'phi(1020) -\> K+ K-' ]                                                                                                                                                              |
| Output           | Phys/Bs2MuMusBs2JPsiPhiSelPhi/Particles                                                                                                                                                  |

**CombineParticles/Bs2MuMusBs2JPsiPhiLine**

|                  |                                                                          |
|------------------|--------------------------------------------------------------------------|
| Inputs           | [ 'Phys/Bs2MuMusBs2JPsiPhiSelJpsi' , 'Phys/Bs2MuMusBs2JPsiPhiSelPhi' ] |
| DaughtersCuts    | { '' : 'ALL' , 'J/psi(1S)' : 'ALL' , 'phi(1020)' : 'ALL' }               |
| CombinationCut   | (ADAMASS('B_s0') \< 500\*MeV)                                            |
| MotherCut        | (BPVIPCHI2()\< 25)& (VFASPF(VCHI2)\<75)                                  |
| DecayDescriptor  | B_s0 -\> J/psi(1S) phi(1020)                                             |
| DecayDescriptors | [ 'B_s0 -\> J/psi(1S) phi(1020)' ]                                     |
| Output           | Phys/Bs2MuMusBs2JPsiPhiLine/Particles                                    |

****Tools:****

**OfflineVertexFitter**

|                          |                                                                                                           |
|--------------------------|-----------------------------------------------------------------------------------------------------------|
| StatTableHeader :        | \| Counter \| \# \| sum \| mean/eff^\* \| rms/err^\* \| min \| max \|                                     |
| maxDeltaChi2 :           | 0.0010000000                                                                                              |
| applyMomMassConstraint : | False                                                                                                     |
| PropertiesPrint :        | False                                                                                                     |
| applyDauMassConstraint : | False                                                                                                     |
| AuditStart :             | False                                                                                                     |
| useResonanceVertex :     | False                                                                                                     |
| maxIter :                | 10                                                                                                        |
| includeDauVertexChi2 :   | True                                                                                                      |
| StatEntityList :         | [ ]                                                                                                     |
| RootOnTES :              | None                                                                                                      |
| PrintMyAlg :             | True                                                                                                      |
| RootInTES :              | None                                                                                                      |
| AuditFinalize :          | False                                                                                                     |
| TypePrint :              | True                                                                                                      |
| Transporter :            | ParticleTransporter:PUBLIC                                                                                |
| widthThreshold :         | 2.0000000                                                                                                 |
| ContextService :         | AlgContextSvc                                                                                             |
| AuditTools :             | False                                                                                                     |
| MonitorService :         | MonitorSvc                                                                                                |
| AuditInitialize :        | False                                                                                                     |
| RegularRowFormat :       | \| %\|-48.48s\|%\|50t\|\|%\|10d\| \|%\|11.7g\| \|%\|#11.5g\| \|%\|#11.5g\| \|%\|#12.5g\| \|%\|#12.5g\| \| |
| OutputLevel :            | 3                                                                                                         |
| StatPrint :              | True                                                                                                      |
| AuditStop :              | False                                                                                                     |
| Context :                | None                                                                                                      |
| ErrorsPrint :            | True                                                                                                      |
| GlobalTimeOffset :       | 0.0000000                                                                                                 |
| maxDeltaZ :              | 1.0000000                                                                                                 |
| UseEfficiencyRowFormat : | True                                                                                                      |
| EfficiencyRowFormat :    | \|\*%\|-48.48s\|%\|50t\|\|%\|10d\| \|%\|11.5g\| \|(%\|#9.6g\| +- %\|-#9.6g\|)%%\| ------- \| ------- \|   |
| CounterList :            | [ '.\*' ]                                                                                               |

**AddRelatedInfo/RelatedInfo1_Bs2MuMusBs2JPsiPhiLine**

|                 |                                                    |
|-----------------|----------------------------------------------------|
| Inputs          | [ 'Phys/Bs2MuMusBs2JPsiPhiSelJpsi' ]             |
| DecayDescriptor | None                                               |
| Output          | Phys/RelatedInfo1_Bs2MuMusBs2JPsiPhiLine/Particles |

****Tools:****

**Tool1**

|                          |                                                                                                                                                                            |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Transporter :            | ParticleTransporter:PUBLIC                                                                                                                                                 |
| StatTableHeader :        | \| Counter \| \# \| sum \| mean/eff^\* \| rms/err^\* \| min \| max \|                                                                                                      |
| GammaCDecays :           | gamma -\> e+ e-                                                                                                                                                            |
| PropertiesPrint :        | False                                                                                                                                                                      |
| AuditStart :             | False                                                                                                                                                                      |
| TrackContainer :         | Rec/Track/Best                                                                                                                                                             |
| trchi2_cut :             | 3.0000000                                                                                                                                                                  |
| TrackExtrapolator :      | TrackMasterExtrapolator:PUBLIC                                                                                                                                             |
| StatEntityList :         | [ ]                                                                                                                                                                      |
| MaxPrints :              | 2                                                                                                                                                                          |
| RootOnTES :              | None                                                                                                                                                                       |
| DeltaPath :              | 0.0020000000                                                                                                                                                               |
| PrintMyAlg :             | True                                                                                                                                                                       |
| RootInTES :              | None                                                                                                                                                                       |
| ParticlePath :           | /Event/Phys/StdAllNoPIDsPions/Particles                                                                                                                                    |
| AuditFinalize :          | False                                                                                                                                                                      |
| TypePrint :              | True                                                                                                                                                                       |
| IsoTwoBody :             | False                                                                                                                                                                      |
| ContextService :         | AlgContextSvc                                                                                                                                                              |
| DeltaChi2 :              | 0.050000000                                                                                                                                                                |
| AuditTools :             | False                                                                                                                                                                      |
| MonitorService :         | MonitorSvc                                                                                                                                                                 |
| AuditInitialize :        | False                                                                                                                                                                      |
| RegularRowFormat :       | \| %\|-48.48s\|%\|50t\|\|%\|10d\| \|%\|11.7g\| \|%\|#11.5g\| \|%\|#11.5g\| \|%\|#12.5g\| \|%\|#12.5g\| \|                                                                  |
| OutputLevel :            | 3                                                                                                                                                                          |
| StatPrint :              | True                                                                                                                                                                       |
| makeTrackCuts :          | False                                                                                                                                                                      |
| AuditStop :              | False                                                                                                                                                                      |
| ghost_cut :              | 0.30000000                                                                                                                                                                 |
| Context :                | None                                                                                                                                                                       |
| ErrorsPrint :            | True                                                                                                                                                                       |
| GlobalTimeOffset :       | 0.0000000                                                                                                                                                                  |
| MaxIterations :          | 10                                                                                                                                                                         |
| Variables :              | [ 'BSMUMUCDFISO' , 'BSMUMUOTHERBMAG' , 'BSMUMUOTHERBANGLE' , 'BSMUMUOTHERBBOOSTMAG' , 'BSMUMUOTHERBBOOSTANGLE' , 'BSMUMUOTHERBTRACKS' , 'BSMUMUPARTID' , 'BSMUMUTOPID' ] |
| DiGammaDecays :          | [ ( pi0 -\> ) , ( eta -\> ) , ]                                                                                                                                          |
| UseEfficiencyRowFormat : | True                                                                                                                                                                       |
| PVInputLocation :        | Rec/Vertex/Primary                                                                                                                                                         |
| ToleranceInZ :           | 0.0020000000                                                                                                                                                               |
| StateProvider :          | TrackStateProvider:PUBLIC                                                                                                                                                  |
| EfficiencyRowFormat :    | \|\*%\|-48.48s\|%\|50t\|\|%\|10d\| \|%\|11.5g\| \|(%\|#9.6g\| +- %\|-#9.6g\|)%%\| ------- \| ------- \|                                                                    |
| tracktype :              | 3                                                                                                                                                                          |
| CounterList :            | [ '.\*' ]                                                                                                                                                                |

**AddRelatedInfo/RelatedInfo2_Bs2MuMusBs2JPsiPhiLine**

|                 |                                                    |
|-----------------|----------------------------------------------------|
| Inputs          | [ 'Phys/Bs2MuMusBs2JPsiPhiSelJpsi' ]             |
| DecayDescriptor | None                                               |
| Output          | Phys/RelatedInfo2_Bs2MuMusBs2JPsiPhiLine/Particles |

****Tools:****

**Tool2**

|                          |                                                                                                                                                                                            |
|--------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| AuditTools :             | False                                                                                                                                                                                      |
| StatTableHeader :        | \| Counter \| \# \| sum \| mean/eff^\* \| rms/err^\* \| min \| max \|                                                                                                                      |
| clone_cut :              | -9999.0000                                                                                                                                                                                 |
| PropertiesPrint :        | False                                                                                                                                                                                      |
| AuditStart :             | False                                                                                                                                                                                      |
| ips :                    | 3.0000000                                                                                                                                                                                  |
| GammaCDecays :           | gamma -\> e+ e-                                                                                                                                                                            |
| TrackContainer :         | Rec/Track/Best                                                                                                                                                                             |
| trchi2_cut :             | 3.0000000                                                                                                                                                                                  |
| TrackExtrapolator :      | TrackMasterExtrapolator:PUBLIC                                                                                                                                                             |
| ErrorsPrint :            | True                                                                                                                                                                                       |
| svdis_h :                | 30.000000                                                                                                                                                                                  |
| StatEntityList :         | [ ]                                                                                                                                                                                      |
| MaxPrints :              | 2                                                                                                                                                                                          |
| angle :                  | 0.27000000                                                                                                                                                                                 |
| DeltaPath :              | 0.0020000000                                                                                                                                                                               |
| PrintMyAlg :             | True                                                                                                                                                                                       |
| RootInTES :              | None                                                                                                                                                                                       |
| ParticlePath :           | /Event/Phys/StdAllNoPIDsPions/Particles                                                                                                                                                    |
| AuditFinalize :          | False                                                                                                                                                                                      |
| pvdis :                  | 0.50000000                                                                                                                                                                                 |
| IsoTwoBody :             | False                                                                                                                                                                                      |
| ContextService :         | AlgContextSvc                                                                                                                                                                              |
| DeltaChi2 :              | 0.050000000                                                                                                                                                                                |
| svdis :                  | -0.15000000                                                                                                                                                                                |
| Transporter :            | ParticleTransporter:PUBLIC                                                                                                                                                                 |
| MonitorService :         | MonitorSvc                                                                                                                                                                                 |
| AuditInitialize :        | False                                                                                                                                                                                      |
| RegularRowFormat :       | \| %\|-48.48s\|%\|50t\|\|%\|10d\| \|%\|11.7g\| \|%\|#11.5g\| \|%\|#11.5g\| \|%\|#12.5g\| \|%\|#12.5g\| \|                                                                                  |
| OutputLevel :            | 3                                                                                                                                                                                          |
| StatPrint :              | True                                                                                                                                                                                       |
| TypePrint :              | True                                                                                                                                                                                       |
| makeTrackCuts :          | False                                                                                                                                                                                      |
| fc :                     | 0.60000000                                                                                                                                                                                 |
| AuditStop :              | False                                                                                                                                                                                      |
| Context :                | None                                                                                                                                                                                       |
| ghost_cut :              | 0.30000000                                                                                                                                                                                 |
| RootOnTES :              | None                                                                                                                                                                                       |
| GlobalTimeOffset :       | 0.0000000                                                                                                                                                                                  |
| MaxIterations :          | 10                                                                                                                                                                                         |
| doca_iso :               | 0.13000000                                                                                                                                                                                 |
| Variables :              | [ 'BSMUMUTRACKPLUSISO' , 'BSMUMUTRACKPLUSISOTWO' , 'ISOTWOBODYQPLUS' , 'ISOTWOBODYMASSISOPLUS' , 'ISOTWOBODYCHI2ISOPLUS' , 'ISOTWOBODYISO5PLUS' , 'BSMUMUTRACKID' , 'BSMUMUTRACKTOPID' ] |
| DiGammaDecays :          | [ ( pi0 -\> ) , ( eta -\> ) , ]                                                                                                                                                          |
| UseEfficiencyRowFormat : | True                                                                                                                                                                                       |
| PVInputLocation :        | Rec/Vertex/Primary                                                                                                                                                                         |
| ToleranceInZ :           | 0.0020000000                                                                                                                                                                               |
| pvdis_h :                | 40.000000                                                                                                                                                                                  |
| StateProvider :          | TrackStateProvider:PUBLIC                                                                                                                                                                  |
| EfficiencyRowFormat :    | \|\*%\|-48.48s\|%\|50t\|\|%\|10d\| \|%\|11.5g\| \|(%\|#9.6g\| +- %\|-#9.6g\|)%%\| ------- \| ------- \|                                                                                    |
| tracktype :              | 3                                                                                                                                                                                          |
| CounterList :            | [ '.\*' ]                                                                                                                                                                                |

**AddRelatedInfo/RelatedInfo3_Bs2MuMusBs2JPsiPhiLine**

|                 |                                                    |
|-----------------|----------------------------------------------------|
| Inputs          | [ 'Phys/Bs2MuMusBs2JPsiPhiSelJpsi' ]             |
| DecayDescriptor | None                                               |
| Output          | Phys/RelatedInfo3_Bs2MuMusBs2JPsiPhiLine/Particles |

****Tools:****

**Tool3**

|                              |                                                                                                           |
|------------------------------|-----------------------------------------------------------------------------------------------------------|
| GammaCDecays :               | gamma -\> e+ e-                                                                                           |
| MaxFinderMaxIteration :      | 10000                                                                                                     |
| MaxFinderMinStep :           | 1.0000000e-06                                                                                             |
| ResolverMaxIteration :       | 8.0000000                                                                                                 |
| minTrNumber :                | 4                                                                                                         |
| TrackExtrapolator :          | TrackMasterExtrapolator:PUBLIC                                                                            |
| MaxFinderMaxjump :           | 5.0000000                                                                                                 |
| StatEntityList :             | [ ]                                                                                                     |
| MaxFinderMinGradientMag :    | 0.010000000                                                                                               |
| ParticlePath :               | /Event/Phys/StdAllNoPIDsPions/Particles                                                                   |
| ToleranceInZ :               | 0.0020000000                                                                                              |
| pvdis :                      | 0.50000000                                                                                                |
| cut_imp :                    | 0.20000000                                                                                                |
| AuditInitialize :            | False                                                                                                     |
| TypePrint :                  | True                                                                                                      |
| StatPrint :                  | True                                                                                                      |
| TrackVtxChi2Max :            | 15.000000                                                                                                 |
| VertexFunctionToolName :     | VertexFunctionTool                                                                                        |
| AuditStart :                 | False                                                                                                     |
| pvdis_h :                    | 40.000000                                                                                                 |
| TwoTracksVtxVfMin :          | 0.10000000                                                                                                |
| Iterations :                 | 5                                                                                                         |
| StateProvider :              | TrackStateProvider:PUBLIC                                                                                 |
| is_data :                    | False                                                                                                     |
| fullExtrapolatorName :       | TrackMasterExtrapolator                                                                                   |
| maxDeltaChi2 :               | 0.0010000000                                                                                              |
| Cut_IPS :                    | 30.000000                                                                                                 |
| TwoTracksVtxVfRatioMin :     | 0.10000000                                                                                                |
| DxForGradient :              | 0.00010000000                                                                                             |
| criticalPoint :              | 9.0000000                                                                                                 |
| DeltaPath :                  | 0.0020000000                                                                                              |
| Weights_BDTG_ZViso :         | IsolationTools_ZVisoBDTG_v1r0.xml                                                                         |
| AuditTools :                 | False                                                                                                     |
| MonitorService :             | MonitorSvc                                                                                                |
| OutputLevel :                | 3                                                                                                         |
| DistanceCalculatorToolName : | DistanceCalculatorTool                                                                                    |
| MC :                         | True                                                                                                      |
| VertexFunctionToolType :     | VertexFunctionTool                                                                                        |
| UseEfficiencyRowFormat :     | True                                                                                                      |
| MVATransform :               | ZViso_BDTG                                                                                                |
| EfficiencyRowFormat :        | \|\*%\|-48.48s\|%\|50t\|\|%\|10d\| \|%\|11.5g\| \|(%\|#9.6g\| +- %\|-#9.6g\|)%%\| ------- \| ------- \|   |
| Profile_step_number_p :      | 1000                                                                                                      |
| Cut_maxVF :                  | 0.500000                                                                                                  |
| ips :                        | 3.0000000                                                                                                 |
| Profile_step_number_m :      | 600                                                                                                       |
| TrackVertexerToolName :      | TrackVertexerTool                                                                                         |
| VF_from_MC :                 | False                                                                                                     |
| PrintMyAlg :                 | True                                                                                                      |
| ErrorsPrint :                | True                                                                                                      |
| DeltaChi2 :                  | 0.050000000                                                                                               |
| svdis :                      | -0.15000000                                                                                               |
| Cut_IPS_VF :                 | 20.000000                                                                                                 |
| cut_ips_high :               | 100.00000                                                                                                 |
| RegularRowFormat :           | \| %\|-48.48s\|%\|50t\|\|%\|10d\| \|%\|11.7g\| \|%\|#11.5g\| \|%\|#11.5g\| \|%\|#12.5g\| \|%\|#12.5g\| \| |
| AuditStop :                  | False                                                                                                     |
| PropertiesPrint :            | False                                                                                                     |
| MaxIterations :              | 10                                                                                                        |
| ResolverMinStep :            | 0.0010000000                                                                                              |
| DiGammaDecays :              | [ ( pi0 -\> ) , ( eta -\> ) , ]                                                                         |
| temperatures :               | [ 10.000000 , 4.0000000 , 1.0000000 , 0.0010000000 , 0.0010000000 ]                                     |
| tracktype :                  | 3                                                                                                         |
| CounterList :                | [ '.\*' ]                                                                                               |
| StatTableHeader :            | \| Counter \| \# \| sum \| mean/eff^\* \| rms/err^\* \| min \| max \|                                     |
| Profile_step_size :          | 0.0500000                                                                                                 |
| maxIter :                    | 6                                                                                                         |
| recover :                    | True                                                                                                      |
| doca_iso :                   | 0.13000000                                                                                                |
| svdis_h :                    | 30.000000                                                                                                 |
| MaxPrints :                  | 0                                                                                                         |
| angle :                      | 0.27000000                                                                                                |
| TrackVertexerToolType :      | TrackVertexer                                                                                             |
| MaxFinderStep :              | 0.0010000000                                                                                              |
| RootInTES :                  | None                                                                                                      |
| AuditFinalize :              | False                                                                                                     |
| recoverVF :                  | False                                                                                                     |
| Transporter :                | ParticleTransporter:PUBLIC                                                                                |
| ContextService :             | AlgContextSvc                                                                                             |
| DistanceCalculatorToolType : | LoKi::DistanceCalculator                                                                                  |
| TwoTracksVtxChi2Max :        | 20.000000                                                                                                 |
| cut_ghost :                  | 0.35000000                                                                                                |
| fc :                         | 0.60000000                                                                                                |
| veloExtrapolatorName :       | TrackLinearExtrapolator                                                                                   |
| Context :                    | None                                                                                                      |
| RootOnTES :                  | None                                                                                                      |
| GlobalTimeOffset :           | 0.0000000                                                                                                 |
| ResolverCut :                | 0.80000000                                                                                                |
| reweightTracks :             | True                                                                                                      |
| Variables :                  | [ 'ZVISO' ]                                                                                             |
| PVInputLocation :            | Rec/Vertex/Primary                                                                                        |

**AddRelatedInfo/RelatedInfo4_Bs2MuMusBs2JPsiPhiLine**

|                 |                                                    |
|-----------------|----------------------------------------------------|
| Inputs          | [ 'Phys/Bs2MuMusBs2JPsiPhiSelJpsi' ]             |
| DecayDescriptor | None                                               |
| Output          | Phys/RelatedInfo4_Bs2MuMusBs2JPsiPhiLine/Particles |

****Tools:****

**Tool4**

|                          |                                                                                                           |
|--------------------------|-----------------------------------------------------------------------------------------------------------|
| Transporter :            | ParticleTransporter:PUBLIC                                                                                |
| StatTableHeader :        | \| Counter \| \# \| sum \| mean/eff^\* \| rms/err^\* \| min \| max \|                                     |
| GammaCDecays :           | gamma -\> e+ e-                                                                                           |
| TrackExtrapolator :      | TrackMasterExtrapolator:PUBLIC                                                                            |
| ErrorsPrint :            | True                                                                                                      |
| StatEntityList :         | [ ]                                                                                                     |
| MaxPrints :              | 2                                                                                                         |
| RootOnTES :              | None                                                                                                      |
| DeltaPath :              | 0.0020000000                                                                                              |
| PrintMyAlg :             | True                                                                                                      |
| RootInTES :              | None                                                                                                      |
| ParticlePath :           | /Event/Phys/StdAllNoPIDsPions/Particles                                                                   |
| AuditFinalize :          | False                                                                                                     |
| TypePrint :              | True                                                                                                      |
| UseEfficiencyRowFormat : | True                                                                                                      |
| ContextService :         | AlgContextSvc                                                                                             |
| DeltaChi2 :              | 0.050000000                                                                                               |
| AuditTools :             | False                                                                                                     |
| MonitorService :         | MonitorSvc                                                                                                |
| AuditInitialize :        | False                                                                                                     |
| RegularRowFormat :       | \| %\|-48.48s\|%\|50t\|\|%\|10d\| \|%\|11.7g\| \|%\|#11.5g\| \|%\|#11.5g\| \|%\|#12.5g\| \|%\|#12.5g\| \| |
| OutputLevel :            | 3                                                                                                         |
| StatPrint :              | True                                                                                                      |
| AuditStop :              | False                                                                                                     |
| Context :                | None                                                                                                      |
| PropertiesPrint :        | False                                                                                                     |
| GlobalTimeOffset :       | 0.0000000                                                                                                 |
| WeightsFile :            | BsMuMu_TrackIsolationBDT6varsA_v1r4.xml                                                                   |
| MaxIterations :          | 10                                                                                                        |
| TrackType :              | 3                                                                                                         |
| Variables :              | 0                                                                                                         |
| DiGammaDecays :          | [ ( pi0 -\> ) , ( eta -\> ) , ]                                                                         |
| AuditStart :             | False                                                                                                     |
| PVInputLocation :        | Rec/Vertex/Primary                                                                                        |
| ToleranceInZ :           | 0.0020000000                                                                                              |
| MVATransform :           | None                                                                                                      |
| StateProvider :          | TrackStateProvider:PUBLIC                                                                                 |
| EfficiencyRowFormat :    | \|\*%\|-48.48s\|%\|50t\|\|%\|10d\| \|%\|11.5g\| \|(%\|#9.6g\| +- %\|-#9.6g\|)%%\| ------- \| ------- \|   |
| CounterList :            | [ '.\*' ]                                                                                               |

**AddRelatedInfo/RelatedInfo5_Bs2MuMusBs2JPsiPhiLine**

|                 |                                                    |
|-----------------|----------------------------------------------------|
| Inputs          | [ 'Phys/Bs2MuMusBs2JPsiPhiSelJpsi' ]             |
| DecayDescriptor | None                                               |
| Output          | Phys/RelatedInfo5_Bs2MuMusBs2JPsiPhiLine/Particles |

****Tools:****

**Tool5**

|                          |                                                                                                           |
|--------------------------|-----------------------------------------------------------------------------------------------------------|
| Transporter :            | ParticleTransporter:PUBLIC                                                                                |
| StatTableHeader :        | \| Counter \| \# \| sum \| mean/eff^\* \| rms/err^\* \| min \| max \|                                     |
| GammaCDecays :           | gamma -\> e+ e-                                                                                           |
| TrackExtrapolator :      | TrackMasterExtrapolator:PUBLIC                                                                            |
| ErrorsPrint :            | True                                                                                                      |
| StatEntityList :         | [ ]                                                                                                     |
| MaxPrints :              | 2                                                                                                         |
| RootOnTES :              | None                                                                                                      |
| DeltaPath :              | 0.0020000000                                                                                              |
| PrintMyAlg :             | True                                                                                                      |
| RootInTES :              | None                                                                                                      |
| ParticlePath :           | /Event/Phys/StdAllNoPIDsPions/Particles                                                                   |
| AuditFinalize :          | False                                                                                                     |
| TypePrint :              | True                                                                                                      |
| UseEfficiencyRowFormat : | True                                                                                                      |
| ContextService :         | AlgContextSvc                                                                                             |
| DeltaChi2 :              | 0.050000000                                                                                               |
| AuditTools :             | False                                                                                                     |
| MonitorService :         | MonitorSvc                                                                                                |
| AuditInitialize :        | False                                                                                                     |
| RegularRowFormat :       | \| %\|-48.48s\|%\|50t\|\|%\|10d\| \|%\|11.7g\| \|%\|#11.5g\| \|%\|#11.5g\| \|%\|#12.5g\| \|%\|#12.5g\| \| |
| OutputLevel :            | 3                                                                                                         |
| StatPrint :              | True                                                                                                      |
| AuditStop :              | False                                                                                                     |
| Context :                | None                                                                                                      |
| PropertiesPrint :        | False                                                                                                     |
| GlobalTimeOffset :       | 0.0000000                                                                                                 |
| WeightsFile :            | BsMuMu_TrackIsolationBDT6varsB_v1r4.xml                                                                   |
| MaxIterations :          | 10                                                                                                        |
| TrackType :              | 3                                                                                                         |
| Variables :              | 1                                                                                                         |
| DiGammaDecays :          | [ ( pi0 -\> ) , ( eta -\> ) , ]                                                                         |
| AuditStart :             | False                                                                                                     |
| PVInputLocation :        | Rec/Vertex/Primary                                                                                        |
| ToleranceInZ :           | 0.0020000000                                                                                              |
| MVATransform :           | None                                                                                                      |
| StateProvider :          | TrackStateProvider:PUBLIC                                                                                 |
| EfficiencyRowFormat :    | \|\*%\|-48.48s\|%\|50t\|\|%\|10d\| \|%\|11.5g\| \|(%\|#9.6g\| +- %\|-#9.6g\|)%%\| ------- \| ------- \|   |
| CounterList :            | [ '.\*' ]                                                                                               |

**AddRelatedInfo/RelatedInfo6_Bs2MuMusBs2JPsiPhiLine**

|                 |                                                    |
|-----------------|----------------------------------------------------|
| Inputs          | [ 'Phys/Bs2MuMusBs2JPsiPhiSelJpsi' ]             |
| DecayDescriptor | None                                               |
| Output          | Phys/RelatedInfo6_Bs2MuMusBs2JPsiPhiLine/Particles |

****Tools:****

**Tool6**

|                          |                                                                                                           |
|--------------------------|-----------------------------------------------------------------------------------------------------------|
| Transporter :            | ParticleTransporter:PUBLIC                                                                                |
| StatTableHeader :        | \| Counter \| \# \| sum \| mean/eff^\* \| rms/err^\* \| min \| max \|                                     |
| GammaCDecays :           | gamma -\> e+ e-                                                                                           |
| TrackExtrapolator :      | TrackMasterExtrapolator:PUBLIC                                                                            |
| ErrorsPrint :            | True                                                                                                      |
| StatEntityList :         | [ ]                                                                                                     |
| MaxPrints :              | 2                                                                                                         |
| RootOnTES :              | None                                                                                                      |
| DeltaPath :              | 0.0020000000                                                                                              |
| PrintMyAlg :             | True                                                                                                      |
| RootInTES :              | None                                                                                                      |
| ParticlePath :           | /Event/Phys/StdAllNoPIDsPions/Particles                                                                   |
| AuditFinalize :          | False                                                                                                     |
| TypePrint :              | True                                                                                                      |
| UseEfficiencyRowFormat : | True                                                                                                      |
| ContextService :         | AlgContextSvc                                                                                             |
| DeltaChi2 :              | 0.050000000                                                                                               |
| AuditTools :             | False                                                                                                     |
| MonitorService :         | MonitorSvc                                                                                                |
| AuditInitialize :        | False                                                                                                     |
| RegularRowFormat :       | \| %\|-48.48s\|%\|50t\|\|%\|10d\| \|%\|11.7g\| \|%\|#11.5g\| \|%\|#11.5g\| \|%\|#12.5g\| \|%\|#12.5g\| \| |
| OutputLevel :            | 3                                                                                                         |
| StatPrint :              | True                                                                                                      |
| AuditStop :              | False                                                                                                     |
| Context :                | None                                                                                                      |
| PropertiesPrint :        | False                                                                                                     |
| GlobalTimeOffset :       | 0.0000000                                                                                                 |
| WeightsFile :            | BsMuMu_TrackIsolationBDT9vars_v1r4.xml                                                                    |
| MaxIterations :          | 10                                                                                                        |
| TrackType :              | 3                                                                                                         |
| Variables :              | 2                                                                                                         |
| DiGammaDecays :          | [ ( pi0 -\> ) , ( eta -\> ) , ]                                                                         |
| AuditStart :             | False                                                                                                     |
| PVInputLocation :        | Rec/Vertex/Primary                                                                                        |
| ToleranceInZ :           | 0.0020000000                                                                                              |
| MVATransform :           | None                                                                                                      |
| StateProvider :          | TrackStateProvider:PUBLIC                                                                                 |
| EfficiencyRowFormat :    | \|\*%\|-48.48s\|%\|50t\|\|%\|10d\| \|%\|11.5g\| \|(%\|#9.6g\| +- %\|-#9.6g\|)%%\| ------- \| ------- \|   |
| CounterList :            | [ '.\*' ]                                                                                               |

**AddRelatedInfo/RelatedInfo7_Bs2MuMusBs2JPsiPhiLine**

|                 |                                                    |
|-----------------|----------------------------------------------------|
| Inputs          | [ 'Phys/Bs2MuMusBs2JPsiPhiSelJpsi' ]             |
| DecayDescriptor | None                                               |
| Output          | Phys/RelatedInfo7_Bs2MuMusBs2JPsiPhiLine/Particles |

****Tools:****

**Tool7**

|                          |                                                                                                           |
|--------------------------|-----------------------------------------------------------------------------------------------------------|
| Transporter :            | ParticleTransporter:PUBLIC                                                                                |
| StatTableHeader :        | \| Counter \| \# \| sum \| mean/eff^\* \| rms/err^\* \| min \| max \|                                     |
| GammaCDecays :           | gamma -\> e+ e-                                                                                           |
| TrackExtrapolator :      | TrackMasterExtrapolator:PUBLIC                                                                            |
| ErrorsPrint :            | True                                                                                                      |
| StatEntityList :         | [ ]                                                                                                     |
| MaxPrints :              | 2                                                                                                         |
| RootOnTES :              | None                                                                                                      |
| DeltaPath :              | 0.0020000000                                                                                              |
| PrintMyAlg :             | True                                                                                                      |
| RootInTES :              | None                                                                                                      |
| ParticlePath :           | /Event/Phys/StdAllNoPIDsPions/Particles                                                                   |
| AuditFinalize :          | False                                                                                                     |
| TypePrint :              | True                                                                                                      |
| UseEfficiencyRowFormat : | True                                                                                                      |
| ContextService :         | AlgContextSvc                                                                                             |
| DeltaChi2 :              | 0.050000000                                                                                               |
| AuditTools :             | False                                                                                                     |
| MonitorService :         | MonitorSvc                                                                                                |
| AuditInitialize :        | False                                                                                                     |
| RegularRowFormat :       | \| %\|-48.48s\|%\|50t\|\|%\|10d\| \|%\|11.7g\| \|%\|#11.5g\| \|%\|#11.5g\| \|%\|#12.5g\| \|%\|#12.5g\| \| |
| OutputLevel :            | 3                                                                                                         |
| StatPrint :              | True                                                                                                      |
| AuditStop :              | False                                                                                                     |
| Context :                | None                                                                                                      |
| PropertiesPrint :        | False                                                                                                     |
| GlobalTimeOffset :       | 0.0000000                                                                                                 |
| WeightsFile :            | BsMuMu_TrackIsolationBDT13vars_v1r4.xml                                                                   |
| MaxIterations :          | 10                                                                                                        |
| TrackType :              | 3                                                                                                         |
| Variables :              | 3                                                                                                         |
| DiGammaDecays :          | [ ( pi0 -\> ) , ( eta -\> ) , ]                                                                         |
| AuditStart :             | False                                                                                                     |
| PVInputLocation :        | Rec/Vertex/Primary                                                                                        |
| ToleranceInZ :           | 0.0020000000                                                                                              |
| MVATransform :           | None                                                                                                      |
| StateProvider :          | TrackStateProvider:PUBLIC                                                                                 |
| EfficiencyRowFormat :    | \|\*%\|-48.48s\|%\|50t\|\|%\|10d\| \|%\|11.5g\| \|(%\|#9.6g\| +- %\|-#9.6g\|)%%\| ------- \| ------- \|   |
| CounterList :            | [ '.\*' ]                                                                                               |

**AddRelatedInfo/RelatedInfo8_Bs2MuMusBs2JPsiPhiLine**

|                 |                                                    |
|-----------------|----------------------------------------------------|
| Inputs          | [ 'Phys/Bs2MuMusBs2JPsiPhiSelJpsi' ]             |
| DecayDescriptor | None                                               |
| Output          | Phys/RelatedInfo8_Bs2MuMusBs2JPsiPhiLine/Particles |

****Tools:****

**Tool8**

|                          |                                                                                                           |
|--------------------------|-----------------------------------------------------------------------------------------------------------|
| Transporter :            | ParticleTransporter:PUBLIC                                                                                |
| StatTableHeader :        | \| Counter \| \# \| sum \| mean/eff^\* \| rms/err^\* \| min \| max \|                                     |
| GammaCDecays :           | gamma -\> e+ e-                                                                                           |
| TrackExtrapolator :      | TrackMasterExtrapolator:PUBLIC                                                                            |
| ErrorsPrint :            | True                                                                                                      |
| StatEntityList :         | [ ]                                                                                                     |
| MaxPrints :              | 2                                                                                                         |
| RootOnTES :              | None                                                                                                      |
| DeltaPath :              | 0.0020000000                                                                                              |
| PrintMyAlg :             | True                                                                                                      |
| RootInTES :              | None                                                                                                      |
| ParticlePath :           | /Event/Phys/StdAllNoPIDsPions/Particles                                                                   |
| AuditFinalize :          | False                                                                                                     |
| TypePrint :              | True                                                                                                      |
| UseEfficiencyRowFormat : | True                                                                                                      |
| ContextService :         | AlgContextSvc                                                                                             |
| DeltaChi2 :              | 0.050000000                                                                                               |
| AuditTools :             | False                                                                                                     |
| MonitorService :         | MonitorSvc                                                                                                |
| AuditInitialize :        | False                                                                                                     |
| RegularRowFormat :       | \| %\|-48.48s\|%\|50t\|\|%\|10d\| \|%\|11.7g\| \|%\|#11.5g\| \|%\|#11.5g\| \|%\|#12.5g\| \|%\|#12.5g\| \| |
| OutputLevel :            | 3                                                                                                         |
| StatPrint :              | True                                                                                                      |
| AuditStop :              | False                                                                                                     |
| Context :                | None                                                                                                      |
| PropertiesPrint :        | False                                                                                                     |
| GlobalTimeOffset :       | 0.0000000                                                                                                 |
| WeightsFile :            | BsMuMu_TrackIsolationBDT15vars_v1r4.xml                                                                   |
| MaxIterations :          | 10                                                                                                        |
| TrackType :              | 3                                                                                                         |
| Variables :              | 4                                                                                                         |
| DiGammaDecays :          | [ ( pi0 -\> ) , ( eta -\> ) , ]                                                                         |
| AuditStart :             | False                                                                                                     |
| PVInputLocation :        | Rec/Vertex/Primary                                                                                        |
| ToleranceInZ :           | 0.0020000000                                                                                              |
| MVATransform :           | None                                                                                                      |
| StateProvider :          | TrackStateProvider:PUBLIC                                                                                 |
| EfficiencyRowFormat :    | \|\*%\|-48.48s\|%\|50t\|\|%\|10d\| \|%\|11.5g\| \|(%\|#9.6g\| +- %\|-#9.6g\|)%%\| ------- \| ------- \|   |
| CounterList :            | [ '.\*' ]                                                                                               |