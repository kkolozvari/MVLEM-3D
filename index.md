# MVLEM-3D
3-D element for flexure-dominated RC walls

[K. Kolozvari](mailto:kkolozvari@fullerton.edu), CSU Fullerton<br/>
K. Kalbasi, CSU Fullerton<br/>
K. Orakcal, Bogazici University<br/>
J. W. Wallace, UCLA<br/>

## Description

The MVLEM_3D model (Figure 1a) is a three-dimenaional four-node element with 24 DOFs for nonlinear analysis of flexure-controlled non-rectangular reinforced concrete walls subjected to multidirectional loading. The model is an extension of the two-dimensional, two-node Multiple-Vertical-Line-Element-Model ([MVLEM](https://opensees.berkeley.edu/wiki/index.php/MVLEM_-_Multiple-Vertical-Line-Element-Model_for_RC_Walls)). The baseline MVLEM, which is essentially a line element for rectangular walls subjected to in-plane loading, is extended to a three-dimensional model formulation by: 1) applying geometric transformation of the element in-plane degrees of freedom that convert it into a four-node element formulation (Figure 1b), as well as by incorporating linear elastic out-of-plane behavior based on the Kirchhoff plate theory (Figure 1c). The in-plane and the out-of-plane element behaviors are uncoupled in the present model.

![3D_model_v2 3](https://user-images.githubusercontent.com/53920372/104970335-f4671300-599f-11eb-8bf5-f598d4c05d1e.jpg)
**Figure 1: MVLEM_3D element formulation**

### MVLEM_3D Input
```markdown
element MVLEM_3D eleTag iNode jNode kNode lNode m -thick {Thicknesses} -width {Widths} -rho {Reinforcing_ratios} 
-matConcrete {Concrete_tags} -matSteel {Steel_tags} -matShear {Shear_tag} <-CoR c> <-thickMod tMod> <-Poisson Nu> <-Density Dens>
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
| tMod	| thickness modifier for out-of-plane bending (optional, default = 0.63, equivalent to 0.25Ig for out-of-plane bending)|
| Nu | Poisson ratio for out-of-plane bending (optional, default = 0.25)|
| Dens | Density (optional, default = 0.0)|

### Recorders

The following recorders are available with the MVLEM_3D element.

| recorder | description |
|----------|------------|
| globalForce | Element global forces|
| Curvature | Element curvature|
| Shear_Force_Deformation | Element shear force-deformation relationship|
| Fiber_Strain | Vertical strains in m fibers along the cross-section|
| Fiber_Stress_Concrete | Vertical concrete stresses in m fibers along the cross-section|
| Fiber_Stress_Steel | Vertical steel stresses in m fibers along the cross-section|
   
## Example

Specimen TUB (Beyer et al. 2008) is analyzed using the MVLEM_3D. Figure 2a shows the photo of the test specimen and the multidirectional displacement pattern applied at the top of the wall, while Figure 2b-c show the MVLEM_3D model of specimen TUB. **To access example files clink on "View on Github".**

![3D_model_2](https://user-images.githubusercontent.com/53920372/105111249-58a7d680-5a75-11eb-8e80-094fd2807caa.jpg)
**Figure 2: MVLEM_3D model of specimen TUB**

![TUB Animation](TUB_MVLEM_3D2.gif)

**Figure 3: Animation of MVLEM_3D analysis of specimen TUB (displacement scale factor = 3.0).**

Figure 4 compares experimentally measured and analytically predicted load deformation behavior of the specimen TUB in E-W, N-S, and diagonal loading directions. The model provides accurate predictions of the lateral load capacity and the stiffness under cyclic loading in loading directions parallel to the principal axes of the cross-section (E-W, N-S direction). Analysis results overestimate the lateral load capacity in diagonal loading directions due to plane-sections-remain-plane assumption implemented in the model formulation that cannot capture pronounced shear lag effect observed in the test specimen. 

![TUB_LD](https://user-images.githubusercontent.com/53920372/94853227-f0f35000-03df-11eb-8e68-f1f221a9086d.JPG)
**Figure 4: Experimental vs. MVLEM_3D load-deforamtion response of specimen TUB**

## References

K. Kolozvari, K. Kalbasi, K. Orakcal & J. W. Wallace (2021), "Three-dimensional model for nonlinear analysis of slender flanged reinforced
concrete walls", Engineering Structures.
