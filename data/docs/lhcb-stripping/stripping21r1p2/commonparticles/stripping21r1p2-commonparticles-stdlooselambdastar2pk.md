[[stripping21r1p2 lines]](./stripping21r1p2-index)

# StdLooseLambdastar2pK

**CombineParticles/StdLooseLambdastar2pK**

|                  |                                                                                                                                                                                          |
|------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Inputs           | ['Phys/[StdAllLooseKaons](./stripping21r1p2-commonparticles-stdallloosekaons)/Particles', 'Phys/[StdAllLooseProtons](./stripping21r1p2-commonparticles-stdalllooseprotons)/Particles'] |
| DaughtersCuts    | {}                                                                                                                                                                                       |
| CombinationCut   | (AM \< 2600.\*MeV) & (ADOCACHI2CUT(30, ''))                                                                                                                                              |
| MotherCut        | (VFASPF(VCHI2) \< 25.)                                                                                                                                                                   |
| DecayDescriptor  | [Lambda(1520)0 -\> p+ K-]cc                                                                                                                                                            |
| DecayDescriptors | []                                                                                                                                                                                     |
| Output           | None                                                                                                                                                                                     |
