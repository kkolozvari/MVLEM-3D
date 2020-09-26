[K. Kolozvari](mailto:kkolozvari@fullerton.edu), CSU Fullerton<br/>
K. Kalbasi, UCLA<br/>
K. Orakcal, Bogazici University<br/>
J. W. Wallace, UCLA<br/>

## Description

The MVLEM-3D model is an extension of the two-dimensional, two-node Multiple-Vertical-Line-Element-Model ([MVLEM](https://opensees.berkeley.edu/wiki/index.php/MVLEM_-_Multiple-Vertical-Line-Element-Model_for_RC_Walls)). The baseline MVLEM, which is essentially a line element for rectangular walls subjected to in-plane loading, is extended to a three-dimensional model formulation by applying geometric transformation of the element degrees of freedom that convert it into a four-node element formulation, as well as by incorporating linear elastic out-of-plane behavior based on the Kirchhoff plate theory. 

### MVLEM-3D Input
```markdown
element MVLEM-3D eleTag iNode jNode kNode lNode m -thick {Thicknesses} -width {Widths} -rho {Reinforcing_ratios} 
-matConcrete {Concrete_tags} -matSteel {Steel_tags} -matShear {Shear_tag} <-CoR c> <-thickMod tMod> <-Poisson Nu>
```

| parameter | description |
|----------|------------|
| eleTag | unique element tag|
| iNode jNode kNode lNode | tags of element nodes defined in counterclockwise direction|
| m | number of element macro-fibers|
| {Thicknesses} | array of m macro-fiber thicknesses|
| {Widths} | array of m macro-fiber widths |
| {Reinforcing_ratios}| array of m reinforcing ratios corresponding to macro-fibers|
| {Concrete_tags}	| array of m uniaxialMaterial tags for concrete |
| {Steel_tags} |	array of m uniaxialMaterial tags for steel |
| {Shear_tag}	| Tag of uniaxialMaterial for shear material |
| c | location of center of rotation from the base (optional, default = 0.4 (recommended))|
| tMod	| thickness modifier for out-of-plane bending (optional, default = 1.0)|
| Nu | Poisson ratio for out-of-plane bending (optional, default = 0.25)|

![MVLEM-3D](https://user-images.githubusercontent.com/53920372/94331495-b6be2480-ff81-11ea-916b-949cd5b112e4.PNG)
**Figure 1: MVLEM-3D Element Formulation**

## Example

Specimen TUB (Beyer et al. 2008) is analyzed using the MVLEM-3D.

![TUB](https://user-images.githubusercontent.com/53920372/94061732-a009a900-fd9a-11ea-8d28-2ae4981326f6.JPG)
**Figure 2: MVLEM-3D Model of specimen TUB**

## References

K. Kolozvari, K. Kalbasi, K. Orakcal, L. M. Massone & J. W. Wallace (in review), "Three-dimensional model for nonlinear analysis of slender flanged reinforced
concrete walls", Engineering Structures.
